RACERS <- array(5,-1);
RACESTATUS <- 0;
RACECASH <- 0;
RACEMARK <- null;
RACEMAP <- null;
RACEID <- -1;
RACESTART <- null;
RACEOFFSET <- null;
RACEFINISH <- null;
RACEROTATION <- null;

function CreateRace(creator,cash,id)
{ 
	if(creator.Vehicle == null)
	{
		MSGPLR(RED+"You must be in a car.",creator,RED+"Trebuie sa fii in masina.");
		return;
	}
	if(RACESTATUS != 0)
	{
		MSGPLR(RED+"Race is created.",creator,RED+"Este deja o cursa");
		return;
	}
	if(id == null) id = rand() % 15;
	if(id == 0) id =1;
	if(cash == null) cash = 100;
	RACESTATUS = 1;
	RACEID = id;
	RACECASH = cash;
	switch(id)
	{
		case 1:
		{
			RACESTART = Vector(-830.146, -503.433, 10.6482)
			RACEOFFSET = Vector(0, -4, 0);
			RACEFINISH = Vector(292.695, -459.987, 16.3027);
			RACEROTATION = Quaternion(0.0131838, -0.0106813, -0.68011, 0.732914);
			break;
		}
		case 2:
		{
			RACESTART = Vector(-679.119, 1169.86, 10.7505);
			RACEOFFSET = Vector(-4,0,0);
			RACEFINISH = Vector(-724.329, -1280.67, 10.6174);
			RACEROTATION = Quaternion(0.00344854, 0.00514229, 0.999329, 0.0361097);
			break;
		}
		case 3:
		{
			RACESTART = Vector(-827.726, -910.549, 10.8098);
			RACEOFFSET = Vector(0,-4,0);
			RACEFINISH = Vector(282.855, 15.4636, 10.61);
			RACEROTATION = Quaternion(-0.000396735, 0.000320439, -0.737285, 0.675581);
			break;
		} 
		case 4:
		{
			RACESTART = Vector(-1647.5, -408.574, 14.5874);
			RACEOFFSET = Vector(0,4,0);
			RACEFINISH = Vector(-1735.43, -1723.19, 14.632);
			RACEROTATION = Quaternion(-0.000640879, 0.00062562, -0.687678, 0.726015)
			break;
		}
		case 5:
		{
			RACESTART = Vector(-1821.95, -351.194, 14.6326);
			RACEOFFSET = Vector(-4,0,0);
			RACEFINISH = Vector(598.348, -1710.11, 8.30696);
			RACEROTATION = Quaternion(-0.000106813, 0.00425727, -0.999542, 0.0299528)
			break;
		}
		case 6:
		{
			RACESTART = Vector(491.697, 1120.27, 16.0482);
			RACEOFFSET = Vector(4,0,0);
			RACEFINISH = Vector(-843.732, 1174.66, 10.6206)
			RACEROTATION = Quaternion(-0.00329595, 0.014313, 0.997192, 0.0734287);
			break;
		}
		case 7:
		{
			RACESTART = Vector(-375.626, 1359.11, 11.4873);
			RACEOFFSET = Vector(0,-4,0);
			RACEFINISH = Vector(-724.329, -1280.67, 10.6174);
			RACEROTATION = Quaternion(-0.000823987, 0.000762951, -0.675624, 0.737246);
			break;
		}
		case 8:
		{
			RACESTART = Vector(-1095.24, -417.75, 10.4347);
			RACEOFFSET = Vector(-4,0,0);
			RACEFINISH = Vector(-907.532, -1076.12, 14.4219)
			RACEROTATION = Quaternion(0.00247196, -7.62951e-005, -0.999161, 0.0408854);
			break;
		}
		case 9:
		{
			RACESTART = Vector(-872.978, 61.3813, 9.09592);
			RACEOFFSET = Vector(0,-4,0);
			RACEFINISH = Vector(488.301, 235.722, 10.8128);
			RACEROTATION = Quaternion(-0.000610361, 0.0009308, -0.835279, 0.549825);
			break;
		}
		case 10:
		{
			RACESTART = Vector(374.306, 1275.61, 16.9501);
			RACEOFFSET = Vector(-4,0,0);
			RACEFINISH = Vector(17.7275, -1648.78, 9.26026);
			RACEROTATION = Quaternion(-0.00108339, 0.00102235, -0.70013, 0.714014)
			break;
		}
		case 11:
		{
			RACESTART = Vector(294.179, -1487.61, 10.6606);
			RACEOFFSET = Vector(4,0,0);
			RACEFINISH = Vector(630.686, 1416.34, 12.6567);
			RACEROTATION = Quaternion(-1.5259e-005, 0.00132753, -0.166522, 0.986037);
			break;
		}
		case 12:
		{
			RACESTART = Vector(-998.335, 303.254, 10.9785);
			RACEOFFSET = Vector(-4,0,0);
			RACEFINISH = Vector(-829.004, -1482.44, 11.4797);
			RACEROTATION = Quaternion(-0.00077821, -0.00134279, 0.990646, 0.136446);
			break;
		}
		case 13:
		{
			RACESTART = Vector(-836.129, 751.117, 10.8046);
			RACEOFFSET = Vector(0,4,0);
			RACEFINISH = Vector(-352.854, 1089.72, 8.74885) 
			RACEROTATION = Quaternion(-0.00102235, 0.00108339, -0.737301, 0.675563);
			break;
		}
		case 14:
		{
			RACESTART = Vector(-836.129, 751.117, 10.8046);
			RACEOFFSET = Vector(0,4,0);
			RACEFINISH = Vector(-1010.57, 1093.83, 9.09712);
			RACEROTATION = Quaternion(-0.00102235, 0.00108339, -0.737301, 0.675563);
			break;
		}
		case 15:
		{
			RACESTART = Vector(-1580.52, 1406.46, 8.45673);
			RACEOFFSET = Vector(-3,-3,0);
			RACEFINISH = Vector(127.101, -1539.57, 10.5091);
			RACEROTATION = Quaternion(-0.00167849, 0, -0.0237888, 0.999716)
			break;
		}
		case 16:
		{
			RACESTART = Vector(457.937, -798.279, 10.9853);
			RACEOFFSET = Vector(-3,0,0);
			RACEFINISH = Vector(815.165, -1455.27, 185.053);
			RACEROTATION = Quaternion(-0.00442512, -0.000396735, -0.826154, 0.563427)
			break;
		}
		case 17:
		{
			RACESTART = Vector(807.509, -1464.49, 185.359);
			RACEOFFSET = Vector(3,0,0);
			RACEFINISH = Vector(464.81, -812.857, 10.7772);
			RACEROTATION = Quaternion(-0.0428931, -0.011841, 0.258122, 0.965087);
			break;
		}
		default:
		{
			MSGPLR(RED+"Error: this id doesn't exist.",creator,RED+"Eroare:acest ID nu exista.");
			ResetRace();
			return;
		}
	}
	
	JoinRace(creator);
	RACEMAP = CreateMarker(0,RACEFINISH,5,RGB(255,255,255),103);
	RACEMARK = CreateCheckpoint(null,0, true,RACEFINISH,ARGB(255,255,99,99),4);
	MSG(PINK+"[RACE]"+WHITE+creator+" created a race.",PINK+"[CURSA]"+WHITE+creator+" a creat o cursa.");
	MSG(PINK+"[RACE]"+WHITE+"Bet:"+cash,PINK+"[CURSA]"+WHITE+"Bani:"+cash);
	MSG(PINK+"[RACE]"+WHITE+"ID:"+id,PINK+"[CURSA]"+WHITE+"ID:"+id);
	MSG(PINK+"[RACE]"+WHITE+"Use /joinrace to join.",PINK+"[CURSA]"+WHITE+"Foloseste /joinrace ca sa intri.");
	MSG(PINK+"[RACE]"+WHITE+"Use /start to start.",PINK+"[CURSA]"+WHITE+"Foloseste /start ca sa pornesti cursa.");
}
function JoinRace(player)
{
	if(player.Cash < RACECASH)
	{
		MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani");
		return;
	}
	if(player.Vehicle == null)
	{
		MSGPLR(RED+"You must be in a car.",player,RED+"Trebuie sa fii in masina.");
		return;
	}
	local a = false,i=0;
	if(player != null)
	{
		if(RACESTATUS == 1)
		{
			for(i =0; i < 5; i++)
			{
				if((RACERS[i] == -1) && (RACERS[i] != player.ID))
				{
					RACERS[i] = player.ID;
					player.Cash -= RACECASH;
					a = true;
					break;
				}
			}
		}
		else
		{
			MSGPLR(RED+"Race is started, or there isn't any race.",player,RED+"Este deja o cursa in desfasurare sau nu este deloc o cursa.");
		}
	}
	if(a)
	{
		player.Vehicle.Pos = RACESTART;
		local veh = player.Vehicle;
		player.Vehicle.World = 2;
		player.World = 2;
		player.Vehicle = veh;
		local pos = Vector(RACEOFFSET.x * i , RACEOFFSET.y * i ,RACEOFFSET.z * i );
		player.Vehicle.Pos += pos;
		player.Vehicle.Immunity = -1;
		player.IsFrozen = true;
		player.Vehicle.Rotation = RACEROTATION;
		MSG(PINK+"[RACE]"+WHITE+player+" joined the race ["+(i+1)+"/5]",PINK+"[CURSA]"+WHITE+player+" a intrat in cursa ["+(i+1)+"/5]");
	}
}
function StartRace()
{
	RACESTATUS = 2;
	for(local i =0 ; i < 5; i++)
	{
		if(FindPlayer(RACERS[i]) != null)
		{
			FindPlayer(RACERS[i]).IsFrozen = false;
		}
	}
	MSG(PINK+"[RACE]"+WHITE+"Race started! GO GO GO",PINK+"[CURSA]"+WHITE+"A inceput cursa! GO GO GO");
}
function ResetRace()
{
	DestroyMarker(RACEMAP);
	RACEMARK.Remove();
	RACESTATUS = 0;
	for(local i =0 ; i < 5; i++)
	{
		local player = FindPlayer(RACERS[i]);
		if(player != null)
		{
			local veh = player.Vehicle;
			if(veh)
			{
				player.Vehicle.Immunity = 0;
				player.Vehicle.World = 1;
				player.Vehicle = veh;
			}
			player.World = 1;
		}
		RACERS[i] = -1;
	}
}
function JoinedPlayersInRace()
{
	local a = 0;
	for(local i =0 ; i < 5; i++)
	{
		if(FindPlayer(RACERS[i]) != null)
		{
			a += 1;
		}
	}
	return a;
}