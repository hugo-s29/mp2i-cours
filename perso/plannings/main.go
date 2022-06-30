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
}

type Kholle struct {
	Subject
	AdditionalData
}

type AdditionalData struct {
	teacher string
	day int
}

type BaseDay struct {
	id int
	subjects []Subject
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

func (d BaseDay) customize(s Student, weekNum int, kholles map[string][]Kholle) BaseDay {
	switch(d.id) {
	case 1:
		if s.getGroup() == (weekNum % 2 == 0) {
			d.subjects = append(d.subjects, Subject{ "TIPE", "K201", Time{15, 16}})
		} else {
			d.subjects = append(d.subjects, Subject{ "TIPE", "K201", Time{16, 17}})
		}
	
	case 2:
		if s.getGroup() {
			d.subjects = append(
				d.subjects,
				Subject{ "Mathématiques", "K201", Time{13, 15}},
				Subject{ "Physique", "Salles TP", Time{15, 17}},
			)
		} else {
			d.subjects = append(
				d.subjects,
				Subject{ "Physique", "Salles TP", Time{13, 15}},
				Subject{ "Mathématiques", "K201", Time{15, 17}},
			)
		}
	case 3:
		if s.getGroup() == (weekNum % 2 == 0) {
			d.subjects = append(
				d.subjects,
				Subject{ "Physique", "D206", Time{13, 14}},
				Subject{ "Informatique", "K201", Time{14, 15}},
			)
		} else {
			d.subjects = append(
				d.subjects,
				Subject{ "Informatique", "K201", Time{13, 14}},
				Subject{ "Physique", "D206", Time{14, 15}},
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
	weekNum := 2

	class := getClassroom()
	baseWeek := getBaseWeek()
	kholles := loadAllKholles(weekNum)
	size := gopdf.Rect{W: 842, H: 595}

	w := 842 * 2.1 / 3
	h := 595 * 4.2 / 3

	col := w / 6
	pad := col / 6 * 2.2

	for _, student := range class {
		pdf := gopdf.GoPdf{}
		pdf.Start(gopdf.Config{ PageSize: size })
		pdf.AddPage()

		pdf.AddTTFFont("lm", "./lmroman10-regular.ttf")
		pdf.AddTTFFont("sc", "./lmromancaps10-regular.ttf")

		name := strings.Split(student.name, " ")
		pdf.SetNewXY(842*2.1/3, 0, 20)
		pdf.SetFont("lm", "", 14)
		pdf.Text("Généré pour " + name[0] + " ")
		pdf.SetFont("sc", "", 14)
		pdf.Text(strings.Join(name[1:], " "))

		for i := 0.; i < 6; i++ {
			pdf.Line(i * (col + pad) + pad, pad, i * (col + pad) + pad, h - 2 * pad)
			pdf.Line((i + 1) * (col + pad), pad, (i + 1) * (col + pad), h - 2 * pad)
		}


		for _, baseDay := range baseWeek {
			day := baseDay.customize(student, weekNum, kholles)
			day = day
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
		{ "Physique", "D207", Time{8, 10} },
		{ "Anglais", "K201", Time{10, 12} },
		{ "Devoirs", "La Chapelle", Time{13.5, 17.5} },
	}

	tuesdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10} },
		{ "Informatique", "K201", Time{10, 12} },
		{ "Physique", "K201", Time{13, 15} },
	}

	wednesdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{10, 12} },
	}

	thursdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10} },
		{ "Informatique", "K201", Time{10, 11} },
		{ "Informatique", "K201", Time{12, 13} },
		{ "Philosophie", "K201", Time{15, 17} },
	}

	fridaySubjects := []Subject {
		{ "EPS", "Gymnase", Time{8, 10} },
		{ "Mathématiques", "K201", Time{10, 12} },
	}

	saturdaySubjects := []Subject {
		{ "Mathématiques", "K201", Time{8, 10} },
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
		_startTime, err2 := strconv.Atoi(line[2])
		day, err3 := strconv.Atoi(line[1])

		if err != nil { log.Fatal(err) }
		if err2 != nil { log.Fatal(err2) }
		if err3 != nil { log.Fatal(err3) }

		startTime := float64(_startTime)

		room := line[3]
		teacher := line[0]
		time := Time{ startTime, startTime + 1 }

		kholles[group - 1] = Kholle{
			Subject{
				subjectName,
				room,
				time,
			},
			AdditionalData{
				teacher,
				day,
			},
		}
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

