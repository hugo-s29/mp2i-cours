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

real[][] data = {
	{28973,28626,1,0,0},
	{28973,28626,1,0,0},
	{28973,28626,1,0,0},
	{28973,28626,1,0,0},
	{28973,28626,1,0,0},
	{28973,28625,2,0,0},
	{28973,28625,2,0,0},
	{28973,28624,3,0,0},
	{28973,28623,4,0,0},
	{28973,28621,6,0,0},
	{28973,28620,7,0,0},
	{28973,28617,10,0,0},
	{28973,28617,10,0,0},
	{28973,28614,13,0,0},
	{28973,28613,14,0,0},
	{28973,28611,16,0,0},
	{28973,28608,19,0,0},
	{28973,28606,21,0,0},
	{28973,28603,24,0,0},
	{28973,28599,28,0,0},
	{28973,28598,29,0,0},
	{28973,28595,32,0,0},
	{28973,28590,37,0,0},
	{28973,28583,44,0,0},
	{28973,28581,46,0,0},
	{28973,28577,50,0,0},
	{28973,28575,52,0,0},
	{28973,28563,64,0,0},
	{28973,28559,68,0,0},
	{28973,28555,72,0,0},
	{28973,28548,79,0,0},
	{28973,28541,86,0,0},
	{28973,28538,89,0,0},
	{28973,28533,94,0,0},
	{28973,28528,99,0,0},
	{28973,28523,104,0,0},
	{28973,28517,110,0,0},
	{28973,28511,116,0,0},
	{28973,28502,125,0,0},
	{28973,28498,129,0,0},
	{28973,28491,136,0,0},
	{28973,28483,144,0,0},
	{28973,28472,155,0,0},
	{28973,28459,168,0,0},
	{28973,28452,175,0,0},
	{28973,28441,186,0,0},
	{28973,28433,194,0,0},
	{28973,28419,208,0,0},
	{28973,28414,213,0,0},
	{28973,28406,221,0,0},
	{28973,28399,228,0,0},
	{28973,28383,244,0,0},
	{28973,28372,255,0,0},
	{28973,28358,269,0,0},
	{28973,28346,281,0,0},
	{28973,28331,296,0,0},
	{28973,28320,307,0,0},
	{28973,28304,323,0,0},
	{28973,28287,340,0,0},
	{28973,28278,349,0,0},
	{28973,28265,362,0,0},
	{28973,28253,374,0,0},
	{28973,28237,390,0,0},
	{28973,28220,407,0,0},
	{28973,28209,418,0,0},
	{28973,28197,430,0,0},
	{28973,28184,443,0,0},
	{28973,28171,456,0,0},
	{28973,28155,472,0,0},
	{28973,28145,482,0,0},
	{28973,28133,494,0,0},
	{28973,28120,507,0,0},
	{28973,28102,525,0,0},
	{28973,28088,539,0,0},
	{28973,28075,552,0,0},
	{28973,28060,567,0,0},
	{28973,28049,578,0,0},
	{28973,28035,592,0,0},
	{28973,28017,610,0,0},
	{28973,27995,632,0,0},
	{28973,27977,650,0,0},
	{28973,27951,676,0,0},
	{28973,27933,694,0,0},
	{28973,27914,713,0,0},
	{28973,27887,740,0,0},
	{28973,27866,761,0,0},
	{28973,27849,778,0,0},
	{28973,27821,806,0,0},
	{28973,27803,824,0,0},
	{28973,27782,845,0,0},
	{28973,27758,869,0,0},
	{28973,27731,896,0,0},
	{28973,27707,920,0,0},
	{28973,27695,932,0,0},
	{28973,27674,953,0,0},
	{28973,27651,976,0,0},
	{28973,27629,998,0,0},
	{28973,27606,1021,0,0},
	{28973,27583,1044,0,0},
	{28973,27564,1063,0,0},
	{28973,27544,1083,0,0},
	{28973,27515,1112,0,0},
	{28973,27497,1130,0,0},
	{28973,27473,1154,0,0},
	{28973,27446,1181,0,0},
	{28973,27430,1197,0,0},
	{28973,27413,1214,0,0},
	{28973,27382,1245,0,0},
	{28973,27360,1267,0,0},
	{28973,27337,1290,0,0},
	{28973,27299,1328,0,0},
	{28973,27273,1354,0,0},
	{28973,27240,1387,0,0},
	{28973,27215,1412,0,0},
	{28973,27193,1434,0,0},
	{28973,27160,1467,0,0},
	{28973,27137,1490,0,0},
	{28973,27111,1516,0,0},
	{28973,27079,1548,0,0},
	{28973,27049,1578,0,0},
	{28973,27025,1602,0,0},
	{28973,26993,1634,0,0},
	{28973,26961,1666,0,0},
	{28973,26931,1696,0,0},
	{28973,26906,1721,0,0},
	{28973,26868,1759,0,0},
	{28973,26847,1780,0,0},
	{28973,26803,1824,0,0},
	{28973,26770,1857,0,0},
	{28973,26742,1885,0,0},
	{28973,26712,1915,0,0},
	{28973,26681,1945,1,0},
	{28973,26646,1980,1,0},
	{28973,26609,2017,1,0},
	{28973,26578,2047,2,0},
	{28973,26544,2080,3,0},
	{28973,26510,2114,3,0},
	{28973,26467,2157,3,0},
	{28973,26423,2201,3,0},
	{28973,26393,2231,3,0},
	{28973,26352,2269,6,0},
	{28973,26315,2305,7,0},
	{28973,26279,2341,7,0},
	{28973,26242,2378,7,0},
	{28973,26192,2427,7,1},
	{28973,26148,2467,11,1},
	{28973,26098,2515,13,1},
	{28973,26061,2550,15,1},
	{28973,26021,2589,16,1},
	{28973,25979,2630,17,1},
	{28973,25939,2668,18,2},
	{28973,25876,2731,18,2},
	{28973,25822,2783,20,2},
	{28973,25775,2827,22,3},
	{28973,25721,2881,22,3},
	{28973,25669,2929,26,3},
	{28973,25621,2975,28,3},
	{28973,25568,3026,30,3},
	{28973,25520,3072,32,3},
	{28973,25477,3113,34,3},
	{28973,25439,3148,37,3},
	{28973,25403,3178,39,7},
	{28973,25353,3223,44,7},
	{28973,25294,3279,47,7},
	{28973,25249,3318,53,7},
	{28973,25213,3346,61,7},
	{28973,25174,3379,66,8},
	{28973,25114,3432,72,9},
	{28973,25076,3465,77,9},
	{28973,25028,3508,81,10},
	{28973,24980,3553,84,10},
	{28973,24924,3601,92,10},
	{28973,24887,3633,97,10},
	{28973,24837,3676,104,10},
	{28973,24788,3720,107,12},
	{28973,24738,3764,112,13},
	{28973,24700,3796,115,16},
	{28973,24650,3838,123,16},
	{28973,24609,3872,129,17},
	{28973,24555,3918,136,18},
	{28973,24512,3952,144,19},
	{28973,24467,3994,147,19},
	{28973,24410,4044,152,21},
	{28973,24359,4087,158,23},
	{28973,24299,4136,168,24},
	{28973,24253,4174,175,25},
	{28973,24214,4203,184,26},
	{28973,24154,4253,193,27},
	{28973,24100,4296,203,28},
	{28973,24058,4324,216,29},
	{28973,24000,4375,223,29},
	{28973,23946,4412,236,33},
	{28973,23903,4444,247,33},
	{28973,23848,4483,261,35},
	{28973,23791,4524,274,38},
	{28973,23733,4575,280,39},
	{28973,23692,4603,290,42},
	{28973,23639,4644,302,42},
	{28973,23573,4707,304,43},
	{28973,23527,4741,314,45},
	{28973,23479,4773,329,46},
	{28973,23428,4811,337,51},
	{28973,23381,4844,349,53},
	{28973,23311,4905,358,53},
	{28973,23255,4950,366,56},
	{28973,23212,4982,373,60},
	{28973,23157,5026,382,62},
	{28973,23113,5059,392,63},
	{28973,23060,5103,401,63},
	{28973,23005,5147,412,63},
	{28973,22949,5190,423,65},
	{28973,22893,5233,433,68},
	{28973,22843,5254,459,71},
	{28973,22780,5306,468,73},
	{28973,22720,5354,479,74},
	{28973,22660,5400,491,76},
	{28973,22613,5428,509,77},
	{28973,22537,5486,525,79},
	{28973,22481,5520,546,80},
	{28973,22421,5566,559,81},
	{28973,22374,5598,574,81},
	{28973,22319,5638,587,83},
	{28973,22265,5672,604,86},
	{28973,22212,5708,620,87},
	{28973,22158,5740,640,89},
	{28973,22099,5772,664,92},
	{28973,22054,5795,683,95},
	{28973,22000,5825,705,97},
	{28973,21943,5856,729,99},
	{28973,21885,5886,752,104},
	{28973,21827,5922,772,106},
	{28973,21769,5951,800,107},
	{28973,21717,5984,819,107},
	{28973,21662,6013,842,110},
	{28973,21597,6057,863,110},
	{28973,21538,6103,875,111},
	{28973,21481,6144,889,113},
	{28973,21427,6178,907,115},
	{28973,21366,6212,934,115},
	{28973,21311,6244,954,118},
	{28973,21249,6282,975,121},
	{28973,21173,6341,989,124},
	{28973,21115,6372,1014,126},
	{28973,21041,6418,1038,130},
	{28973,20974,6465,1058,130},
	{28973,20903,6516,1074,134},
	{28973,20832,6569,1090,136},
	{28973,20774,6600,1116,137},
	{28973,20703,6651,1134,139},
	{28973,20625,6693,1165,144},
	{28973,20561,6734,1184,148},
	{28973,20492,6781,1205,149},
	{28973,20421,6828,1227,151},
	{28973,20355,6867,1250,155},
	{28973,20281,6909,1281,156},
	{28973,20218,6949,1303,157},
	{28973,20152,6984,1333,158},
	{28973,20079,7036,1350,162},
	{28973,20018,7060,1385,164},
	{28973,19959,7086,1414,168},
	{28973,19870,7149,1434,174},
	{28973,19805,7188,1460,174},
	{28973,19733,7220,1497,177},
	{28973,19656,7259,1529,183},
	{28973,19592,7286,1562,187},
	{28973,19526,7319,1589,193},
	{28973,19460,7354,1615,198},
	{28973,19386,7388,1648,205},
	{28973,19325,7408,1687,207},
	{28973,19254,7448,1717,208},
	{28973,19167,7504,1743,213},
	{28973,19100,7542,1770,215},
	{28973,19031,7573,1805,218},
	{28973,18955,7616,1837,219},
	{28973,18892,7648,1863,224},
	{28973,18823,7677,1897,230},
	{28973,18749,7721,1923,234},
	{28973,18691,7731,1969,236},
	{28973,18633,7762,1993,239},
	{28973,18564,7794,2029,240},
	{28973,18497,7831,2057,242},
	{28973,18427,7862,2092,246},
	{28973,18364,7885,2126,252},
	{28973,18293,7919,2157,258},
	{28973,18236,7941,2187,263},
	{28973,18166,7960,2232,269},
	{28973,18088,8009,2256,274},
	{28973,18014,8050,2285,278},
	{28973,17948,8076,2322,281},
	{28973,17878,8110,2355,284},
	{28973,17816,8135,2389,287},
	{28973,17747,8170,2421,289},
	{28973,17687,8177,2470,293},
	{28973,17617,8198,2513,299},
	{28973,17541,8235,2549,302},
	{28973,17459,8264,2595,309},
	{28973,17398,8280,2636,313},
	{28973,17319,8305,2683,320},
	{28973,17243,8331,2727,326},
	{28973,17167,8345,2783,332},
	{28973,17106,8347,2838,336},
	{28973,17038,8372,2874,343},
	{28973,16974,8389,2911,353},
	{28973,16892,8428,2952,355},
	{28973,16829,8457,2984,357},
	{28973,16761,8481,3024,361},
	{28973,16690,8507,3067,363},
	{28973,16605,8543,3112,367},
	{28973,16535,8582,3139,371},
	{28973,16472,8593,3186,376},
	{28973,16390,8629,3231,377},
	{28973,16316,8657,3273,381},
	{28973,16231,8704,3307,385},
	{28973,16164,8733,3337,393},
	{28973,16092,8753,3386,396},
	{28973,16026,8757,3440,404},
	{28973,15943,8794,3480,410},
	{28973,15886,8802,3525,414},
	{28973,15807,8830,3571,419},
	{28973,15723,8874,3610,420},
	{28973,15653,8880,3670,424},
	{28973,15597,8883,3717,430},
	{28973,15533,8885,3774,435},
	{28973,15474,8895,3819,439},
	{28973,15397,8925,3866,439},
	{28973,15330,8948,3904,445},
	{28973,15270,8963,3946,448},
	{28973,15208,8969,3996,454},
	{28973,15138,8996,4037,456},
	{28973,15059,9007,4097,464},
	{28973,14982,9041,4133,471},
	{28973,14914,9056,4183,474},
	{28973,14860,9060,4223,484},
	{28973,14794,9070,4272,491},
	{28973,14730,9073,4324,500},
	{28973,14674,9073,4374,506},
	{28973,14605,9086,4423,513},
	{28973,14524,9107,4479,517},
	{28973,14457,9128,4521,521},
	{28973,14387,9138,4575,527},
	{28973,14315,9158,4621,533},
	{28973,14250,9179,4664,534},
	{28973,14184,9165,4736,542},
	{28973,14124,9164,4790,549},
	{28973,14069,9166,4837,555},
	{28973,14017,9144,4906,560},
	{28973,13955,9154,4954,564},
	{28973,13891,9170,4996,570},
	{28973,13837,9166,5046,578},
	{28973,13770,9175,5100,582},
	{28973,13714,9184,5143,586},
	{28973,13648,9196,5189,594},
	{28973,13575,9224,5232,596},
	{28973,13515,9235,5275,602},
	{28973,13458,9242,5321,606},
	{28973,13373,9278,5365,611},
	{28973,13317,9288,5408,614},
	{28973,13251,9309,5446,621},
	{28973,13177,9327,5492,631},
	{28973,13115,9336,5541,635},
	{28973,13055,9346,5588,638},
	{28973,12986,9361,5639,641},
	{28973,12922,9365,5690,650},
	{28973,12853,9355,5757,662},
	{28973,12794,9357,5808,668},
	{28973,12721,9374,5860,672},
	{28973,12662,9377,5911,677},
	{28973,12587,9409,5949,682},
	{28973,12505,9441,5994,687},
	{28973,12448,9435,6050,694},
	{28973,12386,9440,6100,701},
	{28973,12318,9446,6153,710},
	{28973,12256,9447,6208,716},
	{28973,12184,9456,6267,720},
	{28973,12139,9444,6318,726},
	{28973,12064,9473,6359,731},
	{28973,12006,9465,6414,742},
	{28973,11948,9457,6471,751},
	{28973,11874,9478,6518,757},
	{28973,11802,9484,6576,765},
	{28973,11738,9484,6636,769},
	{28973,11677,9487,6689,774},
	{28973,11617,9476,6758,776},
	{28973,11549,9482,6816,780},
	{28973,11489,9478,6873,787},
	{28973,11424,9482,6931,790},
	{28973,11372,9472,6986,797},
	{28973,11312,9476,7037,802},
	{28973,11252,9458,7109,808},
	{28973,11200,9433,7179,815},
	{28973,11160,9409,7239,819},
	{28973,11104,9401,7294,828},
	{28973,11043,9386,7360,838},
	{28973,10984,9359,7433,851},
	{28973,10935,9338,7495,859},
	{28973,10882,9320,7562,863},
	{28973,10822,9319,7616,870},
	{28973,10758,9316,7676,877},
	{28973,10717,9300,7726,884},
	{28973,10658,9294,7786,889},
	{28973,10592,9290,7851,894},
	{28973,10538,9287,7906,896},
	{28973,10480,9279,7965,903},
	{28973,10416,9294,8013,904},
	{28973,10368,9264,8079,916},
	{28973,10309,9254,8146,918},
	{28973,10250,9242,8213,922},
	{28973,10188,9232,8280,927},
	{28973,10136,9214,8349,928},
	{28973,10073,9209,8408,937},
	{28973,10012,9202,8468,945},
	{28973,9947,9200,8528,952},
	{28973,9880,9187,8600,960},
	{28973,9828,9172,8660,967},
	{28973,9770,9158,8716,983},
	{28973,9701,9167,8770,989},
	{28973,9643,9150,8835,999},
	{28973,9577,9150,8898,1002},
	{28973,9517,9139,8957,1014},
	{28973,9454,9134,9017,1022},
	{28973,9394,9114,9088,1031},
	{28973,9338,9101,9151,1037},
	{28973,9281,9093,9210,1043},
	{28973,9220,9103,9253,1051},
	{28973,9161,9097,9313,1056},
	{28973,9102,9099,9365,1061},
	{28973,9043,9079,9438,1067},
	{28973,8987,9064,9501,1075},
	{28973,8936,9045,9564,1082},
	{28973,8881,9015,9637,1094},
	{28973,8824,9003,9696,1104},
	{28973,8759,9000,9753,1115},
	{28973,8700,8991,9814,1122},
	{28973,8626,8988,9881,1132},
	{28973,8567,8967,9953,1140},
	{28973,8515,8953,10012,1147},
	{28973,8449,8945,10076,1157},
	{28973,8405,8909,10140,1173},
	{28973,8352,8881,10212,1182},
	{28973,8301,8866,10271,1189},
	{28973,8255,8836,10339,1197},
	{28973,8200,8804,10420,1203},
	{28973,8146,8793,10478,1210},
	{28973,8099,8771,10538,1219},
	{28973,8036,8773,10595,1223},
	{28973,7985,8757,10649,1236},
	{28973,7933,8740,10713,1241},
	{28973,7869,8737,10768,1253},
	{28973,7827,8718,10825,1257},
	{28973,7760,8716,10887,1264},
	{28973,7699,8710,10949,1269},
	{28973,7642,8692,11013,1280},
	{28973,7601,8659,11079,1288},
	{28973,7540,8652,11142,1293},
	{28973,7486,8631,11206,1304},
	{28973,7436,8606,11278,1307},
	{28973,7380,8602,11333,1312},
	{28973,7311,8602,11397,1317},
	{28973,7256,8582,11467,1322},
	{28973,7201,8563,11534,1329},
	{28973,7145,8542,11604,1336},
	{28973,7080,8539,11669,1339},
	{28973,7027,8528,11726,1346},
	{28973,6966,8510,11800,1351},
	{28973,6904,8517,11851,1355},
	{28973,6852,8493,11921,1361},
	{28973,6785,8488,11989,1365},
	{28973,6726,8489,12040,1372},
	{28973,6659,8500,12091,1377},
	{28973,6605,8494,12144,1384},
	{28973,6549,8478,12206,1394},
	{28973,6474,8480,12273,1400},
	{28973,6414,8476,12334,1403},
	{28973,6354,8469,12390,1414},
	{28973,6298,8449,12455,1425},
	{28973,6241,8439,12515,1432},
	{28973,6175,8438,12572,1442},
	{28973,6120,8420,12641,1446},
	{28973,6051,8422,12698,1456},
	{28973,6002,8418,12747,1460},
	{28973,5944,8396,12820,1467},
	{28973,5885,8380,12890,1472},
	{28973,5827,8386,12935,1479},
	{28973,5758,8376,13005,1488},
	{28973,5689,8382,13066,1490},
	{28973,5631,8374,13122,1500},
	{28973,5573,8375,13174,1505},
	{28973,5499,8390,13231,1507},
	{28973,5440,8389,13286,1512},
	{28973,5384,8395,13335,1513},
	{28973,5319,8390,13399,1519},
	{28973,5258,8385,13453,1531},
	{28973,5192,8388,13509,1538},
	{28973,5145,8370,13565,1547},
	{28973,5093,8367,13614,1553},
	{28973,5042,8359,13671,1555},
	{28973,4980,8355,13733,1559},
	{28973,4917,8339,13807,1564},
	{28973,4858,8337,13862,1570},
	{28973,4799,8340,13913,1575},
	{28973,4738,8334,13971,1584},
	{28973,4678,8346,14017,1586},
	{28973,4604,8349,14081,1593},
	{28973,4554,8324,14148,1601},
	{28973,4510,8305,14204,1608},
	{28973,4445,8305,14260,1617},
	{28973,4394,8287,14320,1626},
	{28973,4328,8282,14383,1634},
	{28973,4273,8263,14449,1642},
	{28973,4219,8244,14509,1655},
	{28973,4151,8252,14560,1664},
	{28973,4088,8258,14615,1666},
	{28973,4042,8245,14669,1671},
	{28973,3989,8243,14717,1678},
	{28973,3936,8238,14767,1686},
	{28973,3897,8198,14837,1695},
	{28973,3836,8183,14906,1702},
	{28973,3794,8166,14958,1709},
	{28973,3748,8144,15016,1719},
	{28973,3693,8137,15073,1724},
	{28973,3654,8117,15119,1737},
	{28973,3598,8109,15174,1746},
	{28973,3556,8081,15238,1752},
	{28973,3516,8060,15292,1759},
	{28973,3466,8045,15348,1768},
	{28973,3419,8042,15388,1778},
	{28973,3370,8036,15435,1786},
	{28973,3330,8018,15489,1790},
	{28973,3285,8006,15537,1799},
	{28973,3226,8014,15587,1800},
	{28973,3178,7996,15646,1807},
	{28973,3123,8011,15677,1816},
	{28973,3070,7997,15740,1820},
	{28973,3016,7992,15794,1825},
	{28973,2957,8000,15837,1833},
	{28973,2894,8002,15893,1838},
	{28973,2857,7979,15946,1845},
	{28973,2812,7962,16006,1847},
	{28973,2755,7973,16044,1855},
	{28973,2701,7981,16089,1856},
	{28973,2664,7956,16151,1856},
	{28973,2624,7946,16195,1862},
	{28973,2578,7931,16252,1866},
	{28973,2537,7915,16304,1871},
	{28973,2488,7903,16361,1875},
	{28973,2442,7888,16416,1881},
	{28973,2392,7884,16463,1888},
	{28973,2339,7875,16520,1893},
	{28973,2296,7853,16576,1902},
	{28973,2245,7837,16638,1907},
	{28973,2208,7809,16700,1910},
	{28973,2178,7783,16751,1915},
	{28973,2140,7758,16808,1921},
	{28973,2092,7743,16866,1926},
	{28973,2048,7730,16916,1933},
	{28973,2009,7723,16957,1938},
	{28973,1983,7695,17003,1946},
	{28973,1940,7667,17060,1960},
	{28973,1907,7660,17096,1964},
	{28973,1874,7626,17157,1970},
	{28973,1846,7598,17209,1974},
	{28973,1813,7576,17261,1977},
	{28973,1785,7552,17307,1983},
	{28973,1744,7540,17353,1990},
	{28973,1718,7510,17400,1999},
	{28973,1684,7482,17453,2008},
	{28973,1661,7450,17498,2018},
	{28973,1623,7417,17561,2026},
	{28973,1587,7392,17617,2031},
	{28973,1555,7373,17662,2037},
	{28973,1520,7361,17701,2045},
	{28973,1494,7329,17749,2055},
	{28973,1452,7308,17805,2062},
	{28973,1424,7289,17846,2068},
	{28973,1390,7258,17904,2075},
	{28973,1354,7240,17952,2081},
	{28973,1319,7218,18005,2085},
	{28973,1290,7188,18058,2091},
	{28973,1262,7163,18108,2094},
	{28973,1228,7153,18148,2098},
	{28973,1197,7122,18201,2107},
	{28973,1174,7092,18245,2116},
	{28973,1137,7066,18302,2122},
	{28973,1111,7049,18334,2133},
	{28973,1079,7017,18394,2137},
	{28973,1047,6986,18453,2141},
	{28973,1016,6961,18501,2149},
	{28973,991,6930,18554,2152},
	{28973,961,6899,18611,2156},
	{28973,923,6865,18676,2163},
	{28973,891,6838,18732,2166},
	{28973,868,6801,18781,2177},
	{28973,838,6781,18827,2181},
	{28973,813,6752,18874,2188},
	{28973,775,6735,18922,2195},
	{28973,750,6695,18982,2200},
	{28973,716,6668,19039,2204},
	{28973,691,6637,19090,2209},
	{28973,669,6599,19146,2213},
	{28973,648,6567,19191,2221},
	{28973,637,6524,19240,2226},
	{28973,619,6495,19284,2229},
	{28973,602,6452,19339,2234},
	{28973,582,6415,19391,2239},
	{28973,561,6369,19448,2249},
	{28973,541,6329,19500,2257},
	{28973,523,6288,19552,2264},
	{28973,507,6237,19613,2270},
	{28973,491,6198,19666,2272},
	{28973,474,6153,19719,2281},
	{28973,462,6104,19775,2286},
	{28973,449,6057,19830,2291},
	{28973,433,6007,19891,2296},
	{28973,419,5961,19948,2299},
	{28973,402,5920,20001,2304},
	{28973,391,5874,20056,2306},
	{28973,363,5837,20115,2312},
	{28973,343,5789,20178,2317},
	{28973,333,5732,20239,2323},
	{28973,318,5683,20298,2328},
	{28973,309,5622,20359,2337},
	{28973,302,5573,20408,2344},
	{28973,294,5518,20468,2347},
	{28973,283,5483,20510,2351},
	{28973,268,5436,20564,2359},
	{28973,257,5394,20611,2365},
	{28973,249,5350,20655,2373},
	{28973,235,5301,20714,2377},
	{28973,222,5255,20769,2381},
	{28973,210,5217,20813,2387},
	{28973,194,5162,20877,2394},
	{28973,186,5101,20940,2400},
	{28973,182,5060,20982,2403},
	{28973,173,5011,21028,2415},
	{28973,166,4955,21082,2424},
	{28973,159,4911,21129,2428},
	{28973,146,4863,21183,2435},
	{28973,138,4803,21241,2445},
	{28973,126,4756,21298,2447},
	{28973,116,4714,21343,2454},
	{28973,104,4661,21401,2461},
	{28973,90,4616,21455,2466},
	{28973,87,4556,21512,2472},
	{28973,79,4510,21560,2478},
	{28973,75,4455,21616,2481},
	{28973,70,4407,21664,2486},
	{28973,63,4364,21713,2487},
	{28973,59,4304,21771,2493},
	{28973,52,4250,21822,2503},
	{28973,47,4212,21857,2511},
	{28973,44,4162,21899,2522},
	{28973,41,4118,21944,2524},
	{28973,37,4068,21993,2529},
	{28973,35,4032,22029,2531},
	{28973,29,3992,22068,2538},
	{28973,22,3945,22118,2542},
	{28973,19,3885,22178,2545},
	{28973,17,3831,22232,2547},
	{28973,14,3779,22283,2551},
	{28973,12,3713,22342,2560},
	{28973,9,3670,22382,2566},
	{28973,7,3621,22425,2574},
	{28973,6,3573,22469,2579},
	{28973,4,3530,22510,2583},
	{28973,3,3488,22547,2589},
	{28973,2,3435,22597,2593},
	{28973,1,3378,22654,2594},
	{28973,1,3335,22691,2600},
	{28973,1,3284,22734,2608},
	{28973,1,3228,22783,2615},
	{28973,1,3184,22821,2621},
	{28973,1,3128,22875,2623},
	{28973,1,3079,22918,2629},
	{28973,1,3029,22961,2636},
	{28973,1,2985,23003,2638},
	{28973,1,2941,23044,2641},
	{28973,1,2890,23080,2656},
	{28973,1,2854,23112,2660},
	{28973,0,2795,23168,2664},
	{28973,0,2745,23215,2667},
	{28973,0,2701,23255,2671},
	{28973,0,2658,23294,2675},
	{28973,0,2611,23337,2679},
	{28973,0,2576,23370,2681},
	{28973,0,2526,23415,2686},
	{28973,0,2485,23453,2689},
	{28973,0,2425,23506,2696},
	{28973,0,2386,23542,2699},
	{28973,0,2343,23579,2705},
	{28973,0,2307,23606,2714},
	{28973,0,2275,23635,2717},
	{28973,0,2234,23669,2724},
	{28973,0,2194,23704,2729},
	{28973,0,2152,23740,2735},
	{28973,0,2112,23780,2735},
	{28973,0,2072,23815,2740},
	{28973,0,2035,23844,2748},
	{28973,0,2003,23874,2750},
	{28973,0,1980,23892,2755},
	{28973,0,1931,23934,2762},
	{28973,0,1889,23971,2767},
	{28973,0,1864,23992,2771},
	{28973,0,1831,24024,2772},
	{28973,0,1796,24051,2780},
	{28973,0,1750,24093,2784},
	{28973,0,1704,24132,2791},
	{28973,0,1666,24166,2795},
	{28973,0,1632,24197,2798},
	{28973,0,1597,24229,2801},
	{28973,0,1561,24259,2807},
	{28973,0,1529,24286,2812},
	{28973,0,1496,24317,2814},
	{28973,0,1466,24347,2814},
	{28973,0,1440,24371,2816},
	{28973,0,1407,24395,2825},
	{28973,0,1373,24427,2827},
	{28973,0,1341,24456,2830},
	{28973,0,1303,24489,2835},
	{28973,0,1273,24516,2838},
	{28973,0,1254,24533,2840},
	{28973,0,1221,24562,2844},
	{28973,0,1192,24590,2845},
	{28973,0,1163,24619,2845},
	{28973,0,1142,24638,2847},
	{28973,0,1113,24664,2850},
	{28973,0,1086,24689,2852},
	{28973,0,1052,24718,2857},
	{28973,0,1025,24742,2860},
	{28973,0,999,24761,2867},
	{28973,0,965,24794,2868},
	{28973,0,935,24822,2870},
	{28973,0,906,24849,2872},
	{28973,0,881,24874,2872},
	{28973,0,843,24910,2874},
	{28973,0,819,24930,2878},
	{28973,0,799,24947,2881},
	{28973,0,779,24967,2881},
	{28973,0,748,24997,2882},
	{28973,0,720,25022,2885},
	{28973,0,694,25045,2888},
	{28973,0,669,25068,2890},
	{28973,0,641,25094,2892},
	{28973,0,621,25113,2893},
	{28973,0,601,25129,2897},
	{28973,0,580,25148,2899},
	{28973,0,563,25165,2899},
	{28973,0,540,25185,2902},
	{28973,0,525,25200,2902},
	{28973,0,501,25222,2904},
	{28973,0,489,25233,2905},
	{28973,0,467,25252,2908},
	{28973,0,453,25266,2908},
	{28973,0,438,25277,2912},
	{28973,0,423,25290,2914},
	{28973,0,408,25301,2918},
	{28973,0,391,25316,2920},
	{28973,0,381,25326,2920},
	{28973,0,368,25336,2923},
	{28973,0,361,25342,2924},
	{28973,0,353,25349,2925},
	{28973,0,340,25359,2928},
	{28973,0,322,25374,2931},
	{28973,0,311,25384,2932},
	{28973,0,303,25391,2933},
	{28973,0,291,25402,2934},
	{28973,0,275,25417,2935},
	{28973,0,267,25425,2935},
	{28973,0,252,25440,2935},
	{28973,0,238,25453,2936},
	{28973,0,230,25461,2936},
	{28973,0,218,25473,2936},
	{28973,0,206,25484,2937},
	{28973,0,193,25496,2938},
	{28973,0,180,25508,2939},
	{28973,0,171,25517,2939},
	{28973,0,159,25526,2942},
	{28973,0,148,25536,2943},
	{28973,0,143,25540,2944},
	{28973,0,137,25545,2945},
	{28973,0,126,25555,2946},
	{28973,0,116,25565,2946},
	{28973,0,107,25573,2947},
	{28973,0,100,25578,2949},
	{28973,0,95,25583,2949},
	{28973,0,89,25589,2949},
	{28973,0,86,25592,2949},
	{28973,0,82,25595,2950},
	{28973,0,80,25597,2950},
	{28973,0,78,25599,2950},
	{28973,0,72,25604,2951},
	{28973,0,71,25605,2951},
	{28973,0,68,25608,2951},
	{28973,0,65,25611,2951},
	{28973,0,58,25618,2951},
	{28973,0,50,25624,2953},
	{28973,0,48,25626,2953},
	{28973,0,44,25629,2954},
	{28973,0,40,25633,2954},
	{28973,0,31,25641,2955},
	{28973,0,30,25642,2955},
	{28973,0,26,25646,2955},
	{28973,0,21,25650,2956},
	{28973,0,19,25652,2956},
	{28973,0,14,25657,2956},
	{28973,0,11,25659,2957},
	{28973,0,10,25660,2957},
	{28973,0,7,25663,2957},
	{28973,0,6,25664,2957},
	{28973,0,6,25664,2957},
	{28973,0,5,25665,2957},
	{28973,0,5,25665,2957},
	{28973,0,5,25665,2957},
	{28973,0,4,25666,2957},
	{28973,0,4,25666,2957},
	{28973,0,3,25667,2957},
	{28973,0,1,25669,2957},
	{28973,0,1,25669,2957},
	{28973,0,1,25669,2957},
	{28973,0,1,25669,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957},
	{28973,0,0,25670,2957}
};

size(10cm, 3cm, IgnoreAspect);

path pI = (0, 0) -- (0,0);
path pD = (0, 0) -- (0,0);
path pR = (0, 0) -- (0,0);

int tMax = data.length - 1;

real total = data[0][1] + data[0][2] + data[0][3] + data[0][4];

real S, I, R, D;

for(real t = 0; t < tMax; ++t) {
	S = data[floor(t)][1] / total;
	I = data[floor(t)][2] / total;
	R = data[floor(t)][3] / total;
	D = data[floor(t)][4] / total;

	pI = pI -- (t, I);
	pD = pD -- (t, I + D);
	pR = pR -- (t, I + D + R);
}

fill(pI--(tMax, I)--cycle, rgb("EF9A9A"));
fill(pD--reverse(pI)--cycle, rgb("E1BEE7"));
fill(pR--reverse(pD)--cycle, rgb("C5E1A5"));
fill((0, 1) -- (tMax, 1) -- reverse(pR)--cycle, rgb("80DEEA"));
