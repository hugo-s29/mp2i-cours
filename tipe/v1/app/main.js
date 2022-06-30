const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

const sizeFactor = 2;

const cols = 160 * sizeFactor;
const rows = 90 * sizeFactor;

const width = 1600;
const height = 900;

const [px,py] = [width/10, height/10];

const board_width = width - 2 * px;
const board_height = height - 2 * py;

const w = board_width / (cols - 1);
const h = board_height / (rows - 1);

const recovered_probability = 0.9;
const max_age = 170;
const emptyness = 0.5;

const cellType = {
	empty: 0,
	susceptible: 1,
	infectious: 2,
	recovered: 3,
	removed: 4,
}

function infection_probability(age) {
	const max = 1.7;
	const tau = 150;
	const center = 30;
	return max * Math.exp(-((center-age)**2/tau));
}

class Cell {
	constructor(type, i, j) {
		this.type = type;
		this.age = 0;
		this.pos = [i,j];
	}

	reset() {
		this.type = cellType.empty;
		this.age = 0;
	}

	getColor() {
		switch(this.type) {
			case cellType.empty:
				return 'lightgrey';
			case cellType.removed:
				return 'dimgray';
			case cellType.recovered:
				return 'yellowgreen';
			case cellType.infectious:
				return 'tomato';
			case cellType.susceptible:
				return 'mediumturquoise';
		}
	}

	update() {
		switch(this.type) {
			case cellType.empty:
			case cellType.removed:
			case cellType.recovered:
				return;

			case cellType.infectious:
				this.age++;
				if(this.age > max_age + random_normal(20)) {
					if(Math.random() < recovered_probability) {
						this.type = cellType.recovered;
					} else {
						this.type = cellType.removed;
					}
				}
				break;

			case cellType.susceptible:
				const indices = [
					[-3, 0],[3, 0],[0, -3],[0, 3],
					[-2, -1],[2, 1],[-2, 1],[2, -1],
					[-1, -2],[1, 2],[-1, 2],[1, -2],
					[0, -2],[0, 2],[0, 2],[0, -2],
					[-1, -1],[1, 1],[-1, 1],[1, -1],
					[0, -1],[0, 1],[0, 1],[0, -1],
				];

				const [i,j] = this.pos;

				for(const [dx,dy] of indices) {
					const cell = getCell(i+dx,j+dy);
					if(!cell || cell.type != cellType.infectious) { continue; }
					const probability = infection_probability(cell.age);
					if(Math.random() < probability) {
						this.type = cellType.infectious;
						break;
					}
				}
				break;
		}
	}
}

function getCell(i,j) {
	if(i < 0 || j < 0 || i >= cols || j >= rows) {
		return;
	}

	return grid[i][j];
}

const grid = [];

for(let i = 0; i < cols; i++) {
	const line = [];

	for(let j = 0; j < rows; j++) {
		if(Math.random() < 1 - emptyness)
			line.push(new Cell(cellType.susceptible, i, j));
		else
			line.push(new Cell(cellType.empty, i, j));
	}

	grid.push(line);
}

grid[Math.floor(cols/2)][Math.floor(rows/2)].type = cellType.infectious;

const dx = w * 0.02;
const dy = h * 0.02;

const data = [];

let frameCount = 0;

function render() {
	ctx.fillStyle = 'black';
	ctx.rect(0, 0, 1600, 900);
	ctx.fill();

	const counts = [0,0,0,0,0];

	for(let i = 0; i < cols; i++) {
		for(let j = 0; j < rows; j++) {
			const x = map(i, 0, cols - 1, px, width-px);
			const y = map(j, 0, rows - 1, py, height-py);

			counts[grid[i][j].type]++;

			ctx.fillStyle = grid[i][j].getColor();
			ctx.fillRect(x+dx, y+dy, w-2*dx, h-2*dy);
		}
	}

	data.push(counts);

	frameCount++;

	if(frameCount > 1000) {
		stop();
	}

	ctx.font = '48px Anonymous Pro';
	ctx.fillStyle = 'white';
	ctx.fillText(frameCount.toString().padStart(4, '0'), 50, 50);

	frame = requestAnimationFrame(render);
	update();
}

function update() {
	for(let i = 0; i < cols; i++) {
		for(let j = 0; j < rows; j++) {
			grid[i][j].update();
		}
	}
}

function random_normal(n) {
	let u = 0, v = 0;
	while(u === 0) u = Math.random(); // excluding case u = 0 and v = 0
	while(v === 0) v = Math.random();

	return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v) * n;
}

let frame;
let isStopped = false;

addEventListener('load', () => frame = requestAnimationFrame(render));

function map(value, start1, stop1, start2, stop2) {
	return ((value - start1) / (stop1 - start1)) * (stop2 - start2) + start2;
}

document.getElementById('restart').addEventListener('click', restart);
document.getElementById('stop').addEventListener('click', stop);

function restart() {
	while(data.length > 0)
		data.pop();

	for(let i = 0; i < cols; i++) {
		for(let j = 0; j < rows; j++) {
			grid[i][j].reset();
		}
	}

	for(let i = 0; i < cols; i++) {
		for(let j = 0; j < rows; j++) {
			if(Math.random() < 1 - emptyness)
				grid[i][j].type = cellType.susceptible;
		}
	}

	grid[Math.floor(cols/2)][Math.floor(rows/2)].type = cellType.infectious;

	if(isStopped) {
		isStopped = false;
		frame = requestAnimationFrame(render);
	}
}

function stop() {
	isStopped = true;
	cancelAnimationFrame(frame);
	drawGraph();
	frameCount = 0;
}

function drawGraph() {
	const opts = {
		modeBarButtonsToRemove: ['toImage', 'sendDataToCloud'],
		modeBarButtonsToAdd: [{
			name: 'toImage2',
			icon: Plotly.Icons.camera,
			click: function(gd) {
				Plotly.downloadImage(gd, {format: 'svg'})
			}
		}]
	};

	const s = data.map(([e,s,i,r,d]) => s);
	const i = data.map(([e,s,i,r,d]) => i);
	const r = data.map(([e,s,i,r,d]) => r);
	const d = data.map(([e,s,i,r,d]) => d);
	const k = data.map((_,k) => k);

	const tr1 = { x:k, y: s, type : 'bar', marker: {color: 'mediumturquoise'} };
	const tr2 = { x:k, y: i, type : 'bar', marker: {color: 'tomato'} };
	const tr3 = { x:k, y: r, type : 'bar', marker: {color: 'yellowgreen'} };
	const tr4 = { x:k, y: d, type : 'bar', marker: {color: 'dimgray'} };

	const graphData = [tr2, tr4, tr3, tr1];
	const layout = {barmode: "stack"};
	Plotly.newPlot('graph', graphData, layout, opts);
}

/*
const graph = document.getElementById('graph');
const gctx = graph.getContext('2d');

const xmin = 100;
const xmax = width - xmin;
const ymax = 100;
const ymin = height - ymax;
const epsx = 30;
const epsy = 30;

const radius = 2;

function drawGraph() {
	gctx.beginPath();
	gctx.fillStyle = 'black';
	gctx.rect(0, 0, 1600, 900);
	gctx.fill();
	gctx.strokeStyle = 'white';
	gctx.lineWidth = 2;
	gctx.fillStyle = 'white';
	arrow(xmin-epsx, ymin, xmax+epsx, ymin, -15, 0);
	arrow(xmin, ymin+epsy, xmin, ymax-epsy, 0, 15);

	for(let k = 0; k < data.length; k++) {
		const [_,s,i,r,r2] = data[k];
		const x = map(k, 0, data.length - 1, xmin, xmax);
		const dx = (1 / data.length) * (xmax - xmin);
		const dmax = s + i + r + r2;
		const y = d => map(-d, 0, dmax, ymin, ymax);

		let offsety = 0;
		gctx.fillStyle = 'tomato';
		gctx.fillRect(x, y(offsety), dx, y(0)-y(i));
		offsety += i;

		gctx.fillStyle = 'yellowgreen';
		gctx.fillRect(x, y(offsety), dx, y(0)-y(r));
		offsety += r;

		gctx.fillStyle = 'dimgray';
		gctx.fillRect(x, y(offsety), dx, y(0)-y(r2));
		offsety += r2;

		gctx.fillStyle = 'mediumturquoise';
		gctx.fillRect(x, y(offsety), dx, y(0)-y(s));
	}
}

function arrow(fromx, fromy, tox, toy, deltax, deltay) {
	const headlen = 30;
	const dx = tox - fromx;
	const dy = toy - fromy;
	const angle = Math.atan2(dy, dx);
	gctx.beginPath();
	gctx.moveTo(fromx, fromy);
	gctx.lineTo(tox + deltax, toy + deltay);
	gctx.stroke();
	gctx.beginPath();
	gctx.moveTo(tox, toy);
	gctx.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
	gctx.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
	gctx.fill();
}*/
