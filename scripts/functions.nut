//Valori constante:
LANGUAGEFILE <- "PlayerStats/Language.ini";
LANGUAGE <- "Language";
CASHFILE <- "PlayerStats/Cash.ini";
CASH <- "Cash";
WANTEDFILE <- "PlayerStats/Wanted.ini";
WANTED <- "Wanted";

ARRESTFILE <- "PlayerStats/Arrest.ini";
ARREST <- "ArrestTime";

PASSFILE <- "Accounts/Pass.ini";
PASS <- "Pass";
EMAILFILE <- "Accounts/Email.ini";
EMAIL <- "Email";
FORUMFILE <- "Accounts/Forum.ini";
FORUM <- "Forum";
LOGINSTATUSFILE <- "Accounts/Logged.ini";
LOGINSTATUS <- "Logged";

IPFILE <- "Accounts/IP.ini";
IPSTATUS <- "IP";
UIDFILE <- "Accounts/UID.ini";
UIDSTATUS <- "UID";

BANFILE <- "PlayerStats/BANS.ini"
BAN <- "Ban";

PROPFILE <- "PlayerStats/Props.ini";

CARMODELFILE <- "Vehicle/Model.ini";
CARMODEL <- "Model";
CARPOSFILE <- "Vehicle/Position.ini";
CARPOS <- "Position";
CARROTFILE <- "Vehicle/Rotation.ini";
CARROT <- "Rotation";

CAROWNERFILE <- "Vehicle/Owner.ini";
CAROWNER <- "Owner";

CAROWNER2FILE <- "Vehicle/Owner2.ini"

FUELFILE <- "Vehicle/Fuel.ini";
FUEL <- "Fuel";

BOSSFILE <- "Jobs/Boss.ini";
BOSS <- "Boss"

JOBFILE <- "Jobs/Job.ini";
JOB <- "Job"

SKINFILE <- "PlayerStats/Skin.ini";
SKIN <- "Skin"

XPFILE <- "PlayerStats/XP.ini";
XP <- "XP";
HUNGERFILE <- "PlayerStats/Hunger.ini";
HUNGER <- "Hunger";

RED <- "[#ff0000]";
GREEN <- "[#00ff00]";
BLUE <- "[#0000ff]";

WHITE <- "[#ffffff]";
YELLOW <- "[#ffff00]";
MANGETA <- "[#ff00ff]";

SKYBLUE <- "[#00ffff]";
PINK <- "[#ffaaaa]";

ADMINFILE <- "PlayerStats/Admin.ini";
ROLEFILE <- "PlayerStats/Role.ini";
ADMIN <- "Admin";
ROLE <- "Role"

GANGOWNFILE <- "Gang/Owner.ini";
GANGMEMFILE <- "Gang/Members.ini";
GANGMEM2FILE <- "Gang/Members2.ini";
GANGWEPSFILE <- "Gang/Weapons.ini"; 
GANGSPAWNFILE <- "Gang/Spawn.ini"; 
GANGSKINFILE <- "Gang/Skin.ini"; 

GANGOWN <- "Owner";
GANGOWN2 <- "Owner2";
GANGMEM <- "Member";
GANGMEM2 <- "Member2";
GANGSPAWN <- "spawn";
GANGSKIN <- "Skin";
GANGWEPS <- "Weapons";

GANG <- "[#330066][GANG]"+WHITE;

COPCOLOR <- RGB(0,0,255);
MEDICCOLOR <- RGB(0,255,255);
FIRECOLOR <- RGB(255,0,0);
TERRORISTCOLOR <- RGB(0,255,0);
TRUCKERCOLOR <- RGB(100,200,255);
BTRANPORTD <- RGB(100,0,200);
DUSTMANC <- RGB(128,128,128);
TAXIC <- RGB(255,128,0);
BGC <- RGB(1,1,1);
MECHANICC <- RGB(255,128,64);
INVESTIGATORC <- RGB(64,64,64);
DEALERC <- RGB(64,255,64);

CLOTHESC <- RGB(255,102,0);

MSG_ERROR_EN <- RED+"[ERROR]"+WHITE;
MSG_ERROR_RO <- RED+"[ERROARE]"+WHITE;

ROBBERY_EN <- RED+"[ROBBERY]"+WHITE;
ROBBERY_RO <- RED+"[JAF]"+WHITE;

PROP_ENRO <- SKYBLUE+"[PROP]"+WHITE;

CAR_EN <- BLUE+"[CAR SHOP]"+WHITE;
CAR_RO <- BLUE+"[MAGAZIN DE MASINI]"+WHITE;

JOB_EN <- GREEN+"[JOB]"+WHITE;
JOB_RO <- GREEN+"[SLUJBA]"+WHITE;

chaseplayer <- -1;
CHASE_EN <- RED+"[PURSUIT]"+WHITE;
CHASE_RO <- RED+"[URMARIRE CU POLITIA]"+WHITE;

FIRE_EN <- RED+"[FIRE]"+WHITE;
FIRE_RO <- RED+"[FOC]"+WHITE;

BANKTRANSPORT_EN <- YELLOW+"[CASH TRANSPORT]"+WHITE;
BANKTRANSPORT_RO <- YELLOW+"[TRANSPORT DE BANI]"+WHITE;
BNKT_C <- 0;
BNKT_V <- -1;
BNKT_M <- null;
BNKT_CH <- null;

STATS <- SKYBLUE+"[STATS]"+WHITE;

C1FILE <- "Vehicle/Color1.ini";
C2FILE <- "Vehicle/Color2.ini";
C2 <- "C2";
C1 <- "C1"

NOSFILE <- "Vehicle/NOS.ini";
NOS <- "NOS";

VIPBRONZE <- "VIP/VIP-Bronze.ini";
VIPSILVER <- "VIP/VIP-Silver.ini";
VIPGOLD <- "VIP/VIP-Gold.ini";
VIPEMERALD <- "VIP/VIP-Emerald.ini";
VIP <- "vip"

BANKROBBER <- -1;
BANKTIMERBOMB <- 0;

MUTEARR <- array(100,0);

INTERIOURF <- "PlayerStats/Interiour.ini";
INTERIOURC <- "Interiour";

HELPM_EN <- RED+"[HELP]"+WHITE;
HELPM_RO <- RED+"[AJUTOR]"+WHITE;

CRATES_FILE <- "PlayerStats/Crates.ini";
CRATES <- "Crate";
CRATE <- RED+"[CRATE]"+WHITE;

MUTED_ARR <- array(100,false);

//Functii copiate
function GetTok(string, separator, n, ...)
{
 local m = vargv.len() > 0 ? vargv[0] : n,
   tokenized = split(string, separator),
   text = "";
 if (n > tokenized.len() || n < 1) return null;
 for (; n <= m; n++)
 {
 text += text == "" ? tokenized[n-1] : separator + tokenized[n-1];
 }
 return text;
}

JUCATORI <- array(100,null);

class Jucator
{
	constructor(player)
	{
		ID = player.ID;
		Player = player;
	}
	ID = -1;
	Player = null;
	LastRobbedHouse = null;
}

//Functii originale lol
function MSGPLR(eng,plr,rom)
{
	if(ReadIniInteger(LANGUAGEFILE,LANGUAGE,plr.Name) == 0)
	{
		MessagePlayer(rom,plr);
	}
	else MessagePlayer(eng,plr)
}
function MSG(eng,rom)
{
	for(local i =0; i < GetMaxPlayers(); i++)
	{
		if(FindPlayer(i) != null)
		{
			MSGPLR(eng,FindPlayer(i),rom);
		}
	}
}
function NAnnounce(eng,player,type,rom)
{
	if(ReadIniInteger(LANGUAGEFILE,LANGUAGE,player.Name) == 0)
	{
		Announce(rom,player,type);
	}
	else Announce(eng,player,type)
}
function SalveazaStatusuri(player)
{
	WriteIniInteger(CASHFILE,CASH,player+"",player.Cash);
	WriteIniInteger(WANTEDFILE,WANTED,player+"",player.WantedLevel);
}
function Login(player,parola)
{
	if(ReadIniString(PASSFILE,PASS,player.Name) == parola)
	{
		WriteIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name,1);
		MSG(GREEN+"Player "+player+" logged in",GREEN+"Jucatorul "+player+" s-a logat");
		MSGPLR(GREEN+"You are logged in!",player,GREEN+"Te-ai logat!");
		PlayerSaveIP(player);
		return true;
	}
	else MSGPLR(MSG_ERROR_EN+"Wrong password.",player,MSG_ERROR_RO+"Parola gresita!");
	return false;
}
function Register(player,parola,email,forumacc)
{
	if(ReadIniString(PASSFILE,PASS,player.Name) == null)
	{
		WriteIniString(PASSFILE,PASS,player.Name,parola);
		WriteIniString(EMAILFILE,EMAIL,player.Name,email);
		WriteIniString(FORUMFILE,FORUM,player.Name,forumacc);
		WriteIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name,1);
		PlayerSaveIP(player);
		MSG(GREEN+"Player "+player+" registered!",GREEN+"Jucatorul "+player+" s-a inregistrat!");
		player.Cash = 100000;
		Tutorial(player);
		return true;
	}
	else{
		MSGPLR(MSG_ERROR_EN+"This account already exists",player,MSG_ERROR_RO+"Acest cont deja exista");
		return false;
	}
}
function PlayerQuit(player)
{
	SalveazaStatusuri(player);
	WriteIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name,0);
}
function PlayerSaveIP(player)
{
	WriteIniString(IPFILE,IPSTATUS,player.Name,player.IP);
	WriteIniString(UIDFILE,UIDSTATUS,player.Name,player.UID);
}
function PlayerLoad(player)
{
	player.Cash = ReadIniInteger(CASHFILE,CASH,player.Name)
	player.WantedLevel = ReadIniInteger(WANTEDFILE,WANTED,player.Name)
}
function IsPlayerInJail(player)
{
	if(InPoly(player.Pos.x,player.Pos.y,642.212, 1495.2, 577.045, 1497.7, 510.421, 1470.05 ,518.496, 1395.45, 579.434, 1399.42, 584.723, 1429.96 ,646.866, 1440.29)== true)
	{
		return true;
	}
	return false;
}
function GetMapName(x,y)
{
	if(GetDistrictName(x,y) != "Vice City") return GetDistrictName(x,y);
	else return "Ocean";
}
function SaveCar(vehicle,player,newcar)
{
	if(vehicle == null)
	{
		return;
	}
	local sucess = false;
	for(local i =0 ; i < 10; i++)
	{
		if(ReadIniString(CAROWNER2FILE,player.Name,i+"") == null)
		{
			WriteIniInteger(CAROWNER2FILE,player.Name,i+"",vehicle.ID);
			sucess = true;
			break;
		}
		if(ReadIniInteger(CAROWNER2FILE,player.Name,i+"") == -1)
		{
			WriteIniInteger(CAROWNER2FILE,player.Name,i+"",vehicle.ID);
			sucess = true;
			break;
		}
	}
	if(sucess == true)
	{
		WriteIniInteger(CARMODELFILE,CARMODEL,vehicle.ID+"",vehicle.Model);
		WriteIniString(CARPOSFILE,CARPOS,vehicle.ID+"",vehicle.Pos.x+" "+vehicle.Pos.y+" "+vehicle.Pos.z);
		WriteIniString(CARROTFILE,CARROT,vehicle.ID+"",vehicle.Rotation.x+" "+vehicle.Rotation.y+" "+vehicle.Rotation.z+" "+vehicle.Rotation.w);
		WriteIniString(CAROWNERFILE,CAROWNER,vehicle.ID+"",player.Name);
		WriteIniInteger(FUELFILE,FUEL,vehicle.ID+"",100);
		WriteIniInteger(NOSFILE,NOS,vehicle.ID+"",1000);
		WriteIniInteger(C1FILE,C1,vehicle.ID+"",1);
		WriteIniInteger(C2FILE,C2,vehicle.ID+"",1);
	}
	else if(newcar == true) vehicle.Remove();
	
	return sucess;
}
function LoadCars()
{
	for(local i =1 ; i <= 1000; i++)
	{
		local c1 = ReadIniInteger(C1FILE,C1,i+"");
		local c2 = ReadIniInteger(C2FILE,C2,i+"");
		local model = ReadIniInteger(CARMODELFILE,CARMODEL,i+"");
		local pos = ReadIniString(CARPOSFILE,CARPOS,i+"");
		local rot = ReadIniString(CARROTFILE,CARROT,i+"");
		local world = 0;
		if(pos != null)
		{
			local px = GetTok(pos," ",1).tofloat()
			local py = GetTok(pos," ",2).tofloat()
			local pz = GetTok(pos," ",3).tofloat()
		
			local rx = GetTok(rot," ",1).tofloat()
			local ry = GetTok(rot," ",2).tofloat()
			local rz = GetTok(rot," ",3).tofloat()
			local rw = GetTok(rot," ",4).tofloat()
		
			if(px == py == pz == 0) world = 1;
			local vehicle = CreateVehicle(model,world,Vector(px,py,pz),0,c1,c2);
			vehicle.Rotation = Quaternion(rx,ry,rz,rw);
			if(DistanceFromPoint(px,py,-1036.81, -850.937) <= 20)
			{
				vehicle.World = 10
			}
			if(vehicle.Model == 6427)
			{
				vehicle.Health = 0x7fffffff;
			}
			if(vehicle.Model == VEH_HUNTER)
			{
				vehicle.Health = 15000;
			}
			if(vehicle.Model == VEH_RHINO)
			{
				vehicle.Health = 20000;
			}
			if(vehicle.Model == 6428)
			{
				vehicle.Health = 500;
			}
		}
	}
}
function RandLim(min,max)
{
	return min + rand() % max-min+1;
}
function GetVehName(veh)
{
	if(veh == 130) return "landstalker";
	if(veh == 131) return "idaho";
	if(veh == 132) return "stinger";
	if(veh == 133) return "linerunner";
	if(veh == 134) return "perennial";
	if(veh == 135) return "sentinel";
	if(veh == 136) return "rio";
	if(veh == 137) return "firetruck";
	if(veh == 138) return "trashmaster";
	if(veh == 139) return "stretch";
	if(veh == 140) return "manana";
	if(veh == 141) return "infernus";
	if(veh == 142) return "voodoo";
	if(veh == 143) return "pony";
	if(veh == 144) return "mule";
	if(veh == 145) return "cheetah";
	if(veh == 146) return "ambulance";
	if(veh == 147) return "fbiwashington";
	if(veh == 148) return "moonbeam";
	if(veh == 149) return "esperanto";
	if(veh == 150) return "taxi";
	if(veh == 151) return "washington";
	if(veh == 152) return "bobcat";
	if(veh == 153) return "mrwhoopee";
	if(veh == 154) return "bf injection";
	if(veh == 155) return "hunter";
	if(veh == 156) return "police";
	if(veh == 157) return "enforcer";
	if(veh == 158) return "securicar";
	if(veh == 159) return "banshee";
	if(veh == 160) return "predator";
	if(veh == 161) return "bus";
	if(veh == 162) return "rhino";
	if(veh == 163) return "barracksol";
	if(veh == 164) return "cubanhermes";
	if(veh == 166) return "angel";
	if(veh == 167) return "coach";
	if(veh == 168) return "cabbie";
	if(veh == 169) return "stallion";
	if(veh == 170) return "rumpo";
	if(veh == 171) return "rc bandit";
	if(veh == 172) return "romero";
	if(veh == 173) return "packer";
	if(veh == 174) return "sentinel xs";
	if(veh == 175) return "admiral";
	if(veh == 176) return "squalo";
	if(veh == 177) return "sea sparrow";
	if(veh == 178) return "pizza boy";
	if(veh == 179) return "gang burrito";
	if(veh == 182) return "speeder";
	if(veh == 183) return "reefer";
	if(veh == 184) return "tropic";
	if(veh == 185) return "flatbed";
	if(veh == 186) return "yankee";
	if(veh == 187) return "caddy";
	if(veh == 188) return "zebra";
	if(veh == 189) return "top fun";
	if(veh == 190) return "skimmer";
	if(veh == 191) return "pcj600";
	if(veh == 192) return "faggio";
	if(veh == 193) return "freeway";
	if(veh == 194) return "rc baron";
	if(veh == 195) return "rc raider";
	if(veh == 196) return "glendale";
	if(veh == 197) return "oceanic";
	if(veh == 198) return "sanchez";
	if(veh == 199) return "sparrow";
	if(veh == 200) return "patriot";
	if(veh == 201) return "love fist";
	if(veh == 202) return "coast guard";
	if(veh == 203) return "dinghy";
	if(veh == 204) return "hermes";
	if(veh == 205) return "sabre";
	if(veh == 206) return "sabre turbo";
	if(veh == 207) return "pheonix";
	if(veh == 208) return "walton";
	if(veh == 209) return "regina";
	if(veh == 210) return "comet";
	if(veh == 211) return "deluxo";
	if(veh == 212) return "burrito";
	if(veh == 213) return "spandexpress";
	if(veh == 214) return "marquis";
	if(veh == 215) return "baggage";
	if(veh == 216) return "kaufman cab";
	if(veh == 217) return "maverick";
	if(veh == 218) return "vcn maverick";
	if(veh == 219) return "rancher";
	if(veh == 220) return "fbi rancher";
	if(veh == 221) return "virgo";
	if(veh == 222) return "greenwood";
	if(veh == 223)  return "cuban jetmax";
	if(veh == 224)  return "hotring racer 1";
	if(veh == 225) return "sandking";
	if(veh == 226) return "blista";
	if(veh == 227) return "virgo";
	if(veh == 228) return "boxville";
	if(veh == 229) return "benson";
	if(veh == 230) return "mesagrande";
	if(veh == 231) return "rc goblin";
	if(veh == 232) return "hotring racer 2";
	if(veh == 233) return "hotring racer 3";
	if(veh == 234) return "bloodring banger 1";
	if(veh == 235) return "bloodring banger 2";
	if(veh == 236) return "cheetah 2";
	
	if(veh == 6400) return "honda civic";
	if(veh == 6401) return "bmw m3 gtr";
	if(veh == 6402) return "corvette";
	if(veh == 6403) return "cheetahsa";
	if(veh == 6404) return "bansheesa";
	if(veh == 6405) return "nissan skyline";
	if(veh == 6406) return "sultan";
	if(veh == 6407) return "elegy";
	if(veh == 6408) return "bobcatsa";
	if(veh == 6409) return "mesasa";
	if(veh == 6410) return "stretchsa";
	if(veh == 6411) return "towtruck";
	if(veh == 6412) return "turismo";
	if(veh == 6413) return "infernussa";
	if(veh == 6414) return "bullet";
	if(veh == 6415) return "zr";
	if(veh == 6416) return "jester";
	if(veh == 6417) return "flash";
	if(veh == 6418) return "uranus";
	if(veh == 6419) return "logan";
	if(veh == 6420) return "buffalo";
	if(veh == 6421) return "sentinelsa";
	if(veh == 6422) return "admiralsa";
    if(veh == 6423) return "blade";
    if(veh == 6424) return "savanna";
    if(veh == 6425) return "countach";
    if(veh == 6426) return "gallardo";
	if(veh == 6427) return "bmx";
    if(veh == 6428) return "hydra";
    if(veh == 6429) return "honda s2000";
    if(veh == 6430) return "dacia 1310";
	if(veh == 6431) return "chevrolet camaro";
}
function GetVehCash(veh)
{
	if(veh == null) return;
	try{
	veh = veh.tolower();
	}
	catch(e) { }
	if(veh == "landstalker") return 200000;
	if(veh == "stallion") return 400000;
	if(veh == "idaho") return 200000;
	if(veh == "stinger") return 400000;
	if(veh == "linerunner") return 300000;
	if(veh == "perennial") return 200000;
	if(veh == "sentinel") return 250000;
	if(veh == "firetruck") return 500000;
	if(veh == "trashmaster") return 400000;
	if(veh == "stretch") return 1000000;
	if(veh == "manana") return 120000;
	if(veh == "infernus") return 750000;
	if(veh == "voodoo") return 250000;
	if(veh == "pony") return 300000;
	if(veh == "mule") return 250000;
	if(veh == "cheetah") return 700000;
	if(veh == "cheetah 2") return 705000;
	if(veh == "coast guard") return 755000;
	if(veh == "kaufman cab") return 205000;
	if(veh == "vcn maverick") return 500000;
	if(veh == "ambulance") return 500000;
	if((veh == "fbi washington") || (veh == "fbiwashington")) return 550000;
	if(veh == "moonbeam") return 250000;
	if(veh == "esperanto") return 110000;
	if(veh == "taxi") return 350000;
	if(veh == "washington") return 300000;
	if(veh == "bobcat") return 225000;
	if((veh == "mr. whoopee") || (veh == "mrwhoopee")) return 200000;
	if((veh == "bf injection") || (veh == "bfinjection")) return 850000;
	if(veh == "hunter") return 5000000;
	if(veh == "police") return 450000;
	if(veh == "enforcer") return 650000;
	if(veh == "securicar") return 600000;
	if(veh == "banshee") return 650000;
	if(veh == "bus") return 150000;
	if(veh == "rhino") return 2000000;
	if((veh == "barracks ol") || (veh == "barracksol")) return 800000;
	if((veh == "cuban hermes") || (veh == "cubanhermes")) return 900000;
	if((veh == "maverick") || (veh == "helicopter")) return 1000000;
	if(veh == "angel") return 550000;
	if(veh == "coach") return 200000;
	if(veh == "cabbie") return 300000;
	if(veh == "rumpo") return 2000000;
	if((veh == "rc bandit") || (veh == "rcbandit")) return 75000;
	if(veh == "rc goblin") return 100000;
	if((veh == "romero's hearse") || (veh == "romeroshearse") || (veh == "romero")) return 400000;
	if(veh == "packer") return 600000;
	if(veh == "sentinel xs") return 300000;
	if(veh == "admiral") return 120000;
	if((veh == "pizza boy") || (veh == "pizzaboy")) return 75000;
	if((veh == "gang burrito") || (veh == "gangburrito")) return 400000;
	if(veh == "flatbed") return 175000;
	if(veh == "yankee") return 275000;
	if(veh == "caddy") return 90000;
	if((veh == "zebra") || (veh == "zebracab") || (veh == "zebra cab")) return 375000;
	if((veh == "topfun") || (veh == "top fun")) return 75000;
	if(veh == "skimmer") return 2000000;
	if((veh == "pcj-600") || (veh == "pcj") || (veh == "pcj600")) return 750000;
	if(veh == "faggio") return 130000;
	if(veh == "freeway") return 700000;
	if(veh == "rc baron") return 85000;
	if(veh == "rc raider") return 175000;
	if(veh == "glendale") return 275000;
	if(veh == "oceanic") return 300000;
	if(veh == "sanchez") return 700000;
	if(veh == "sparrow") return 900000;
	if(veh == "patriot") return 500000;
	if((veh == "lovefist") || (veh == "love fist")) return 1250000;
	if(veh == "hermes") return 300000;
	if(veh == "sabre") return 200000;
	if((veh == "sabreturbo") || (veh == "sabre turbo")) return 650750;
	if(veh == "pheonix") return 75000;
	if(veh == "walton") return 190000;
	if(veh == "regina") return 300000;
	if(veh == "comet") return 600000;
	if(veh == "deluxo") return 600000;
	if(veh == "burrito") return 300000;
	if(veh == "spandexpress") return 200500;
	if((veh == "baggage") || (veh == "baggage handler") || (veh == "baggagehandler")) return 90000;
	if((veh == "vcn maverixk") || (veh == "vcnmaverick") || (veh == "vcn")) return 90000;
	if(veh == "rancher") return 150000;
	if((veh == "fbi rancher") || (veh == "fbirancher")) return 90000;
	if(veh == "greenwood") return 225000;
	if((veh == "hotring racer 1") || (veh == "hotringracer1") || (veh == "hotring1"))  return 750000;
	if((veh == "hotring racer 2") || (veh == "hotringracer2") || (veh == "hotring2"))  return 750000;
	if((veh == "hotring racer 3") || (veh == "hotringracer3") || (veh == "hotring3"))  return 750000;
	if(veh == "sandking") return 450000;
	if((veh == "blista") || (veh == "blista compact") || (veh == "blistacompact")) return 500000;
	if((veh == "police maverick") || (veh == "policemaverick") || (veh == "police helicopter") || (veh == "policehelicopter")) return 1100000;
	if(veh == "virgo") return 250000;
	if(veh == "boxville") return 250000;
	if(veh == "benson") return 350000;
	if((veh == "mesagrande") || (veh == "mesa grande")) return 190000;
	//Masini custom preturi
	if((veh == "hondacivic") || (veh == "honda civic")) return 555000;
	if((veh == "bmwm3gtr") || (veh == "bmw m3 gtr")) return 750000;
	if(veh == "skyline") return 600000;
	if((veh == "corvette") || (veh == "corvettecop")) return 900000;
    if(veh == "cheetahsa") return 1200000;
	if(veh == "bansheesa") return 900000;
	if(veh == "sultan") return 600000;
	if(veh == "elegy") return 620000;
	if(veh == "bobcatsa") return 300000;
	if(veh == "mesasa") return 350000;
	if(veh == "stretchsa") return 2000000;
	if(veh == "turismo") return 1300000;
	if(veh == "infernussa") return 5000000;
	if(veh == "bullet") return 4600000;
 	if(veh == "zr") return 1100000;
 	if(veh == "towtruck") return 360000;
 	if(veh == "jester") return 500000;
 	if(veh == "flash") return 400000;
 	if(veh == "uranus") return 420000;
 	if(veh == "logan") return 150000;
 	if(veh == "sentinelsa") return 480000;
 	if(veh == "buffalo") return 800000;
 	if(veh == "admiralsa") return 240000;
    if(veh == "blade") return 150000;
    if(veh == "savanna") return 200000;
    if(veh == "countach") return 1500000;
    if(veh == "gallardo") return 2000000;
	
	if(veh == "hunter") return 5000000;
	if((veh == "maverick") || (veh == "helicopter")) return 1000000;
	if(veh == "skimmer") return 2000000;
	if((veh == "police maverick") || (veh == "policemaverick") || (veh == "police helicopter") || (veh == "policehelicopter")) return 1100000;
	if(veh == "sparrow") return 900000;	
	if(veh == "sea sparrow") return 3000000;	
	
	if(veh == "dinghy") return 400000;
	if(veh == "marquis") return 600000;
	if(veh == "cuban jetmax") return 900000;
	if(veh == "tropic") return 500000;
	if(veh == "reefer") return 450000;
	if(veh == "speeder") return 600000;
	if(veh == "predator") return 1000000;
	if(veh == "squalo") return 800000;
	if(veh == "rio") return 550000;
	
	if(veh == "bloodring banger 1") return 400000;
	if(veh == "bloodring banger 2") return 400000;
	
	if(veh == "bmx") return 75000;
	if(veh == "hydra") return 10000000;
	if(veh == "honda s2000") return 650550;
	if(veh == "dacia 1310") return 150000;
}
function Cop(player)
{
	if(player.WantedLevel == 0)
	{
		if(CheckpointColors(player,COPCOLOR) != true)
		{
		if(player.Skin == 15) player.Skin = 1;
		player.GiveWeapon(WEP_COLT,187);
		player.GiveWeapon(WEP_TEARGAS,11);
		player.GiveWeapon(WEP_UZI,330);
		player.GiveWeapon(WEP_RUGER,330);
		player.GiveWeapon(WEP_SHOTGUN,50);
		player.GiveWeapon(100,1);
		player.GiveWeapon(101,11);
		MSG(JOB_EN+player+" is now a cop.",JOB_RO+player+" este acum un politist.");
		MSGPLR(JOB_EN+"Your job is killing or arresting wanted players.",player,JOB_RO+"Slujba ta e sa ucizi sau sa arestezi jucatori cautati.");
		MSGPLR(JOB_EN+"Arresting gives a higher reward.",player,JOB_RO+"Arestarea da un mai mare premiu.");
		MSGPLR(JOB_EN+"To arrest, get close enough to an player, holding in your hand the cuffs, then press [E].",player,JOB_RO+"Ca sa arestezi, apropiete de jucator, tine in mana catusele si apasa [E].");
		MSGPLR(JOB_EN+"Commands: /r , /wanted",player,JOB_RO+"Comenzi: /r , /wanted");
		player.Colour= COPCOLOR;
		SaveJob(player,"cop");
		}
		else MSGPLR(MSG_ERROR_EN+"You are already a cop.",player,MSG_ERROR_RO+"Esti deja politist.");
	}
	else MSGPLR(MSG_ERROR_EN+"You are wanted.",player,MSG_ERROR_RO+"Esti cautat de politie.");
}
function CPlayer::Kill()
{
	this.Eject();
	this.Health = 0;
}
function Arrest(victim,cop)
{
	victim.Disarm();
	victim.Eject();
	local reward = victim.WantedLevel * 1000 * 2
	cop.Cash += reward;
	MessagePlayer(GREEN+"$ +"+reward,cop);
	MSG(RED+victim+" was arrested by "+cop,RED+victim+" a fost arestat de "+cop);
	MSGPLR(GREEN+"Tip: You can evade the prison.",victim,GREEN+"Sfat: Poti sa scapi din inchisoare.");
	local arresttime = victim.WantedLevel * 20;
	if(arresttime > 1800) arresttime = 1800;
	WriteIniInteger(ARRESTFILE,ARREST,victim.Name,arresttime);
	victim.WantedLevel = 0;
	victim.Pos = Vector(589.45, 1441.48, 11.7562);
}
function ArrestUpdate()
{
	for(local i =0 ; i < GetMaxPlayers();i++)
	{
		local plr = FindPlayer(i);
		if(plr != null)
		{
			local PrisonTime = ReadIniInteger(ARRESTFILE,ARREST,plr.Name);
			if(PrisonTime == 0) continue;
			PrisonTime -= 1;
			local minutes = PrisonTime / 60;
			local seconds = PrisonTime % 60;
			NAnnounce("Time in prison:~o~ "+minutes+":"+seconds,plr,1,"Timp in inchisoare:~o~ "+minutes+":"+seconds)		
			WriteIniInteger(ARRESTFILE,ARREST,plr.Name,PrisonTime);
			if(PrisonTime == 0 )
			{
				MSG(GREEN+plr+"is now free.",GREEN+plr+" e acum liber");
				plr.Pos = Vector(646.48, 1425.02, 13.3799);
				continue;
			}
			if(IsPlayerInJail(plr) == false)
			{
				WriteIniInteger(ARRESTFILE,ARREST,plr.Name,0);
				MSG(RED+plr+" escaped from the prison!",RED+plr+" a evadat din inchisoare!");
				NAnnounce("Time in prison:~o~ 0:0",plr,1,"Timp in inchisoare:~o~ 0:0")		

				plr.WantedLevel = 100;
			}
		}
	}
	if(BANKTIMERBOMB > 0) {
		BANKTIMERBOMB -= 1;
		if(BANKTIMERBOMB == 0)
		{
			local player = FindPlayer(BANKROBBER);
			local reward = 10000 + rand() % 25000;
			player.Cash += reward;
			MessagePlayer(GREEN+"$ +"+reward,player);
			player.WantedLevel += 6;
			MSG(ROBBERY_EN+player+" robbed the bank in "+GetMapName(player.Pos.x,player.Pos.y),ROBBERY_RO+player+" a jefuit banca din "+GetMapName(player.Pos.x,player.Pos.y));
			CreateExplosion(0,2,Vector(-944.937, -343.691, 7.22757),-1,false);
			CreateExplosion(0,2,Vector(-934.508, -351.041, 7.22692),-1,false);
			CreateExplosion(0,2,Vector(-934.433, -341.627, 7.22693),-1,false);
			CreateExplosion(0,2,Vector(-933.562, -352.32, 17.8038),-1,false);
			UpdateClientSide(player,-1,-1);
		}
	}
}
function GetWep(id)
{
	if(id == 10) return "Katana";
	if(id == 100) return "Cuffs";
	if(id == 101) return "Spikes";
	if(id == 102) return "Medkit";
	if(id == 103) return "Desert Eagle 50 AE";
	if(id == 104) return "PP-Bizon 38";
	if(id == 105) return "AWP";
	if(id == 106) return "Glock-18";
	if(id == 107) return "AK-47";
	if(id == 108) return "Vector Kriss";
	if((id >= 109) && (id < 112)) return "AK-47 Custom";
	if((id > 111) && (id < 115)) return "M4 Custom";
	if((id > 115) && (id < 118)) return "MP5 Custom";
	if(id == 118) return "M60 Custom";
	if(id == 119) return "Colt .45 Custom";
	if(id == 120) return "Pump-Action Shotgun Custom";
	else return GetWeaponName(id);
}

function Speed(vehicle)
{
 local sX = pow( vehicle.Speed.x, 2 )
 local sY = pow( vehicle.Speed.y, 2 )
 local sZ = pow( vehicle.Speed.z, 2 )
 
 local SumSpeed = ( sX + sY + sZ );
 
 local avgSpeed = sqrt( SumSpeed ) * 50 * 3.6;
 return round( avgSpeed, 0 );
} 

function round(value, precision) {
    local factor = pow(10.0, precision);
    return floor(value * factor + 0.5) / factor;
}

function IsCopCar(vehicle)
{
	if(vehicle.Model == 6402) return true;
	if(vehicle.Model == 156) return true;
	if(vehicle.Model == 157) return true;
	if(vehicle.Model == 236) return true;
	if(vehicle.Model == 220) return true;
	if(vehicle.Model == 147) return true;
	return false;
}

function Medic(player)
{
	if(CheckpointColors(player,MEDICCOLOR) != true)
	{
		if(player.Skin == 15) player.Skin =5;
		player.Color = MEDICCOLOR;
		player.GiveWeapon(102,1);
		MEDICARR[player.ID] = 10;
		MSG(JOB_EN+player+" is now an medic!",JOB_RO+player+" este un medic!");
		MSGPLR(JOB_EN+"Your job is healing players by pressing [E]",player,JOB_RO+"Jobul tau e sa dai heal la jucatori cu [E]");
		MSGPLR(JOB_EN+"Restock by accepting the job again.",player,JOB_RO+"Primesti medkituri cand accepti jobul din nou.");
		SaveJob(player,"medic");
	}
	else if(MEDICARR[player.ID] <= 0)
	{
		player.GiveWeapon(102,1);
		MEDICARR[player.ID] = 10;
		MSGPLR(WHITE+"Medkits remaining:"+MEDICARR[player.ID],player,WHITE+"Medkit-uri ramase:"+MEDICARR[player.ID]);
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an medic",player,MSG_ERROR_RO+"Esti deja un medic");
}
MEDICARR <- array(100,-1);
FIREPOS <- null;
FIREMARK <- null;
function SpawnFire()
{
	if(FIREPOS != null) return 0;
	switch(rand() % 20)
	{
		case 1: { FIREPOS = Vector(-378.164,-554.109,19.5741); break; }
		case 2: { FIREPOS = Vector( -895.765 , -340.55 , 13.3881); break; }
		case 3: { FIREPOS = Vector( -1008.13 , -868.942, 13.0261); break;}
		case 4: { FIREPOS = Vector( -676.9 , 1200.7 , 11); break;}
		case 5: { FIREPOS = Vector( -597.9 , 653.6 , 11); break;}
		case 6: { FIREPOS = Vector(-657.3 , 762.5 , 11.6); break;}
		case 7: { FIREPOS = Vector( -1011.4 , 198.5 , 11); break;}
		case 8: { FIREPOS = Vector( -1102.8 , 343.5 , 11.5); break;}
		case 9: { FIREPOS = Vector(-872.2 , -683.7, 11.2); break;}
		case 10: { FIREPOS = Vector(-1169.9 , -607.5, 11.6); break;}
		case 11: { FIREPOS = Vector(-727.1 , 563.4, 10.9); break;}
		case 12: { FIREPOS = Vector( -708.228 , -1264.19 , 11.0715); break;}
		case 13: { FIREPOS = Vector(-1062.4 , -278.2 , 12.0); break;}
		case 14: { FIREPOS = Vector( 259.9 , -232.9 , 11.5); break;}
		case 15: { FIREPOS = Vector( -993.862671 , -1164.624756 , 15); break;}
		case 16: { FIREPOS = Vector(233.206772 , -1277.911987 , 12); break;}
		case 17: { FIREPOS = Vector(183.102341 , -379.095245 , 11); break;}
		case 18: { FIREPOS = Vector(3.454 , -938.991455 , 10.458992); break;}
		case 19: { FIREPOS = Vector(491.832520 ,-78.475685 ,11.483762); break;}
		default: { FIREPOS = Vector(-59.326523 , -1481.117676 , 10.495505); break;}
	}
	FIREMARK = CreateMarker(0,FIREPOS,5,RGB(1,1,1),102);
	MSG(FIRE_EN+"A fire started in "+GetMapName(FIREPOS.x,FIREPOS.y),FIRE_EN+"A inceput un incendiu in "+GetMapName(FIREPOS.x,FIREPOS.y));
	
	return 1;
}
function TurnOffFire()
{
	DestroyMarker(FIREMARK);
	FIREPOS = null;
}
function UpdateFire()
{
	if(FIREPOS != null) CreateExplosion(0,1,FIREPOS,-1,false);
}
FIRET1 <- NewTimer("UpdateFire",2000,0);
FIRET2 <- NewTimer("SpawnFire",120000,0);
function FireFighter(player)
{
	if(CheckpointColors(player, FIRECOLOR) != true)
	{
		if(player.Skin == 15) player.Skin = 6;
		player.Color = FIRECOLOR;
		MSG(JOB_EN+player+" is now an firefighter!",JOB_RO+player+" este un pompier!");
		MSGPLR(JOB_EN+"Your job is stopping fires!",player,JOB_RO+"Jobul tau e sa opresti focurile");
		MSGPLR(JOB_EN+"To stop a fire you need to be in a firetruck, and then when you are near the fire press [E]",player,JOB_RO+"Ca sa operesti focul, trebuie sa fii intro masina de pompieri si apoi cand esti aproape de foc, apasa [E]");
		SaveJob(player,"firefighter");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an firefighter",player,MSG_ERROR_RO+"Esti deja un pompier");
}
function Terrorist(player)
{
	if(CheckpointColors(player,TERRORISTCOLOR) != true)
	{
		player.Color = TERRORISTCOLOR;
		MSG(JOB_EN+player+" is now an terrorist!",JOB_RO+player+" este un terorist!");
		MSGPLR(JOB_EN+"Your job is killing everyone!",player,JOB_RO+"Jobul tau e sa omori pe toata lumea!");
		player.GiveWeapon(103,77);
		player.GiveWeapon(WEP_MOLOTOV,11);
		player.GiveWeapon(107,330);
		player.GiveWeapon(WEP_STUBBY,88);
		player.GiveWeapon(WEP_FLAMETHROWER,500);
		player.WantedLevel += 6;
		SaveJob(player,"terrorist");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an terrorist",player,MSG_ERROR_RO+"Esti deja un terorist");
}
function Trucker(player)
{
	if(CheckpointColors(player,TRUCKERCOLOR) != true)
	{
		if(player.Skin == 15) player.Skin = 156;
		player.Color = TRUCKERCOLOR;
		MSG(JOB_EN+player+" is now an trucker!",JOB_RO+player+" este un camionagiu!");
		MSGPLR(JOB_EN+"Your job is to collect boxes with a Spand Express truck!",player,JOB_RO+"Jobul tau e colectezi cutii cu un camion Spand Express!");
		SaveJob(player,"trucker");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an trucker",player,MSG_ERROR_RO+"Esti deja un camionagiu");
}
function BankTransporter(player)
{
	if(CheckpointColors(player,BTRANPORTD) == false)
	{
		player.Skin = 103;
		player.GiveWeapon(WEP_M4,330);
		player.GiveWeapon(WEP_RPG,2);
		player.GiveWeapon(WEP_REMOTE,4);
		player.GiveWeapon(WEP_COLT,187);
		player.GiveWeapon(108,495);
		player.Color = BTRANPORTD;
		MSG(JOB_EN+player+" is now an bank guard!",JOB_RO+player+" este un paznic de banca!");
		MSGPLR(JOB_EN+"Your job is to tranport cash from the bank to a location and to protect the truck or to prevent the players from robbing the bank!",player,JOB_RO+"Jobul tau e sa duci bani de la banca la un loc, si sa pazesti camionul, sau sa pazesti banca!");
		SaveJob(player,"bank guard");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an bank guard",player,MSG_ERROR_RO+"Esti deja un paznic de banca");
}
function BankTransportC()
{
	if(BNKT_V == -1) return 0;
	local POS = null;
	switch(rand() % 20)
	{
		case 1: { POS = Vector(-378.164,-554.109,19.5741); break; }
		case 2: { POS = Vector(-1058.83, -266.908, 11.4464); break; }
		case 3: { POS = Vector( -1008.13 , -868.942, 13.0261); break;}
		case 4: { POS = Vector( -676.9 , 1200.7 , 11); break;}
		case 5: { POS = Vector( -597.9 , 653.6 , 11); break;}
		case 6: { POS = Vector(-657.3 , 762.5 , 11.6); break;}
		case 7: { POS = Vector( -1011.4 , 198.5 , 11); break;}
		case 8: { POS = Vector( -1102.8 , 343.5 , 11.5); break;}
		case 9: { POS = Vector(-872.2 , -683.7, 11.2); break;}
		case 10: { POS = Vector(-1169.9 , -607.5, 11.6); break;}
		case 11: { POS = Vector(-727.1 , 563.4, 10.9); break;}
		case 12: { POS = Vector( -708.228 , -1264.19 , 11.0715); break;}
		case 13: { POS = Vector(-1062.4 , -278.2 , 12.0); break;}
		case 14: { POS = Vector( 259.9 , -232.9 , 11.5); break;}
		case 15: { POS = Vector( -993.862671 , -1164.624756 , 15); break;}
		case 16: { POS = Vector(233.206772 , -1277.911987 , 12); break;}
		case 17: { POS = Vector(183.102341 , -379.095245 , 11); break;}
		case 18: { POS = Vector(3.454 , -938.991455 , 10.458992); break;}
		case 19: { POS = Vector(491.832520 ,-78.475685 ,11.483762); break;}
		default: { POS = Vector(-59.326523 , -1481.117676 , 10.495505); break;}
	}
	BNKT_CH =  CreateCheckpoint(null,0, true,POS,ARGB(0,250,0,255),4).ID;
	BNKT_M = CreateMarker(0,POS,5,RGB(250,0,255),0);
	MSG(BANKTRANSPORT_EN+"Destination:"+GetMapName(POS.x,POS.y),BANKTRANSPORT_RO+"Destinatie:"+GetMapName(POS.x,POS.y));
	TXTAddLine("Logs.txt","Destination:"+GetMapName(POS.x,POS.y));
	return 1;
}
function InBank(player)
{
	//(-901.584, -329.858
	//(-901.456, -352.261
	//(-977.383, -344.611
	//(-975.582, -312.744
	//(-888.281, -315.106
	if(DistanceFromPoint(player.Pos.x,player.Pos.y,-938.602, -351.197) < 22 )
	{
		return true;
	}
	else return false;
}
function Dustman(player)
{
	if(! CheckpointColors(player,DUSTMANC))
	{
	if(player.Skin == 15) player.Skin = 29;
	player.Colour = DUSTMANC;
	MSG(JOB_EN+player+" is now an dustman",JOB_RO+player+" este acum un gunoier");
	MSGPLR(JOB_EN+"Your job is to collect trash around the city with your Trashmaster.",player,JOB_RO+"Jobul tau e sa colectezi gunoi cu Trashmaster-ul tau.");
	SaveJob(player,"dustman");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an dustman",player,MSG_ERROR_RO+"Esti deja un gunoier. Ce mai vrei de la viata?");
}
DUST_COLLECTED <- array(100,0);
function TaxiDriver(player)
{
	if(! CheckpointColors(player,TAXIC))
	{
	if(player.Skin == 15) player.Skin = 134;
	player.Colour = TAXIC;
	MSG(JOB_EN+player+" is now an taxi driver",JOB_RO+player+" este acum un sofer taxi");
	MSGPLR(JOB_EN+"Your job is to tranport players where they want.",player,JOB_RO+"Jobul tau e sa transporti jucatorii unde vor.");
	SaveJob(player,"taxi driver");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an taxi driver",player,MSG_ERROR_RO+"Esti deja un sofer de taxi.");
}
function BodyGuard(player,boss)
{
	player.GiveWeapon(12,1);
	player.GiveWeapon(103,77);
	player.GiveWeapon(107,330);
	player.GiveWeapon(5,1);
	player.GiveWeapon(25,330);
	player.Colour = BGC;
	MSG(JOB_EN+boss+" hired "+player+" as a bodyguard!",JOB_RO+boss+" l-a angajat pe "+player+" ca un bodyguard!");
	MSGPLR(JOB_EN+"Your job is protecting "+boss,player,JOB_RO+"Jobul tau e sa il pazesti pe "+boss);
	WriteIniString(BOSSFILE,BOSS,player.Name,boss.Name);
}
function Mechanic(player)
{
	if(CheckpointColors(player,MECHANICC) == false)
	{
		player.Color = MECHANICC;
		player.GiveWeapon(7,1);
		CARREPAIRS[player.ID] = 10;
		if(player.Skin == 15)player.Skin = 27;
		MSG(JOB_EN+player+" is now an mechanic",JOB_RO+player+" este acum un mecanic");
		MSGPLR(JOB_EN+"Your job is to repair cars.",player,JOB_RO+"Jobul tau e sa repari masini.");
		MSGPLR(JOB_EN+"To repair a car enter it an press [E] while holding the hammer.",player,JOB_RO+"Ca sa repari o masina intra in ea si apasa [E] cand ai cionanul in mana.");
		SaveJob(player,"mechanic");
	}
	else
	{
		if(CARREPAIRS[player.ID] <= 0)
		{
			player.GiveWeapon(7,1);
			CARREPAIRS[player.ID] = 10;
			MSGPLR(WHITE+"New hammers given.",player,WHITE+"Ai primit noile ciocane.");
		}
		else MSGPLR(MSG_ERROR_EN+"You already are an mechanic.",player,MSG_ERROR_RO+"Esti deja mecanic");
	}
}
CARREPAIRS <- array(100,0);
function Investigator(player)
{
	if(! CheckpointColors(player,INVESTIGATORC))
	{
	if(player.Skin == 15) player.Skin = 102;
	player.Colour = INVESTIGATORC;
	player.GiveWeapon(17,187);
	MSG(JOB_EN+player+" is now an investigator",JOB_RO+player+" este acum un investigator");
	MSGPLR(JOB_EN+"Your job is to investigate murders marked with a skull pickup.",player,JOB_RO+"Jobul tau e cercetezi crimele marcate cu un craniu.");
	SaveJob(player,"investigator");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an investigator",player,MSG_ERROR_RO+"Esti deja un investigator.");
}
KILLS_PICKUP_DATA <- array(2000,"");
function DrugDealer(player)
{
	if(! CheckpointColors(player,DEALERC))
	{
	if(player.Skin == 15) player.Skin = 46;
	player.Colour = DEALERC;
	player.GiveWeapon(103,77);
	MSG(JOB_EN+player+" is now an drug dealer",JOB_RO+player+" este acum un dealer de droguri");
	MSGPLR(JOB_EN+"Your job is to sell drug to players that require them.",player,JOB_RO+"Jobul tau e sa dai droguri celor care vor.");
	SaveJob(player,"drug dealer");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an drug dealer!",player,MSG_ERROR_RO+"Esti deja un dealer de droguri!");
}
function SaveJob(player,job)
{
	WriteIniString(JOBFILE,JOB,player.Name,job);
}
function LoadJob(player)
{
	local job = ReadIniString(JOBFILE,JOB,player.Name)
	switch(job)
	{
		case "cop":
		{
			Cop(player);
			break;
		}
		case "medic":
		{
			Medic(player);
			break;
		}
		case "firefighter":
		{
			FireFighter(player);
			break;
		}
		case "terrorist":
		{
			Terrorist(player);
			break;
		}
		case "trucker":
		{
			Trucker(player);
			break;
		}
		case "bank guard":
		{
			BankTransporter(player)
			break;
		}				
		case "dustman":
		{
			Dustman(player)
			break;
		}
		case "taxi driver":
		{
			TaxiDriver(player)
			break;
		}
		case "mechanic":
		{
			Mechanic(player);
			break;
		}
		case "investigator":
		{
			Investigator(player);
			break;
		}
		case "drug dealer":
		{
			DrugDealer(player);
			break;
		}
		case "bulider":
		{
			Builder(player);
			break;
		}
		case "prostitute":
		{
			Curva(player)
			break;
		}
		default: break;
	}
}
function MinuteT()
{
	for(local i =0 ; i < 100; i++)
	{
		if(FindPlayer(i) != null)
		{
			local player = FindPlayer(i);
			local xp = ReadIniInteger(XPFILE,XP,player.Name);
			local hunger = ReadIniInteger(HUNGERFILE,HUNGER,player.Name);
			if(xp == null) xp = 0;
			if(hunger == null) hunger = 0;
			xp++;
			hunger--;
			if(hunger <= 0)
			{
				hunger = 100;
				player.Kill();
			}
			WriteIniInteger(HUNGERFILE,HUNGER,player.Name,hunger);
			if(player.Vehicle != null)
			{
				if(player.Vehicle.Model != 6427)
				{
					local fuel = ReadIniInteger(FUELFILE,FUEL,player.Vehicle.ID+"");
					fuel -= 1;
					if(fuel < 0) fuel = 0;
					WriteIniInteger(FUELFILE,FUEL,player.Vehicle.ID+"",fuel);
				}
			}
	
			local vip4 = ReadIniInteger(VIPEMERALD,VIP,player.Name);
			local vip3 = ReadIniInteger(VIPGOLD,VIP,player.Name);
			local vip2 = ReadIniInteger(VIPSILVER,VIP,player.Name);
			local vip1 = ReadIniInteger(VIPBRONZE,VIP,player.Name);
			if(vip4 > 0)
			{
				vip4 -= 1;
				xp += 3;
				WriteIniInteger(VIPEMERALD,VIP,player.Name,vip4);
				MessagePlayer(YELLOW+"VIP Emerald : "+vip4+" min",player);
			}
			else if(vip3 > 0)
			{
				vip3 -= 1;
				xp += 2;
				WriteIniInteger(VIPGOLD,VIP,player.Name,vip3);
				MessagePlayer(YELLOW+"VIP Gold : "+vip3+" min",player);
			}
			else if(vip2 > 0)
			{
				vip2 -= 1;
				xp += 1;
				WriteIniInteger(VIPSILVER,VIP,player.Name,vip2);
				MessagePlayer(YELLOW+"VIP Silver : "+vip2+" min",player);
			}
			else if(vip1 > 0)
			{
				vip1 -= 1;
				WriteIniInteger(VIPBRONZE,VIP,player.Name,vip1);
				MessagePlayer(YELLOW+"VIP Bronze : "+vip1+" min",player);
			}
			WriteIniInteger(XPFILE,XP,player.Name,xp);
			MessagePlayer(GREEN+"XP:"+xp,player);
			UpdateClientSide(player,xp,hunger);
		}
	}
}
HungerT <- NewTimer("MinuteT",60000,0);

function UpdateClientSide(player,xp,hunger)
{
	if(player.Vehicle == null)
	{
	Stream.StartWrite();
	Stream.WriteInt(13)
	Stream.WriteString(player.Cash+" "+player.WantedLevel+" "+xp+" "+hunger)
	Stream.SendStream(player);
	}
	else
	{
		local owner = ReadIniString(CAROWNERFILE,CAROWNER,player.Vehicle.ID+"");
		if(owner == "For Sale") owner = "For_Sale"
		local fuel = ReadIniInteger(FUELFILE,FUEL,player.Vehicle.ID+"")
		local nos = ReadIniInteger(NOSFILE,NOS,player.Vehicle.ID+"");
		if(player.Vehicle.Model == 6427)
		{
			nos = "N/A";
			fuel = "N/A";
		}
		if(IsVehHeli(player.Vehicle))
		{
			nos = "N/A";
		}
		Stream.StartWrite();
		Stream.WriteInt(15);
		Stream.WriteString(player.Vehicle.ID+" "+owner+" "+fuel+" "+nos)
		Stream.SendStream(player);
		if(hunger != -1)
		{
			Stream.StartWrite();
			Stream.WriteInt(16);
			Stream.WriteString(hunger+"")
			Stream.SendStream(player);
		}
		if(fuel != "N/A")
		{
			if(fuel <= 0)
			{
				player.Vehicle.SetHandlingData(14, 0);
				player.Vehicle.SetHandlingData(13,0);
				MSGPLR(RED+"No fuel!",player,RED+"Fara combustibil!");
			}
		}
	}
}

function foodname(index)
{
	switch(index)
	{
		case 1: return "coca cola";
		case 2: return "french fries";
		case 3: return "hamburger";
		case 4: return "kebab";
		case 5: return "pizza";
		case 6: return "salad";
		case 7: return "sprite";
		case 8: return "water";
		default: return "coca cola";
	}
	return 1;
}
function foodprice(index)
{
	switch(index)
	{
		case 1: return 5;
		case 2: return 3;
		case 3: return 5;
		case 4: return 18;
		case 5: return 20;
		case 6: return 30;
		case 7: return 4;
		case 8: return 2;
		default: return 5;
	}
	return 1;
}
function foodhunger(index)
{
	switch(index)
	{
		case 1: return 5;
		case 2: return 40;
		case 3: return 30;
		case 4: return 70;
		case 5: return 100;
		case 6: return 30;
		case 7: return 7;
		case 8: return 10;
		default: return 5;
	}
	return 1;
}
function GetAdminLevel(player)
{
	local lvl = ReadIniInteger(ADMINFILE,ADMIN,player.Name);
	if(lvl == null) lvl = 0;
	return lvl;
}
function GetAdminName(lvl)
{
	switch(lvl)
	{
		case 1: return "[#00ff90][Moderator]"+WHITE;
		case 2: return SKYBLUE+"[Global Moderator]"+WHITE;
		case 3: return "[#aaaaaa][Helper]"+WHITE;
		case 4: return "[#ffaa00][Admin]"+WHITE;
		case 5: return RED+"[Co-Owner]"+WHITE;
		case 6: return "[#aaaaff][Founder & Developer]"+WHITE;
		default: return WHITE+"[Player]"+WHITE;
	}
}
function NotAdminError(plr,lvl)
{
	MSGPLR(MSG_ERROR_EN+"You are not an "+GetAdminName(lvl),plr,MSG_ERROR_RO+"Nu esti un "+GetAdminName(lvl));
}

function PlrColToStrHex(plr)
{
	local r = format("%02X", plr.Color.r);
	local g = format("%02X", plr.Color.g);
	local b = format("%02X", plr.Color.b);
	return "[#"+r+g+b+"]";
	
}
function WepPickSpawn(player,wep,ammo,offset)
{
	local pickid = 0;
	if(wep == 102) pickid = 6499;
	if(wep == 103) pickid = 6501;
	if(wep == 104) pickid = 6502;
	if(wep == 105) pickid = 6503;
	if(wep == 106) pickid = 6504;
	if(wep == 107) pickid = 6500;
	if(wep == 108) pickid = 6505;
	if((wep >= 109) && (wep <= 111)) pickid = 6500;
	if((wep >= 112) && (wep <= 115)) pickid = 280;
	if((wep >= 116) && (wep <= 117)) pickid = 284;
	if(wep == 119) pickid =  274;
	if(wep == 120) pickid = 277;
	if(wep == 118) pickid = 289;
	if(wep == 1) pickid = 259;
	if(wep == 2) pickid = 260;
	if(wep == 3) pickid = 261;
	if(wep == 4) pickid = 262;
	if(wep == 5) pickid = 263;
	if(wep == 6) pickid = 264;
	if(wep == 7) pickid = 265;
	if(wep == 8) pickid = 266;
	if(wep == 9) pickid = 267;
	if(wep == 10) pickid = 268;
	if(wep == 11) pickid = 269;
	if(wep == 12) pickid = 270;
	if(wep == 13) pickid = 291;
	if(wep == 14) pickid = 271;
	if(wep == 15) pickid = 272;
	if(wep == 17) pickid = 274;
	if(wep == 18) pickid = 275;
	if(wep == 19) pickid = 277;
	if(wep == 20) pickid = 278;
	if(wep == 21) pickid = 279;
	if(wep == 22) pickid = 281;
	if(wep == 23) pickid = 282;
	if(wep == 24) pickid = 283;
	if(wep == 25) pickid = 284;
	if(wep == 26) pickid = 280;
	if(wep == 27) pickid = 276;
	if(wep == 28) pickid = 285;
	if(wep == 29) pickid = 286;
	if(wep == 30) pickid = 287;
	if(wep == 31) pickid = 288;
	if(wep == 32) pickid = 289;
	if(wep == 33) pickid = 290;
	if(pickid != 0) CreatePickup(pickid,0,ammo,Vector(player.Pos.x + 1*offset, player.Pos.y, player.Pos.z),255,true);
}
function DropInventory(player)
{
	if(ggstatus != 0) return;
	local offset = 1;
	for(local i =0; i < 10;i++) {
		if(player.GetWeaponAtSlot(i) > 0 )
		{
			WepPickSpawn(player,player.GetWeaponAtSlot(i),player.GetAmmoAtSlot(i),offset);
			offset += 1;
		}
	} 
}
function WeaponPickup(player,pickup)
{
	if(pickup == null) return;
	if(Between(259,295,pickup.Model) == true)
	{
		pickup.Remove();
	}
	if(pickup.Model == 6499){
		player.GiveWeapon(102,pickup.Quantity);
		if(pickup.ID != 0) pickup.Remove();
	}
	if(pickup.Model ==  6500) 
	{
		player.GiveWeapon(107,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model ==  6501) 
	{
		player.GiveWeapon(103,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model ==  6502) 
	{
		player.GiveWeapon(104,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model ==  6503) 
	{
		player.GiveWeapon(105,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model ==  6504) 
	{
		player.GiveWeapon(106,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model ==  6505) 
	{
		player.GiveWeapon(108,pickup.Quantity);
		pickup.Remove();
	}
	if(pickup.Model == 291) 
	{
		player.GiveWeapon(13,pickup.Quantity);
	}
}
function WepClip(wep)
{
	if(wep == 16) return -1;
	if((wep < 17) || (wep == 29)) return 1;
	if(wep == 17) return 17;
	if(wep == 18) return 6;
	if(wep == 19) return 8;
	if(wep == 28) return 1;
	if((wep == 20) || (wep == 29)) return 7;
	if(wep == 21) return 8;
	if(wep == 22) return 50;
	if((wep > 22) && (wep < 28)) return 30;
	if(wep == 30) return 1;
	if(wep == 31) return 500;
	if(wep == 32) return 100;
	if(wep == 33) return 500 / 11;
	if(wep == 103) return 7;
	if(wep == 104) return 64;
	if(wep == 105) return 10;
	if(wep == 106) return 20;
	if(wep == 107) return 30;
	if(wep == 108) return 45;
	if((wep > 108) && (wep < 111)) return 30;
	if(wep == 111) return 45;
	if(wep == 112) return 45;
	if((wep > 112) && (wep < 118)) return 30;
	if(wep == 118) return 200;
	if(wep == 119) return 17;
	if(wep == 120) return 8;
}

function BattleRoyaleEvent()
{
	local counter = 0;
	if(BattleRoyaleOn == true)
	{
		BattleRoyaleTimer += 1;
		if(BattleRoyaleTimer == 60)
		{
			for(local j =0 ; j < 100; j++)
			{
				if(FindPlayer(j) != null)
				{
					if(FindPlayer(j).World == 3)
					{
						if(FindPlayer(j).Pos.z > 100) {
							FindPlayer(j).Pos.z -= 5;
							Announce("~o~You were kicked out of the plane | Ai fost scos din avion.",FindPlayer(j),1);
						}
					}
				}
			}
		}
		else if(BattleRoyaleTimer < 60)
		{
			for(local j =0 ; j < 100; j++)
			{
				if(FindPlayer(j) != null)
				{
					if(FindPlayer(j).World == 3)
					{
						if(FindPlayer(j).Pos.z > 50)
						{
							FindPlayer(j).Health = 100;
							FindPlayer(j).Armour = 0;
							FindPlayer(j).Immunity = -1;
						}
						FindPlayer(j).HasMarker = false;
						if(FindPlayer(j).Pos.z > 50)
						{
							Announce("~o~/exitplane~h~ when you are ready | ~o~/exitplane~h~ cand esti gata",FindPlayer(j),1);
						}
						else
						{
							Announce("~y~ Look for weapons and kill everyone else. | Cauta arme si omoara pe oricine altcineva.",FindPlayer(j),1);
						}
						if(FindPlayer(j).Pos.z < 30) FindPlayer(j).Immunity = 0;
					}
				}
			}
		}
		if(BattleRoyaleTimer > 60)
		{
			for(local j =0 ; j < 100 ; j++)
			{
				if(FindPlayer(j) != null)
				{
					if(FindPlayer(j).World == 3) {
						counter++;
						FindPlayer(j).Immunity = 0;
					}
				}
			}
			for(local j =0; j < 100; j++)
			{
				if(FindPlayer(j) != null)
				{
					if(FindPlayer(j).World == 3) Announce("Remaining players in battle royale event:~b~"+counter+"~h~ | Jucatori ramasi in eventul battle royale:~b~"+counter,FindPlayer(j),1);
				}
			}
		}
			if(counter == 1)
			{
				for(local i=0 ; i < 100; i++)
				{
					if(FindPlayer(i) != null)
					{
						if(FindPlayer(i).World == 3)
						{
						AnnounceAll("Winner is "+FindPlayer(i)+" | Castigatorul este "+FindPlayer(i),3);
						BattleRoyaleOn = false;
						FindPlayer(i).World = 0;
						FindObject(0).Pos = Vector(161.641,-259.323,128.128);
						break;
						}
					}
				}
			}
		}
	}
quizid <- -1;
function QuizGenerator()
{
	local msg = "";
	local randomg = rand() % 13;
	switch(randomg)
	{
		case 0:
		{
			msg = "What is the fastest vehicle in the server?";
			break;
		}
		case 1:
		{
			msg = "What is the fastest vehicle in the server?";
			break;
		}
		case 2:
		{
			msg = "What is the best job in the server?";
			break;
		}
		case 3:
		{
			msg = "What is the best attachement for M4?";
			break;
		}
		case 4:
		{
			msg = "What is the best weapon in single player?";
			break;
		}
		case 5:
		{
			msg = "What is the fastest vehicle in single player?";
			break;
		}
		case 6:
		{
			msg = "pi = ? . Only 3 digits required.";
			break;
		}
		case 7:
		{
			msg = "1+1=?"
			break;
		}
		case 8:
		{
			msg = "2+2=?";
			break;
		}
		case 9:
		{
			msg = "2+1=?";
			break;
		}
		case 10:
		{
			msg = "x*x = -1 , x = ?";
			break;
		}
		case 11:
		{
			msg = "Who is the main developer of the server?";
			break;
		}
		case 12:
		{
			msg = "If a is a, what is a?";
			break;
		}
		default: break;
	}
	Message(MANGETA+"[QUIZ]"+msg);
	quizid = randomg;
}
function QuizReward(player)
{
	player.Cash += 1000;
	MessagePlayer(GREEN+"$ +1000",player);
	MSG(MANGETA+"[QUIZ]"+player+" responded correctly.",MANGETA+"[QUIZ]"+player+" a raspuns corect.");
	quizid = -1;
}
function QuizAnswer(text,player)
{
	text = text.tolower();
	if((quizid == 0) && (text == "bufallo")) QuizReward(player);
	if((quizid == 1) && (text == "bufallo")) QuizReward(player);
	if((quizid == 2) && (text == "bank guard")) QuizReward(player);
	if((quizid == 3) && (text == "m203")) QuizReward(player);
	if((quizid == 4) && (text == "minigun")) QuizReward(player);
	if((quizid == 5) && (text == "infernus")) QuizReward(player);
	if((quizid == 6) && (text == "3.141")) QuizReward(player);
	if((quizid == 7) && (text == "2")) QuizReward(player);
	if((quizid == 8) && (text == "4")) QuizReward(player);
	if((quizid == 9) && (text == "3")) QuizReward(player);
	if((quizid == 10) && (text == "i")) QuizReward(player);
	if((quizid == 11) && (text == "athanatos")) QuizReward(player);
	if((quizid == 12) && (text == "a")) QuizReward(player);
}
LOTTERY <- array(10,-1);
function LotteryJ(player,inp)
{
	if(inp == null) return 0;
	try
	{
		local a = inp.tointeger();
	}
	catch(e) return 0;
	if((inp.tointeger() > 10) || (inp.tointeger() < 0)) return 0;
	if(LOTTERY[inp.tointeger()] != -1)
	{
		if(FindPlayer(LOTTERY[inp].tointeger())) return 1;
	}
	if(player.Cash >= 1000)
	{
		player.Cash -= 1000;
		LOTTERY[inp.tointeger()] = player.ID;
		MSG(YELLOW+"[LOTTERY]"+WHITE+player+" bought ticket "+inp ,YELLOW+"[LOTERIE]"+WHITE+player+" bought ticket "+inp);
		return -1;
	}
	else return 2;
}
function LotteryW()
{
	local a = rand() % 10;
	if(LOTTERY[a] != -1)
	{
		local winner =  FindPlayer(LOTTERY[a]);
		if(winner != null)
		{
			local reward = 40000 + rand() % 1000001;
			winner.Cash += reward;
			MSG(YELLOW+"[LOTTERY]"+WHITE+winner+" won "+reward,YELLOW+"[LOTERIE]"+WHITE+winner+" a castigat.");
			MessagePlayer(GREEN+"$ +"+reward,winner);
			ResetLottery();
		}
	}
	else
	{
		for(local c =0; c < 10; c++) if(LOTTERY[c] != -1)
		{
			MSG(YELLOW+"[LOTTERY]"+WHITE+"Winner not decided.",YELLOW+"[LOTERIE]"+WHITE+"Castigatorul nu a fost ales.");
			return;
		}
	}
}
LOT <- NewTimer("LotteryW",30000,0);
function ResetLottery()
{
	for(local i =0; i < 10;i++) LOTTERY[i] = -1;
}
function ChangeWeather()
{
	SetWeather(rand() % 7);
}

function NumTok(string, separator)
{
    local tokenized = split(string, separator);
    return tokenized.len();
}
function Builder(player)
{
	if(! CheckpointColors(player,RGB(200,200,0)))
	{
	if(player.Skin == 15) player.Skin = 61;
	player.Colour = RGB(200,200,0);
	MSG(JOB_EN+player+" is now an bulider",JOB_RO+player+" este acum un constructor");
	MSGPLR(JOB_EN+"Your job is buliding interiors at player's request.",player,JOB_RO+"Jobul tau e sa construiecti interioarele la jucatori.");
	SaveJob(player,"bulider");
	}
	else MSGPLR(MSG_ERROR_EN+"You are already an bulider",player,MSG_ERROR_RO+"Esti deja un constructor.");
}

PLR_SELECT_INTERIOUR <- array(100,-1);
function SelectInteriour(player)
{
	Stream.StartWrite();
	Stream.WriteInt(22);
	Stream.SendStream(player);
	PLR_SELECT_INTERIOUR[player.ID] = 0;
	player.Frozen = true;
	ShowcaseInteriour(player,PLR_SELECT_INTERIOUR[player.ID]);
}
function ShowcaseInteriour(player,id)
{
	
	switch(id)
	{
		case 0:
		{
			player.SetCameraPos(INTERIOUR1,INTERIOUR1+Vector(-1,-1,0));
			Announce("Burned Interiour cost: 50,000 $",player,1);
			break;
		}
		case 1:
		{
			player.SetCameraPos(INTERIOUR2,INTERIOUR2+Vector(-1,-1,0));
			Announce("Interiour #1 : cost 500,000 $",player,1);
			break;
		}
		case 2:
		{
			player.SetCameraPos(INTERIOUR3,INTERIOUR3+Vector(-1,-1,0));
			Announce("Garage: 250,000 $",player,1);
			break;
		}
		case 3:
		{
			player.SetCameraPos(INTERIOUR4,INTERIOUR4+Vector(-1,-1,0));
			Announce("Interiour #2 cost: 450,000 $",player,1);
			break;
		}
		case 4:
		{
			player.SetCameraPos(INTERIOUR5,INTERIOUR5+Vector(-1,-1,0));
			Announce("Interiour #3 cost: 400,000 $",player,1);
			break;
		}
		case 5:
		{
			player.SetCameraPos(INTERIOUR6,INTERIOUR6+Vector(-1,-1,0));
			Announce("Ken Roserberg Interiour : 750,000 $",player,1);
			break;
		}
		case 6:
		{
			player.SetCameraPos(INTERIOUR7,INTERIOUR7+Vector(-1,-1,0));
			Announce("Dark Office: 300,000 $",player,1);
			break;
		}
		case 7:
		{
			player.SetCameraPos(INTERIOUR8,INTERIOUR8+Vector(-1,-1,0));
			Announce("Classic Interiour: 1,000,000 $",player,1);
			break;
		}
		case 8:
		{
			player.SetCameraPos(INTERIOUR9,INTERIOUR9+Vector(-1,-1,0));
			Announce("Interiour #4 cost: 555,000 $",player,1);
			break;
		}
		case 9:
		{
			player.SetCameraPos(INTERIOUR10,INTERIOUR10+Vector(-1,-1,0));
			Announce("Interiour #5 cost: 600,000 $",player,1);
			break;
		}
		default: break;
	}
}
function ChangeInteriour(player,a)
{
	if(a == true) //creste
	{
		PLR_SELECT_INTERIOUR[player.ID] += 1;
	}
	else PLR_SELECT_INTERIOUR[player.ID] -= 1;
	
	if(PLR_SELECT_INTERIOUR[player.ID] < 0) PLR_SELECT_INTERIOUR[player.ID] = 9;
	if(PLR_SELECT_INTERIOUR[player.ID] > 9) PLR_SELECT_INTERIOUR[player.ID] = 0;
	
	ShowcaseInteriour(player,PLR_SELECT_INTERIOUR[player.ID]);
}
function InteriourPrice(int)
{
	switch(int)
	{
		case 0: return 50000;
		case 1: return 500000;
		case 2: return 250000;
		case 3: return 450000;
		case 4: return 400000;
		case 5: return 750000;
		case 6: return 300000;
		case 7: return 1000000;
		case 8: return 555000;
		case 9: return 600000;
	}
}
function InteriourPos(int)
{
	switch(int)
	{
		case 0: return INTERIOUR1;
		case 1: return INTERIOUR2;
		case 2: return INTERIOUR3;
		case 3: return INTERIOUR4;
		case 4: return INTERIOUR5;
		case 5: return INTERIOUR6;
		case 6: return INTERIOUR7;
		case 7: return INTERIOUR8;
		case 8: return INTERIOUR9;
		case 9: return INTERIOUR10;
	}
}
function SaveInteriour(player)
{
	if(player.Cash >= InteriourPrice(PLR_SELECT_INTERIOUR[player.ID]))
	{
		WriteIniInteger(INTERIOURF,INTERIOURC,player.Name,PLR_SELECT_INTERIOUR[player.ID]);
		MSGPLR(GREEN+" Bought interiour: Price:"+InteriourPrice(PLR_SELECT_INTERIOUR[player.ID]),player,GREEN+" Ai cumparat interior: Pret :"+InteriourPrice(PLR_SELECT_INTERIOUR[player.ID]));
		Stream.StartWrite();
		Stream.WriteInt(23);
		Stream.SendStream(player);
		player.Cash -= InteriourPrice(PLR_SELECT_INTERIOUR[player.ID]);
		PLR_SELECT_INTERIOUR[player.ID] = -1;
		player.Frozen = false;
	}
	else MSGPLR(MSG_ERROR_EN+"You don't have enough money.",player,MSG_ERROR_RO+"Nu ai destui bani.");
}
function IMP_RemoveVehicles()
{
	for(local i =0; i < 1000; i++)
	{
		try{
			if(FindVehicle(i) != null) FindVehicle(i).Remove();
		}
		catch(e) { Message("Caught "+e) } ;
	}
}

function IsVehHeli(veh)
{
	switch(veh.Model)
	{
		case VEH_HUNTER : return true;
		case VEH_MAVERICK : return true;
		case VEH_VCNMAVERICK : return true;
		case 6428 : return true;
		case VEH_SPARROW : return true;
		case VEH_SEASPARROW : return true;
		case VEH_RCGOBLIN : return true;
		case VEH_RCRAIDER : return true;
		case VEH_SKIMMER : return true;
		default: return false;
	}
}
function DiscordWeaponEmoji(wep)
{
	switch(wep)
	{
		case GetWeaponName(0) :  return "fist";
		case GetWeaponName(1) :  return "brassknuckles";
		case GetWeaponName(2) :  return "screwdriver";
		case GetWeaponName(3) :  return "golfclub";
		case GetWeaponName(4) :  return "nitestick";
		case GetWeaponName(5) :  return "knife";
		case GetWeaponName(6) :  return "bat";
		case GetWeaponName(7) :  return "hammer";
		case GetWeaponName(8) :  return "cleaver";
		case GetWeaponName(9) :  return "machete";
		case GetWeaponName(10) :  return "katana";
		case GetWeaponName(11) :  return "chnsaw";
		case GetWeaponName(12) :  return "grenade";
		case GetWeaponName(13) :  return "bomb: :grenade";
		case GetWeaponName(14) :  return "teargas";
		case GetWeaponName(15) :  return "molotov";
		case GetWeaponName(16) :  return "rpg";
		case GetWeaponName(17) :  return "colt45";
		case GetWeaponName(18) :  return "python";
		case GetWeaponName(19) :  return "chromegun";
		case GetWeaponName(20) :  return "shotgspa";
		case GetWeaponName(21) :  return "buddyshot";
		case GetWeaponName(22) :  return "tec9";
		case GetWeaponName(23) :  return "uzi";
		case GetWeaponName(24) :  return "mac10";
		case GetWeaponName(25) :  return "mp5lng";
		case GetWeaponName(26) :  return "m4";
		case GetWeaponName(27) :  return "ruger";
		case GetWeaponName(28) :  return "sniper";
		case GetWeaponName(29) :  return "laser";
		case GetWeaponName(30) :  return "rocketla";
		case GetWeaponName(31) :  return "flamethrower: :flame";
		case GetWeaponName(32) :  return "m60";
		case GetWeaponName(33) :  return "minigun";
		case GetWep(100): return "cuffs";	
	case GetWep(102): return "medkit";
	case GetWep(103): return "deserteagle";
	case GetWep(104): return "ppbizon";
	case GetWep(105): return "awp";
	case GetWep(106): return "glock";
	case GetWep(107): return "ak47";
	case GetWep(108): return "vectorkriss";
	case GetWep(109): return "ak47";
	case GetWep(110): return "ak47";
	case GetWep(111): return "ak47";
	case GetWep(112): return "ak47";
	case GetWep(113): return "m4";
	case GetWep(114): return "m4";
	case GetWep(115): return "m4";
	case GetWep(115): return "mp5lng";
	case GetWep(116): return "mp5lng";
	case GetWep(117): return "mp5lng";
	case GetWep(118): return "m60";
	case GetWep(119): return "colt45";
	case GetWep(120): return "chromegun";
		default : return "grey_question"
	}
}
function Curva(player)
{
	if(!CheckpointColors(player,RGB(255,0,255)))
	{
		if(!IsFemaleSkin(player.Skin)) player.Skin = 174;
		MSG(JOB_EN+player+" is now a prostitute.",JOB_RO+player+" este acum o curva.");
		MSGPLR(JOB_EN+"Your job is getting fucked by players",player,JOB_RO+"Slujba ta e sa fii futut(a)");
		MSG(RED+player+" can be fucked. Use /fuck <player>",RED+player+" poate sa fie futut in cur :)))) . Foloseste /fuck <jucator>");
		player.Color = RGB(255,0,255);
	}
	else MSGPLR(MSG_ERROR_EN+"You are already a bitch. If you are a male, then "+RED+"YOU ARE GAY"+WHITE+" XDDDDD",player,MSG_ERROR_RO+"Esti deja o curva. Daca esti baiat atuncea "+RED+"ESTI GAY"+WHITE+" XDDDDD")
}
function IsFemaleSkin(id)
{
	switch(id)
	{
		case 24: return true;
		case 9: return true;
		case 10: return true;
		case 13: return true;
		case 14: return true;
		case 17: return true;
		case 18: return true;
		case 21: return true;
		case 22: return true;
		case 23: return true;
		case 25: return true;
		case 31: return true;
		case 32: return true;
		case 35: return true;
		case 36: return true;
		case 38: return true;
		case 40: return true;
		case 43: return true;
		case 44: return true;
		case 49: return true;
		case 50: return true;
		case 53: return true;
		case 54: return true;
		case 57: return true;
		case 59: return true;
		case 63: return true;
		case 65: return true;
		case 67: return true;
		case 70: return true;
		case 71: return true;
		case 75: return true;
		case 77: return true;
		case 79: return true;
		case 80: return true;
		case 81: return true;
		case 105: return true;
		case 106: return true;
		case 110: return true;
		case 117: return true;
		case 126: return true;
		case 143: return true;
		case 157: return true;
		case 158: return true;
		case 159: return true;
		case 174: return true;
		case 176: return true;
		case 177: return true;
		case 178: return true;
		case 183: return true;
		case 185: return true;
		default: return false;
	}
}

TUTORIAL_Status <- array(100,-1);

function Tutorial(player)
{
	local part = TUTORIAL_Status[player.ID];
	switch(part)
	{
		case -1: 
		{
			MSGPLR(RED+"Skip tutorial with /skiptutorial.",player,RED+"Sari peste tutorial cu /skiptutorial");
			player.Frozen = true;
			TUTORIAL_Status[player.ID] += 1;
			//Tutorial(player);
			break;
		}
		case 0:
		{
			player.Pos = Vector(-866.41, -112.493, 600);
			player.SetCameraPos(Vector(-866.41, -112.493, 11.1034),Vector(-869.777, -110.421, 11.1034));
			NAnnounce("Robbery system",player,3,"Sistemul de jefuiere!");
			NAnnounce("This is a robbery point.",player,0,"Acesta este un punct de jaf.");
			break;
		}
		case 1:
		{
			player.Pos = Vector(-866.41, -112.493,600);
			player.SetCameraPos(Vector(-866.41, -112.493, 11.1034),Vector(-869.777, -110.421, 11.1034));
			NAnnounce("By collecting this pickup you rob the property.",player,0,"Atingand acest pickup, jefuiesti propietatea.");
			break;
		}
		case 2:
		{
			player.Pos = Vector(-673.667, 1207.25,600);
			NAnnounce("Shops",player,3,"Magazine");
			player.SetCameraPos(Vector(-673.667, 1207.25, 11.1081),Vector(-677.746, 1204.59, 11.1091));
			NAnnounce("This is a gun shop",player,0,"Acesta este un magazin cu arme.");
			break;
		}	
		case 3:
		{
			player.Pos = Vector(-861.627, -637.748,600);
			player.SetCameraPos(Vector(-861.627, -637.748, 11.3756),Vector(-853.942, -635.31, 11.3756));
			NAnnounce("This a restaurant",player,0,"Acesta este un restaurant.");
			break;
		}
		case 4:
		{
			player.Pos = Vector(-861.627, -637.748,600);
			player.SetCameraPos(Vector(-861.627, -637.748, 11.3756),Vector(-853.942, -635.31, 11.3756));
			NAnnounce("Here you buy food to refill the hunger bar",player,0,"Aici cumperi mancare pentru a umple hungerul (bara portocalie de sus)");
			break;
		} 
		case 5:
		{
			player.Pos = Vector(-1008.84, -861.698,600);
			player.SetCameraPos(Vector(-1008.84, -861.698, 17.9541),Vector(-1023.18, -864.025, 18.0625));
			NAnnounce("This is the car dealership",player,0,"Acesta este dealershipul cu masini!");
			break;
		}		
		case 6:
		{
			player.Pos = Vector(414.67, 1038.63,25.2998);
			player.SetCameraPos(Vector(414.67, 1038.63, 25.2998),Vector(420.958, 1037.82, 25.2999));
			NAnnounce("This is the skin shop",player,0,"Acesta este magazinul cu skinuri");
			break;
		}		
		case 7:
		{
			player.Pos = Vector(410, 1038.43, 25.2998);
			player.SetCameraPos(Vector(414.67, 1038.63, 25.2998),Vector(420.958, 1037.82, 25.2999));
			NAnnounce("Buy clothes and skins there.",player,0,"Cumpara skinuri si haine aici.");
			break;
		}
		case 8:
		{
			player.Pos = Vector(-919.174, -1273.75, 600);
			player.SetCameraPos(Vector(-919.174, -1273.75, 11.6234),Vector(-912.327, -1268.37, 11.8174));
			NAnnounce("This is a car repair shop.",player,0,"Acesta este un magazin de reparat masina.");
			break;
		}
		case 9:
		{
			player.Pos = Vector(-838.696, -1490.98, 100);
			player.SetCameraPos(Vector(-838.696, -1490.98, 12.1081),Vector(-841.735, -1497.15, 12.1144));
			NAnnounce("This is a car tuning shop",player,0,"Acesta este un magazin in care iti tunezi masina");
			break;
		}
		case 10:
		{
			player.Pos = Vector(-838.696, -1490.98, 600);
			player.SetCameraPos(Vector(-838.696, -1490.98, 12.1081),Vector(-841.735, -1497.15, 12.1144));
			NAnnounce("Tuning is limited to car colors, NOS and armour.",player,0,"Tuning-ul e limitat la vopseaua masini, nitro si armura.");
			break;
		}
		case 11:
		{
			player.Pos = Vector(289.844, -143.001, 600);
			NAnnounce("Property system",player,3,"Sistemul de case!"); 
			player.SetCameraPos(Vector(289.844, -143.001, 15),Vector(282.277, -139.047, 12.1897));
			break;
		}
		case 12:
		{
			player.Pos = Vector(289.844, -143.001, 600);
			NAnnounce("To buy a house use /buyprop (name)",player,0,"Pentru a cumpara o propietate, foloseste /buyprop (nume)"); 
			player.SetCameraPos(Vector(289.844, -143.001, 15),Vector(282.277, -139.047, 12.1897));
			break;
		}
		case 13:
		{
			player.Pos = Vector(289.844, -143.001, 600);
			NAnnounce("To sell a house use /sellprop",player,0,"Pentru a vinde o casa , foloseste /sellprop"); 
			player.SetCameraPos(Vector(289.844, -143.001, 15),Vector(282.277, -139.047, 12.1897));
			break;
		}
		case 14:
		{
			player.Pos = Vector(113.902, -380.6, 600);
			player.SetCameraPos(Vector(113.902, -380.6, 9.05053),Vector(120.004, -377.119, 9.00778));
			NAnnounce("This is the interiour shop",player,0,"Acesta este magazinul de interioare.");
			break;
		}
		case 15:
		{
			player.Pos = Vector(289.844, -143.001, 600);
			player.SetCameraPos(Vector(289.844, -143.001, 15),Vector(282.277, -139.047, 12.1897));
			NAnnounce("To enter the house press [H] when touching the pickup",player,0,"Ca sa intri in casa apasa [H] cand atingi pickpul");
			break;
		}
		case 16:
		{
			player.Pos = Vector(289.844, -143.001, 600);
			player.SetCameraPos(Vector(289.844, -143.001, 15),Vector(282.277, -139.047, 12.1897));
			NAnnounce("To come back home use /home",player,0,"Ca sa te teleportezi acasa foloseste /home");
			break;
		}
		case 17:
		{
			player.Pos = Vector(-928.553, -349.74, 600);
			NAnnounce("Bank robbing system",player,3,"Sistemul de jefuit banca"); 
			player.SetCameraPos(Vector(-928.553, -349.74, 17.8038),Vector(-933.927, -351.119, 17.8038));
			NAnnounce("Enter the lift to the valut there.",player,0,"Intra in lift aici");
			break;
		}
		case 18:
		{
			player.Pos = Vector(-939.156, -343.754, 600);
			player.SetCameraPos(Vector(-939.156, -343.754, 7.22693),Vector(-941.448, -343.509, 7.22693));
			NAnnounce("Break the valut there. You will need a bomb.",player,0,"Sparge seiful aici. O sa ai nevoie de o bomba.");
			break;
		}
		case 19:
		{
			player.Pos = Vector(-673.667, 1207.25, 600);
			player.SetCameraPos(Vector(-673.667, 1207.25, 11.1081),Vector(-677.746, 1204.59, 11.1091));
			NAnnounce("Buy a bomb here to break the vault.",player,0,"Cumpara aici o bomba pentru a sparge seiful.");
			break;
		}
		case 20:
		{
			player.Pos = Vector(-687.542, -1267.7, 600);
			NAnnounce("Boat robbing system",player,3,"Sistemul de jefuit barca");
			player.SetCameraPos(Vector(-687.542, -1267.7, 16.3482),Vector(-689.213, -1260.83, 16.3466));
			NAnnounce("Just pickup the briefcase.",player,0,"Doar ia servieta.");
			break;
		}
		case 21:
		{
			player.Pos = Vector(-687.542, -1267.7, 600);
			player.SetCameraPos(Vector(-687.542, -1267.7, 16.3482),Vector(-689.213, -1260.83, 16.3466));
			NAnnounce("By robbing the boat you won't get only money, but some free weapons too.",player,0,"Prin jefuirea barcii nu obtii doar bani, ci si arme.");
			break;
		}		
		case 22:
		{
			player.Pos = Vector(-865.26, -681.725, 600);
			player.SetCameraPos(Vector(-865.26, -681.725, 11.2571),Vector(-870.537, -683.512, 11.2359));
			NAnnounce("Police job",player,3,"Jobul de politist."); 
			NAnnounce("Police job: Arrest/kill wanted players.",player,0,"Jobul de politist: Aresteaza / Ucide jucatori cautati.");
			break;
		}		
		case 23:
		{
			player.Pos = Vector(-865.26, -681.725, 600);
			player.SetCameraPos(Vector(-865.26, -681.725, 11.2571),Vector(-870.537, -683.512, 11.2359));
			NAnnounce("Get a list with wanted players by using : /wanted",player,0,"Obtine o lista cu jucatorii cautati cu : /wanted");
			break;
		}
		case 24:
		{
			player.Pos = Vector(-882.118, -475.306, 600);
			player.SetCameraPos(Vector(-882.118, -475.306, 12.9649),Vector(-884.863, -482.691, 13.1105));
			NAnnounce("Medic job",player,3,"Jobul de doctor."); 
			NAnnounce("Heal players by using your medkit.",player,0,"Vindeca jucatori cu medkitul tau.");
			break;
		}		
		case 25:
		{
			player.Pos = Vector(-882.118, -475.306, 600);
			player.SetCameraPos(Vector(-882.118, -475.306, 12.9649),Vector(-884.863, -482.691, 13.1105));
			NAnnounce("To use the medkit press [E] near the wounded player.",player,0,"Ca sa folosesti medkit-ul, apasa [E] in apropierea jucatorului ranit.");
			break;
		}
		case 26:
		{
			player.Pos = Vector(-698.95, 840.396, 600);
			player.SetCameraPos(Vector(-698.95, 840.396, 11.0846),Vector(-699.526, 836.937, 11.0846));
			NAnnounce("Firefighter job",player,3,"Jobul de pompier."); 
			NAnnounce("Stop fires with your firetruck.",player,0,"Opreste incendii cu camionul tau.");
			break;
		}
		case 27:
		{
			player.Pos = Vector(-698.95, 840.396, 600);
			player.SetCameraPos(Vector(-698.95, 840.396, 11.0846),Vector(-699.526, 836.937, 11.0846));
			NAnnounce("To stop a fire, press [E] near the fire in your firetruck.",player,0,"Pentru a oprii focul apropiete de el si apasa [E] in camionul tau de pompieri.");
			break;
		}
		case 28:
		{
			player.Pos = Vector(-572.062, 793.497, 600);
			player.SetCameraPos(Vector(-572.062, 793.497, 22.8768),Vector(-565.658, 793.071, 22.8768));
			NAnnounce("Investigator job",player,3,"Jobul de investigator."); 
			NAnnounce("Investigate murders around the city.",player,0,"Investigheaza crimele din oras.");
			break;
		}
		case 29:
		{
			player.Pos = Vector(-572.062, 793.497, 600);
			player.SetCameraPos(Vector(-572.062, 793.497, 22.8768),Vector(-565.658, 793.071, 22.8768));
			NAnnounce("Murders are marked with a skull pickup.",player,0,"Crimele sunt marcate cu un pickup cu craniu pe el.");
			break;
		}
		case 30:
		{
			player.Pos = Vector(-572.062, 793.497, 600);
			player.SetCameraPos(Vector(-572.062, 793.497, 22.8768),Vector(-565.658, 793.071, 22.8768));
			NAnnounce("To investigate a murder, collect the skull pickups.",player,0,"Ca sa investighezi o crima, colecteaza pickup-urile cu craniu.");
			break;
		}
		case 31:
		{
			player.Pos = Vector(63.1076, 1095, 600);
			player.SetCameraPos(Vector(68.2016, 1095.73, 18.7597),Vector(63.1076, 1095, 18.7597));
			NAnnounce("Terrorist job",player,3,"Jobul de terorist."); 
			NAnnounce("Kill everyone you can.",player,0,"Ca terorist, omoara pe oricine poti.");
			break;
		}
		case 32:
		{
			player.Pos = Vector(63.1076, 1095, 600);
			player.SetCameraPos(Vector(68.2016, 1095.73, 18.7597),Vector(63.1076, 1095, 18.7597));
			NAnnounce("You will be given free weapons!",player,0,"O sa ai si arme gratis in schimb.");
			break;
		}
		case 33:
		{
			player.Pos = Vector(17.5837, 1149.5, 600);
			player.SetCameraPos(Vector(17.5837, 1149.5, 23.5272),Vector(63.1076, 1095, 18.7597));
			NAnnounce("Drug dealer job",player,3,"Jobul de traficant de droguri."); 
			NAnnounce("Sell drugs to players.",player,0,"Vinde droguri la jucatori.");
			break;
		}
		case 34:
		{
			player.Pos = Vector(17.5837, 1149.5, 600);
			player.SetCameraPos(Vector(17.5837, 1149.5, 23.5272),Vector(63.1076, 1095, 18.7597));
			NAnnounce("To sell drugs, an player should write /takedrugs near you.",player,0,"Un jucator ar treuii sa scrie /takedrugs in apropierea ta.");
			break;
		}
		case 35:
		{
			player.Pos = Vector(17.5837, 1149.5, 600);
			NAnnounce("Taxi driver job",player,3,"Jobul de taximetrist."); 
			player.SetCameraPos(Vector(-1017.28, 194.345, 11.2562),Vector(-1014.83, 202.982, 11.2577));
			NAnnounce("Drive players around the map with an taxi cab.",player,0,"Conduu jucatorii cu taxiul tau.");
			break;
		}
		case 36:
		{
			player.Pos = Vector(17.5837, 1149.5, 600);
			NAnnounce("Taxi driver job",player,3,"Jobul de taximetrist."); 
			player.SetCameraPos(Vector(-1017.28, 194.345, 11.2562),Vector(-1014.83, 202.982, 11.2577));
			NAnnounce("You can also use an bus.",player,0,"Poti folosii si un bus.");
			break;
		}
		case 37:
		{
			player.Pos = Vector(286.301, -298.573, 600);
			player.SetCameraPos(Vector(287.166, -301.521, 11.9591),Vector(286.301, -298.573, 11.9591));
			NAnnounce("Trucker job",player,3,"Jobul de camionagiu."); 
			NAnnounce("Collect boxes with your truck.",player,0,"Colecteaza cutii din oras cu camionul tau.");
			break;
		}
		case 38:
		{
			player.Pos = Vector(-975.285, -839.239, 600);
			player.SetCameraPos(Vector(-976.594, -832.459, 6.80092),Vector(-975.285, -839.239, 6.80091));
			NAnnounce("This is the kind of boxes you need to collect with your truck.",player,0,"Acestea sunt cutiile care trebuie colectate cu camionul tau.");
			break;
		}
		case 39:
		{
			player.Pos = Vector(-1235.44, 13.7256, 600);
			player.SetCameraPos(Vector(-1230.74, 13.1069, 11.3913),Vector(-1235.44, 13.7256, 11.3956));
			NAnnounce("Dustman job",player,3,"Jobul de gunoier"); 
			NAnnounce("Collect trash with your truck.",player,0,"Colecteaza gunoi din oras cu camionul tau.");
			break;
		}
		case 40:
		{
			player.Pos = Vector(-868.071, -550.116, 600)
			player.SetCameraPos(Vector(-863.331, -546.864, 11.1036),Vector(-868.071, -550.116, 11.0999));
			NAnnounce("This is an trash pickup.",player,0,"Acestea este un pickup de gunoi.");
			break;
		}
		case 41:
		{
			player.Pos = Vector(-379.15, -545.547, 17.283);
			NAnnounce("Tutorial complete.",player,3,"Tutorial complet."); 
			player.Frozen = false;
			player.RestoreCamera();
			break;
		}
		default: break;
	}
}
function TutorialUpdate()
{
	for(local i =0 ; i < 100;i++)
	{
		if(FindPlayer(i) != null)
		{
			if(TUTORIAL_Status[i] != -1)
			{
				TUTORIAL_Status[i] += 1;
				Tutorial(FindPlayer(i));
			}
		}
	}
}
TUTORIAL_TIMER <- NewTimer("TutorialUpdate",5000,0);
function Server_Cleanup()
{
	for(local i = 0; i < 2000;i++) if(FindPickup(i) != null) FindPickup(i).Remove();
	for(local i = 0; i < 3000;i++) if(FindObject(i) != null) FindObject(i).Delete();
	for(local i=0; i < 1000; i++) if(FindCheckpoint(i) != null) FindCheckpoint(i).Remove();
	for(local i=0; i < 128; i++) DestroyMarker(i); 
	Message(RED+"[ANTI-LAG]"+WHITE+"Cleaned server pickups!");
	CreateMap();
	Message(RED+"[ANTI-LAG]"+WHITE+"Reloading map!");
	PropsPicks();
	Message(RED+"[ANTI-LAG]"+WHITE+"Reloading properties pickups!");
	print("Pickups cleaned!");
}
SERVER_CLEANUP_TIMER <- NewTimer("Server_Cleanup",1800000,0);
HitmanTargers <- array(100,-1);
function Hitman(player,target)
{
	if(!CheckpointColors(player,RGB(2,2,2)))
	{
		MSG(JOB_EN+player+" is now a hitman.",JOB_RO+player+" este acum asasin platit.");
		MSGPLR(JOB_EN+"Your job is killing the target:"+target.Name,player,JOB_RO+"Slujba ta e sa ucizi tinta:"+target.Name);
		player.Color = RGB(2,2,2);
		player.GiveWeapon(199,500);
		player.GiveWeapon(29,21);
		HitmanTargers[player.ID] = target.ID;
	}
	else MSGPLR(MSG_ERROR_EN+"You are already a hitman.",player,MSG_ERROR_RO+"Esti deja o asasin platit.")
}
function HelpMessages()
{
	local r = rand() % 20;
	local M = array(2,"");
	switch(r)
	{
		case 0:
		{
			M[0] = "Website: rcnr.tk";
			M[1] = "Site web: rcnr.tk";
			break;
		}
		case 1:
		{
			M[0] = "Forum: http://romaniacopsnrobbers.boards.net/";
			M[1] = "Forum: http://romaniacopsnrobbers.boards.net/";
			break;
		}
		case 2:
		{
			M[0] = "Discord: http://discord.gg/brDD6BT";
			M[1] = "Discord: http://discord.gg/brDD6BT";
			break;
		}
		case 3:
		{
			M[0] = "Rules: /rules";
			M[1] = "Reguli: /rules";
			break;
		}
		case 4:
		{
			M[0] = "Commands: /help";
			M[1] = "Comenzi: /help";
			break;
		}
		case 5:
		{
			M[0] = "Want admin? Make an application in the forum! http://romaniacopsnrobbers.boards.net/";
			M[1] = "Vrei admin? Viziteaza si fa o aplicatie in forum! http://romaniacopsnrobbers.boards.net/";
			break;
		}
		case 6:
		{
			M[0] = "Want free VIP? Make an application in the forum! http://romaniacopsnrobbers.boards.net/";
			M[1] = "Vrei VIP gratis? Fa o aplicatie in forum: http://romaniacopsnrobbers.boards.net/";
			break;
		}
		case 7:
		{
			M[0] = "Founders are: Angelo and Athanatos";
			M[1] = "Fondatorii serverului sunt: Angelo si Athanatos";
			break;
		}
		case 8:
		{
			M[0] = "There are NPCs around the city! Make sure you have a weapon in your inventory.";
			M[1] = "Sunt NPC-uri in oras! Fii sigur sa ai o arma pe la tine.";
			break;
		}
		case 9:
		{
			M[0] = "You want some more speed? Press [X] in your car to use nitro!";
			M[1] = "Vrei niste viteza? Foloseste tasta [X] in masina ca sa folosesti nitro!";
			break;
		}
		case 10:
		{
			M[0] = "Some weapons are exclusive to VIPs!";
			M[1] = "Unele arme sunt excluzive VIPurilor!";
			break;
		}
		case 11:
		{
			M[0] = "Jobs are marked with a square/triangle marker on the map.";
			M[1] = "Joburile sunt marcate cu un marker patrat sau triunghi colorat pe mapa.";
			break;
		}
		case 12:
		{
			M[0] = "Want an other language? Use /lang <en/ro>";
			M[1] = "Vrei alta limba? Foloseste /lang <en/ro>";
			break;
		}
		case 13:
		{
			M[0] = "You want to race? Use /createrace <prize> <id> !";
			M[1] = "Vrei sa faci curse? Foloseste /createrace <premiu> <id> !";
			break;
		}
		case 14:
		{
			M[0] = "There are some events on the server! Ask any Helper, Admin, Co-Founer or Founder to start it.";
			M[1] = "Sunt eventuri pe server! Intreaba orice Helper, Admin, Co-Founder, Foundar sa le inceapa.";
			break;
		}
		case 15:
		{
			M[0] = "You want a new car? Check the Sunsine Autos!";
			M[1] = "Vrei o masina noua? Dute la Sunshine Autos!";
			break;
		}
		case 16:
		{
			M[0] = "You want to paint your car? Check the tunning garage at the ports!";
			M[1] = "Vrei sa iti vopsesti masina? Verifica garajul de tunat la porturi!";
			break;
		}
		case 17:
		{
			M[0] = "Confused about gameplay mechanics? Check /tutorial !";
			M[1] = "Esti confuz legat de mecanicile de gameplay? Verifica /tutorial !";
			break;
		}
		case 18:
		{
			M[0] = "1 XP = 1 Minute played";
			M[1] = "1 XP = 1 Minut jucat";
		}
		case 19:
		{
			M[0] = "XPs are used by admins to determine how much you played.";
			M[1] = "XP-urile sunt folosite de admin sa determine cat de mult ai jucat.";
		}
		default: break;
	}
	Message("\r\n");
	MSG(HELPM_EN+M[0],HELPM_RO+M[1]);
	Message("\r\n");
}
HELPMTIMER <- NewTimer("HelpMessages",30000,0);

function Between(x,y,v)
{
	if((v >= x) && (v <= y)) return true;
	return false;
}