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

defaultpen(black + fontsize(8pt));

real r = 0.5;
real a = 0.1;
real b = 0.01;

real dt = 0.1;
real tMax = 50;

size(10cm, 3cm, IgnoreAspect);

real S = 0.99;
real I = 0.01;
real R = 0;
real D = 0;

path pI = (0, 0) -- (0,0);
path pD = (0, 0) -- (0,0);
path pR = (0, 0) -- (0,0);

for(real t = 0; t < tMax; t += dt) {
	S -= r * S * I * dt;
	I += (r * S * I - (a + b) * I) * dt;
	R += a * I * dt;
	D += b * I * dt;
	pI = pI -- (t, I);
	pD = pD -- (t, I + D);
	pR = pR -- (t, I + D + R);
}

fill(pI--(tMax, I)--cycle, rgb("EF9A9A"));
fill(pD--reverse(pI)--cycle, rgb("E1BEE7"));
fill(pR--reverse(pD)--cycle, rgb("C5E1A5"));
fill((0, 1) -- (tMax, 1) -- reverse(pR)--cycle, rgb("80DEEA"));

