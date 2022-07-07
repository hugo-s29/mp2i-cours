package main

import (
	"fmt"
	"log"
	"github.com/signintech/gopdf"
	"io/ioutil"
	"encoding/csv"
	"strings"
	"strconv"
	"os"
)

const groupCount = 16

type Student struct {
	name string
	kholleGroup int
}

type Time struct {
	start float64
	end float64
}

type Subject struct {
	name string
	room string
	time Time
	teacher string
}

type Kholle struct {
	Subject
	AdditionalData
}

type AdditionalData struct {
	day int
}

type BaseDay struct {
	id int
	subjects []Subject
}

type Color struct {
	r, g, b uint8
}

func rgb(r, g, b uint8) Color { return Color{r, g, b} }

var colorMap map[string]Color = map[string]Color{
	"Informatique": rgb(240, 98, 146),
	"Mathématiques": rgb(255, 183, 77),
	"EPS": rgb(121, 134, 203),
	"TIPE": rgb(229, 115, 115),
	"SII": rgb(220, 231, 117),
	"Physique": rgb(100, 181, 246),
	"Anglais": rgb(174, 213, 129),
	"Philosophie": rgb(77, 182, 172),
	"Devoirs": rgb(255, 213, 79),
	"Khôlle Info.": rgb(240, 98, 146),
	"Khôlle Maths.": rgb(255, 183, 77),
	"Khôlle Physique": rgb(100, 181, 246),
	"Khôlle Anglais": rgb(174, 213, 129),
}

func (s Student) String() string {
	return fmt.Sprintf("%v (groupe %v)", s.name, s.kholleGroup)
}

func (s Student) getGroup() bool {
	// true -> I ; false -> II
	return isIn(s.kholleGroup, []int{3, 4, 6, 7, 9, 10, 13, 16})
}

func (t Time) String() string {
	return fmt.Sprintf("début : %vh, fin : %vh", t.start, t.end)
}

func (s Subject) String() string {
	return fmt.Sprintf("%v en %v (%v)", s.name, s.room, s.time)
}

func (d BaseDay) String() string {
	return fmt.Sprintf("Jour %v : %v", d.id, d.subjects)
}

func (s Subject) asSubject() Subject { return s }
func (d AdditionalData) asData() AdditionalData { return d }

func (d BaseDay) customize(s Student, weekNum int, kholles map[string][]Kholle) BaseDay {
	switch(d.id) {
	case 1:
		if s.getGroup() == (weekNum % 2 == 0) {
			d.subjects = append(d.subjects, Subject{ "TIPE", "K201", Time{15, 16}, ""})
		} else {
			d.subjects = append(d.subjects, Subject{ "TIPE", "K201", Time{16, 17}, ""})
		}
	
	case 2:
		if s.getGroup() {
			d.subjects = append(
				d.subjects,
				Subject{ "Mathématiques", "K201", Time{13, 15}, ""},
				Subject{ "Physique", "Salles TP", Time{15, 17}, ""},
			)
		} else {
			d.subjects = append(
				d.subjects,
				Subject{ "Physique", "Salles TP", Time{13, 15}, ""},
				Subject{ "Mathématiques", "K201", Time{15, 17}, ""},
			)
		}
	case 3:
		if s.getGroup() == (weekNum % 2 == 0) {
			d.subjects = append(
				d.subjects,
				Subject{ "Physique", "D206", Time{13, 14}, ""},
				Subject{ "Informatique", "K201", Time{14, 15}, ""},
			)
		} else {
			d.subjects = append(
				d.subjects,
				Subject{ "Informatique", "K201", Time{13, 14}, ""},
				Subject{ "Physique", "D206", Time{14, 15}, ""},
			)
		}
	}

	for _, line := range kholles {
		if line[s.kholleGroup - 1].day == d.id + 1 {
			d.subjects = append(d.subjects, line[s.kholleGroup - 1].asSubject())
		}
	}

	return d
}

func main() {
	weekNum := 0
	class := getClassroom()
	size := gopdf.Rect{W: 842, H: 595}
	baseWeek := getBaseWeek()
	kholles := loadAllKholles(weekNum)

	w := 842 * 2.1 / 3
	h := 595 * 4.2 / 3

	col := w / 6
	pad := col / 6 * 2.2

	center := gopdf.CellOption{
		Align : gopdf.Center | gopdf.Middle,
	}

	for _, student := range class {
		pdf := gopdf.GoPdf{}
		pdf.Start(gopdf.Config{ PageSize: size })

		pdf.AddTTFFont("lm", "./lmroman10-regular.ttf")
		pdf.AddTTFFont("sc", "./lmromancaps10-regular.ttf")
		pdf.AddTTFFont("br", "./lmroman10-bold.ttf")
		pdf.AddTTFFont("bi", "./lmroman10-bolditalic.ttf")
		pdf.AddTTFFont("it", "./lmroman10-italic.ttf")
		pdf.AddPage()


		name := strings.Split(student.name, " ")
		pdf.SetNewXY(842*2.1/3, 2, 20)
		pdf.SetFont("lm", "", 8)
		pdf.Text(" Généré pour " + name[0] + " ")
		pdf.SetFont("sc", "", 8)
		pdf.Text(strings.Join(name[1:], " "))
		pdf.SetFont("lm", "", 8)
		pdf.Text(fmt.Sprintf(" (semaine %d)", weekNum + 1))

		pdf.SetLineWidth(0.5)

		dayNames := []string{ "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi" }

		pdf.SetFont("br", "", 16)
		pdf.SetXY(pad, 0)
		pdf.CellWithOption(&gopdf.Rect{W : 842 - 4 * pad, H : 1.5 * pad}, "Emplois du temps –", center)
		pdf.SetFont("bi", "", 16)
		pdf.SetXY(3*pad, 0)
		pdf.CellWithOption(&gopdf.Rect{W : 842 - 2 * pad, H : 1.5 * pad}, "MP2I", center)

		for i := 0.; i < 6; i++ {
			pdf.Line(i * (col + pad) + pad, 1.5 * pad, i * (col + pad) + pad, 2.5 * pad)
			pdf.Line((i + 1) * (col + pad), 1.5 * pad, (i + 1) * (col + pad), 2.5 * pad)

			pdf.Line(i * (col + pad) + pad, 3 * pad, i * (col + pad) + pad, h - 7.5 * pad)
			pdf.Line((i + 1) * (col + pad), 3 * pad, (i + 1) * (col + pad), h - 7.5 * pad)

			pdf.Line(i * (col + pad) + pad, 1.5 * pad, (i + 1) * (col + pad), 1.5 * pad)
			pdf.Line(i * (col + pad) + pad, 2.5 * pad, (i + 1) * (col + pad), 2.5 * pad)
			pdf.Line(i * (col + pad) + pad, 3 * pad, (i + 1) * (col + pad), 3 * pad)
			pdf.Line(i * (col + pad) + pad, h - 7.5 * pad, (i + 1) * (col + pad), h - 7.5 * pad)

			pdf.SetXY(i * (col + pad) + pad, 1.5 * pad)
			rect := gopdf.Rect{W : col, H : pad}
			pdf.SetFont("sc", "", 13)
			pdf.CellWithOption(&rect, dayNames[int(i)], center)

			if i == 0. { continue }

			pdf.SetFillColor(50, 50, 50)
			for j := 8.; j < 20; j++ {
				y := mapValues(j, 7.5, 19.5, 3 * pad, h - 7.5 * pad)
				x := i * (col + pad)
				var rect gopdf.Rect

				if j < 10 {
					rect = gopdf.Rect{ W : 9*pad/10., H : 0 }
				} else {
					rect = gopdf.Rect{ W : 8.5*pad/10., H : 0 }
				}

				pdf.SetXY(x,y)
				pdf.SetFont("it", "", 9)
				pdf.CellWithOption(&rect, fmt.Sprintf("%d", int(j)), center)
				pdf.SetFont("it", "", 6)

				if j < 10 {
					pdf.SetXY(x + 1.3 * pad / 10, y - 1)
				} else {
					pdf.SetXY(x + 1.9 * pad / 10, y - 1)
				}

				pdf.CellWithOption(&rect, "h", center)
			}
			pdf.SetFillColor(0, 0, 0)
		}


		for _, baseDay := range baseWeek {
			day := baseDay.customize(student, weekNum, kholles)

			for _, subject := range day.subjects {
				startX := float64(baseDay.id) * (col + pad) + pad
				startY := mapValues(subject.time.start, 7.5, 19.5, 3 * pad, h - 7.5 * pad)
				endY := mapValues(subject.time.end, 7.5, 19.5, 3 * pad, h - 7.5 * pad)

				dy := endY - startY

				color, ok := colorMap[subject.name]

				if !ok {
					color = Color{ 255, 255, 255 }
				}

				pdf.SetXY(startX, startY)
				pdf.SetFillColor(color.r, color.g, color.b)
				pdf.Rectangle(startX, startY, startX + col, endY, "DF", 0, 0)
				pdf.SetFillColor(0, 0, 0)
				if len(subject.teacher) > 0 {
					pdf.SetFont("lm", "", 10)
					pdf.CellWithOption(&gopdf.Rect{W : col, H : dy/2}, subject.name, center)
					pdf.SetXY(startX, startY + dy/4)
					pdf.SetFont("it", "", 8)
					pdf.CellWithOption(&gopdf.Rect{W : col, H : dy/2}, subject.room, center)
					pdf.SetXY(startX, startY + dy/2)
					pdf.SetFont("sc", "", 8)
					pdf.CellWithOption(&gopdf.Rect{W : col, H : dy/2}, subject.teacher, center)
				} else {
					pdf.SetFont("lm", "", 10)
					pdf.CellWithOption(&gopdf.Rect{W : col, H : 2*dy/3}, subject.name, center)
					pdf.SetXY(startX, startY + dy/3)
					pdf.SetFont("it", "", 8)
					pdf.CellWithOption(&gopdf.Rect{W : col, H : 2*dy/3}, subject.room, center)
				}
			}
		}

		pdf.WritePdf("plannings/" + strings.Replace(strings.ToLower(student.name), " ", "-", -1) + ".pdf")
	}
}

func getClassroom() []Student {
	_body, err := ioutil.ReadFile("classroom.txt")

	if err != nil {
		return []Student{}
	}

	body := string(_body)
	lines := strings.Split(body, "\n")

	class := make([]Student, len(lines) - 1)

	for i, line := range lines {
		if len(line) == 0 {
			break
		}

		parts := strings.Split(line, " => ")
		name := parts[0]
		group, err := strconv.Atoi(parts[1])

		if err != nil {
			panic(err)
		}

		class[i] = Student{ name, group }
	}

	return class
}

func getBaseWeek() []BaseDay {
	mondaySubjects := []Subject {
		{ "Physique", "D207", Time{8, 10}, "" },
		{ "Anglais", "K201", Time{10, 12}, "" },
		{ "Devoirs", "La Chapelle", Time{13.5, 17.5}, "" },
	}

	tuesdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10}, "" },
		{ "Informatique", "K201", Time{10, 12}, "" },
		{ "Physique", "K201", Time{13, 15}, "" },
	}

	wednesdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{10, 12}, "" },
	}

	thursdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10}, "" },
		{ "Informatique", "K201", Time{10, 11}, "" },
		{ "Informatique", "K201", Time{12, 13}, "" },
		{ "Philosophie", "K201", Time{15, 17}, "" },
	}

	fridaySubjects := []Subject {
		{ "EPS", "Gymnase", Time{8, 10}, "" },
		{ "Mathématiques", "K201", Time{10, 12}, "" },
	}

	saturdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10}, "" },
	}

	week := []BaseDay{
		{0, mondaySubjects},
		{1, tuesdaySubjects},
		{2, wednesdaySubjects},
		{3, thursdaySubjects},
		{4, fridaySubjects},
		{5, saturdaySubjects},
	}

	return week
}

func isIn(elem int, slice []int) bool {
	for _, x := range slice {
		if x == elem {
			return true
		}
	}

	return false
}

func loadKholles(fileName, subjectName string, weekNum int) []Kholle {
	f, err := os.Open("kholles/" + fileName + ".csv")

	if err != nil {
		log.Fatal(err)
	}

	defer f.Close()

	csvReader := csv.NewReader(f)
	data, err := csvReader.ReadAll()
	if err != nil {
		log.Fatal(err)
	}
	
	data = data[1:]

	index := weekNum + 5

	kholles := make([]Kholle, groupCount)
	
	for _, line := range data {
		group, err := strconv.Atoi(line[index])
		_startTime, err2 := strconv.ParseFloat(line[2], 64)
		day, err3 := strconv.Atoi(line[1])

		if err != nil { log.Fatal(err) }
		if err2 != nil { log.Fatal(err2) }
		if err3 != nil { log.Fatal(err3) }

		startTime := float64(_startTime)

		room := line[3]
		teacher := line[0]
		time := Time{ startTime, startTime + 1 }

		kholle := Kholle{
			Subject{
				subjectName,
				room,
				time,
				teacher,
			},
			AdditionalData{
				day,
			},
		}

		kholles[group - 1] = kholle
	}

	return kholles
}


func loadAllKholles(weekNum int) map[string][]Kholle {
	maths := loadKholles("maths", "Khôlle Maths.", weekNum)
	info := loadKholles("informatique", "Khôlle Info.", weekNum)
	physique := loadKholles("physique", "Khôlle Physique", weekNum)
	anglais := loadKholles("anglais", "Khôlle Anglais", weekNum)

	return map[string][]Kholle{
		"maths": maths,
		"info": info,
		"physique": physique,
		"anglais": anglais,
	}
}

func mapValues(value float64, start1 float64, stop1 float64, start2 float64, stop2 float64) float64 {
    return (value - start1) / (stop1 - start1) * (stop2 - start2) + start2
}
