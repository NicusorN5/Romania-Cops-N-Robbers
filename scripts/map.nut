function StartServer()
{
	SetServerName("[R0/EN]Romania Cops N' Robbers 0.8 WIP pre-Beta");
	SetGameModeName("RCNR 0.8 WIP pre-Beta<21 MB>");
	SetDeathMessages(false);
	SetPassword("");
	SetWastedSettings( 2000, 1000, 500, 500, RGB(0,0,0), 100000, 10000 )
	SetFriendlyFire(false);
	SetJoinMessages(false);
	SetTime(23,0);
	SetTimeRate(1000);
	SetWaterLevel(4.5);
	CreateRadioStream( 14, "Radio ZU", "http://stream.radiozu.ro:8020/", true );
	CreateRadioStream( 15, "Taraf", "http://asculta.radiotaraf.ro:7100/", true );
	CreateRadioStream( 16, "Trinitas", "http://82.208.137.144:8010/", true );
	SetSpawnPlayerPos(83.0861, -790.873, 20);
	SetSpawnCameraLook(83.0861, -790.873, 32.6243);
	SetSpawnCameraPos(107.401, -797.319, 43.9825);
	
}
function CreateMap()
{
	SetBackfaceCullingDisabled( true );
	CreateObject(638,3,Vector(161.641,-259.323,128.128),100).RotateToEuler(Vector(0,0,2 * 3.1415926 /4),0);
	//Romania Prison
	//islands
	//building
	CreateObject(734,0,Vector(586.398, 1453.41, 22.1),255).RotateToEuler(Vector(0,0,2 * 3.1415926 / 3),0);
	//celule
	CreateObject(3680,0,Vector(628.726, 1446.85, 11.78),255);
	CreateObject(3680,0,Vector(615.726, 1444.85, 11.78),255);
	CreateObject(3680,0,Vector(602.726, 1444.85, 12.3),255);
	CreateObject(3680,0,Vector(589.726, 1444.85, 12.3),255);
	//mase
	CreateObject(416,0,Vector(610.422, 1462.92, 10.5),255);
	CreateObject(416,0,Vector(607.422, 1462.92, 10.5),255);
	CreateObject(416,0,Vector(604.422, 1462.92, 10.5),255);
	CreateObject(416,0,Vector(601.422, 1462.92, 10.5),255);
	CreateObject(416,0,Vector(610.422, 1457.92, 10.5),255);
	CreateObject(416,0,Vector(607.422, 1457.92, 10.5),255);
	CreateObject(416,0,Vector(604.422, 1457.92, 10.5),255);
	CreateObject(416,0,Vector(601.422, 1457.92, 10.5),255);
	//markere
	CreateCheckpoint(null,0, true,Vector(550.659, 1435.76, 9.5014),ARGB(255,255,255,100),2) 
	CreateCheckpoint(null,0, true,Vector(551.423, 1431.38, 9.61492),ARGB(255,255,255,99),2)
	CreateCheckpoint(null,0, true,Vector(-1020.77, -866.595, 17.965),ARGB(255,0,0,254),3)
	CreateMarker(1,Vector(-1020.77, -866.595, 17.965),5,RGB(255,255,255),26);

	//garduri
	CreateObject(581,0,Vector(525.56, 1422.07, 10.4709),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(525.56, 1422.07, 11.7),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(525.56, 1409.17, 10.4709),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(525.56, 1409.17, 11.7),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(531.911, 1402.78, 10.47),255);
	CreateObject(581,0,Vector(531.911, 1402.78, 11.7),255);
	CreateObject(581,0,Vector(544.65, 1402.78, 10.47),255);
	CreateObject(581,0,Vector(544.65, 1402.78, 11.7),255);
	CreateObject(581,0,Vector(557.6, 1402.78, 10.07),255);
	CreateObject(581,0,Vector(557.6, 1402.78, 11.2),255);
	CreateObject(581,0,Vector(564.011, 1409.2, 10.5),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1409.2, 11.75),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1422.1, 10.5),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1422.1, 11.75),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1429, 9.5),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1429, 10.75),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(581,0,Vector(564.011, 1429, 11.75),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);

	//copaci
	CreateObject(440,0,Vector(530.129, 1408.6, 9.5),255)
	CreateObject(440,0,Vector(515.692, 1417.65,9.5),255)
	CreateObject(440,0,Vector(573.6, 1413.95, 9),255)
	CreateObject(440,0,Vector(596.75, 1429.01,8),255)
	CreateObject(440,0,Vector(568.877, 1425.79,7.6),255)
	//mese 2
	CreateObject(416,0,Vector(529.711, 1419.41, 10.2),255);
	CreateObject(416,0,Vector(532.711, 1419.41, 10.2),255);
	CreateObject(416,0,Vector(535.711, 1419.41, 10.2),255);
	CreateObject(416,0,Vector(538.711, 1419.41, 10.2),255);
	CreateObject(416,0,Vector(529.711, 1416.41, 10.2),255);
	CreateObject(416,0,Vector(532.711, 1416.41, 10.2),255);
	CreateObject(416,0,Vector(535.711, 1416.41, 10.2),255);
	CreateObject(416,0,Vector(538.711, 1416.41, 10.2),255);
	//mingi bagate in xml
	
	//vegetatie
	CreateObject(467,0,Vector(513.856, 1425.71, 10.6676),255)
	CreateObject(467,0,Vector(512.06, 1408.7, 11.3415),255)
	CreateObject(467,0,Vector(534.377, 1405.81, 10.8512),255)
	CreateObject(467,0,Vector(577.71, 1421.5, 11.0532),255)
	CreateObject(467,0,Vector(575.736, 1408.25, 11.5564),255)
	//cutii bagate in xml
	
	//altele
	CreateObject(3064,0,Vector(591.324, 1411.39, 11.22),255); //helipad
	CreateObject(2756,0,Vector(640.377, 1300,-18),255).RotateToEuler(Vector(0,0,3.141592 / 2),0);
	CreateObject(2774,0,Vector(640.377, 1300,-18),255).RotateToEuler(Vector(0,0,3.141592 / 2),0);
	CreateObject(2852,0,Vector(640.838, 1382.75, 10),255).RotateToEuler(Vector(0,3.141592 /55,0),0)
	
	//angelo
	CreateObject(6407,0,Vector(-828.183,-347.631,13.4),255).RotateByEuler(Vector(0,0,4.69),0); 
	CreateObject(6409,0,Vector(-566,642.59,12.312),255).RotateByEuler(Vector(0,0,4.85),0);
	CreateObject(6416,0,Vector(-544,642.59,11.1),255).RotateByEuler(Vector(0,0,15.85),0);
	CreateObject(6420,0,Vector(-417.763,897.871,13.99),255).RotateByEuler(Vector(0,0,4.31),0);
	CreateObject(6404,0,Vector(-408.32,919.978,12.8),255).RotateByEuler(Vector(0,0,7.49),0);
	CreateObject(6403,0,Vector(-424.274,880.560,12.5712),255).RotateByEuler(Vector(0,0,16.9),0);
	CreateObject(6414,0,Vector(-433.2,861.348,12.3712),255).RotateByEuler(Vector(0,0,20.01),0);
	CreateObject(6415,0,Vector(-436.5,839,12.6712),255).RotateByEuler(Vector(0,0,20.01),0);
	CreateObject(6417,0,Vector(-449,828,13.8712),255).RotateByEuler(Vector(0,0,4.30),0);
	CreateObject(6413,0,Vector(-448.2,797.148,17.0012),255).RotateByEuler(Vector(0,0,4.32),0);
	CreateObject(6412,0,Vector(-459.71,769.1,16.6600),255).RotateByEuler(Vector(0,0,4.318),0);
	CreateObject(6410,0,Vector(-471.41,741.5,16.8900),255).RotateByEuler(Vector(0,0,4.318),0);
	CreateObject(6411,0,Vector(-481.4,718.2,16.3500),255).RotateByEuler(Vector(0.02,0,4.318),0);
	CreateObject(6406,0,Vector(-496.7,689.8,15.5600),255).RotateByEuler(Vector(0,0,7.470),0);
	CreateObject(6406,0,Vector(-1039,1126.43,15.5898),255);
	CreateObject(6408,0,Vector(-1050.26,1182.501,12.4),255);
	CreateObject(6408,0,Vector(-1036.26,1182.50,12.4),255);
	
	
	//buy heli
	CreateObject(3814,0,Vector(-1264.98,-806.491,16.8 ),255);
	CreateObject(3064,0,Vector(-1258.48,-822.132,14.868 ),255);
	
	//next
	RawHideMapObject(2438,-5375,-3008,145);
	RawHideMapObject(2370,-2076,-4331,209);
	RawHideMapObject(414,-5340,-3039,101);
	RawHideMapObject(2423,-5375,-3008,145);
	RawHideMapObject(3429,818,-7974,132);  //wshbuildws19
    RawHideMapObject(3430,818,-7974,132);  //LODbuildws19
    RawHideMapObject(3515,893,-7811,105);  //lodbuil19wall
    RawHideMapObject(340,1057,-7826,99);  //bollardlight
    RawHideMapObject(340,958,-8006,99);  //bollardlight
    RawHideMapObject(340,890,-8130,99);  //bollardlight
	RawHideMapObject(3522,-1082,-8760,281);
    RawHideMapObject(391,-1003,-9566,241);
	RawHideMapObject(2403,-4998,-4677,116);
    RawHideMapObject(371,-4787,-4657,117);
    RawHideMapObject(371,-4290,-4309,110);
    RawHideMapObject(2372,-3726,-4633,113);
	RawHideMapObject(2420,-3781,-3359,118);
	RawHideMapObject(4045,4436,5246,126);
    RawHideMapObject(2454,-2076,-4369,199);
    HideMapObject(813,-832.981,-1484.41,12.9336 ); 
	CreateObject(6419,0,Vector(-210.385,-431.283,10),255).RotateByEuler(Vector(0,0,3.2),0);
	CreateObject(6418,0,Vector(-211.03,-420.25,11.5),255).RotateByEuler(Vector(0,0,3.2),0);
	CreateObject(6424,0,Vector(-210.661,-426.900,13.2),255).RotateByEuler(Vector(0,0,3.2),0);
	CreateObject(6423,0,Vector(-213.484,-427.555,12.1443),255).RotateByEuler(Vector(0,0,3.2),0);
	CreateObject(6421,0,Vector(-206.7,-434.660,12.7443),255).RotateByEuler(Vector(0,0,3.2),0);
	CreateObject(6422,0,Vector(-213.2,-434.2,12),255).RotateByEuler(Vector(0,0,3.2),0);
    CreateObject(6405,0,Vector(-533.136,-285.265,15.813),255).RotateByEuler(Vector(0,0,91.1000),0);
	CreateObject(6425,0,Vector(87.4984,-783.141,22.4633),255).RotateByEuler(Vector(0,0,114.2100),0);
	CreateObject(6416,0,Vector(-914.614,5,10.7913),255).RotateByEuler(Vector(0,0,15.69),0);
	CreateObject(416,0,Vector(-201.121,-444.28,11.1),255);
	CreateObject(416,0,Vector(-218.214,-444.725,11.1),255);
	CreateObject(4628,0,Vector(-206.896,-420.423,11.6),255);
	CreateObject(471,0,Vector(-209.671,-449.091,10.72),255);
	CreateObject(361,0,Vector(-221.454,-436.031,10.8),255);
	CreateObject(335,0,Vector(-208.191,-435.300,11.6743),255);
	CreateObject(574,0,Vector(-213.515,-384.792,9.7),255).RotateByEuler(Vector(0,0,15.69),0);
	CreateObject(574,0,Vector(-209.73,-383.435,9.7),255).RotateByEuler(Vector(0,0,15.69),0);
	CreateObject(574,0,Vector(-206.456,-379.684,9.7),255).RotateByEuler(Vector(0,0,15.69),0);
	//CreateObject(6430,0,Vector(-1468,-270.200,24.5),255);   //salvatore ang
	//CreateObject(6432,0,Vector(-1468,-265.200,21.9),255);   //salvatore ang
	//CreateObject(6431,0,Vector(-1497.25,-269.79,16.0063),255);  //salvatore ang
	//CreateObject(6433,0,Vector(-1468,-270.793,24.6),255).RotateByEuler(Vector(0,0,6.29),0);  //salvatore ang
	//CreateObject(6434,0,Vector(-1467,-265.405,22),255).RotateByEuler(Vector(0,0,6.29),0);    //salvatore ang
	//CreateObject(6435,0,Vector(-1468,-265,22),255).RotateByEuler(Vector(0,0,6.29),0);      //salvatore ang
    CreateObject(6450,0,Vector(-1015.79,-512.498,14.7412),255);    //ogloc
    CreateObject(6460,0,Vector(-1010.8,-512.720,11),255).RotateByEuler(Vector(0,0,7.9),0);    //ogloc
	RawHideMapObject(474,-10127,-5049,94);  //copaci
    RawHideMapObject(448,-10077,-5008,100);  //copaci
    RawHideMapObject(449,-10236,-5014,87);  //copaci
    RawHideMapObject(445,-10220,-5038,95);  //copaci
    RawHideMapObject(449,-10078,-5005,87);  //copaci
	RawHideMapObject(474,-10127,-5049,94);
    RawHideMapObject(449,-10318,-5024,87);
	RawHideMapObject(449,-10078,-5005,87);
	CreateObject(6401,0,Vector(712.558,-1366.82,5.1029),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(760.862,-1366.82,5.1429),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(810.968,-1366.82,5.1829),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(861.184,-1366.82,5.2229),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(712.564,-1316.73,5.1429),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(762.855,-1316.51,5.1829),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(813.023,-1316.7,5.2229),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6401,0,Vector(863.021,-1316.49,5.2629),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(729.091,-1348,12.1029),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(759.391,-1348.01,12.1029),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(789.591,-1348,12.1029),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(819.891,-1348,12.1429),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(850.2,-1348,12.1429),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(6413,0,Vector(880.5,-1348,12.2029),255).RotateToEuler(Vector(0,0,3.141592),0);
	CreateObject(1449,0,Vector(710.734,-1320.58,-12.3),255).RotateToEuler(Vector(0,0,2.9),0);
	CreateObject(4020,0,Vector(730.793,-1280.53,11.7829),255).RotateToEuler(Vector(0,0,5.6),0);

	
	//angelo
	 CreateObject(6429,0,Vector(-1529.65,-297.249,13.8683),255).RotateByEuler(Vector(0,0,11),0);  //ancelotti
	CreateObject(6428,0,Vector(-1529.80,-263.247,13.8990),255).RotateByEuler(Vector(0,0,11),0);  //ancelotti
	CreateObject(6426,0,Vector(-1529.80,-218.75,13.8683),255).RotateByEuler(Vector(0,0,7.859),0);  //ancelotti
	CreateObject(6427,0,Vector(-1529.80,-218.75,13.8683),255).RotateByEuler(Vector(0,0,7.859),0);  //ancelotti
	CreateObject(6461,0,Vector(-1874.58,-476.385,8.8),255).RotateByEuler(Vector(0,0,10.999),0);
	CreateObject(6462,0,Vector(-1874.5,-494.485,9.2),255).RotateByEuler(Vector(0,0,10.999),0);
	CreateObject(6463,0,Vector(-1868.7,-518.936,6),255).RotateByEuler(Vector(0,0,10.999),0);
	CreateObject(6463,0,Vector(-1868.7,-521.936,6),255).RotateByEuler(Vector(0,0,14.1),0);
	CreateObject(6463,0,Vector(-1858.29,-481.884,13.9076),255).RotateByEuler(Vector(0,0,18.8),0);
	CreateObject(6463,0,Vector(-1855.3,-481.880,13.9076),255).RotateByEuler(Vector(0,0,22),0);
	CreateObject(2489,0,Vector(-1877,-500,9.58054),255).RotateByEuler(Vector(0,0,22),0);
	CreateObject(636,0,Vector(-1859.55,-513.037,20.5),255).RotateByEuler(Vector(0,0,7.4),0);
    RawHideMapObject(1164,-15340,-2189,296);  //ancelotti
    RawHideMapObject(1163,-14840,-3197,217);  //ancelotti
	

	/*
	Nicusor Island
	*/
	CreateObject(2389,0,Vector(-2023.79, -1806.62, 19.5),255).RotateToEuler(Vector(0.025,-0.06,0),0);
	CreateObject(440,0,Vector(-2054.17, -1823.61, 8),255);
	CreateObject(453,0,Vector(-2040.81, -1819.33, 11.9),255);
	CreateObject(414,0,Vector(-2030.05, -1819.32, 10.2),255).RotateToEuler(Vector(0,0,3.1415926 / 2),0);
	CreateObject(471,0,Vector(-2015.07, -1829.58, 9.25),255);
	CreateObject(3060,0,Vector(-2115.15, -1790.03, 15),255);
	CreateObject(2852,0,Vector(-2077.43, -1752, 8),255).RotateToEuler(Vector(0,0.025,0),0);

	CreateObject(2756,0,Vector(-1989.54, -1743.28, -19.8),255).RotateToEuler(Vector(0,0,3.141592 / 6),0);
	CreateObject(2774,0,Vector(-1989.54, -1743.28, -19.8),255).RotateToEuler(Vector(0,0,3.141592 / 6),0);
	CreateObject(2756,0,Vector(-1884.92, -1673.5, -18.20),255).RotateToEuler(Vector(-0.03,0,3.141592 / 6),0);
	CreateObject(2774,0,Vector(-1884.92, -1673.5, -18.20),255).RotateToEuler(Vector(-0.03,0,3.141592 / 6),0);
	CreateObject(2756,0,Vector(-1781.55, -1604.0, -15.3),255).RotateToEuler(Vector(-0.025,0,3.141592 / 6),0);
	CreateObject(2774,0,Vector(-1781.55, -1604.0, -15.3),255).RotateToEuler(Vector(-0.025,0,3.141592 / 6),0);
	
	//Pickups
	CreatePickup(408,0,1,Vector(201.492,-469.974,11.0699),255,true); //Tool Shop #2
	CreatePickup(408,0,1,Vector(417.838,91.3782,11.2505),255,true); //Pizzeria #2
	CreatePickup(408,0,1,Vector(330.495,435.559,11.3856),255,true); //Car paint #3
	CreatePickup(408,0,1,Vector(387.37,754.583,12.7635),255,true);  // Pharmacy #2
	CreatePickup(408,0,1,Vector(408.954,1121.61,18.4858),255,true); //Mall
	CreatePickup(408,0,1,Vector(465.5,-49.5492,15.7038),255,true); //Malibu
	CreatePickup(408,0,1,Vector(216.226,-1272.23,12.5),255,true); //Hotel
	CreatePickup(408,0,1,Vector(-64.2798,-1485.48,11),255,true); //Gun shop 2
	CreatePickup(408,0,1,Vector(364.9,1051.7,20),255,true);
	CreatePickup(408,0,1,Vector(4.069548,-937.912903,16.5),255,true); //Mall 2
	CreatePickup(408,0,1,Vector(-373.407,-596.9,25.8263),255,true); //Vercetti mainson
	//Downtown
	CreatePickup(408,0,1,Vector(-867.489,-583.992,11.2124),255,true); //Ice cream
	CreatePickup(408,0,1,Vector(-855.819,-631.717,11.3756),255,true); //Donut shop #1
	CreatePickup(408,0,1,Vector(-707.9,-1262.2,11.0715),255,true); //Port
	CreatePickup(408,0,1,Vector(-848.128,-70.9189,11.5348),255,true); //Pharmacy #1
	CreatePickup(408,0,1,Vector(-870.082,-109.848,11.1034),255,true); //Car paint #1
	CreatePickup(408,0,1,Vector(-594.634,632.168,11.6765),255,true); //Bikers
	CreatePickup(408,0,1,Vector(-681.342,1204.69,11.109),255,true); //Gun shop #1
	CreatePickup(408,0,1,Vector(-393.105,1113.82,11.1667),255,true); //VCN
	CreatePickup(408,0,1,Vector(3.14535,956.621,11.233),255,true); //Film studios
	CreatePickup(408,0,1,Vector(-882.012,1159.07,11.1667),255,true); //Rock Radio studio
	CreatePickup(408,0,1,Vector(-907.584,798.337,11.4042),255,true); //Pizzeria #1
	CreatePickup(408,0,1,Vector(-963.902,-690.905,11.3284),255,true); //Tool shop #1
	CreatePickup(408,0,1,Vector(-1035.94,-844.531,13.9397),255,true); //Car Shop
	CreatePickup(408,0,1,Vector(-1167.76,-610.978,11.8297),255,true); //Cuban cafe
	CreatePickup(408,0,1,Vector(-1080.05,-275.167,12.0882),255,true); //Print works
	CreatePickup(408,0,1,Vector(-904.335,-1269.18,11.7957),255,true); //Car paint #2
	CreatePickup(408,0,1,Vector(-9.60864,-1275.1,11.101),255,true); //Car paint #3
	CreatePickup(408,0,1,Vector(-851.523,-1507.12,12.1238),255,true); //Tunning Shop
	CreatePickup(408,0,1,Vector(-1038.47,83.1769,11.6273),255,true); //pizza 3
	CreatePickup(335,0,1,Vector(-689.248, -1260.13, 16.3465),255,true);
	
	CreatePickup(349,0,1,Vector(-698.746,-1266.72,11.0715),255,true);
	CreatePickup(349,0,1,Vector(-692.213,-1575.27,12.5484),255,true);
	CreatePickup(349,0,1,Vector(-625.473,-1506.72,12.5344),255,true);
	CreatePickup(349,0,1,Vector(-861.759,-578.87,11.1006),255,true);
	CreatePickup(349,0,1,Vector(-975.414,-839.319,6.80091),255,true);
	CreatePickup(349,0,1,Vector(-1292.35,-1338.03,14.8),255,true);
	CreatePickup(349,0,1,Vector(-1186.93,-871.815,14.8677),255,true);
	CreatePickup(349,0,1,Vector(-1731.58,-303.047,14.8684),255,true);
	CreatePickup(349,0,1,Vector(-895.049,-699.336,11.196),255,true);
	CreatePickup(349,0,1,Vector(-1058.49,-245.429,11.4464),255,true);
	CreatePickup(349,0,1,Vector(-1047.57,70.1632,11.4368),255,true);
	CreatePickup(349,0,1,Vector(-845.908,-86.3616,11.1027),255,true);
	CreatePickup(349,0,1,Vector(-601.898,670.691,11.0833),255,true);
	CreatePickup(349,0,1,Vector(-726.624,834.607,11.0846),255,true);
	CreatePickup(349,0,1,Vector(0.985296,951.064,10.9402),255,true);
	CreatePickup(349,0,1,Vector(361.679,1202.9,25.1919),255,true);
	CreatePickup(349,0,1,Vector(461.323,-41.9664,10.1333),255,true);
	CreatePickup(349,0,1,Vector(354.071,-496.122,12.3246),255,true);
	CreatePickup(349,0,1,Vector(-192.285,-974.075,10.4634),255,true);
	
	/*
	Trash pickups
	*/
	CreatePickup(399,0,1,Vector(-867.302,-500.649,11.1036),255,true);
	CreatePickup(399,0,1,Vector(-868.387,-550.088,11.0998),255,true);
	CreatePickup(399,0,1,Vector(-1059.17,-244.578,11.4464),255,true);
	CreatePickup(399,0,1,Vector(-389.865,-532.087,12.7653),255,true);
		CreateCheckpoint(null,0, true,Vector(-874.53,-682.378,11.2224),ARGB(0,0,0,255),2)
	CreateCheckpoint(null,0, true,Vector(-654.546,759.922,11.094),ARGB(0,0,0,255),2)
	CreateCheckpoint(null,0, true,Vector(401.191,-474.786,11.7534),ARGB(0,0,0,255),2)
	
	CreateCheckpoint(null,0, true,Vector(-885.507,-483.205,13.1107),ARGB(0,0,255,255),2)
	CreateCheckpoint(null,0, true,Vector(-822.385,1151.27,12.4111),ARGB(0,0,255,255),2)
	CreateCheckpoint(null,0, true,Vector(-139.47,-978.683,10.4676),ARGB(0,0,255,255),2)
	
	CreateCheckpoint(null,0, true,Vector(-841.835,-1497.52,12.1148),ARGB(0,128,255,255),4)
	CreateCheckpoint(null,0, true,Vector(-591.224,-1520.88,5.75058),ARGB(0,128,255,255),4)
	CreateCheckpoint(null,0, true,Vector(-1228.13,-814.563,14.868),ARGB(0,128,255,255),4)
	
	CreateCheckpoint(null,0, true,Vector(421.006,1038,25.2999),ARGB(0,255,102,0),2)
	
	CreateCheckpoint(null,0, true,Vector(62.7814,1093.94,18.7597),ARGB(0,0,255,0),2)
	
	CreateCheckpoint(null,0, true,Vector(-699.157,836.816,11.0846),ARGB(0,255,0,0),2)
	
	CreateCheckpoint(null,0, true,Vector(-871.214,-117.906,11.0956),ARGB(0,128,255,128),2)
	CreateMarker( 1,Vector(-840.999, -1495.98, 11.8222),5,RGB(255,0,0), 101 )
	
	CreateCheckpoint(null,0, true,Vector(-912.523,-1268.4,11.8173),ARGB(0,128,255,128),2)
	CreateCheckpoint(null,0, true,Vector(328.833,428.829,11.3556),ARGB(0,128,255,128),2)
	
	CreateCheckpoint(null,0, true,Vector(-13.5651,-1258.15,10.4633),ARGB(0,128,255,128),2)
	CreateCheckpoint(null,0, true,Vector(-579.991,-1493.56,5.88495),ARGB(0,128,255,128),2)
	CreateCheckpoint(null,0, true,Vector(-1272.3,-802.588,20.5342),ARGB(0,128,255,128),2)
	
	CreateCheckpoint(null,0,true,Vector(-1235.23,13.5742,11.394),ARGB(0,128,128,128),2);
	
	CreateCheckpoint(null,0,true,Vector(-1277.73,72.081,11.4534),ARGB(0,153,53,0),2);
	
	CreateCheckpoint(null,0,true,Vector(-1012.8,194.677,11.2611),ARGB(0,255,128,0),2);
	
	CreateCheckpoint(null,0,true,Vector(-677.599,1204.96,11.1089),ARGB(0,255,255,255),2);
	CreateCheckpoint(null,0,true,Vector(363.658,1056.2,19.2076),ARGB(0,255,255,255),2);
	CreateCheckpoint(null,0,true,Vector(-64.4826,-1481.15,10.4817),ARGB(0,255,255,255),2);
	
	CreateCheckpoint(null,0,true,Vector(-864.701,-103.854,11.1034),ARGB(0,255,128,64),2);
	CreateCheckpoint(null,0,true,Vector(-896.925,-1274.13,11.7346),ARGB(0,255,128,64),2);
	CreateCheckpoint(null,0,true,Vector(333.093,444.235,11.5572),ARGB(0,255,128,64),2);
	CreateCheckpoint(null,0,true,Vector(-10.5285,-1266.25,10.4633),ARGB(0,255,128,64),2);
	
	CreateCheckpoint(null,0,true,Vector(-909.466,-330.698,13.3802),ARGB(0,255,254,255),2);
	CreateCheckpoint(null,0,true,Vector(-664.273,-1482.95,13.8016),ARGB(0,255,250,250),2);
	
	CreateCheckpoint(null,0,true,Vector(286.769,-298.528,11.9591),ARGB(0,100,200,255),2);
	//(
	CreateCheckpoint(null,0,true,Vector(-910.991, -306.937, 13.382),ARGB(0,200,0,255),2);
	CreateCheckpoint(null,0,true,Vector(-918.143, -351.48, 13.3802),ARGB(0,100,0,200),2);
	
	
	CreateCheckpoint(null,0,true,Vector(-565.885, 792.849, 22.8768),ARGB(0,64,64,64),2);
	
	CreateCheckpoint(null,0,true,Vector(17.6821, 1145.4, 23.5265),ARGB(0,64,255,64),2);
	
	///Markere joburi
	CreateMarker( 1,Vector(-885.507,-483.205,13.1107),2,RGB(0,255,255), 0 )
	CreateMarker( 1,Vector(-654.546,759.922,11.094),2,RGB(0,0,255), 0 )
	CreateMarker( 1,Vector(-874.53,-682.378,11.2224),2,RGB(0,0,255), 0 )
	
	CreateMarker( 1,Vector(401.191,-474.786,11.7534),2,RGB(0,0,255), 0 )
	CreateMarker( 1,Vector(-822.385,1151.27,12.4111),2,RGB(0,255,255), 0 )
	CreateMarker( 1,Vector(-139.47,-978.683,10.4676),2,RGB(0,255,255), 0 )
	
	CreateMarker( 1,Vector(62.7814,1093.94,18.7597),2,RGB(0,255,0), 0 )
	
	CreateMarker( 1,Vector(-699.157,836.816,11.0846),2,RGB(255,0,0), 0 )
	
	CreateMarker( 1,Vector(-1235.23,13.5742,11.394),2,RGB(128,128,128), 0 )
	
	CreateMarker( 1,Vector(-1012.8,194.677,11.2611),2,RGB(255,128,0), 0 )
	
	CreateMarker( 1,Vector(-864.701,-103.854,11.1034),2,RGB(255,128,64), 27 )
	CreateMarker( 1,Vector(-896.925,-1274.13,11.7346),2,RGB(255,128,64),27 )
	CreateMarker( 1,Vector(333.093,444.235,11.5572),2,RGB(255,128,64), 27 )
	CreateMarker( 1,Vector(-10.5285,-1266.25,10.4633),2,RGB(255,128,64),27 )
	
	CreateMarker( 1,Vector(-918.143, -351.48, 13.3802),2,RGB(100,0,200), 0 )
	
	CreateMarker( 1,Vector(286.769,-298.528,11.9591),2,RGB(100,200,255), 0 )
	
	CreateMarker( 1,Vector(-565.885, 792.849, 22.8768),2,RGB(64,64,64), 0 )
	
	CreateMarker( 1,Vector(17.6821, 1145.4, 23.5265),2,RGB(64,255,64), 0 )
	
	//restaurante
	CreateCheckpoint(null,0,true,Vector(-853.729,-635.299,11.3756),ARGB(0,255,178,0),2);
	CreateMarker( 1,Vector(-853.729,-635.299,11.3756),5,RGB(255,255,255), 104)
	
	CreateCheckpoint(null,0,true,Vector(421.277,88.0771,11.2662),ARGB(0,255,178,0),2);
	CreateMarker( 1,Vector(421.277,88.0771,11.2662),5,RGB(255,255,255), 104)
	
	CreateCheckpoint(null,0,true,Vector(-902.085,799.915,11.4568),ARGB(0,255,178,0),2);
	CreateMarker( 1,Vector(-902.085,799.915,11.4568),5,RGB(255,255,255), 104)
	
	CreateCheckpoint(null,0,true,Vector(376.897,1102.23,19.5811),ARGB(0,255,178,0),2);
	CreateMarker( 1,Vector(376.897,1102.23,19.5811),5,RGB(255,255,255), 104)
	
	CreateCheckpoint(null,0,true,Vector(393.008,1109.49,19.5329),ARGB(0,255,178,0),2);
	CreateCheckpoint(null,0,true,Vector(376.829,1147.11,19.5803),ARGB(0,255,178,0),2);
	CreateCheckpoint(null,0,true,Vector(392.609,1139.39,19.5276),ARGB(0,255,178,0),2);
	
	CreateCheckpoint(null,0,true,Vector(-1041.75,81.2273,11.637),ARGB(0,255,178,0),2);
	CreateMarker( 1,Vector(-1041.75,81.2273,11.637),5,RGB(255,255,255), 104);
	CreateMarker( 1,Vector(-1041.75,81.2273,11.637),5,RGB(255,255,255), 104);
	CreateCheckpoint(null,0,true,Vector(-1258.36,-821.667,16.208),ARGB(0,235,0,0),2);
	
	
	CreateCheckpoint(null,0,true,Vector(-937.936, -351.798, 17.8038),ARGB(0,255,250,0),2);
	CreateCheckpoint(null,0,true,Vector(-938.738, -351.673, 7.22692),ARGB(0,255,245,0),2);
	CreatePickup(380,0,1,Vector(-944.937, -343.691, 7.22757),255,true);
	
	//CreateCheckpoint(null,0,true,Vector(114.577, -372.329, 8.79201),ARGB(0,200,200,0),2);
	CreateCheckpoint(null,0,true,Vector(121.371, -372.941, 8.87097),ARGB(0,202,202,0),2);
	CreateMarker( 1,Vector(121.371, -372.941, 8.87097),2,RGB(200,200,0), 105) 
	//CreateMarker( 1,Vector(114.577, -372.329, 8.79201),2,RGB(200,200,0), 0 ) 
	
	//CreateCheckpoint(null,0,true,Vector(270.365, -226.967, 12.4681),ARGB(0,200,200,0),2);
	//CreateMarker( 1,Vector(270.365, -226.967, 12.4681),2,RGB(200,200,0), 0 )
	
	/*
	INTERIOARE
	CreateObject(1835,0,Vector(-1000,0,-90),255);
	CreateObject(2527,0,Vector(-1030,0,-90),255);
	CreateObject(720,0,Vector(-1050,0,-80),255);
	
	CreateObject(4590,0,Vector(-1090,0,-80),255);
	CreateObject(4620,0,Vector(-1090 - 13.077 ,-11.93,-82.55),255);
	
	CreateObject(2954,0,Vector(-1150,0,-80),255);
	
	CreateObject(6434,0,Vector(-1170,0,-80),255);
	
	
	CreateObject(6022,0,Vector(-1200,0,-80),255);
	*/
	CreateObject(6223,0,Vector(-1200,0,-80),0);
	CreateObject(6225,0,Vector(-1230,0,-80),0);
	
	CreateObject(425,0,Vector(-1197, -6.4591, -80),255); // lumina
	
	
	/*
	Bariere la interioare
	*/
	///Bariere garaj
	CreateObject(2897,0,Vector(-1170, -6.5, -81.55),255).RotateByEuler(Vector(0,0,1.35),0);
	CreateObject(2897,0,Vector(-1174, -5.5, -81.55),255).RotateByEuler(Vector(0,0,1.35),0);
	CreateObject(2897,0,Vector(-1178, -4.5, -81.55),255).RotateByEuler(Vector(0,0,1.35),0);
	CreateObject(2897,0,Vector(-1177.4, -2, -81.55),255).RotateByEuler(Vector(0,0,-0.15),0);
	CreateObject(2897,0,Vector(-1176.75, 2.5, -81.55),255).RotateByEuler(Vector(0,0,-0.15),0);
	CreateObject(2897,0,Vector(-1092.7, -9.7, -79),255).RotateByEuler(Vector(0,0,1.35),0); //6460, 6463
	CreateObject(1573,0,Vector(-1044.15, 4.44951, -82.6),255).RotateByEuler(Vector(0,0,0.5),0);
	CreateObject(2897,0,Vector(-1023.59, 0.858911, -89.9),255);
	CreateObject(2897,0,Vector(-992.5, 3, -91),255).RotateByEuler(Vector(0,0,1.55),0);
	CreateObject(2897,0,Vector(-989, -0.928445, -91.2736),255);
	
	//Usi
	CreateObject(6460,0,Vector(-1151, -0.9, -81.5),255);
	CreateObject(6460,0,Vector(-992.5, 2.9, -92.4),255);
	CreateObject(6460,0,Vector(138.6, -1369.8, 12),255).RotateByEuler(Vector(0,0,-0.2),0);
	
	
	INTERIOUR1 <- Vector(-992.008, 1.67198, -91); // Burned Interiour cost: 50k
	INTERIOUR2 <- Vector(-1026.09, 1.02084, -90.6603); // Interiour #1 : cost 500k
	INTERIOUR3 <- Vector(-1048.31, 3.0489, -83.61); //Garage : cost 250k
	INTERIOUR4 <- Vector(-1087.13, -0.930764, -78.9382); // Interiour #2 : cost 450k
	INTERIOUR5 <- Vector(-1150.8, 2.69825, -80.4192); // Interiour 3 : cost 400k
	INTERIOUR6 <- Vector(139.822, -1368.17, 13.1827); // Ken Roserberg Interiour
	INTERIOUR7 <- Vector(-883.051, -577.325, 11.2705); // Dark Office
	INTERIOUR8 <- Vector(-1163.83, 0.241517, -81.7408); // Classic Interiour
	INTERIOUR9 <- Vector(-1200.68, -6.08532, -78); // Interiour #4
	INTERIOUR10 <- Vector(-1231.1, -10.2838, -75); // Interiour #5
	
	CreateCheckpoint(null,0,true,Vector(84.7102, -1450.54, 10.5655),ARGB(0,255,0,255),2);
	CreateMarker( 1,Vector(84.7102, -1450.54, 10.5655),2,RGB(255,0,255), 0) 
	CreateMarker( 1,Vector(421.517, 1038.06, 25.2999),2,RGB(255,0,255), 28) 

	//locuri jefuire interioare
	CreatePickup(408,200,1,Vector(-1197.48, -14.2159, -78.96),255,true); 
	CreatePickup(408,200,1,Vector(-990.318, -1.57551, -91.2057),255,true);
	CreatePickup(408,200,1,Vector(-1034.83, -3.99019, -90.6603),255,true);
	CreatePickup(408,200,1,Vector(-1060.56, -8.31598, -83.61),255,true);
	CreatePickup(408,200,1,Vector(-1095.45, -4.38178, -79.7817),255,true);
	CreatePickup(408,200,1,Vector(-1152.69, 3.76794, -80.4192),255,true);
	CreatePickup(408,200,1,Vector(143.33, -1363.67, 13.1827),255,true);
	CreatePickup(408,200,1,Vector(-882.869, -571.516, 12.1368),255,true);
	CreatePickup(408,200,1,Vector(-1162.73, 0.245377, -81.7408),255,true);
	CreatePickup(408,200,1,Vector(-1230.89, -0.728874, -75.6687),255,true);

	//NPC uri
	CreateNPC("Boxy the stoopid NPC",6100,1,Vector(-895.199, -879.686, 12.1259),100,2);
	CreateNPC("Boxy the box",6100,1,Vector(-780.466, -841.244, 11.0714),100,2);
	CreateNPC("Boxy the box behind the bush",6100,1,Vector(-807.089, -539.052, 10.9793),100,2);
	CreateNPC("Boxy the sewers box",6100,1,Vector(-935.836, -114.197, 6.64452),100,2);
	CreateNPC("Boxy the box behind the tree",6100,1,Vector(-801.146, -99.0368, 11.0712),100,2);
	CreateNPC("[#ff0000]Boxy the rapist[#ffffff]",6100,1,Vector(-979.514, 117.091, 9.2611),250,10);
	CreateNPC("Boxy",6100,1,Vector(-310.7, 1087.74, 8.99309),100,2);
	CreateNPC("Boxy the box behind the box",6100,1,Vector(-237.356, -566.3, 10.3489),100,2);
	CreateNPC("Boxy the wild box",6100,1,Vector(381.689, -1252.37, 67.6165),100,4);
	
	CreateNPC("Tiganu Gica care promite ca nu fura fer de la constructii",6102,1,Vector(263.428, -310.781, 9.64397),100,10);
	CreateNPC("Tiganu Popescu violaturu'",6102,1,Vector(86.8438, 1078.78, 15.9632),100,40);
	CreateNPC("Tiganu Viorel",6102,1,Vector(-961.552, 152.972, 9.39548),100,10);
	CreateNPC("Tiganu Alcolist",6102,1,Vector(-594.151, 645.586, 11.6765),75,5);
	CreateNPC("Tiganu care a furat fer de la sinele de tren",6102,1,Vector(207.12, -373.713, 10.7578),100,10);
	CreateNPC("Tiganu care fura masini",6102,1,Vector(72.7588, -952.627, 10.447),100,10);
	CreateNPC("[#ff0000]Inocentiu Marcelium[#ffffff]",6102,1,Vector(-57.5947, -1438.45, 10.4504),500,25);
	CreateNPC("Marcel Tiganu",6102,1,Vector(628.886, 1445.54, 11.2289),100,10);

	CreateNPC("[#ff0000]Viorica Dancila[#ffffff]",6101,1,Vector(636.103, 1412.42, 12.6591),1000,25);
	CreateNPC("[#ff0000]Dragnea[#ffffff]",6105,1,Vector(389.778, -507.512, 9.39561),5000,25);
	CreateNPC("[#ff0000]Dinca[#ffffff]",6104,1,Vector(591.521, 1413.82, 12.56),3000,50);
}