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

pen[] poss = {red, red, red, green, green, cyan, cyan, cyan, cyan, cyan};

defaultpen(black + fontsize(8pt));

size(5cm);

srand(0);

for(int i = 0; i < 30; ++i) {
	real x = unitrand();
	real y = unitrand();
	real theta = 2pi * unitrand();
	pen p = poss[floor(unitrand() * poss.length)];

	while(x+cos(theta)/10 > 1 || x + cos(theta)/10 < 0 || y + sin(theta)/10 > 1 || y + sin(theta)/10 < 0) {
		theta = 2pi * unitrand();
	}

	dot((x,y), p);
	draw((x,y) -- (x,y) + expi(theta) / 10, p, Arrow(TeXHead));
}

draw(unitsquare);

