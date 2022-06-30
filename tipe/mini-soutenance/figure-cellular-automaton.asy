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
size(3.5cm, IgnoreAspect);


int w = 14;

srand(0);

pen[] poss = {red, red, red, purple, green, gree, cyan, cyan, cyan, cyan, cyan};

for(int i = 1; i < w - 1; ++i) {
	for(int j = 1; j < w - 1; ++j) {
		int r = floor(unitrand() * poss.length);
		pen p = poss[r];

		fill((i,j)--(i+1,j)--(i+1,j+1)--(i,j+1)--cycle,p);
	}
}

for(int i = 1; i < w; ++i) {
	draw((i, 0)--(i, w));
	draw((0, i)--(w, i));
}






