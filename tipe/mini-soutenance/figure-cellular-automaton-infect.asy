settings.prc = false;
settings.render=0;

white = rgb("faf4ed");
black = rgb("575279");
blue = rgb("286983");
red = rgb("d7827e");
yellow = rgb("f6c177");
orange = rgb("ea9d34");
gray = rgb("9893a5");
grey = rgb("9893a5");
deepcyan = rgb("56949f");
pink = rgb("b4637a");
magenta = rgb("eb6f92");
green = rgb("a0d971");
purple = rgb("907aa9");

red = rgb("EF9A9A");
purple = rgb("E1BEE7");
green = rgb("C5E1A5");
cyan = rgb("80DEEA");

defaultpen(black + fontsize(8pt));
size(2.5cm, IgnoreAspect);


int w = 9;

srand(0);

pen[] poss = {red, red, purple, green, green, cyan, cyan, cyan, cyan, cyan, cyan, cyan, cyan};

pair mid = (w/2, w/2);

for(int i = 1; i < w - 1; ++i) {
	for(int j = 1; j < w - 1; ++j) {
		int r = floor(unitrand() * poss.length);
		pen p = poss[r];
		bool inf = p == red;
		pair pos = (i + 0.5, j + 0.5) - mid;

		if(length(pos) > w/3) {
			p = 0.2*p + 0.8*white;
		}

		if(inf) {
			fill((i,j)--(i+1,j)--(i+1,j+1)--(i,j+1)--cycle, p);
		}
	}
}

for(int i = 1; i < w - 1; ++i) {
	for(int j = 1; j < w - 1; ++j) {
		pair pos = (i + 0.5, j + 0.5) - mid;

		if(length(pos) > w/3) {
			draw((i,j)--(i+1,j)--(i+1,j+1)--(i,j+1)--cycle, 0.1*black + 0.9*white);
		}
	}
}

for(int i = 1; i < w - 1; ++i) {
	for(int j = 1; j < w - 1; ++j) {
		pair pos = (i + 0.5, j + 0.5) - mid;

		if(length(pos) <= w/3) {
			draw((i,j)--(i+1,j)--(i+1,j+1)--(i,j+1)--cycle, black);
		}
	}
}

fill(circle((w/2,w/2), 0.75/2));
label("?", (w/2, w/2), white);





