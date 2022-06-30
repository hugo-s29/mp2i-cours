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

size(3cm);

srand(0);

for(int i = 0; i < 10; ++i) {
	pair z = expi(2pi * unitrand()) * unitrand() / 2 + (1,1)/2;
	real x = z.x;
	real y = z.y;
	real theta = 2pi * unitrand();
	pen p = red;

	dot((x,y), p);
	draw((x,y) -- (x,y) + expi(theta) / 10, p, Arrow(TeXHead));
}

draw(circle((1,1)/2,1/2), dashed);

dot((1/2, 1/2), cyan);


