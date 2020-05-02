/*
   ROMANA COPS N ROBBERS
*/

// =========================================== S E R V E R   E V E N T S ==============================================

function onServerStart()
{
	LoadCars();
	print("Masini incarcate.");
	//ActivateEcho();
	Discord_SendMessage(" :white_check_mark: Server starting...");
}

function onServerStop()
{
}
function onScriptLoad()
{
	dofile("scripts/Echo.nut",true);
	dofile("scripts/functions.nut",true);
	print("Se incarca scripturile...");
	try { MSG("Loading scripts...","Se incarca scripturile...") }
	catch(e) { }
	dofile("scripts/npcs.nut",true); 
	dofile("scripts/map.nut");
	StartServer();
	CreateMap();
	dofile("scripts/cmds.nut",true);
	dofile("scripts/props.nut",true);
	PropsPicks();
	NPCUpdate <- NewTimer("NPC_Update",100,0);
	ArrestUpdateT <- NewTimer("ArrestUpdate",1000,0);
	dofile("scripts/car_chase.nut");
	dofile("scripts/races.nut");
	dofile("scripts/GG-event.nut");
	dofile("scripts/derby.nut");
	dofile("scripts/Discord.nut",true);
	BattleRoyaleOn <- false;
	BattleRoyaleTimer <- 0;
	BRT <- NewTimer("BattleRoyaleEvent",1000,0);
	killplrv <- -1;
	killplrj <- -1;
	print("Scripturi incarcate! Se porneste botul IRC si se incarca masinile!");
	try{
	MSG("Scripts loaded!","Scripturi incarcate!")
	}
	catch(e) { } 
	//try
	//{
	//	print(FBS_BOT+"");
	//}
	//catch(e) { ActivateEcho();};
}
function onScriptUnload()
{
}
// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player )
{
	local country = " ";
	try{
	country = geoip_country_name_by_addr(player.IP);
	}
	catch(e) { }
	if(country == null)
	{
		country = "Unknown";
	}
	if(player.IP == "127.0.0.1") country = "Romania";
	local str = "",str2="",str3="";
	for(local i =1; i < 255;i++)
	{
		local s = GetTok(player.Name,"=",i);
		str += ( s ? s : "")
	}
	for(local i =1; i < 255;i++)
	{
		local s = GetTok(str,"[",i);
		str2 += ( s ? s : "")
	}
	for(local i =1; i < 255;i++)
	{
		local s = GetTok(str2,"]",i);
		str3 += ( s ? s : "")
	}
	player.Name = str3;
	local banreason = ReadIniString(BANFILE,BAN,player.UID);
	if(banreason != null)
	{
		MSG(RED+"Player "+player+" is banned. Reason:"+banreason,RED+"Jucatorul "+player+" este interdictat de pe acest server. Motiv:"+banreason);
		player.Kick();
		return;
	}
	else
	{
		if(ReadIniString(IPFILE,IPSTATUS,player.Name) == player.IP)
		{
			WriteIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name,1);
			Stream.StartWrite();
			Stream.WriteInt(1)
			Stream.SendStream(player);
			MSGPLR(GREEN+"You autologged.",player,GREEN+"Te-ai autologat.");
			player.Spawn();
		}
		else 
		{
			WriteIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name,0);
		}
	}
	MSG(GREEN+"Player "+player+" joined the server from "+country+"!",GREEN+"Jucatorul "+player+" a intrat in server din "+country+"!");
	MSGPLR(WHITE+"Welcome to "+RED+"Ro"+YELLOW+"ma"+BLUE+"nia "+WHITE+" Cops N' Robbers",player,WHITE+"Bun venit in "+RED+"Ro"+YELLOW+"ma"+BLUE+"nia "+WHITE+" Cops N' Robbers");
	MSGPLR(WHITE+"Use "+BLUE+"/help "+WHITE+" for commands.",player,WHITE+"Foloseste "+BLUE+"/help "+WHITE+" pentru comenzi");
	MSGPLR(GREEN+"Have fun!",player,GREEN+"Distreaza-te!");
	PlayerLoad(player);
	if(player.Pos.x == 0)
	{
		Announce("Please wait for all files to download!",player,1);
	}
	local xp = ReadIniInteger(XPFILE,XP,player.Name);
	local hunger = ReadIniInteger(HUNGERFILE,HUNGER,player.Name);
	UpdateClientSide(player,xp,hunger);
	TXTAddLine("Logs.txt",player.Name+" connected to the server from "+country);
	JUCATORI[player.ID] = Jucator(player);
}

function onPlayerPart( player, reason )
{
	DropInventory(player);
	SalveazaStatusuri(player)
	PlayerQuit(player);
	if(chaseplayer == player.ID) chaseplayer = -1;
	MEDICARR[player.ID] =0;
	DUST_COLLECTED[player.ID] = 0;
	CARREPAIRS[player.ID] = 0;
	if(CARBUYER == player.ID )
	{
		CARBUYER = -1;
		if(FindVehicle(BCAIRD) != null)
		{
			FindVehicle(BCARID).Remove()
		}
	}
	local reas = "";
	switch(reason)
	{
		case 0 : reas = "[Timeout]"; break;
		case 1 : reas = "[Quit]"; break;
		case 2 : reas = "[Kick/Ban]"; break;
		case 3 : reas = "[Crash]"; break;
		default: reas = "[Unknown]"; break;
	}
	JUCATORI[player.ID] = null;
	MSG(WHITE+"Player "+player+" left the server."+reas,WHITE+"Jucatorul "+player+" a iesit din server."+reas);
}

function onPlayerRequestClass( player, classID, team, skin )
{
	return 1;
}

function onPlayerRequestSpawn( player )
{
	player.Colour = RGB(250,250,250);
	if(ReadIniInteger(LOGINSTATUSFILE,LOGINSTATUS,player.Name) == 1)
	{
		return 1;
	}
	else return MSGPLR(MSG_ERROR_EN+"You need to login.",player,MSG_ERROR_RO+"Trebuie sa te loghezi");
}

function onPlayerSpawn( player )
{
	player.RemoveWeapon(17);
	player.Skin = 15;
	local gang = ReadIniString(GANGMEM2FILE,GANGMEM2,player.Name);
	if(gang != null)
	{
		player.Skin = ReadIniInteger(GANGSKINFILE,GANGSKIN,gang);
		local pos = ReadIniString(GANGSPAWNFILE,GANGSPAWN,gang);
		if(pos != null)
		{
			if(pos != null) player.Pos.x = GetTok(pos,"/",1).tofloat();
			if(pos != null) player.Pos.y = GetTok(pos,"/",2).tofloat();
			if(pos != null) player.Pos.z = GetTok(pos,"/",3).tofloat();
		}
		local weps = ReadIniString(GANGWEPSFILE,GANGWEPS,gang);
		if(weps != null)
		{
			if(GetTok(weps,"/",1) != null) player.GiveWeapon(GetTok(weps,"/",1).tointeger(),100);
			if(GetTok(weps,"/",2) != null) player.GiveWeapon(GetTok(weps,"/",2).tointeger(),100);
			if(GetTok(weps,"/",3) != null) player.GiveWeapon(GetTok(weps,"/",3).tointeger(),100);
		}
		MSGPLR(GANG+"Member of "+gang,player,GANG+"Membru al "+gang);
	}
	local skin= ReadIniInteger(SKINFILE,SKIN,player.Name)
	player.World = 1;
	player.SetDrunkLevel(0,0);
	SpawnPoint(player);
	LoadJob(player);
	if(skin != 0) player.Skin = skin;
	local xp = ReadIniInteger(XPFILE,XP,player.Name);
	local hunger = ReadIniInteger(HUNGERFILE,HUNGER,player.Name);
	
	local vip4 = ReadIniInteger(VIPEMERALD,VIP,player.Name);
	local vip3 = ReadIniInteger(VIPGOLD,VIP,player.Name);
	local vip2 = ReadIniInteger(VIPSILVER,VIP,player.Name);
	local vip1 = ReadIniInteger(VIPBRONZE,VIP,player.Name);
	
	if(vip4 > 0)
	{
		//+ x4 XP
		player.GiveWeapon(15,99999);
		player.GiveWeapon(103,99999);
		player.GiveWeapon(108,99999);
		player.GiveWeapon(107,999999);
		player.GiveWeapon(105,99999);
		player.GiveWeapon(20,99999);
		player.GiveWeapon(33,99999);
		player.Health =255;
		player.Armour =255;
	}
	else if(vip3 > 0)
	{
		//+ Triple XP
		player.GiveWeapon(15,11);
		player.GiveWeapon(103,77);
		player.GiveWeapon(108,495);
		player.GiveWeapon(107,330);
		player.GiveWeapon(105,110);
		player.GiveWeapon(20,77);
		player.GiveWeapon(33,500);
		player.Armour = 200;
	}
	else if(vip2 > 0)
	{
		//+Double XP
		player.GiveWeapon(33,500);
		player.GiveWeapon(26,330);
		player.Armour = 100;
	}
	else if(vip1 > 0)
	{
		//+ Avalibility to vip feautures
		player.GiveWeapon(33,500);
	}
	UpdateClientSide(player,xp,hunger);
	GG_Respawn(player);
}

function onPlayerDeath( player, reason )
{
	if(chaseplayer == player.ID) chaseplayer = -1;
	SalveazaStatusuri(player);
	UpdateClientSide(player,-1,-1);
	local reas = "";
	switch(reason)
	{
		case 44: reas += "[fell/ cazatura]" ; break;
		case 41: reas += "[explosion/explozie]"; break;
		case 43: reas += "[drowned/inecat]"; break;
		case 39: reas += "[car accident/accident de masina]"; break;
		case 70: reas += "[suicide/suicid]"; break;
		case 14: reas += "[suffocated/sufocare]"; break;
		case 31: reas += "[fire/foc]"; break;
		default: Message(reason+""); break;
	}
	MSG(RED+player+" died."+reas,RED+player+" a murit."+WHITE+reas);
	DropInventory(player);
	GG_Update(player,"died");
	TXTAddLine("Logs.txt",player+" died."+reas);
}

function onPlayerKill( player, killer, reason, bodypart )
{
	if(killplrv == killer.ID)
	{
		player.Cash += 1000000;
		MessagePlayer(GREEN+"$ + 1 000 000",player);
		MSG(RED+"[KILL-A-PLAYER-EVENT]"+WHITE+player+" won",RED+"[KILL-A-PLAYER-EVENT]"+WHITE+player+" a castigat");
		killplrv = -1;
	}
	if(killplrj == killer.ID)
	{
		player.Cash += 10000000;
		MessagePlayer(GREEN+"$ + 10 000 000",player);
		MSG(RED+"[KILL-A-JUGGERNAUT-EVENT]"+WHITE+player+" won",RED+"[KILL-A-JUGGERNAUT-EVENT]"+WHITE+player+" a castigat");
		killplrj = -1;
		player.Skin = 230;
		player.Armour = 255;
		jugg[player.ID] = 6000;
		player.Immunity = 64;
		player.GiveWeapon(WEP_M60,1100);
		player.GiveWeapon(18,66);
		player.GiveWeapon(WEP_GRENADE,4);
	}
	SalveazaStatusuri(player);
	SalveazaStatusuri(killer);
	DropInventory(killer);
	MSG(WHITE+player+" killed "+killer+" with "+GetWep(reason),WHITE+player+" l-a omorat pe "+killer+" cu "+GetWep(reason));
	if(CheckpointColors(killer,COPCOLOR))
	{
		MSG(RED+player+" killed a cop.",RED+player+" a omorat un politist.");
		player.WantedLevel += 6;
	}
	if(CheckpointColors(player,COPCOLOR))
	{
		local reward = killer.WantedLevel * 1000
		player.Cash += reward;
		MessagePlayer(GREEN+"$ +"+reward,player);
		killer.WantedLevel = 0;
	}
	if(chaseplayer == player.ID) chaseplayer = -1;
	if(CheckpointColors(player,TERRORISTCOLOR) == true)
	{
		player.Cash += 5000;
		MessagePlayer(GREEN+"$ +5000",player);
		if(CheckpointColors(killer,COPCOLOR) == true)
		{
			player.Cash += 25000;
			MessagePlayer(GREEN+"BONUS: $ +25000",player);
		}
	}
	if(CheckpointColors(player,BGC))
	{
		local protected_nibba = ReadIniString(BOSSFILE,BOSS,player.Name);
		local boss = FindPlayer(protected_nibba);
		if(boss != null)
		{
			if(DistanceFromPoint(player.Pos.x,player.Pos.y,boss.Pos.x,boss.Pos.y) < 100)
			{
				if(CheckpointColors(killer,BGC))
				{
					return;
				}
				if(killer.ID == boss.ID)
				{
					player.Colour = RGB(250,250,250);
					MSGPLR(RED+"You killed your boss!",player,RED+"Ti-ai omorat seful!");
					RemoveIniValue(BOSSFILE,BOSS,player.Name);
					return;
				}
				player.Cash += 10000;
				MessagePlayer(GREEN+"$ + 10000",player);
				MSGPLR(GREEN+"You protected "+protected_nibba,player,GREEN+"L-ai aparat pe "+protected_nibba);
			}
			else MSGPLR(YELLOW+"You were too far from "+protected_nibba,player,YELLOW+"Erai prea departe de "+protected_nibba);
		}
	}
	if(CheckpointColors(killer,BGC))
	{
		local protected_nibba = ReadIniString(BOSSFILE,BOSS,player.Name);
		MSGPLR(RED+"An bodyguard died!",FindPlayer(protected_nibba),RED+"A murit un bodyguard!");
	}
	if(CheckpointColors(player,BTRANPORTD))
	{
		if(killer.ID == BANKROBBER)
		{
			player.Cash += 10000;
			MSG(GREEN+"Bank robber "+killer+" was killed.",GREEN+"Jefuitorul de banci "+killer+" a fost ucis.");
			BANKROBBER = -1;
		}
	}
	if(CheckpointColors(player,RGB(2,2,2)))
	{
		player.Cash += 1000000;
		HitmanTargers[player.ID] = -1;
		player.Colour = RGB(250,250,250);
		MessagePlayer(GREEN+" $ + 1000000",player);
		MSG(RED+"Target "+killer+" was killed by "+player,RED+"Tinta "+killer+" a fost omorata de "+player);
	}
	local killpickup = CreatePickup(383,0,1,killer.Pos,255,true);
	KILLS_PICKUP_DATA[killpickup.ID] = player.Name;
	UpdateClientSide(player,-1,-1);
	UpdateClientSide(killer,-1,-1);
	if(reason == 11) GG_Update(killer,"died")
	GG_Update(player,"killer")
	Discord_SendMessage(killer+" was killed by "+player+" using \":"+DiscordWeaponEmoji(GetWep(reason))+":\"");
}

function onPlayerTeamKill( player, killer, reason, bodypart )
{
	onPlayerKill(player,killer,reason,bodypart);
}

function onPlayerChat( player, text )
{
	QuizAnswer(text,player);
	if(MUTED_ARR[player.ID] == true)
	{
		MSGPLR(RED+"You are muted",player,RED+"Esti amutit");
		return 0;
	}
	print( player.Name + ": " + text );
	
	local vip1 = ReadIniInteger(VIPBRONZE,VIP,player.Name) , vip = "";
	if(vip1 > 0) vip += "[#cd7f32][VIP Bronze]"+WHITE;
	
	local vip2 = ReadIniInteger(VIPSILVER,VIP,player.Name);
	if(vip2 > 0) vip += "[#c0c0c0][VIP Silver]"+WHITE;
	
	local vip3 = ReadIniInteger(VIPGOLD,VIP,player.Name);
	if(vip3 > 0) vip += "[#fd7000][VIP Gold]"+WHITE;
	
	local vip4 = ReadIniInteger(VIPEMERALD,VIP,player.Name);
	if(vip4 > 0) vip += "[#00590b][VIP Emerald]"+WHITE;
	
	local lvl = GetAdminLevel(player);
	local role= "",rolea = ReadIniString(ROLEFILE,ROLE,player.Name);
	if(rolea != null) role = "[#aaaaaa]["+rolea+"]"+WHITE;
	
	Message(vip+role+GetAdminName(lvl)+PlrColToStrHex(player)+player.Name+WHITE+" : "+text);
	
	TXTAddLine("Logs.txt",player+" : "+text);
	SalveazaStatusuri(player);
	return 0;
}

function onPlayerPM( player, playerTo, message )
{
	return 1;
}

function onPlayerBeginTyping( player )
{
}

function onPlayerEndTyping( player )
{
}


function onNameChangeable( player )
{
}

function onPlayerSpectate( player, target )
{
}

function onPlayerCrashDump( player, crash )
{
}

function onPlayerMove( player, lastX, lastY, lastZ, newX, newY, newZ )
{
}

function onPlayerHealthChange( player, lastHP, newHP )
{
	Stream.StartWrite();
	Stream.WriteInt(11)
	Stream.WriteString(newHP+"");
	Stream.SendStream(player);
}

function onPlayerArmourChange( player, lastArmour, newArmour )
{
	if(player.Skin == 230)
	{
		if(jugg[player.ID] >= 0)
		{
			jugg[player.ID] -= abs(lastArmour - newArmour); //DeltaHP
			player.Armour = 255;
		}
		else
		{
			MSG(WHITE+player+"'s "+RED+"Juggernaut"+WHITE+" armour is destroyed.",WHITE+"Armura de tip "+RED+" Juggernaut "+WHITE+" a lui "+player+" e distrusa.");
			player.Skin = ReadIniInteger(SKINFILE,SKIN,player.Name);
			player.Armour = 0;
			player.Health = 100
		}
	}
	Stream.StartWrite();
	Stream.WriteInt(12)
	Stream.WriteString(newArmour+"");
	Stream.SendStream(player);
}

function onPlayerWeaponChange( player, oldWep, newWep )
{
	local wep = player.Weapon;
	if((wep == 114) || (wep == 110))
	{
		Stream.StartWrite();
		Stream.WriteInt(20);
		Stream.SendStream(player);
	}
	else
	{
		Stream.StartWrite();
		Stream.WriteInt(21);
		Stream.SendStream(player);
	}
	local boole = true;
	if(newWep == 115)
	{
		boole = false;
	}
	else if(newWep == 108)
	{
		boole = false;
	}
	else if(newWep == 116)
	{
		boole = false;
	}
		else if(newWep == 120)
	{
		boole = false;
	}
	else if(newWep == 119)
	{
		boole = false;
	}
	if((!boole) && (player.HasMarker == true)) MSGPLR(WHITE+"You are hidden from the radar!",player,WHITE+"Esti ascuns din radar!")
	if(player.HasMarker == false)
	{
		MSGPLR(WHITE+"You are not hidden from the radar anymore!",player,WHITE+"Numai esti ascuns din radar!")
	}
	player.HasMarker = boole;
}

function onPlayerAwayChange( player, status )
{
}

function onPlayerNameChange( player, oldName, newName )
{
}

function onPlayerActionChange( player, oldAction, newAction )
{
}

function onPlayerStateChange( player, oldState, newState )
{
}

function onPlayerOnFireChange( player, IsOnFireNow )
{
}

function onPlayerCrouchChange( player, IsCrouchingNow )
{
}

function onPlayerGameKeysChange( player, oldKeys, newKeys )
{
}

// ========================================== V E H I C L E   E V E N T S =============================================

function onPlayerEnteringVehicle( player, vehicle, door )
{
	return 1;
}

function onPlayerEnterVehicle( player, vehicle, door )
{
	UpdateClientSide(player,-1,-1);
	local owner = ReadIniString(CAROWNERFILE,CAROWNER,vehicle.ID+"");
	MessagePlayer(WHITE+"ID:"+vehicle.ID+" Owner:"+owner,player);
	if((CheckpointColors(player,FIRECOLOR) == true) && (vehicle.Model == VEH_FIRETRUCK))
	{
		MSGPLR(WHITE+"You can stop fires using [E]",player,WHITE+"Poti sa opresti incendii folosind [E]");
	}
	if((CheckpointColors(player,DUSTMANC) == true) && (vehicle.Model == VEH_TRASHMASTER))
	{
		MSGPLR(WHITE+"You can collect trash and bring it to the Srap yard",player,WHITE+"Poti sa colectezi gunoi si sa il duci la groapa de gunoi!");
	}
	if((CheckpointColors(player,TRUCKERCOLOR) == true) && (vehicle.Model == VEH_SPANDEXPRESS))
	{
		MSGPLR(WHITE+"You can collect boxes around the city!",player,WHITE+"Poti sa colectezi cutii de prin oras!");
	}
	if((CheckpointColors(player,BTRANPORTD) == true) && (vehicle.Model == VEH_SECURICAR))
	{
		MSGPLR(WHITE+"Now you can transport the money!",player,WHITE+"Poti sa transporti banii");
		MSGPLR(WHITE+"Go to the purple marker on the right side of the bank",player,WHITE+"Dute la markerul purpuriu din partea dreapta a bancii");
	}
	if(vehicle.ID == BNKT_V)
	{
		if(CheckpointColors(player,BTRANPORTD) == false)
		{
			player.Cash += BNKT_C;
			MessagePlayer(GREEN+"$ +"+BNKT_C,player);
			BNKT_C = 0;
			BNKT_V = -1;
			DestroyMarker(BNKT_M);
			FindCheckpoint(BNKT_CH).Remove();
			MSG(BANKTRANSPORT_EN+RED+"Bank transport failed!",BANKTRANSPORT_RO+RED+"Transportul de bani a esuat!");
		}
	}
	if((vehicle.Model == VEH_TAXI) || (vehicle.Model == VEH_KAUFMAN) || ( vehicle.Model == VEH_BUS))
	{
		if(door == 0)
		{
			if(CheckpointColors(player,TAXIC)) MSG(PINK+"[TAXI]"+WHITE+player+" can transport you! Use /request taxi!",PINK+"[TAXI]"+WHITE+player+" poate sa te transporte! Foloseste /request taxi!");
		}
		else
		{
			if(vehicle.Driver != null)
				if(CheckpointColors(vehicle.Driver,TAXIC))
					MSGPLR(WHITE+"You pay the money when you exit the vehicle",player,WHITE+"Platesti banii cand iesi din masina");
		}
	}
}

function onPlayerExitVehicle( player, vehicle )
{
	UpdateClientSide(player,-1,-1);
	if(chaseplayer == player.ID) 
	{
		chaseplayer = -1;
		Stream.StartWrite();
		Stream.WriteInt(9);
		Stream.SendStream(player);
		MSG(CHASE_EN+player+" is running.",CHASE_RO+player+" fuge pe jos.");
	}
	if(chaseplayer != -1)
	{
		if(IsCopCar(vehicle))
		{
			local plr = FindPlayer(chaseplayer);
			Stream.StartWrite();
			Stream.WriteInt(8);
			Stream.WriteString("0 -1 1");
			Stream.SendStream(plr);
		}
	}
	if(vehicle.Driver != null)
	{
		if((vehicle.Model == VEH_TAXI) || (vehicle.Model == VEH_KAUFMAN) || ( vehicle.Model == VEH_BUS))
		{
			if(CheckpointColors(vehicle.Driver,TAXIC))
			{
				if(player != vehicle.Driver)
				{
					player.Cash -= 2500;
					vehicle.Driver.Cash += 5000;
					MessagePlayer(GREEN+"$ +5000",vehicle.Driver);
					MessagePlayer(RED+"$ -2500",player);
					UpdateClientSide(player,-1,-1);
					UpdateClientSide(vehicle.Driver,-1,-1);
				}
			}
		}
	}
}

function onVehicleExplode( vehicle )
{
	if(chaseplayer != -1)
	{
		if(IsCopCar(vehicle))
		{
			local plr = FindPlayer(chaseplayer);
			Stream.StartWrite();
			Stream.WriteInt(8);
			Stream.WriteString("0 -1 1");
			Stream.SendStream(plr);
		}
	}
	if(vehicle.ID == BNKT_V)
	{
		MSG(BANKTRANSPORT_EN+"The cash were burnt",BANKTRANSPORT_RO+"Banii au ars.");
		BNKT_C = 0;
		BNKT_V = -1;
		FindCheckpoint(BNKT_CH).Remove();
		DestroyMarker(BNKT_M);
	}
}

function onVehicleRespawn( vehicle )
{
	vehicle.Colour1 = 1;
	vehicle.Colour1 = ReadIniInteger(C1FILE,C1,vehicle.ID+"");
	vehicle.Colour2 = ReadIniInteger(C2FILE,C2,vehicle.ID+"");
	local i = vehicle.ID;
	local pos = ReadIniString(CARPOSFILE,CARPOS,i+"");
	local rot = ReadIniString(CARROTFILE,CARROT,i+"");
	local world = 1;
		
	local px = GetTok(pos," ",1).tofloat()
	local py = GetTok(pos," ",2).tofloat()
	local pz = GetTok(pos," ",3).tofloat()
		
	local rx = GetTok(rot," ",1).tofloat()
	local ry = GetTok(rot," ",2).tofloat()
	local rz = GetTok(rot," ",3).tofloat()
	local rw = GetTok(rot," ",4).tofloat()
	if(px == py == pz == 0) world = 2;
	vehicle.Pos = Vector(px,py,pz);
	vehicle.Rotation = Quaternion(rx,ry,rz,rw);
	if(DistanceFromPoint(px,py,-1036.81, -850.937) <= 20)
	{
		world = 10
	}
	vehicle.World = world;
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

function onVehicleHealthChange( vehicle, oldHP, newHP )
{
}

function onVehicleMove( vehicle, lastX, lastY, lastZ, newX, newY, newZ )
{
}

// =========================================== P I C K U P   E V E N T S ==============================================

function onPickupClaimPicked( player, pickup )
{
	return 1;
}

function onPickupPickedUp( player, pickup )
{
	if(pickup.Model == 408)
	{
		if(pickup.World == 200)
		{
			local p = JUCATORI[player.ID].LastRobbedHouse;
			MSG(ROBBERY_EN+player+" robbed "+PropName(p.x,p.y,p.z),ROBBERY_RO+player+" a jefuit "+PropName(p.x,p.y,p.z));
			TXTAddLine("Logs.txt",player+" robbed "+PropName(p.x,p.y,p.z));
			local reward = 20000 + rand() % 50000;
			player.Cash += reward;
			player.WantedLevel += 10;
			MessagePlayer(GREEN+"$ +"+reward,player);
			pickup.RespawnTime = 120000;
		}
		else
		{
			MSG(ROBBERY_EN+player+" robbed a place in "+GetMapName(player.Pos.x,player.Pos.y),ROBBERY_RO+player+" a jefuit un loc din "+GetMapName(player.Pos.x,player.Pos.y));
			TXTAddLine("Logs.txt",player+" robbed a place in "+GetMapName(player.Pos.x,player.Pos.y));
			local reward = rand() % 5500;
			player.Cash += reward;
			player.WantedLevel += 1;
			MessagePlayer(GREEN+"$ +"+reward,player);
			pickup.RespawnTime = 30000;
			if(CheckpointColors(player,COPCOLOR) == true)
			{
				player.Colour = RGB(250,250,250);
				player.WantedLevel += 6;
				MSG(RED+player+" is an corrupt police officer.",RED+player+" este un politist corupt.");
			}
		}
	}
	if(pickup.Model == 407)
	{
		local prop = PropName(pickup.Pos.x,pickup.Pos.y,pickup.Pos.z);
		local price = PropPrice(prop);
		local owner = PropOwner(prop);
		MSGPLR(PROP_ENRO+"Prop name:"+prop+" Price:"+price+" Owner:"+owner,player,PROP_ENRO+"Numele propietatii:"+prop+" Pret:"+price+" Owner:"+owner)
		NAnnounce("Prop name:"+prop+" Price:"+price+" Owner:"+owner,player,0,"Numele propietatii:"+prop+" Pret:"+price+" Owner:"+owner)
		if(owner == player.Name) NAnnounce("~o~[H]~h~ to enter.",player,1,"~o~[H]~h~ ca sa intri.");
		else NAnnounce("~o~/robh <Name>~h~ to rob.",player,1,"~o~/robh <Name>~h~ ca sa jefuiesti.");
	}
	if(pickup.Model == 335)
	{
		MSG(ROBBERY_EN+player+" robbed a boat in "+GetMapName(player.Pos.x,player.Pos.y),ROBBERY_RO+player+" a jefuit o barca din "+GetMapName(player.Pos.x,player.Pos.y));
		TXTAddLine("Logs.txt",player+" robbed a boat in "+GetMapName(player.Pos.x,player.Pos.y));
		local reward = 20000 + rand() % 20000;
		player.Cash += reward;
		player.WantedLevel += 10;
		MessagePlayer(GREEN+"$ +"+reward,player);
		pickup.RespawnTime = 120000;
		local wep1 = rand() % 34;
		if(wep1 == 16) wep1 = 33;
		player.GiveWeapon(wep1,rand() % 1000);
		local wep2 = rand() % 34;
		if(wep2 == 16) wep1 = 33;
		player.GiveWeapon(wep2,rand() % 1000);
		if(CheckpointColors(player,COPCOLOR) == true){
			player.Colour = RGB(250,250,250);
			player.WantedLevel += 18;
			MSG(RED+player+" is an corrupt police officer.",RED+player+" este un politist corupt.");
		}
	}
	if(pickup.Model == 349)
	{
		if(CheckpointColors(player,TRUCKERCOLOR) == true)
		{
			if(player.Vehicle != null)
			{
				if(player.Vehicle.Model == VEH_SPANDEXPRESS)
				{
				local reward = 5000 + rand () % 3000;
				MessagePlayer(GREEN+"$ +"+reward,player);
				player.Cash += reward;
				pickup.RespawnTime = 30000;
				}
			}
		}
	}
	if(pickup.Model == 399)
	{
		if(CheckpointColors(player,DUSTMANC))
		{
			DUST_COLLECTED[player.ID] += 1;
			pickup.RespawnTime = 30000;
			if(player.Vehicle != null)
			{
				if(player.Vehicle.Model == VEH_TRASHMASTER)
				{
					DUST_COLLECTED[player.ID] += 2;
				}
			}
		}
	}
	if(pickup.Model == 383)
	{
		if(CheckpointColors(player,INVESTIGATORC))
		{
			if(FindPlayer(KILLS_PICKUP_DATA[pickup.ID]) != null)
			{
				FindPlayer(KILLS_PICKUP_DATA[pickup.ID]).WantedLevel += 1;
			}
			else
			{
				local wanted = ReadIniInteger(WANTEDFILE,WANTED,KILLS_PICKUP_DATA[pickup.ID]);
				wanted++;
				WriteIniInteger(WANTEDFILE,WANTED,KILLS_PICKUP_DATA[pickup.ID],wanted);
			}
			MSG(RED+KILLS_PICKUP_DATA[pickup.ID]+" is now found guilty for a murder.",RED+KILLS_PICKUP_DATA[pickup.ID]+" este vinovat pentru o crima.");
			pickup.Remove();
			local reward = 5000+ rand() % 5000;
			player.Cash += reward;
			MessagePlayer(GREEN+"$ +"+reward,player);
		}
	}
	WeaponPickup(player,pickup)
	if(pickup.Model == 405)
	{
		local prize = rand() % 18;
		local name = "";
		if(prize == 0) prize = 1;
		switch(prize)
		{
			case 1:
			{
				player.GiveWeapon(33,500);
				name = "Minigun";
				break;
			}
			case 2:
			{
				player.GiveWeapon(105,100);
				name = "AWP";
				break;
			}
			case 3:
			{
				player.Skin = 230;
				player.Armour = 255;
				jugg[player.ID] = 6000;
				player.Immunity = 64;
				player.GiveWeapon(WEP_M60,1100);
				player.GiveWeapon(18,66);
				player.GiveWeapon(WEP_GRENADE,4);
				name = "Juggernaut Armour"
				break;
			}
			case 4:
			{
				player.Cash += 1000000;
				name = "1 000 000 $";
				break;
			}
			case 5:
			{
				player.Armour = 100;
				name = "Armour";
				break;
			}
			case 6:
			{
				local vip = ReadIniInteger(VIPGOLD,VIP,player.Name);
				vip += 10;
				WriteIniInteger(VIPGOLD,VIP,player.Name,vip);
				name = "VIP +10 Mins";
				break;
			}
			case 7:
			{
				player.Health = 0;
				name = "Death";
				MessagePlayer(RED+"Surprize motherfucker xD",player);
				break;
			}
			case 8:
			{
				player.Immunity = -1;
				name = "Immunity except some weapons";
				break;
			}
			case 9:
			{
				player.GiveWeapon(17,500)
				name = "Colt 45"
				break;
			}
			case 10:
			{
				player.GiveWeapon(26,500);
				name = "M4";
				break;
			}
			case 11:
			{
				name = "Despacito 6.9"
				break;
			}
			case 12:
			{
				name = "Maximum wanted level"
				player.WantedLevel = 255;
				break;
			}
			case 13:
			{
				name = "Maximum armour";
				player.Armour = 255;
				break;
			}
			case 14:
			{
				name = "Maximum health";
				player.Health = 255;
				break;
			}
			case 15:
			{
				name = "1 Smoke grenade";
				player.GiveWeapon(14,1);
				break;
			}
			case 16:
			{
				name = "No wanted level";
				player.WantedLevel = 0;
				break;
			}
			case 17:
			{
				name = "RPG"
				player.GiveWeapon(30,25);
				break;
			}
			default:
			{
				break;
			}
		}
		MSG(GREEN+"Event box was taken by "+player+" prize:"+WHITE+name,GREEN+"Un event box a fost luat de "+player+" premiu: "+WHITE+name);
		pickup.Remove();
	}
	if(pickup.Model == 380)
	{
		if(player.Weapon == 16)
		{
			pickup.RespawnTime = 45000;
			player.GiveWeapon(16,-1);
			BANKROBBER = player.ID;
			BANKTIMERBOMB = 5;
			Announce("~o~You have 5 seconds to run! | Ai 5 secunde sa fugi!",player,1);
		}
		else MSGPLR(MSG_ERROR_EN+"You need a bomb.",player,MSG_ERROR_RO+"Ai nevoie de bomba.");
		if(CheckpointColors(player,COPCOLOR) == true){
			player.Colour = RGB(250,250,250);
			player.WantedLevel += 18;
			MSG(RED+player+" is an corrupt police officer.",RED+player+" este un politist corupt.");
		}
	}
	UpdateClientSide(player,-1,-1);
}

function onPickupRespawn( pickup )
{
}

// ========================================== O B J E C T   E V E N T S ==============================================

function onObjectShot( object, player, weapon )
{
	local npc = FindNPC(object.ID);
	if(npc != -1)
	{
		NPC_ARRAY[npc].Damage(player.Weapon,player);
	}
}

function onObjectBump( object, player )
{

}

// =========================================== B I N D   E V E N T S ==============================================

function onKeyDown( player, key )
{
}

function onKeyUp( player, key )
{
}

function CheckpointColors(checkpoint,Colour)
{
	if(checkpoint.Color.r == Colour.r)
	{
		if(checkpoint.Color.g == Colour.g)
		{
			if(checkpoint.Color.b == Colour.b) return true;
			else return false;
		}
		else return false;
	}
	else return false;
}

function onCheckpointEntered( player, checkpoint )
{
	local prison1 = RGB(255,255,100);
	local prison2 = RGB(255,255,99);
	local carshop = RGB(0,0,254);
	if(CheckpointColors(checkpoint,prison1) == true)
	{
		player.Pos = Vector(554.169, 1432.77, 9.51496);
	}
	if(CheckpointColors(checkpoint,prison2) == true)
	{
		player.Pos = Vector(547.521, 1435.46, 9.57808);
	}
	if(CheckpointColors(checkpoint,carshop) == true)
	{
		if(CARBUYER == -1)
		{
			CARINDEX = 130;
			CARBUYER = player.ID;
			CARINDEX = ValidateIndex(CARINDEX,1)
			BCARID = CreateVehicle(CARINDEX,0,Vector(-1023.18, -864.025, 18.0625),player.Angle,1,1).ID;
			player.IsFrozen = true;
			player.Pos = Vector(-1037.14, -850.435, 17.5728);
			player.SetCameraPos(Vector(-1008.84, -861.698, 17.9541),Vector(-1023.18, -864.025, 18.0625));
			Stream.StartWrite();
			Stream.WriteInt(5);
			Stream.SendStream(player);
			MSG(CAR_RO+player+" is now buying a car.",CAR_EN+player+" cumpara acum o masina");
		}
		else MSGPLR(RED+"Someone is already buying a car.",player,RED+"Cineva deja cumpara o masina.");
	}
	if(CheckpointColors(checkpoint,COPCOLOR) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("cop");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,MEDICCOLOR) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("medic");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,FIRECOLOR) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("firefighter");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,TERRORISTCOLOR) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("terrorist");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,BTRANPORTD) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("bank guard");
		Stream.SendStream(player);
	}
	local BANKT1 = RGB(200,0,255);
	local BANKT2 = RGB(250,0,255);
	if(CheckpointColors(checkpoint,BANKT1))
	{
		if(CheckpointColors(player,BTRANPORTD) == false)
		{
			MSGPLR(MSG_ERROR_EN+"You need to be a bank guard to transport the money!",player,MSG_ERROR_RO+"Trebuie sa fii un paznic de banca ca sa transporti banii");
			return;
		}
		if((GetHour() < 6) && (GetHour() > -1 ) || (GetHour() > 22))
		{
			if(player.Vehicle != null)
			{
				if(player.Vehicle.Model == VEH_SECURICAR)
				{
					if(BNKT_V == -1)
					{
						MSG(BANKTRANSPORT_EN+"There is a bank transport happening right now.",BANKTRANSPORT_RO+"Are loc un transport de bani.");
						BNKT_C = 100000 + rand() % 1000001;
						MSG(BANKTRANSPORT_EN+"Cash:"+BNKT_C,BANKTRANSPORT_RO+"Bani:"+BNKT_C);
						TXTAddLine("Logs.txt","Cash:"+BNKT_C);
						BNKT_V = player.Vehicle.ID;
						BankTransportC();
						player.Vehicle.Fix();
						player.Vehicle.Health = 5000;
						MSGPLR(GREEN+"Your vehicle got 5 times more health.",player,GREEN+"Masina ta are de 5 ori mai multa viata.");
					}
					else MSGPLR(MSG_ERROR_EN+"There is already an transport!",player,MSG_ERROR_RO+"E deja un transport in curs!");
				}
				else MSGPLR(MSG_ERROR_EN+"You need to be in a Securicar!",player,MSG_ERROR_RO+"Trebuie sa fii intro Securicar!");
			}
		}
		else MSGPLR(MSG_ERROR_EN+"Cash can be transported between 23:00 and 5:00",player,MSG_ERROR_RO+"Bani pot fii transportati intre 23:00 si 5:00");
	}
	if(CheckpointColors(checkpoint,BANKT2) == true)
	{
		if(player.Vehicle != null)
		{
			if(player.Vehicle.Model == VEH_SECURICAR)
			{
				if(BNKT_V != -1)
				{
					BNKT_V = -1;
					player.Cash += BNKT_C;
					MessagePlayer(GREEN+"$ +"+BNKT_C,player);
					MSG(BANKTRANSPORT_EN+"The transport finished.",BANKTRANSPORT_RO+"Transportul sa terminat.");
					TXTAddLine("Logs.txt",player+" finished a bank transport.");
					checkpoint.Remove();
					BNKT_C = 0;
					FindCheckpoint(BNKT_CH).Remove();
					DestroyMarker(BNKT_M);
				}
			}
			else MSGPLR(MSG_ERROR_EN+"You need to be in a Securicar!",player,MSG_ERROR_RO+"Trebuie sa fii intro Securicar!");
		}
		else MSGPLR(MSG_ERROR_EN+"You need to be in a Securicar!",player,MSG_ERROR_RO+"Trebuie sa fii intro Securicar!");
	}
	if(CheckpointColors(checkpoint,DUSTMANC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("dustman");
		Stream.SendStream(player);
	}
	local DUSTCOLLECT = RGB(153,53,0);
	if(CheckpointColors(checkpoint,DUSTCOLLECT))
	{
		if(player.Vehicle != null)
		{
			if(player.Vehicle.Model == VEH_TRASHMASTER)
			{
				local reward = DUST_COLLECTED[player.ID] * 1000;
				player.Cash += reward;
				MessagePlayer(GREEN+"$ +"+reward,player);
				DUST_COLLECTED[player.ID] =0;
			}
			else MSGPLR(MSG_ERROR_EN+"You need to be in a Trashmaster",player,MSG_ERROR_RO+"Trebuie sa fii intr-un Trashmaster");
		}
		else MSGPLR(MSG_ERROR_EN+"You need to be in a Trashmaster",player,MSG_ERROR_RO+"Trebuie sa fii intr-un Trashmaster");
	}
	if(CheckpointColors(checkpoint,TAXIC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("taxi driver");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,MECHANICC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("mechanic");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,TRUCKERCOLOR) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("trucker");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,INVESTIGATORC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("investigator");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,DEALERC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("drug dealer");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,CLOTHESC) == true)
	{
		Stream.StartWrite();
		Stream.WriteInt(10);
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,RGB(255,178,0)))
	{
		Stream.StartWrite()
		Stream.WriteInt(14);
		Stream.SendStream(player)
	}
	if(CheckpointColors(checkpoint,RGB(128,255,128)))
	{
		if(player.Vehicle != null)
		{
			Stream.StartWrite()
			Stream.WriteInt(17);
			Stream.SendStream(player)
		}
		else MSGPLR(MSG_ERROR_EN+"You need to be in a car!",player,MSG_ERROR_RO+"Trebuie sa fii intro masina!");
	}
	if(CheckpointColors(checkpoint,RGB(128,255,255)))
	{
		if(player.Vehicle != null)
		{
			local owner = ReadIniString(CAROWNERFILE,CAROWNER,player.Vehicle.ID+"");
			if(owner == player.Name)
			{
				Stream.StartWrite()
				Stream.WriteInt(18);
				Stream.SendStream(player)
			}
			else MSGPLR(RED+"You don't own this vehicle.",player,RED+"Acest vehicul nu iti apartine");
		}
		else MSGPLR(MSG_ERROR_EN+"You need to be in a car!",player,MSG_ERROR_RO+"Trebuie sa fii intro masina!");
	}
	if(CheckpointColors(checkpoint,RGB(255,255,255)))
	{
		Stream.StartWrite()
		Stream.WriteInt(19);
		Stream.SendStream(player)
	}
	if(CheckpointColors(checkpoint,RGB(255,99,99)))
	{
		for(local i =0 ; i < 5; i++)
		{
			if(FindPlayer(RACERS[i]).Name == player.Name)
			{
				player.Cash += RACECASH * JoinedPlayersInRace();
				MSG(PINK+"[RACE]"+WHITE+player+" won the race! prize:"+ (RACECASH * JoinedPlayersInRace()) , PINK+"[CURSA]"+WHITE+player+" a castigat cursa! premiu:"+ (RACECASH * JoinedPlayersInRace()))
				ResetRace();
				break;
			}
		}
	}
	if(CheckpointColors(checkpoint,RGB(200,200,0)))
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("bulider");
		Stream.SendStream(player);
	}
	if(CheckpointColors(checkpoint,RGB(202,202,0)))
	{
		SelectInteriour(player);
		player.Pos.x += 7;
		player.Pos.z += 2;
	}
	if(CheckpointColors(checkpoint,RGB(255,254,255)))
	{
		Announce("~h~Use ~b~/ticket (1-10)~h~ | Foloseste ~b~/ticket (1-10)",player,0);
	}
	if(CheckpointColors(checkpoint,RGB(255,250,0)))
	{
		player.Pos = Vector(-934.611, -351.417, 7.22692);
	}
	if(CheckpointColors(checkpoint,RGB(255,245,0)))
	{
		player.Pos = Vector(-933.437, -350.255, 17.8038);
	}
	if(CheckpointColors(checkpoint,RGB(255,0,255)))
	{
		Stream.StartWrite();
		Stream.WriteInt(3);
		Stream.WriteString("prostitute");
		Stream.SendStream(player);
	}
	UpdateClientSide(player,-1,-1);
}
// ================================== E N D   OF   O F F I C I A L   E V E N T S ======================================