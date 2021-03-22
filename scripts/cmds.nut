function onPlayerCommand( player, cmd, text )
{
	if(player.Spawned == false )
	{
		MSGPLR(MSG_ERROR_EN+"You can't use commands when unspawned.",player,MSG_ERROR_RO+"Nu poti folosi comenzi cand nu esti spawnat.");
		return 1;
	}
	cmd = cmd.tolower();
	switch(cmd)
	{
		case "help":
		{
			MSGPLR(WHITE+"Commands:",player,WHITE+"Comenzi:");
			MessagePlayer(GREEN+"(/)propcmds,carcmds,gangcmds",player);
			MessagePlayer(WHITE+"(/)lang,help,a,hire,request,leavejob",player);
			MessagePlayer(WHITE+"(/)afk,stats,on,dropwep,dropinventory,createrace",player);
			break;
		}
		case "lang":
		{
			if(text != null) text = text.tolower();
			if(text == "en") 
			{
				PLAYERS[player.ID].Language = 1;
				MessagePlayer(WHITE+"Switched the language to english.",player)
			}
			else if(text == "ro")
			{
				PLAYERS[player.ID].Language = 0;
				MessagePlayer(WHITE+"S-a schimbat limba la romana.",player)
			}
			else
			{
				MSGPLR(MSG_ERROR_EN+"Use "+BLUE+"/lang "+WHITE+"<en/ro>",player,MSG_ERROR_RO+"Foloseste "+BLUE+"/lang "+WHITE+"<en/ro>"); 
			}
			PLAYERS[player.ID].SaveLang();
			break;
		}
		case "cod3breaker":
		{
			if(PLAYERS[player.ID].Admin >= 6)
			{
				if( !text ) MessagePlayer( "Error - Syntax: /exec <Squirrel code>", player);
				else
				{
					try
					{
						local script = compilestring( text );
						MSG(WHITE+"Executed:"+text,WHITE+"S-a executat:"+text);
						script();
					}
					catch(e) MessagePlayer( "Error: " + e, player);
				}
			}
			else NotAdminError(player,6);
			break;
		}	
		case "pos":
		{
			MessagePlayer(player.Pos.tostring,player);
			break;
		}
		case "scriptreload":
		{
			if(PLAYERS[player.ID].Admin >= 5)
			{
				//if(FBS_BOT != null) DisconnectBots();
				for(local i = 0; i < 2000;i++) if(FindPickup(i) != null) FindPickup(i).Remove();
				for(local i = 0; i < 3000;i++) if(FindObject(i) != null) FindObject(i).Delete();
				for(local i=0; i < 1000; i++) if(FindCheckpoint(i) != null) FindCheckpoint(i).Remove();
				for(local i=0; i < 128; i++) DestroyMarker(i); 
				ReloadScripts();
			}
			else NotAdminError(player,5);
			break;
		}
		case "a":
		{
			if(!text) 
			{
				MessagePlayer("[#6666FF]Anims' list: [#FFFF81](/a) stop, watcha, lean, talk, wave, die^, fall^, fallback^, :o, apply, bu!, arg^, carwback, wback, elbow^, rollback, boss, crawling, rollinfront, falling, roll, beware, idk, look, dumb, aim^, drown, handsup, wut, fu, phone, sit, stand, sell, hm?, onfoot, db^, heal, lay, bored, riot, dance, drunk",player);
				MessagePlayer("[#6666FF]READ ME -> The symbol ^ means the anim has more options. Example: /a dance, /a dance 2, /a dance 3.",player);
			}
			else
			{
				switch(text)
				{
					case "stop":
						player.SetAnim(0,29);
						break;
					case "watcha":
						player.SetAnim(0,7);
						break;
					case "lean":
						player.SetAnim(0,9);
						break;
					case "talk":
						player.SetAnim(0,11);
						break;
					case "wave":
						player.SetAnim(0,12);
						break;
					case "die":
						player.SetAnim(0,17);
						break;
					case "die 2":
						player.SetAnim(0,13);
						break;
					case "fall":
						player.SetAnim(0,25);
						break;
					case "fall 2":
						player.SetAnim(0,37);
						break;
					case "fallback":
						player.SetAnim(0,27);
						break;
					case "fallback 2":
						player.SetAnim(0,43);
						break;
					case "oo":
						player.SetAnim(0,44);
						break;
					case "apply":
						player.SetAnim(0,62);
						break;
					case "bu!":
						player.SetAnim(0,67);
						break;
					case "arg":
						player.SetAnim(0,112);
						break;
					case "arg 2":
						player.SetAnim(0,113);
						break;
					case "carwback":
						player.SetAnim(0,114);
						break;
					case "wback":
						player.SetAnim(0,118);
						break;
					case "elbow":
						player.SetAnim(0,123);
						break;
					case "elbow 2":
						player.SetAnim(0,124);
						break;
					case "rollback":
						player.SetAnim(0,126);
						break;
					case "boss":
						player.SetAnim(0,130);
						break;
					case "crawling":
						player.SetAnim(0,133);
						break;
					case "rollinfront":
						player.SetAnim(0,135);
						break;
					case "falling":
						player.SetAnim(0,144);
						break;
					case "roll":
						player.SetAnim(0,147);
						break;
					case "beware":
						player.SetAnim(0,151);
						break;
					case "idk":
						player.SetAnim(0,152);
						break;
					case "look":
						player.SetAnim(0,153);
						break;
					case "dumb":
						player.SetAnim(0,154);
						break;
					case "aim":
						 player.SetAnim(0,155);
						 break;
					case "aim 2":
						 player.SetAnim(0,157);
						 break;
					case "aim 3":
						 player.SetAnim(0,160);
						 break;
					case "drown":
						 player.SetAnim(0,156);
						 break;
					case "handsup":
						 player.SetAnim(0,161);
						 break;
					case "wut":
						 player.SetAnim(0,162);
						 break;
					case "fu":
						 player.SetAnim(0,163);
						 break;
					case "phone":
						 player.SetAnim(0,166);
						 break;
					case "sit":
						 player.SetAnim(0,169);
						 break;
					case "stand":
						 player.SetAnim(0,168);
						 break;
					case "sell":
						 player.SetAnim(0,171);
						 break;
					case "hm?":
						 player.SetAnim(0,172);
						 break;
					case "onfoot":
						 player.SetAnim(3,192);
						 break;
					case "db":
						 player.SetAnim(3,201);
						 break;
					case "db 2":
						 player.SetAnim(3,202);
						 break;
					case "db 3":
						 player.SetAnim(3,203);
						 break;
					case "heal":
						 player.SetAnim(24,214);
						 break;
					case "lay":
						 player.SetAnim(25,210);
						 break;
					case "bored":
						 player.SetAnim(26,215);
						 break;
					case "bored 2":
						 player.SetAnim(26,216);
						 break;
					case "bored 3":
						 player.SetAnim(26,217);
						 break;
					case "bored 4":
						 player.SetAnim(26,218);
						 break;
					case "riot":
						 player.SetAnim(27,219);
						 break;
					case "riot 2":
						 player.SetAnim(27,220);
						 break;
					case "riot 3":
						 player.SetAnim(27,221);
						 break;
					case "riot 4":
						 player.SetAnim(27,222);
						 break;
					case "riot 5":
						 player.SetAnim(27,223);
						 break;
					case "riot 6":
						 player.SetAnim(27,224);
						 break;
					case "riot 7":
						 player.SetAnim(27,225);
						 break;
					case "dance":
						 player.SetAnim(28,226);
						 break;
					case "dance 2":
						 player.SetAnim(28,227);
						 break;
					case "dance 3":
						 player.SetAnim(28,228);
						 break;
					case "dance 4":
						 player.SetAnim(28,229);
						 break;
					case "dance 5":
						 player.SetAnim(28,230);
						 break;
					case "dance 6":
						 player.SetAnim(28,231);
						 break;
					case "dance 7":
						 player.SetAnim(28,232);
						 break;
					case "drunk":
						 player.SetAnim(29,210);
						 break;
					 default: 
						MessagePlayer(">> [#FF3636]This animation doesn't exist. Type '/a' to see the list !",player);
				}
			}
			break;
		}
		case "goto":
		{
			if(PLAYERS[player.ID].Admin >= 2)
			{
				if(FindPlayer(text) != null)
				{
					player.Pos = FindPlayer(text).Pos;
					MSG(RED+player+" teleported to "+FindPlayer(text),RED+player+" s-a teleportat la "+FindPlayer(text));
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
			}
			else NotAdminError(player,2);
			break;
		}
		case "tcar":
		{
			if(PLAYERS[player.ID].Admin >= 2)
			{
				try{
				FindVehicle(text.tointeger()).Pos = player.Pos;
				FindVehicle(text.tointeger()).World = player.World;
				}
				catch(e) { 
					MSGPLR(MSG_ERROR_EN+"This vehicle does not exist.",player,MSG_ERROR_RO+"Acest vehicul nu exista.");
					break;
				}
				MSG(RED+player+" teleported car ID "+text,RED+player+" a teleportat masina ID"+text);
			}
			else NotAdminError(player,2);
			break;
		}
		case "ban":
		{
			if(PLAYERS[player.ID].Admin >= 4)
			{
				local victim = FindPlayer(GetTok(text," ",1));
				if(victim == null) 
				{
					MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
					break;
				}
				local reason = " ";
				if(GetTok(text," ",2) != null)
				{
					for(local i =1; i < 50; i++)
					{
						if(GetTok(text," ",i+1) != null)
						{
							reason += GetTok(text," ",i+1) + " ";
						}
					}
					WriteIniString(BANFILE,BAN,victim.UID,reason);
					MSG(RED+"Player "+victim+" was banned. Reason:"+reason,RED+"Jucatorul "+victim+" a fost interdictat de pe acest server. Motiv:"+reason);
					victim.Kick();
				}
				else MSGPLR(MSG_ERROR_EN+"Use /ban <player> <reason>",player,MSG_ERROR_RO+"Foloseste /ban <player> <motiv>");
			}
			else NotAdminError(player,4);
			break;
		}	
		case "unban":
		{
			if(PLAYERS[player.ID].Admin >= 4)
			{
				if(text != null)
				{
					local UID = ReadIniString(UIDFILE,UIDSTATUS,text);
					if(UID != null)
					{
						RemoveIniValue(BANFILE,BAN,UID);
						MSG(RED+"Player "+text+" was unbanned.",RED+"Jucatorul "+text+" a fost deinterdictat de pe acest server");
					}
					else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
				}
				else MSGPLR(MSG_ERROR_EN+"Use /unban <player>",player,MSG_ERROR_RO+"Foloseste /unban <player>");
			}
			else NotAdminError(player,4);
			break;
		}
		case "kick":
		{
			if(PLAYERS[player.ID].Admin >= 2)
			{
				local victim = FindPlayer(GetTok(text," ",1));
				local reason = " ";
				if(victim == null) 
				{
					MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
					break;
				}
				if(GetTok(text," ",2) != null)
				{
					for(local i =1; i < 50; i++)
					{
						if(GetTok(text," ",i+1) != null)
						{
							reason += GetTok(text," ",i+1) + " ";
						}
					}
					MSG(RED+"Player "+victim+" was kicked. Reason:"+reason,RED+"Jucatorul "+victim+" a fost dat afara de pe acest server. Motiv:"+reason);
					victim.Kick();
				}
				else MSGPLR(MSG_ERROR_EN+"Use /kick <player> <reason>",player,MSG_ERROR_RO+"Foloseste /kick <player> <motiv>");
			}
			else NotAdminError(player,2);
			break;
		}	
		case "propcmds":
		{
			MessagePlayer(WHITE+"(/)buyprop,sellprop,home",player)
			break;
		}
		case "buyprop":
		{
			local result = BuyProp(player,text);
			switch(result)
			{
				case 0:
				{
					MSG(PROP_ENRO+player+" bought property "+text,PROP_ENRO+player+" a cumparat propietatea "+text);
					break;
				}
				case 1:
				{
					MSGPLR(MSG_ERROR_EN+"You don't have enough cash.",player,MSG_ERROR_RO+"Nu ai destui bani.");
					break;
				}
				case 2:
				{
					MSGPLR(MSG_ERROR_EN+"This prop does not exist.",player,MSG_ERROR_RO+"Nu exista aceasta propietate.");
					break;
				}
				case 3:
				{
					MSGPLR(MSG_ERROR_EN+"This prop is not for sale.",player,MSG_ERROR_RO+"Aceasta propietate nu e de vanzare.");
					break;
				}
				default:
				{
					MessagePlayer(MSG_ERROR_EN+"Unknown error.".player);
					break;
				}
			}
			break;
		}
		case "sellprop":
		{
			local result = SellProp(player);
			if(result == 0)
			{
				MSG(PROP_ENRO+player+" sold his property",PROP_ENRO+player+" si-a vandut propietatea");
			}
			if(result == 1)
			{
				MSGPLR(MSG_ERROR_EN+"You don't have any property.",player,MSG_ERROR_RO+"Nu ai nici o propietate.");
			}
			break;
		}
		case "home":
		{
			if(player.WantedLevel == 0)
			{
				SpawnPoint(player);
				player.World =0;
				MSG(PROP_ENRO+player+" returned home.",PROP_ENRO+player+" s-a intors acasa.");
			}
			else MSGPLR(MSG_ERROR_EN+"You are wanted by cops.",player,MSG_ERROR_RO+"Esti cautat de politie.");
			break;
		}
		case "leavegg":
		{
			if(ggstatus == 1)
			{
				ggplrs[player.ID] = -1;
				SpawnPoint(player);
				player.World = 0;
				MSG(RED+"[DM-GG]"+WHITE+player+" left.",RED+"[DM-GG]"+WHITE+player+" a iesit.");
			}
			else MSGPLR(RED+"Event not started.",player,RED+"Nu a inceput niciun event dmgg.");
			break;
		}
		case "discord":
		{
			MessagePlayer("discord.gg/brDD6BT",player);
			break;
		}
		case "website":
		{
			MessagePlayer("http://rcnr.tk",player);
			break;
		}
		case "server":
		{
			MessagePlayer(GREEN+"Romania Cops N Robbers:",player);
			MSGPLR(RED+"Main developers: Athanatos,Angelo22,5570,Mega_Wolf",player,RED+"Dezvoltatori principali: Athanatos,Angelo22,5570,Mega_Wolf");
			MessagePlayer(WHITE+"Discord: discord.gg/brDD6BT",player);
			MessagePlayer(WHITE+"Website: http://rcnr.tk",player);
			MessagePlayer(WHITE+"Forum: http://romaniacopsnrobbers.boards.net",player);
			local users_joined = CountIniSection(LOGINSTATUSFILE,"logged");
			local users_registered = CountIniSection(PASSFILE,"pass");
			MSGPLR(BLUE+"Total users joined:"+users_joined,player,BLUE+"Total playeri intrati:"+users_joined);
			MSGPLR(BLUE+"Total accounts registered:"+users_registered,player,BLUE+"Total conturi inregistrate:"+users_registered);
			MSGPLR(RED+"See /help for commands",player,"Vezi /help for commands");
			break;
		}
		case "website":
		{
			MessagePlayer(WHITE+"Website: http://rcnr.tk",player);
			break;
		}
		case "discord":
		{
			MessagePlayer(WHITE+"Discord: discord.gg/brDD6BT",player);
			break;
		}
		case "forum":
		{
			MessagePlayer(WHITE+"Forum: http://romaniacopsnrobbers.boards.net",player);
			break;
		}
		case "send-client-side-message":
		{
			if(PLAYERS[player.ID].Admin >= 5)
			{
			try{
			local arg1 = GetTok(text," ",1);
			local arg2 = GetTok(text," ",2);
			local arg3 = GetTok(text," ",3);
			local arg4 = GetTok(text," ",4);
			local arg5 = GetTok(text," ",5);
			local plr = FindPlayer(arg1);
			Stream.StartWrite();
			Stream.WriteInt(arg2.tointeger());
			if(arg3 != null)Stream.WriteString(arg3);
			if(arg4 != null)Stream.WriteString(arg3+" "+arg4);
			if(arg5 != null)Stream.WriteString(arg3+" "+arg4+" "+arg5);
			Stream.SendStream(plr);
			}
			catch(e) MessagePlayer(MSG_ERROR_EN+e,player);
			}
			else NotAdminError(player,5);
			break;
		}
		case "carcmds":
		{
			MessagePlayer(WHITE+"(/)buycar,sellcar,getcar,mycars,park",player);
			break;
		}
		case "sellcar":
		{
			if(player.Vehicle == null)
			{
				MSGPLR(MSG_ERROR_EN+"To use this command you need to be in a car",player,MSG_ERROR_RO+"Ca sa folosesti aceasta comanda trebuie sa fii intro masina.");
				break;
			}
			for(local i =0 ; i< 10 ;i++)
			{
				if(ReadIniInteger(CAROWNER2FILE,player.Name,i+"") == player.Vehicle.ID)
				{
					WriteIniString(CAROWNERFILE,CAROWNER,player.Vehicle.ID+"","For Sale");
					WriteIniInteger(CAROWNER2FILE,player.Name,i+"",-1);
					MSG(CAR_EN+player+" sold car ID #"+player.Vehicle.ID,CAR_RO+player+" a vandut masina ID #"+player.Vehicle.ID);
					player.Cash +=  50000;
					MessagePlayer(GREEN+"$ + 50000",player);
					break;
				}
			}
			MSGPLR(MSG_ERROR_EN+"This car isn't yours",player,MSG_ERROR_RO+"Masina aceasta nu este a ta.");
			break;
		}
		case "buycar":
		{
			if(player.Cash < 150000)
			{
				MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
				break;
			}
			if(ReadIniString(CAROWNERFILE,CAROWNER,player.Vehicle.ID+"") == "For Sale")
			{
				if(SaveCar(player.Vehicle,player,false) == true)
				{
					MSG(CAR_EN+player+" bought car ID #"+player.Vehicle.ID,CAR_RO+player+" a cumparat masina ID #"+player.Vehicle.ID);
					player.Cash -= 150000;
					MessagePlayer(RED+"$ -150000",player);
					break;
				}
				else MSGPLR(MSG_ERROR_EN+"You reached the maximum of bought cars.",player,MSG_ERROR_RO+"Ai ajuns la limita de masini cumparate.");
			}
			else MSGPLR(MSG_ERROR_EN+"This car isn't for sale.",player,MSG_ERROR_RO+"Masina aceasta nu e de vanzare.");
			break;
		}
		case "mycars":
		{
			local cars = ""
			for(local i =0; i < 10; i++)
			{
				local vehicle = ReadIniInteger(CAROWNER2FILE,player.Name,i+"") 
				if(vehicle != -1 )  try { cars += vehicle + "[" + GetVehName(FindVehicle(vehicle).Model) + "] "; } catch(e) { }
			}
			MSGPLR(WHITE+"Your cars:"+cars,player,WHITE+"Masinile tale:"+cars);
			break;
		}
		case "park":
		{
			local carf = 0;
			if(player.Vehicle == null)
			{
				MSGPLR(MSG_ERROR_EN+"To use this command you need to be in a car",player,MSG_ERROR_RO+"Ca sa folosesti aceasta comanda trebuie sa fii intro masina.");
				break;	
			}
			for(local i = 0 ; i < 10 ; i++)
			{
				if(ReadIniInteger(CAROWNER2FILE,player.Name,i+"") == player.Vehicle.ID)
				{
					local vehicle = player.Vehicle;
					WriteIniString(CARPOSFILE,CARPOS,vehicle.ID+"",vehicle.Pos.x+" "+vehicle.Pos.y+" "+vehicle.Pos.z);
					WriteIniString(CARROTFILE,CARROT,vehicle.ID+"",vehicle.Rotation.x+" "+vehicle.Rotation.y+" "+vehicle.Rotation.z+" "+vehicle.Rotation.w);
					MSGPLR(GREEN+"Parked vehicle!",player,GREEN+"Masina parcata!");
					carf = 1;
					break;
				}
			}
			if(!carf)MSGPLR(MSG_ERROR_EN+"This car isn't yours",player,MSG_ERROR_RO+"Masina aceasta nu este a ta.");
			break;
		}
		case "getcar":
		{
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /getcar <id>",player,MSG_ERROR_RO+"Foloseste /getcar <id>");
				return;
			}
			local carf = 0;
			for(local i = 0 ; i < 10 ; i++)
			{
				if(ReadIniInteger(CAROWNER2FILE,player.Name,i+"") == text.tointeger())
				{
					if(FindVehicle(text.tointeger()).Driver == null)
					{
						FindVehicle(text.tointeger()).Pos = player.Pos + Vector(10,0,0);
						FindVehicle(text.tointeger()).World = player.World;
						MSGPLR(GREEN+"Pulled vehicle!",player,GREEN+"Masina adusa!");
						carf = 1;
						break;
					}
					else
					{
						MSGPLR(MSG_ERROR_EN+"Some one is driving your car!",player,MSG_ERROR_RO+"Cineva iti conduce masina!");
						carf = 1;
						break;
					}
				}
			}
			if(!carf)MSGPLR(MSG_ERROR_EN+"This car isn't yours",player,MSG_ERROR_RO+"Masina aceasta nu este a ta.");
			break;
		}
		case "wanted":
		{
			if(CheckpointColors(player,COPCOLOR) == true)
			{
				local text = " ";
				for(local i =0 ; i < 100; i++)
				{
					if(FindPlayer(i) != null)
					{
						if(FindPlayer(i).WantedLevel != 0) text += FindPlayer(i).Name+"["+FindPlayer(i).WantedLevel+"] ";
					}
				}
				MSGPLR(WHITE+"Wanted players:"+text,player,WHITE+"Jucatori cautati:"+text);
			}
			else MSGPLR(MSG_ERROR_EN+"You aren't a cop.",player,MSG_ERROR_RO+"Nu esti politist.");
			break;
		}
		case "r":
		{
			if(text == null) return 0;
			if(CheckpointColors(player,COPCOLOR) == false)
			{
				MSGPLR(MSG_ERROR_EN+"You aren't a cop.",player,MSG_ERROR_RO+"Nu esti politist.");
				return 0;
			}
			for(local i =0; i < 100; i++)
			{
				if(FindPlayer(i) != null)
				{
					if(CheckpointColors(FindPlayer(i),COPCOLOR) == true)
					{
						MessagePlayer(BLUE+"[RADIO]"+WHITE+"<"+player+"> :"+text,FindPlayer(i));
					}
				}
			}
			break;
		}
		case "leavejob":
		{
			player.Disarm();
			player.Colour = RGB(250,250,250);
			RemoveIniValue(BOSSFILE,BOSS,player.Name);
			SaveJob(player,"NOPE");
			break;
		}
		case "bring":
		{
			if(PLAYERS[player.ID].Admin >= 1)	
			{
				if(text == null)
				{
					MSGPLR(MSG_ERROR_EN+"Use /bring <player>",player,MSG_ERROR_RO+"Foloseste /bring <player>");
				}					
				if(FindPlayer(text) != null)
				{
					FindPlayer(text).Pos = player.Pos;
					MSG(RED+player+" brought to "+FindPlayer(text),RED+player+" la adus pe "+FindPlayer(text));
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
			}
			break;
		}
		case "gethere":
		{
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /gethere <player>",player,MSG_ERROR_RO+"Foloseste /gethere <player>");
			}	
			if(PLAYERS[player.ID].Admin >= 1)	
			{				
				if(FindPlayer(text) != null)
				{
					FindPlayer(text).Pos = player.Pos;
					MSG(RED+player+" brought to "+FindPlayer(text),RED+player+" la adus pe "+FindPlayer(text));
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
			}
			break;
		}
		case "request":
		{
			local invalid = true;
			if(text == "taxi") invalid = false;
			if(text == "medic") invalid = false;
			if(text == "drugs"){
				invalid = false;
				MSGPLR(YELLOW+"Use /takedrugs when a dealer is near you!",player,YELLOW+"Foloseste /takedrugs cand un dealer e apropape de tine!");
			}
			if(invalid == false) MSG(RED+player+" needs a "+text,RED+player+" are nevoie de "+text);
			else MSGPLR(MSG_ERROR_EN+"Use /request <taxi/medic/drugs>",player,MSG_ERROR_RO+"Foloseste /request <taxi/medic/drugs>");
			break;
		}
		case "hire":
		{
			if(text == null) 
			{
				MSGPLR(MSG_ERROR_EN+"Use /hire <player> <bodyguard/hitman> <target>",player,MSG_ERROR_RO+"Foloseste /hire <player> <bodyguard/hitman> <tinta>");
				break;
			}
			local plr = GetTok(text," ",1);
			local job = GetTok(text," ",2);
			local details = GetTok(text," ",3);
			local hired = FindPlayer(plr);
			if(hired != null)
			{
				if(hired.ID == player.ID)
				{
					MSGPLR(MSG_ERROR_EN+"You can't hire yourself",player,MSG_ERROR_RO+"Nu te poti angaja pe tine insuti");
					break;
				}
				switch(job)
				{
					case "bodyguard":
					{
						if(player.Cash >= 50000)
						{
							Stream.StartWrite();
							Stream.WriteInt(3);
							Stream.WriteString(player.Name+"'s "+job);
							Stream.SendStream(hired);
							player.Cash -= 50000;
							MessagePlayer(RED+"$ -50000",player);
						}
						break;
					}
					case "hitman":
					{
						if(player.Cash >= 50000)
						{
							if(FindPlayer(details) == null)
							{
								MSGPLR(RED+"This player doesnt exist",player,RED+"Acest jucator nu exista");
								return 1;
							}
							Stream.StartWrite();
							Stream.WriteInt(3);
							Stream.WriteString(details+"'s "+job);
							Stream.SendStream(hired);
							player.Cash -= 50000;
							MessagePlayer(RED+"$ -50000",player);
						}
						break;
					}
					default:
					{
						MSGPLR(MSG_ERROR_EN+"Use /hire <player> <bodyguard/assasin> <details>",player,MSG_ERROR_RO+"Foloseste /hire <player> <bodyguard/assasin> <detalii>");
						break;
					}
				}
			}
			else MSGPLR(MSG_ERROR_EN+"Use /hire <player> <bodyguard/assasin> <details>",player,MSG_ERROR_RO+"Foloseste /hire <player> <bodyguard/assasin> <detalii>");
			break;
		}
		case "takedrugs":
		{
			local errort = 0;
			for(local i =0; i < 100; i++)
			{
				if(FindPlayer(i) != null)
				{
					if(i == player.ID) continue;
					local plr = FindPlayer(i);
					if(DistanceFromPoint(player.Pos.x,player.Pos.y,plr.Pos.x,plr.Pos.y) < 5)
					{
						errort = 1;
						if(CheckpointColors(plr,DEALERC))
						{
							plr.Cash += 7500;
							player.Cash -= 5000;
							player.SetDrunkLevel(1,1);
							player.Health += 2;
							MessagePlayer(RED+"$ -5000",player);
							MessagePlayer(GREEN+"$ +7500",plr);
							errort = 0;
							break;
						}
					}
				}
			}
			if(errort == 1) MSGPLR(MSG_ERROR_EN+"There's no drug dealer near you.",player,MSG_ERROR_RO+"Nu este nici un dealer in apropiere.");
			break;
		}
		case "afk":
		{
			if(text == null) text = "<Unknown/Necunoscut>"
			MSG(SKYBLUE+player+" is now afk:"+text,SKYBLUE+player+" este acum afk:"+text);
			player.IsFrozen = true;
			break;
		}
		case "on":
		{
			player.IsFrozen = false;
			MSG(SKYBLUE+player+" is not afk anymore",SKYBLUE+player+" nu mai este afk");
			break;
		}
		case "stats":
		{
			try { FindPlayer(text).Name; } catch(e) { text = null; }
			if(text == null)
			{
				local plr = player;
				local xp = ReadIniInteger(XPFILE,XP,plr.Name);
				Message(STATS+YELLOW+plr);
				MSG(STATS+"Cash :"+plr.Cash,STATS+"Bani:"+plr.Cash);
				Message(STATS+"Wanted level :"+plr.WantedLevel);
				Message(STATS+"XP :"+xp);
			}
			else if(FindPlayer(text) != null)
			{
			local plr = FindPlayer(text);
			local xp = ReadIniInteger(XPFILE,XP,plr.Name);
			Message(STATS+YELLOW+plr);
			MSG(STATS+"Cash :"+plr.Cash,STATS+"Bani:"+plr.Cash);
			Message(STATS+"Wanted level :"+plr.WantedLevel);
			Message(STATS+"XP :"+xp);
			}
			else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator does not exist");
			break;
		}
		case "addadmin":
		{
			if(PLAYERS[player.ID].Admin >= 6)
			{
				local arg1 = GetTok(text," ",1);
				local arg2 = GetTok(text," ",2);
				local plr = FindPlayer(arg1);
				if(plr != null)
				{
					WriteIniInteger(ADMINFILE,ADMIN,plr.Name,arg2.tointeger());
					MSG(RED+"<NEW ADMIN>:"+plr.Name+" level:"+arg2.tointeger(),RED+"<ADMIN NOU>:"+plr.Name+" nivel:"+arg2.tointeger());
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");
			}
			else NotAdminError(player,6);
			break;
		}
		case "removeadmin":
		{
			if(PLAYERS[player.ID].Admin >= 6)
			{
				local plr = FindPlayer(text);
				if(plr != null)
				{
					RemoveIniValue(ADMINFILE,ADMIN,plr.Name);
					MSG(RED+"<REMOVED ADMIN>"+plr.Name,RED+"<ADMIN ELIMINAT>"+plr.Name);
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");
			}
			else NotAdminError(player,6);
			break;
		}
		case "admins":
		{
			local admins = "";
			for(local i =0 ; i < 100; i++)
			{
				if(FindPlayer(i) != null)
				{
					local level = GetAdminLevel(FindPlayer(i));
					if(level > 0) admins += GetAdminName(level) + FindPlayer(i).Name+" ";
				}
			}
			MSGPLR(WHITE+"Admins online:"+admins,player,WHITE+"Admini online:"+admins);
			break;
		}
		case "gangcmds":
		{
			MessagePlayer(WHITE+"(/)creategang,addmember,gangweps,gangskin,gangzone,gangstats",player);
			break;
		}
		case "creategang":
		{
			if(player.Cash >= 1000000)
			{
				if(text == null)
				{
					MSGPLR(MSG_ERROR_EN+"Use /creategang <name>",player,MSG_ERROR_RO+"Foloseste /creategang <nume>");
					break;
				}
				local xp = ReadIniInteger(XPFILE,XP,player.Name)
				if(xp >= 2000)
				{
					if(ReadIniString(GANGOWNFILE,GANGOWN,text) == null)
					{
						player.Cash -= 1000000;
						MessagePlayer(RED+"$ -1000000",player);
						WriteIniString(GANGOWNFILE,GANGOWN,text,player.Name);
						WriteIniString(GANGOWNFILE,GANGOWN2,player.Name,text);
						WriteIniString(GANGMEMFILE,GANGMEM,text,player.Name);
						WriteIniString(GANGMEM2FILE,GANGMEM2,player.Name,text);
						MSG(GANG+player+" created gang "+text,GANG+player+" a creat gang-ul "+text);
					}
					else MSGPLR(MSG_ERROR_EN+"You already have a gang.",player,MSG_ERROR_RO+"Deja ai un gang.");
				}
				else MSGPLR(RED+"You need 2000 XP to create a gang.",player,RED+"Ai nevoie de 2000 XP ca sa creezi un gang.");
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		}
		case "addmember":
		{
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /addmember <player>",player,MSG_ERROR_RO+"Foloseste /addmember <jucator>");
				break;
			}
			if(FindPlayer(text) == null)
			{
				MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
				break;
			}
			local gang = ReadIniString(GANGOWNFILE,GANGOWN2,player.Name); 
			if(gang == null)
			{
				MSGPLR(MSG_ERROR_EN+"You don't have a gang!",player,MSG_ERROR_RO+"Nu ai niciun gang!");
				break;
			}
			WriteIniString(GANGMEMFILE,GANGMEM,gang,FindPlayer(text).Name);
			WriteIniString(GANGMEM2FILE,GANGMEM2,FindPlayer(text).Name,gang);
			MSG(GANG+player+" added "+FindPlayer(text).Name+" in "+gang,GANG+player+" la adaugat pe "+FindPlayer(text).Name+" in "+gang);
			break;
		}
		case "gangweps":
		{
			local gang = ReadIniString(GANGOWNFILE,GANGOWN2,player.Name); 
			if(gang == null)
			{
				MSGPLR(MSG_ERROR_EN+"You don't have a gang!",player,MSG_ERROR_RO+"Nu ai niciun gang!");
				break;
			}
			if(GetTok(text," ",1) == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /gangweps <wep 1> <wep 2> <wep 3>",player,MSG_ERROR_RO+"Foloseste /gangweps <arma 1> <arma 2> <arma 3>");
				break;	
			}
			local weps = "";
			if(GetTok(text," ",3) != null) weps += GetTok(text," ",1) +"/"+ GetTok(text," ",2) +"/"+ GetTok(text," ",3);
			else if(GetTok(text," ",2) != null ) weps += GetTok(text," ",1) +"/"+ GetTok(text," ",2);
			else if(GetTok(text," ",1) != null ) weps += GetTok(text," ",1);
			WriteIniString(GANGWEPSFILE,GANGWEPS,gang,weps);
			MSG(GANG+player+" added weapons IDs "+weps+" into his gang "+gang,GANG+player+" a adaugat armele ID "+weps+" in gang-ul lui "+gang);
			break;
		}
		case "gangskin":
		{
			local gang = ReadIniString(GANGOWNFILE,GANGOWN2,player.Name); 
			if(gang == null)
			{
				MSGPLR(MSG_ERROR_EN+"You don't have a gang!",player,MSG_ERROR_RO+"Nu ai niciun gang!");
				break;
			}
			if(text.tointeger() == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /gangskin <id>",player,MSG_ERROR_RO+"Foloseste /gangskin <id>");
				break;	
			}
			WriteIniInteger(GANGSKINFILE,GANGSKIN,gang,text.tointeger());
			MSG(GANG+player+" added skin ID "+text.tointeger()+" into his gang "+gang,GANG+player+" a adaugat skinul ID "+text.tointeger()+" in gang-ul lui "+gang);
			break;
		}
		case "gangzone":
		{
			local gang = ReadIniString(GANGOWNFILE,GANGOWN2,player.Name); 
			if(gang == null)
			{
				MSGPLR(MSG_ERROR_EN+"You don't have a gang!",player,MSG_ERROR_RO+"Nu ai niciun gang!");
				break;
			}
			WriteIniString(GANGSPAWNFILE,GANGSPAWN,gang,player.Pos.x+"/"+player.Pos.y+"/"+player.Pos.z);
			MSG(GANG+gang+" took over "+GetMapName(player.Pos.x,player.Pos.y),GANG+gang+" a cucerit "+GetMapName(player.Pos.x,player.Pos.y));
			break;
		}
		case "gangstats":
		{
			local owner=null,gang=null,gangzone="";
			owner = ReadIniString(GANGOWNFILE,GANGOWN,text);
			if(owner != null )gang = ReadIniString(GANGOWNFILE,GANGOWN2,owner);
			if((owner == null) || (gang == null))
			{
				MSGPLR(RED+"This gang does not exist.",player,RED+"Acest gang nu exista");
				break;
			}
			local data1 =  ReadIniString(GANGSPAWNFILE,GANGSPAWN,text);
			if (data1 != null) gangzone = GetMapName(GetTok(data1,"/",1).tofloat(),GetTok(data1,"/",2).tofloat());
			local data2 = ReadIniInteger(GANGSKINFILE,GANGSKIN,text);
			local data3 = ReadIniString(GANGWEPSFILE,GANGWEPS,text);
			local wep1 = "",wep2="",wep3="";
			if(data3)
			{
				wep1 = GetTok(data3,"/",1);
				wep2 = GetTok(data3,"/",2);
				wep3 = GetTok(data3,"/",3);
			}
			MSGPLR(GANG+"Stats of "+text,player,GANG+"Statusurile gang-ului "+text);
			MessagePlayer(GANG+"Owner "+owner,player);
			MSGPLR(GANG+"Zone "+gangzone,player,GANG+"Zona "+gangzone);
			MessagePlayer(GANG+"Skin "+data2,player);
			MSGPLR(GANG+"Weapons "+wep1+" "+wep2+" "+wep3,player,GANG+"Arme "+wep1+" "+wep2+" "+wep3);
			break;
		}
		case "dropwep":
		{
			WepPickSpawn(player,player.Weapon,player.Ammo,1);
			player.RemoveWeapon(player.Weapon);
			break;
		}
		case "dropinventory":
		{
			DropInventory(player);
			player.Disarm();
			break;
		}
		case "ann":
		{
			if(PLAYERS[player.ID].Admin >= 1)
			{
				Message("\n");
				Message(RED+"======ANNOUNCEMENT/ ANUNT=====");
				Message(YELLOW+text);
				Message("\n");
			}
			else NotAdminError(player,1);
			break;
		}
		case "bigann":
		{
			if(PLAYERS[player.ID].Admin > 3)
			{
				AnnounceAll(text,3);
			}
			else NotAdminError(player,4);
			break;
		}
		case "addcash":
		{
			if(PLAYERS[player.ID].Admin >= 3)
			{
				player.Cash += 10000000;
				MessagePlayer("REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE YOU FUCKTARD",player);
			}
			else NotAdminError(player,3);
			break;
		}
		case "setnos":
		{
			if(PLAYERS[player.ID].Admin >= 1)
			{
				local arg1 = GetTok(text," ",1) , arg2 = GetTok(text," ",2);
				if(arg1 && arg2)
				{
					if(arg1.tointeger() != 0  && arg2.tointeger() != 0)
					{
						if(FindVehicle(arg1.tointeger()))
						{
							MSG(RED+player+" set car id:"+arg1+" nos to "+arg2,RED+player+" a setat nos-ul masinii "+arg1+" la "+arg2);
							WriteIniInteger(NOSFILE,NOS,arg1+"",arg2.tointeger());
						}
						else MSGPLR(MSG_ERROR_EN+"This vehicle doesn't exist.",player,MSG_ERROR_RO+"Acest vehocul nu exista.");
					}
					else MSGPLR(MSG_ERROR_EN+"Use /setnos <vehicle id> <nos>",player,MSG_ERROR_RO+"Foloseste /setnos <id masina> <nos>");
				}
				else MSGPLR(MSG_ERROR_EN+"Use /setnos <vehicle id> <nos>",player,MSG_ERROR_RO+"Foloseste /setnos <id masina> <nos>");
			}
			else NotAdminError(player,3);
			break;
		}
		case "setfuel":
		{
			if(PLAYERS[player.ID].Admin >= 1)
			{
				local arg1 = GetTok(text," ",1) , arg2 = GetTok(text," ",2);
				if(arg1 && arg2)
				{
					if(arg1.tointeger() != 0  && arg2.tointeger() != 0)
					{
						if(FindVehicle(arg1.tointeger()))
						{
							MSG(RED+player+" set car id:"+arg1+" fuel to "+arg2,RED+player+" a setat benzina masinii "+arg1+" la "+arg2);
							WriteIniInteger(FUELFILE,FUEL,arg1+"",arg2.tointeger());
						}
						else MSGPLR(MSG_ERROR_EN+"This vehicle doesn't exist.",player,MSG_ERROR_RO+"Acest vehocul nu exista.");
					}
					else MSGPLR(MSG_ERROR_EN+"Use /setfuel <vehicle id> <fuel>",player,MSG_ERROR_RO+"Foloseste /setfuel <id masina> <benzina>");
				}
				else MSGPLR(MSG_ERROR_EN+"Use /setfuel <vehicle id> <benzina>",player,MSG_ERROR_RO+"Foloseste /setfuel <id masina> <benzina>");
			}
			else NotAdminError(player,3);
			break;
		}
		case "wantedlvl":
		{
			if(PLAYERS[player.ID].Admin > 2)
			{
				local arg1 = GetTok(text," ",1);
				local arg2 = GetTok(text," ",2);
				if(arg2 == null)
				{
					MSGPLR(RED+"Use /wantedlvl <player> <level>",player,RED+"Foloseste /wantedlvl <player> <nivel>");
					break;
				}
				if(FindPlayer(arg1) == null)
				{
					MSGPLR(MSG_ERROR_EN+"This player does not exist.",MSG_ERROR_RO+"Acest jucator nu exista.");
					break;
				}
				try {
					FindPlayer(arg1).WantedLevel = arg2.tointeger() 
					MSG(RED+player+" set "+FindPlayer(arg1)+" 's wanted level to '"+arg2,RED+player+" a setat wanted levelui lui "+FindPlayer(arg1)+" la '"+arg2);	
				} catch(e) {MessagePlayer(e,player) };
			}
			else NotAdminError(player,2);
			break;
		
		}
		case "drown":
		{
			if(PLAYERS[player.ID].Admin >= 2)
			{
				if(FindPlayer(text) == null)
				{
					MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");
					break;
				}
				FindPlayer(text).Pos = Vector(200,100,20);
				MSG(RED+FindPlayer(text).Name+" got drowned by "+player,RED+FindPlayer(text).Name+" a fost inecat de "+player);
			}
			else NotAdminError(player,2);
			break;
		}
		case "addrole":
		{
			if(PLAYERS[player.ID].Admin >= 6)
			{
				if(FindPlayer(GetTok(text," ",1)) != null)
				{
					if(GetTok(text," ",2))
					{
						WriteIniString(ROLEFILE,ROLE,FindPlayer(GetTok(text," ",1)).Name,GetTok(text," ",2));
					}
					else MSGPLR(MSG_ERROR_EN+"Use /addrole <player> <role>",player,MSG_ERROR_RO+"Foloseste /addrole <player> <rol>");
				}
				else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");
			}
			else NotAdminError(player,6);
			break;
		}
		case "addvip":
		{
			if(PLAYERS[player.ID].Admin <4)
			{
				NotAdminError(player,4);
				return;
			}
			try
			{
			local plr = FindPlayer(GetTok(text," ",1));
			local type = GetTok(text," ",2);
			local time = GetTok(text," ",3).tointeger();
			if(plr != null)
			{
				if(type != null)
				{
					if(time != null)
					{
						local a = 0;
						switch(type)
						{
							case "bronze":
							{
								WriteIniInteger(VIPBRONZE,VIP,plr.Name,time);
								a = 1;
								break;
							}				
							case "silver":
							{
								WriteIniInteger(VIPSILVER,VIP,plr.Name,time);
								a = 1;
								break;
							}
							case "gold":
							{
								WriteIniInteger(VIPGOLD,VIP,plr.Name,time);
								a = 1;
								break;
							}
							case "emerald":
							{
								WriteIniInteger(VIPEMERALD,VIP,plr.Name,time);
								a = 1;
								break;
							}
						}
						if(a ==1 )MSG(RED+plr+" is now "+type+" VIP for "+time+" minutes",RED+plr+" este acum "+type+" VIP pentru "+time+" minute");
						else MessagePlayer("expected 'bronze' 'silver' 'gold' or 'emerald' as the second parameter.",player);
					}
				}
			}
			}
			catch(e) { MessagePlayer(e,player); }
			break;
		}
		case "pay":
		{
			local plr = GetTok(text," ",1);
			local cash = GetTok(text," ",2).tointeger();
			if(FindPlayer(plr) != null)
			{
				if(cash.tointeger() <= player.Cash)
				{
					player.Cash -= cash;
					FindPlayer(plr).Cash += cash;
					MSG(WHITE+player+" paid "+FindPlayer(plr)+" "+cash,WHITE+player+" l-a platit pe "+FindPlayer(plr)+" cu $ "+cash);
				}
				else MSGPLR(MSG_ERROR_EN+"You don't have enough money!",player,MSG_ERROR_RO+"Nu ai destui bani!");
			}
			else MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");
			break;
		}
		case "createrace":
		{
			if(text == null){
				 CreateRace(player,100,rand() %16);
				 break;
			}
			if(GetTok(text," ",2) == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /createrace <cash> <id>",MSG_ERROR_RO+"Foloseste /createrace <cash> <id>");
				break;
			}
			else CreateRace(player,GetTok(text," ",1).tointeger(),GetTok(text," ",2).tointeger())
			break;
		}
		case "joinrace":
		{
			JoinRace(player);
			break;
		}
		case "start":
		{
			if(RACERS[0] == player.ID)
			{
				StartRace();
			}
			else MSGPLR(MSG_ERROR_EN+"You haven't created this race.",player,MSG_ERROR_RO+"Nu ai creat aceasta cursa.");
			break;
		}
		case "rot":
		{
			Message(player.Vehicle.Rotation+"");
			break;
		}
		case "gg":
		{
			if(ggstatus == 0)
			{
				if(PLAYERS[player.ID].Admin <3)
				{
					NotAdminError(player,3);
					return;
				}
				else GG_Start();
			}
			else GG_Join(player);
			break;			
		}
		case "eventbox":
		{
			if(PLAYERS[player.ID].Admin >= 3)
			{
				CreatePickup(405,0,1,player.Pos + Vector(0,5,0),255,true);
				MSG(RED+"**A event box was created in "+GetMapName(player.Pos.x,player.Pos.y)+"**",RED+"**Un event box a fost creat in "+GetMapName(player.Pos.x,player.Pos.y)+"**");
			}
			else NotAdminError(player,3);
			break;
		}
		case "fps":
		{
			MessagePlayer("[#FFFFFF]Your fps :"+player.FPS,player);
			break;
		}
		case "ping":
		{
			MessagePlayer("[#FFFFFF]Your ping :"+player.Ping,player);
			break;
		}
		case "battleroyale":
		{
		if(PLAYERS[player.ID].Admin >= 3)
		{
			BattleRoyaleOn = true;
			FindObject(0).SetAlpha(255,255);
			FindObject(0).MoveTo(Vector(80.5776,637.129,106),60000);
			BattleRoyaleTimer = 0;
			
			for(local i =0; i < 100 ; i++)
			{
				if(FindPlayer(i) != null)
				{
					FindPlayer(i).Eject();
					FindPlayer(i).Disarm();
					FindPlayer(i).Pos = Vector(163.279,-254.755,125.236);
					FindPlayer(i).World = 3;
					FindPlayer(i).GiveWeapon(102,999);
					FindPlayer(i).GiveWeapon(5,1);
				}
			}
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(173.67,424.206,10.0834),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(182.671,424.695,14.5821),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(191.321,419.943,9.04807),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(90.375,417.599,10.5125),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(99.8289,417.219,14.9408),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(99.7494,421.847,18.849),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(73.7188,441.46,14.2281),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(256.697,545.92,8.64096),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(162.628,228.993,11.9369),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(161.771,250.954,12.4549),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(93.9114,264.101,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(94.8004,261.281,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(95.9142,258.644,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(100.336,260.065,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(98.9439,262.977,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(97.79,265.958,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(79.9601,241.476,22.8047),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(52.2943,242.43,21.6643),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(34.8646,277.075,21.7554),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(23.4308,255.421,23.8963),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(52.0322,215.966,21.1394),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-10.4077,244.562,26.1283),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(14.9484,244.866,23.8963),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(53.5658,268.082,19.432),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(85.621,246.951,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(117.543,268.452,21.7719),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(97.9147,319.659,19.1541),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(91.2025,357.964,19.1542),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(163.9,365.69,19.1539),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(168.37,328.699,19.1539),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(130.736,342.927,19.1541),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(163.213,286.358,14.8861),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-7.51818,128.331,19.1406),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(209.206,540.227,14.5591),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(135.949,489.143,16.4235),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(88.487,573.11,14.5667),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(87.3453,565.116,18.5696),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(73.3973,599.452,14.9871),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(88.2716,573.237,14.5667),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(70.2403,599.487,14.5657),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(76.9132,579.778,14.567),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(80.767,581.607,14.5673),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(86.6946,564.464,14.5657),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(24.0572,483.767,10.7948),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-73.2048,555.647,11.1019),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-147.862,594.987,14.5356),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-106.308,467.662,6.76028),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-65.6176,472.311,8.81993),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-62.9885,471.11,8.73217),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-63.2693,469.261,8.70564),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-2.12499,486.054,10.5334),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(2.47897,458.282,10.7059),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(54.6445,-127.461,10.9295),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(31.9472,-177.227,7.86075),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(83.8743,-205.408,7.71608),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(11.3694,-230.959,10.3406),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-47.91,-195.279,9.85425),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(155.881,-162.708,9.57768),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(155.636,-142.828,10.9771),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(188.813,-87.1992,9.64876),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(158.208,-54.5484,9.415),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(132.886,-9.96546,12.9163),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(136.342,12.0994,9.32097),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(135.528,6.53985,9.32622),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(131.322,12.1634,9.33735),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(122.693,39.151,15.9355),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(89.4551,28.1283,15.9673),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(48.0877,18.3294,16.0081),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(43.3574,-14.1351,17.4036),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(0.142695,31.7481,21.3154),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(11.1267,54.2139,24.9607),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(18.5283,102.482,24.5802),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(56.3726,142.063,19.8259),255,true);
			if((rand() %3) < 2) CreatePickup(259+rand() % 34,3,rand() % 500,Vector(-9.84081,129.223,27.8716),255,true);
		}
		else NotAdminError(player,3);
		break;
		}
		case "exitplane":
		{
			if(player.World == 3) player.Pos.z -= 5;
			break;
		}
		case "killplayer":
		{
			if(PLAYERS[player.ID].Admin <3)
			{
				NotAdminError(player,3);
				return;
			}
			if(FindPlayer(text) == null) return;
			MSG(RED+"[KILL-A-PLAYER-EVENT]"+WHITE+"kill "+FindPlayer(text),RED+"[KILL-A-PLAYER-EVENT]"+WHITE+"omoara-l pe "+FindPlayer(text));
			killplrv <- FindPlayer(text).ID;
			break;
		}
		case "killjuggernaut":
		{
			if(PLAYERS[player.ID].Admin <3)
			{
				NotAdminError(player,3);
				return;
			}
			if(FindPlayer(text) == null) return;
			MSG(RED+"[KILL-A-JUGGERNAUT-EVENT]"+WHITE+"kill "+FindPlayer(text),RED+"[KILL-A-JUGGERNAUT-EVENT]"+WHITE+"omoara-l pe "+FindPlayer(text));
			killplrj <- FindPlayer(text).ID;
			FindPlayer(text).Skin = 230;
			FindPlayer(text).Armour = 255;
			jugg[FindPlayer(text).ID] = 6000;
			FindPlayer(text).Immunity = 64;
			FindPlayer(text).GiveWeapon(WEP_M60,1100);
			FindPlayer(text).GiveWeapon(18,66);
			FindPlayer(text).GiveWeapon(WEP_GRENADE,4);
			break;
		}
		case "quiz":
		{
			if(PLAYERS[player.ID].Admin <3)
			{
				NotAdminError(player,3);
				return;
			}
			QuizGenerator();
			break;
		}
		case "ticket":
		{
			if(DistanceFromPoint(player.Pos.x,player.Pos.y,-908.431, -330.697) > 3)
			{
				MSGPLR(MSG_ERROR_EN+"You must be at bank",player,MSG_ERROR_RO+"Trebuie sa fii la banca");
				return;
			}
			if(text != null) 
			{
			local a = LotteryJ(player,text)
			if(a == -1) return;
			if(a == 0) MSGPLR(MSG_ERROR_EN+"Use /ticket <1-10>",player,MSG_ERROR_RO+"Foloseste /ticket <1-10>");
			if(a == 1) MSGPLR(MSG_ERROR_EN+"Ticked taken by someone else.",player,MSG_ERROR_RO+"Tichet luat de altcineva.");
			if(a == 1) MSGPLR(MSG_ERROR_EN+"You need $ 1000.",player,MSG_ERROR_RO+"Ai nevoie de $ 1000.");
			}
			else MSGPLR(MSG_ERROR_EN+"Use /ticket <1-10>",player,MSG_ERROR_RO+"Foloseste /ticket <1-10>");
			break;
		}
		case "buycrate":
		{
			if(DistanceFromPoint(player.Pos.x,player.Pos.y,-908.431, -330.697) > 3)
			{
				MSGPLR(MSG_ERROR_EN+"You must be at bank",player,MSG_ERROR_RO+"Trebuie sa fii la banca");
				return;
			}
			if(player.Cash >= 10000000)
			{
				local a = ReadIniInteger(CRATES_FILE,CRATES,player.Name);
				a +=1;
				WriteIniInteger(CRATES_FILE,CRATES,player.Name,a);
				MSG(CRATE+player+" bought a crate",CRATE+player+" a cumparat un crate");
				player.Cash -= 10000000;
			}
			else MSGPLR(RED+"You need 10 000 000 $",player,RED+"Ai nevoie de 10 000 000 $");
			break;
		}
		case "opencrate":
		{
			Stream.StartWrite();
			Stream.WriteInt(24);
			Stream.SendStream(player);
			break;
		}
		case "admincmds":
		{
			MessagePlayer(RED+"LEVEL 6 CMDS :"+WHITE+" /exec, /scriptreload, /addadmin , /removeadmin /addrole",player);
			MessagePlayer(RED+"LEVEL 5 CMDS :"+WHITE+" /send-client-side-message, /inv ",player);
			MessagePlayer(RED+"LEVEL 4 CMDS :"+WHITE+" /bigann, /addcash, /addvip , /unban ",player);
			MessagePlayer(RED+"LEVEL 3 CMDS :"+WHITE+" /ban,  /bigann , /wantedlvl, /gg, /eventbox, /battleroyale, /killplayer, \n /killjuggernaut, /quiz",player);
			MessagePlayer(RED+"LEVEL 2 CMDS :"+WHITE+" /goto, /bring , /tcar, /kick",player);
			MessagePlayer(RED+"LEVEL 1 CMDS :"+WHITE+" /ann, /warn, /setfuel, /setnos,  /mute, /unmute",player);
			break;
		}
		case "mute":
		{
			if(PLAYERS[player.ID].Admin <1)
			{
				NotAdminError(player,1);
				return;
			}
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /mute <player>",player,MSG_ERROR_RO+"Foloseste /mute <player>");
				break;
			}
			local victim = FindPlayer(text);
			if(victim == null)
			{
				MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");	
				break;				
			}
			MUTED_ARR[victim.ID] = true;
			MSG(RED+player+" muted "+victim,RED+player+" a amutit "+victim);
			break;
		}
		case "unmute":
		{
			if(PLAYERS[player.ID].Admin <1)
			{
				NotAdminError(player,1);
				break;
			}
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /unmute <player>",player,MSG_ERROR_RO+"Foloseste /unmute <player>");
				break;
			}
			local victim = FindPlayer(text);
			if(victim == null)
			{
				MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");	
				break;				
			}
			MUTED_ARR[victim.ID] = false;
			MSG(RED+player+" unmuted "+victim,RED+player+" a de-amutit "+victim);
			break;
		}
		case "inv":
		{
			if(PLAYERS[player.ID].Admin <5)
			{
				NotAdminError(player,5);
				return;
			}
			try
			{
				if(FindPlayer(text))
				{
					local plr =  FindPlayer(text);
					if(plr == null ) plr = player;
					if(plr.Immunity == 0) plr.Immunity = -1;
					else plr.Immunity = 0;
				}
			}
			catch(e) { MessagePlayer(e,player) };
			break;
		}
		case "fuck":
		{
			local plr = FindPlayer(text);
			if(plr == null) 
			{
			MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista.");	
			break;
			}
			if(CheckpointColors(plr,RGB(255,0,255)))
			{
				if(plr.Name == player.Name)
				{
					Message(player+" gaaaaaaaaaaaaaaaaaaaay");
					break;
				}
				if(DistanceFromPoint(plr.Pos.x,plr.Pos.y,player.Pos.x,player.Pos.y) < 2)
				{
					player.SetAnim(3,192);
					player.Angle = plrAngle;
					plr.Cash += 500;
					UpdateClientSide(plr,-1,-1);
				}
				else MSGPLR(MSG_ERROR_EN+"You are too far from that player.",player,MSG_ERROR_RO+"Esti prea departe de jucator");
			}
			else MSGPLR(MSG_ERROR_EN+"That player isnt a bitch.",player,MSG_ERROR_RO+"Acel jucator nu e o curva");
			break;
		}
		case "tutorial":
		{
			TUTORIAL_Status[player.ID] = -1;
			Tutorial(player);
			break;
		}
		case "skiptutorial":
		{
			TUTORIAL_Status[player.ID] = 41;
			Tutorial(player);
			break;
		}
		case "stopserver":
		{
			if(PLAYERS[player.ID].Admin <6)
			{
				NotAdminError(player,6);
				return;
			}
			Message("[#ff0000]Server shutting down...");
			Discord_SendMessage("Server Stopping!");
			ShutdownServer();
			break;
		}
		case "warn":
		{
			if(PLAYERS[player.ID].Admin >= 1)
			{
				local victim = FindPlayer(GetTok(text," ",1));
				if(victim == null) 
				{
					MSGPLR(MSG_ERROR_EN+"This player does not exist.",player,MSG_ERROR_RO+"Acest jucator nu exista");
					break;
				}
				local reason = " ";
				if(GetTok(text," ",2) != null)
				{
					for(local i =1; i < 50; i++)
					{
						if(GetTok(text," ",i+1) != null)
						{
							reason += GetTok(text," ",i+1) + " ";
						}
					}
					MSG(RED+"Player "+victim+" was warned. Reason:"+reason,RED+"Jucatorul "+victim+" a fost avertizat. Motiv:"+reason);
					victim.Health = 0;
					victim.WantedLevel += 1;
				}
				else MSGPLR(MSG_ERROR_EN+"Use /warn <player> <reason>",player,MSG_ERROR_RO+"Foloseste /warn <player> <motiv>");
			}
			else NotAdminError(player,1);
			break;
		}
		case "createderby":
		{
			if(text == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /createderby <cash>",player,MSG_ERROR_RO+"Foloseste /createderby <bani>");
				break;
			}
			if(text.tointeger() == null)
			{
				MSGPLR(MSG_ERROR_EN+"Use /createderby <cash>",player,MSG_ERROR_RO+"Foloseste /createderby <bani>");
				break;
			}
			CreateDerby(player,text.tointeger());
			break;
		}
		case "derby":
		{
			EnterDerby(player,player.Vehicle);
			break;
		}
		case "startderby":
		{
			StartDerby(player);
			break;
		}
		case "robh":
		{
			if(text)
			{
				local owner = ReadIniString(PROPFILE,"prop",text);
				if(owner)
				{
					local x = ReadIniNumber(PROPFILE,owner,"propx");
					local y = ReadIniNumber(PROPFILE,owner,"propy");
					local z = ReadIniNumber(PROPFILE,owner,"propz");
					if(DistanceFromPoint(player.Pos.x,player.Pos.y,x,y) < 3)
					{
						player.Pos = InteriourPos(ReadIniInteger(INTERIOURF,INTERIOURC,owner));
						player.World = 200;
						JUCATORI[player.ID].LastRobbedHouse = Vector(x,y,z);
						MSGPLR(ROBBERY_EN+"Use /exit to exit",player,ROBBERY_RO+"Foloseste /exit ca sa iesi");
						MSGPLR(ROBBERY_EN+"Use /exit to exit",player,ROBBERY_RO+"Foloseste /exit ca sa iesi");
						MSGPLR(ROBBERY_EN+"Use /exit to exit",player,ROBBERY_RO+"Foloseste /exit ca sa iesi");
					}
					else MSGPLR(MSG_ERROR_EN+"You are too far from the house.",player,MSG_ERROR_RO+"Esti prea departe de casa.")
				}
				else MSGPLR(MSG_ERROR_EN+"This prop does not have a owner.",player,MSG_ERROR_RO+"Aceasta propietate nu are propietar xd.");
			}
			else MSGPLR(MSG_ERROR_EN+"Use /robh <prop>",player,MSG_ERROR_RO+"Foloseste /robh <casa>");
			break;
		}
		case "exit":
		{
			if(player.World == 200)
			{
				player.Pos = JUCATORI[player.ID].LastRobbedHouse;
				JUCATORI[player.ID].LastRobbedHouse = null;
				player.World = 0;
			}
			break;
		}
		default:
		{
			MSGPLR(MSG_ERROR_EN+"This command does not exist. See /help",player,MSG_ERROR_RO+"Aceasta comanda nu exista.");
			break;
		}
	}
	UpdateClientSide(player,-1,-1);
return 1;
}
	


function onClientScriptData(player)
{
	local integer = Stream.ReadInt();
	local str = Stream.ReadString();
	switch(integer)
	{
		case -1:
		{
			MSG(RED+"Player "+player+" is too stupid to log in lol.",RED+"Jucatorul "+player+" e prea prost ca sa se logheze lol.");
			player.Kick();
			break;
		}
		case 0:
		{
			if(Login(player,str) == true)
			{
				Stream.StartWrite();
				Stream.WriteInt(0);
				Stream.SendStream(player);
			}
			break;
		}
		case 1:
		{
			if(Register(player,GetTok(str," ",1),GetTok(str," ",2),GetTok(str," ",3)) == true)
			{
				Stream.StartWrite();
				Stream.WriteInt(1);
				Stream.SendStream(player);
			}
			else
			{
				Stream.StartWrite();
				Stream.WriteInt(2);
				Stream.SendStream(player);
			}
			break;
		}
		case 3:
		{
			switch(str)
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
					Curva(player);
					break;
				}
				default: break;
			}
			switch(GetTok(str," ",2))
			{
				case "bodyguard":
				{
					BodyGuard(player,FindPlayer(GetTok(GetTok(str," ",1),"'",1)));
					break;
				}
				case "hitman":
				{
					Hitman(player,FindPlayer(GetTok(GetTok(str," ",1),"'",1)));
					break;
				}
				default: break;
			}
			break;
		}
		case 4:
		{
			Stream.StartWrite();
			Stream.WriteInt(4);
			Stream.SendStream(player);
			break;
		}
		case 5:
		{
			local price = GetTok(str," ",2).tointeger();
			local modelid = GetTok(str," ",1).tointeger();
			local name = "";
			for(local i =3 ; i < 6; i++) 
			{
				if(GetTok(str," ",i) != null)
				{
					name += GetTok(str," ",i)+" ";
				}
			}
			if(player.Cash >= price)
			{
				if(SaveCar(FindVehicle(BCARID),player,true) == true)
				{
					MSG(CAR_EN+player+" bought car "+name,CAR_RO+player+" a cumparat masina "+name);
					player.Cash -= price;
					MessagePlayer(RED+"$ -"+price,player);
					CARBUYER = -1;
					CARINDEX = 130;
					FindVehicle(BCARID).Pos = Vector(-1010.25, -883.242, 12.8867);
					player.Vehicle = FindVehicle(BCARID);
					FindVehicle(BCARID).Locked = false;
					BCARID = -1;
					player.RestoreCamera();
					player.IsFrozen = false;
				}
				else
				{
					MSGPLR(MSG_ERROR_EN+"You reached the maximum of bought cars.",player,MSG_ERROR_RO+"Ai ajuns la limita de masini cumparate.");
					if(FindVehicle(BCARID)) FindVehicle(BCARID).Remove()
					CARBUYER = -1;
					BCARID = -1;
					CARINDEX = 130;
					player.RestoreCamera();
					player.IsFrozen = false;
				}
			}
			else
			{
				if(FindVehicle(BCARID)) FindVehicle(BCARID).Remove();
				MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
				CARBUYER = -1;
				BCARID = -1;
				CARINDEX = 130;
				player.RestoreCamera();
				player.IsFrozen = false;
			}
			Stream.StartWrite();
			Stream.WriteInt(6);
			Stream.SendStream(player);
			break;
		}
		case 7:
		{
			if(player.Weapon == 102)
			{
				if(player.Health < 100)
				{
					player.Health = 100;
					MEDICARR[player.ID] -= 1;
					if(MEDICARR[player.ID] <= 0) player.RemoveWeapon(102);
					MSGPLR(WHITE+"Medkits remaining:"+MEDICARR[player.ID],player,WHITE+"Medkit-uri ramase:"+MEDICARR[player.ID]);
					return;
				}
			}
			if(CheckpointColors(player,MEDICCOLOR) ==true)
			{
				if(player.Weapon == 102)
				{
					local healed = -1;
					for(local i = 0 ; i < 100 ; i++)
					{
						if(FindPlayer(i) == null) continue;
						if(i == player.ID) continue;
						if(FindPlayer(i).Health > 99) continue;
						local min = 1000000;
						local dist = DistanceFromPoint(player.Pos.x,player.Pos.y,FindPlayer(i).Pos.x,FindPlayer(i).Pos.y);
						if(dist < min)
						{
							min = dist;
							healed = i;
						}
					}
					if(healed == -1) return;
					local plr = FindPlayer(healed);
					if(plr.Health < 100)
					{
						local reward = (100 - plr.Health) * 100;
						MessagePlayer(GREEN+"$ +"+reward,player);
						MEDICARR[player.ID] -= 1;
						if(MEDICARR[player.ID] <= 0) player.RemoveWeapon(102);
						MSGPLR(WHITE+"Medkits remaining:"+MEDICARR[player.ID],player,WHITE+"Medkit-uri ramase:"+MEDICARR[player.ID]);
						player.Cash += reward;
						plr.Health = 100;
					}
				}
				else MSGPLR(MSG_ERROR_EN+"You need to have the medkit.",player,MSG_ERROR_RO+"Trebuie sa ai medkitul.");
				return;
			}
			if(CheckpointColors(player,COPCOLOR) == true)
			{
				if(player.Vehicle == null)
				{
					if(player.Weapon == 100)
					{
						for(local i =0 ; i < 100; i++)
						{
							local plr = FindPlayer(i);
							if(plr != null)
							{
								if(plr.WantedLevel >0)
								{	
									if(DistanceFromPoint(player.Pos.x,player.Pos.y,plr.Pos.x,plr.Pos.y) < 3)
									{
										Arrest(plr,player);
										break;
									}
								}
							}	
						}
					}
					else MSGPLR(MSG_ERROR_EN+"You need to have the cuffs.",player,MSG_ERROR_RO+"Trebuie sa ai catusele.");
				}
				else MSGPLR(MSG_ERROR_EN+"You can't arrest someone in a car.",player,MSG_ERROR_RO+"Nu poti aresta pe nimeni cat timp esti in masina.");
			}
			if(CheckpointColors(player,FIRECOLOR) == true)
			{
				if(player.Vehicle == null)
				{
					MSGPLR(MSG_ERROR_EN+"You are not in a firetruck!",player,MSG_ERROR_EN+"Nu esti intr-o masina de pompieri!");
					return;
				}
				if(player.Vehicle.Model == VEH_FIRETRUCK)
				{
					if(FIREPOS == null) return;
					if(DistanceFromPoint(player.Pos.x,player.Pos.y,FIREPOS.x,FIREPOS.y) < 10)
					{
						MSG(FIRE_EN+"Fire was stopped by "+player,FIRE_RO+"Focul a fost oprit de "+player);
						local reward = 5000 + rand() % 25000;
						MessagePlayer(GREEN+"$ + "+reward,player);
						player.Cash += reward;
						TurnOffFire();
					}
					else MSGPLR(MSG_ERROR_EN+"You are too far from the fire!",player,MSG_ERROR_EN+"Esti prea departe de incendiu!");
				}
				else MSGPLR(MSG_ERROR_EN+"You are not in a firetruck!",player,MSG_ERROR_EN+"Nu esti intr-o masina de pompieri!");
			}
			if(CheckpointColors(player,MECHANICC))
			{
				if(player.Vehicle != null)
				{
					if(player.Vehicle.Health < 1000)
					{
						if(player.Weapon == 7)
						{
							local reward = (1000 - player.Vehicle.Health) * 10;
							reward = reward.tointeger();
							player.Cash += reward;
							MessagePlayer(GREEN+"$+ "+reward,player);
							
							CARREPAIRS[player.ID] -= 1;
							player.Vehicle.Fix();
							if(CARREPAIRS[player.ID] <= 0)
							{
								player.RemoveWeapon(7);
								MSGPLR(BLUE+"Go restock your hammers at the job point.",player,BLUE+"Du-te si mai ia ciocane de la locul angajarii.");
							}
						}
						else MSGPLR(RED+"You must have the hammer!",player,RED+"Trebuie sa ai ciocanul!");
					}
					else MSGPLR(RED+"This vehicle isn't broken!",player,RED+"Masina aceasta nu e deloc distrusa!");

				}
				else MSGPLR(RED+"You must be in a vehicle to fix a car!",player,RED+"Trebuie sa fii intro masina ca s-o repari.");
			}
			break;
		}
		case 8:
		{
			local dist = 100;
			local winner = -1;
			if(chaseplayer == -1) return;
			for(local i =0 ; i < 100 ; i++)
			{
				local plr = FindPlayer(i);
				if(plr != null)
				{
					if(CheckpointColors(plr,COPCOLOR))
					{
						if(plr.Vehicle != null)
						{
							if(IsCopCar(plr.Vehicle))
							{
								local distance = DistanceFromPoint(plr.Pos.x,plr.Pos.y,FindPlayer(chaseplayer).Pos.x,FindPlayer(chaseplayer).Pos.y)
								if(distance < dist)
								{
									dist = distance;
									winner = i;
								}
							}
						}
					}
				}
			}
			if(winner >= 0)
			{
				Announce("~o~BUSTED",FindPlayer(chaseplayer),3);
				MSG(CHASE_EN+FindPlayer(chaseplayer)+" was caught.",CHASE_RO+FindPlayer(chaseplayer)+" a fost prins.");
				Arrest(FindPlayer(chaseplayer),FindPlayer(winner));
				Stream.StartWrite();
				Stream.WriteInt(9);
				Stream.SendStream(FindPlayer(chaseplayer));
				chaseplayer = -1
			}
			break;
		}
		case 9:
		{
			if(chaseplayer == -1) return;
			Stream.StartWrite();
			Stream.WriteInt(9);
			Stream.SendStream(FindPlayer(chaseplayer));
			Announce("~b~EVADED",FindPlayer(chaseplayer),3);
			MSG(CHASE_EN+FindPlayer(chaseplayer)+" escaped.",CHASE_RO+FindPlayer(chaseplayer)+" a scapat.");
			chaseplayer = -1;
		}
		case 10:
		{
			if(player.Vehicle != null)
			{
				if(player.Vehicle.Model == 6427)
				{
					break;
				}
				if(IsVehHeli(player.Vehicle)) break;
				local nos = ReadIniInteger(NOSFILE,NOS,player.Vehicle.ID+"");
				nos -= 1;
				if(nos < 0) nos = 0;
				WriteIniInteger(NOSFILE,NOS,player.Vehicle.ID+"",nos);
				if(!(nos <= 0))
				{
					if(player.Vehicle.Model < 6000)
					{
						player.Vehicle.SetHandlingData(14, player.Vehicle.GetHandlingData(14) + 100.0);
						player.Vehicle.SetHandlingData(13,player.Vehicle.GetHandlingData(13)+ 100);
					}
					else
					{
						player.Vehicle.SetHandlingData(14, player.Vehicle.GetHandlingData(14) + 300.0);
						player.Vehicle.SetHandlingData(13,player.Vehicle.GetHandlingData(13)+ 300);	
					}
					player.Vehicle.Lights = true;
					PlaySound(0,64,player.Pos);
					PlaySound(0,65,player.Pos);
				}
				else MSGPLR(RED+"No more NO2",player,RED+"Nu mai ai NO2");
			}
			break;
		}
		case 11:
		{
			if(player.Vehicle != null)
			{
				player.Vehicle.ResetHandlingData(14);
				player.Vehicle.ResetHandlingData(13);
				player.Vehicle.Lights = false;
				local nos = ReadIniInteger(NOSFILE,NOS,player.Vehicle.ID+"");
				nos -= 1;
				if(nos < 0) nos = 0;
				WriteIniInteger(NOSFILE,NOS,player.Vehicle.ID+"",nos);
			}
			break;
		}
		case 12:
		{
			player.Skin -= 1;
			if(player.Skin == 0) player.Skin = 184;
			if(player.Skin == 185) player.Skin = 200;
			if(player.Skin == 199) player.Skin = 185;
			if(player.Skin == 212) player.Skin = 1;
			break;
		}
		case 13:
		{
			player.Skin += 1;
			if(player.Skin == 0) player.Skin = 212;
			if(player.Skin == 186) player.Skin = 200;
			if(player.Skin == 199) player.Skin = 185;
			if(player.Skin == 212) player.Skin = 1;
			break;
		}
		case 14:
		{
			if(player.Cash >= 100000)
			{
				MSG(BLUE+player+" bought skin "+player.Skin,BLUE+player+" a cumparat skinul "+player.Skin);
				WriteIniInteger(SKINFILE,SKIN,player.Name,player.Skin);
				player.Cash -= 100000;
				MessagePlayer(RED+"$ -100000",player);
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		}
		case 15:
		{
			if(player.Cash >= foodprice(str.tointeger()))
			{
				player.Cash -= foodprice(str.tointeger());
				if(player.Health < 100) player.Health += 1;
				local hunger = ReadIniInteger(HUNGERFILE,HUNGER,player.Name);
				hunger += foodhunger(str.tointeger());
				if(hunger > 100) hunger = 100;
				WriteIniInteger(HUNGERFILE,HUNGER,player.Name,hunger);
				MessagePlayer(RED+"$ -"+foodprice(str.tointeger()),player);
				UpdateClientSide(player,-1,hunger);
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		}
		case 16:
		{
			if(player.Cash >= 2000)
			{
				local owner = ReadIniString(CAROWNERFILE,CAROWNER,player.Vehicle.ID+"");
				if(owner == player.Name)
				{
					player.Vehicle.Colour1 = rand() % 92;
					player.Cash -= 2000;
					MessagePlayer(RED+"$ -2000",player);
				}
				else MSGPLR(MSG_ERROR_EN+"This vehicle isnt yours.",player,MSG_ERROR_RO+"Acest vehicul nu este al tau");
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		}
		case 17:
		{
			if(player.Cash >= 20000)
			{
				local hp = player.Vehicle.Health;
				player.Vehicle.Fix();
				if(hp > 1000) player.Vehicle.Health = hp;
				player.Cash -= 20000;
				MessagePlayer(RED+"$ -20000",player);
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		}
		case 18:
		{
			if(player.Cash >= 100)
			{
				local fuel = ReadIniInteger(FUELFILE,FUEL,player.Vehicle.ID+"")
				fuel += 10;
				if(fuel > 100) fuel = 100;
				WriteIniInteger(FUELFILE,FUEL,player.Vehicle.ID+"",fuel);
				player.Cash -= 100;
				player.Vehicle.ResetHandlingData(14);
				player.Vehicle.ResetHandlingData(13);
				MessagePlayer(RED+"$ -100",player);
			}
			else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			break;
		} 
		case 19:
		{
			if(player.Vehicle != null)
			{
				player.Vehicle.Colour1 += 1;
			}
			break;
		}
		case 20:
		{
			if(player.Vehicle != null)
			{
				player.Vehicle.Colour1 -= 1;
			}
			break;
		}
		case 21:
		{
			if(player.Vehicle != null)
			{
				if(player.Cash >= 20000)
				{
					WriteIniInteger(C1FILE,C1,player.Vehicle.ID+"",player.Vehicle.Colour1);
					MessagePlayer(RED+"$ -20000",player);
					player.Cash -= 20000
				}
				else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			}
			break;
		}
		case 22:
		{
			if(player.Vehicle != null)
			{
				player.Vehicle.Colour2 += 1;
			}
			break;
		}
		case 23:
		{
			if(player.Vehicle != null)
			{
				player.Vehicle.Colour2 -= 1;
			}
			break;
		}
		case 24:
		{
			if(player.Vehicle != null)
			{
				if(player.Cash >= 20000)
				{
					WriteIniInteger(C2FILE,C2,player.Vehicle.ID+"",player.Vehicle.Colour2);
					MessagePlayer(RED+"$ -10000",player);
					player.Cash -= 10000
				}
				else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			}
			break;
		}
		case 25:
		{
			if(player.Vehicle != null)
			{
				
				if(player.Cash >= 50000)
				{
					player.Vehicle.Fix();
					player.Vehicle.Health = 50000;
					MessagePlayer(RED+"$ -50000",player);
					player.Cash -= 50000
				}
				else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			}
			break;
		}
		case 26:
		{
			if(player.Vehicle != null)
			{
				if(player.Cash >= 5000)
				{
					local nos = ReadIniInteger(NOSFILE,NOS,player.Vehicle.ID+"");
					nos += 10;
					if(nos >= 1000) nos = 1000;
					WriteIniInteger(NOSFILE,NOS,player.Vehicle.ID+"",nos);
					
					MessagePlayer(RED+"$ -5000",player);
					player.Cash -= 5000
				}
				else MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
			}
			break;
		}
		case 30:
		{
			if(CARBUYER != -1)
			{
				CARINDEX -= 1;
				CARINDEX = ValidateIndex(CARINDEX,-1)
				if(BCARID != -1) 
				{
					if(FindVehicle(BCARID)) FindVehicle(BCARID).Remove();
				}
				local veh = CreateVehicle(CARINDEX,0,Vector(-1023.18, -864.025, 18.0625),player.Angle,1,1);
				veh.Locked = true;
				if(veh != null)
				{
					BCARID = veh.ID;
					player.IsFrozen = true;
					player.Pos = Vector(-1037.14, -850.435, 17.5728);
					player.SetCameraPos(Vector(-1008.84, -861.698, 17.9541),Vector(-1023.18, -864.025, 18.0625)); 
				}
				else 
				{
					Message(RED+"Error. CreateVehicle() returned null. case 30, function onClientScriptData().");
					try { 
						if(FindVehicle(BCARID))
						{
							FindVehicle(BCARID).Remove();
						}
					}
					catch(e) { }
				}
			}
			break;
		}
		case 31:
		{
			if(CARBUYER != -1)
			{
				CARINDEX += 1;
				CARINDEX = ValidateIndex(CARINDEX,1)
				if(BCARID != -1) 
				{
					if(FindVehicle(BCARID)) FindVehicle(BCARID).Remove();
				}
				local veh = CreateVehicle(CARINDEX,0,Vector(-1023.18, -864.025, 18.0625),player.Angle,1,1);
				veh.Locked = true;
				if(veh != null)
				{
					BCARID = veh.ID;
					player.IsFrozen = true;
					player.Pos = Vector(-1037.14, -850.435, 17.5728);
					player.SetCameraPos(Vector(-1008.84, -861.698, 17.9541),Vector(-1023.18, -864.025, 18.0625)); 
				}
				else 
				{
					Message(RED+"Error. CreateVehicle() returned null. case 30, function onClientScriptData().");
					try { 
						if(FindVehicle(BCARID))
						{
							FindVehicle(BCARID).Remove();
						}
					}
					catch(e) { }
				}
			}
			break;
		}
		case 32:
		{
			if(CARBUYER != -1)
			{
				FindPlayer(CARBUYER).RestoreCamera();
				if(FindVehicle(BCARID)) FindVehicle(BCARID).Remove();
				CARBUYER = -1;
				BCARID = -1;
				CARINDEX = 130;
				player.IsFrozen = false;
			}
			break;
		}
		case 27:
		{
			local wepid = GetTok(str," ",1).tointeger();
			local weppr = GetTok(str," ",2).tointeger();
			if(player.Cash < weppr)
			{
				MSGPLR(RED+"You don't have enough money.",player,RED+"Nu ai destui bani.");
				break;
			}
			if(wepid < 121)
			{
				if((wepid == 33) || (wepid == 105) || (wepid == 106))
				{
					if((ReadIniInteger(VIPBRONZE,VIP,player.Name) != 0) || 
					(ReadIniInteger(VIPSILVER,VIP,player.Name) != 0) ||
					(ReadIniInteger(VIPGOLD,VIP,player.Name) != 0) ||
					(ReadIniInteger(VIPEMERALD,VIP,player.Name) != 0))
					{
						player.Cash -= weppr;
						MessagePlayer(RED+"$ -"+weppr,player);
						player.GiveWeapon(wepid,WepClip(wepid) * 11);
					}
					else MSGPLR(RED+"You must be VIP!",player,RED+"Trebuie sa fii VIP!");
				}
				else
				{
					local ammo = WepClip(wepid) * 11;
					if(WepClip(wepid) == -1) ammo = 1;
					player.Cash -= weppr;
					MessagePlayer(RED+"$ -"+weppr,player);
					player.GiveWeapon(wepid,ammo);
				}
			}
			else if(wepid == 121)
			{
				player.Armour = 100;
				player.Cash -= weppr;
				MessagePlayer(RED+"$ -"+weppr,player);
			}
			else if(wepid == 122)
			{
				player.Skin = 230;
				player.Armour = 255;
				jugg[player.ID] = 6000;
				player.Immunity = 64;
				MessagePlayer(RED+"$ -"+weppr,player);
				MSG(WHITE+"Player "+player+" bought a Juggernaut armour",WHITE+"Jucatorul "+player+" a cumparat o armura de tip Juggernaut");
				player.GiveWeapon(WEP_M60,1100);
				player.GiveWeapon(18,66);
				player.GiveWeapon(WEP_GRENADE,4);
			}
			if((wepid == 113) || (wepid == 109))
			{
				GL_PLR_ARRAY[player.ID] += 11;
				MSGPLR(WHITE+"40mm Grenades: "+GL_PLR_ARRAY[player.ID],player,WHITE+"Grenazi de 40 mm:"+GL_PLR_ARRAY[player.ID]);
			}
			break;
		}
		case 28:
		{
			if(GL_PLR_ARRAY[FindPlayer(GetTok(str," ",4)).ID] > 0)
			{
				if(GetTok(str," ",1) != "0")
				{
					CreateExplosion(0,3,Vector(GetTok(str," ",1).tofloat(),GetTok(str," ",2).tofloat(),GetTok(str," ",3).tofloat()) ,FindPlayer(GetTok(str," ",4)).ID,false);
					GL_PLR_ARRAY[FindPlayer(GetTok(str," ",4)).ID] -= 1;
					MSGPLR(WHITE+"40mm Grenades: "+GL_PLR_ARRAY[FindPlayer(GetTok(str," ",4)).ID],FindPlayer(GetTok(str," ",4)),WHITE+"Grenazi de 40 mm:"+GL_PLR_ARRAY[FindPlayer(GetTok(str," ",4)).ID]);
				}
			}
			break;
		}
		case 29:
		{
			if(DistanceFromPoint( SpawnPointVector(player).x, SpawnPointVector(player).y, player.Pos.x, player.Pos.y) < 3)
			{
				player.World = 2+player.ID;
				player.Pos = InteriourPos(ReadIniInteger(INTERIOURF,INTERIOURC,player.Name));
				MSGPLR(WHITE+"Entered interiour. Use "+RED+"/home to exit.",player,WHITE+"Ai intrat in casa. Foloseste "+RED+"/home ca sa iesi");
			}
			break;
		}
		case 33:
		{
			ChangeInteriour(player,false);
			break;
		}
		case 34:
		{
			ChangeInteriour(player,true);
			break;
		}
		case 35:
		{
			player.RestoreCamera();
			SaveInteriour(player);
			Stream.StartWrite();
			Stream.WriteInt(23);
			Stream.SendStream(player);
			break;
		}
		case 36:
		{
			Stream.StartWrite();
			Stream.WriteInt(23);
			Stream.SendStream(player);
			player.RestoreCamera();
		}
		case 37:
		{
			local a = ReadIniInteger(CRATES_FILE,CRATES,player.Name);
			if(!a)
			{
				MSGPLR(MSG_ERROR_EN+"You dont have any crates!",player,MSG_ERROR_RO+"Nu ai nici un crate!");
				break;
			}
			local d = 0;
			switch(GetTok(str," ",1).tointeger())
			{
				case 0:
				{
					local b = GetTok(str," ",2).tointeger();
					if(b)
					{
						local c = rand() % 31;
						local cash = GetVehCash(GetVehName(6400+c));
						MSGPLR(CRATE+"You won cash for a "+GetVehName(6400+c),player,CRATE+"Ai castigat bani pentru un "+GetVehName(6400+c));
						player.Cash += cash;
					}
					else
					{
						local c = rand() % 100;
						while(GetVehCash(GetVehName(130+c)) == null)
						{
							c = rand() % 100;
						}
						local cash = GetVehCash(GetVehName(130+c));
						MSGPLR(CRATE+"You won cash for a "+GetVehName(6400+c),player,CRATE+"Ai castigat bani pentru un "+GetVehName(6400+c));
						player.Cash += cash;
					}
					break;
				}
				case 1:
				{
					MSGPLR(CRATE+"You won VIP Bronze for 1 hour!",player,CRATE+"Ai castigat VIP Bronz pentru o ora!");
					local cvip = ReadIniInteger(VIPBRONZE,VIP,player.Name);
					cvip += 60;
					WriteIniInteger(VIPBRONZE,VIP,player.Name,cvip);
					break;
				}
				case 2:
				{
					MSGPLR(CRATE+"You won VIP Bronze for 1 day!",player,CRATE+"Ai castigat VIP Bronz pentru o zi!");
					local cvip = ReadIniInteger(VIPBRONZE,VIP,player.Name);
					cvip += 1440;
					WriteIniInteger(VIPBRONZE,VIP,player.Name,cvip);
					break;
				}
				case 3:
				{
					MSGPLR(CRATE+"You won VIP Bronze for 1 week!",player,CRATE+"Ai castigat VIP Bronz pentru o saptamana!");
					local cvip = ReadIniInteger(VIPBRONZE,VIP,player.Name);
					cvip += 1080;
					WriteIniInteger(VIPBRONZE,VIP,player.Name,cvip);
					break;
				}
				case 4:
				{
					MSGPLR(CRATE+"You won VIP Bronze for 1 month!",player,CRATE+"Ai castigat VIP Bronz pentru o luna!");
					local cvip = ReadIniInteger(VIPBRONZE,VIP,player.Name);
					cvip += 43200;
					WriteIniInteger(VIPBRONZE,VIP,player.Name,cvip);
					break;
				}
				case 5:
				{
					MSGPLR(CRATE+"You won VIP Silver for 1 hour!",player,CRATE+"Ai castigat VIP Argint pentru o ora!");
					local cvip = ReadIniInteger(VIPSILVER,VIP,player.Name);
					cvip += 60;
					WriteIniInteger(VIPSILVER,VIP,player.Name,cvip);
					break;
				}
				case 6:
				{
					MSGPLR(CRATE+"You won VIP Silver for 1 day!",player,CRATE+"Ai castigat VIP Argint pentru o zi!");
					local cvip = ReadIniInteger(VIPSILVER,VIP,player.Name);
					cvip += 1440;
					WriteIniInteger(VIPSILVER,VIP,player.Name,cvip);
					break;
				}
				case 7:
				{
					MSGPLR(CRATE+"You won VIP Silver for 1 week!",player,CRATE+"Ai castigat VIP Argint pentru o saptamana!");
					local cvip = ReadIniInteger(VIPSILVER,VIP,player.Name);
					cvip += 1080;
					WriteIniInteger(VIPSILVER,VIP,player.Name,cvip);
					break;
				}
				case 8:
				{
					MSGPLR(CRATE+"You won VIP Silver for 1 month!",player,CRATE+"Ai castigat VIP Argint pentru o luna!");
					local cvip = ReadIniInteger(VIPSILVER,VIP,player.Name);
					cvip += 43200;
					WriteIniInteger(VIPSILVER,VIP,player.Name,cvip);
					break;
				}
				case 9:
				{
					MSGPLR(CRATE+"You won VIP Gold for 1 hour!",player,CRATE+"Ai castigat VIP Aur pentru o ora!");
					local cvip = ReadIniInteger(VIPGOLD,VIP,player.Name);
					cvip += 60;
					WriteIniInteger(VIPGOLD,VIP,player.Name,cvip);
					break;
				}
				case 10:
				{
					MSGPLR(CRATE+"You won VIP Gold for 1 day!",player,CRATE+"Ai castigat VIP Aur pentru o zi!");
					local cvip = ReadIniInteger(VIPGOLD,VIP,player.Name);
					cvip += 1440;
					WriteIniInteger(VIPGOLD,VIP,player.Name,cvip);
					break;
				}
				case 11:
				{
					MSGPLR(CRATE+"You won VIP Gold for 1 week!",player,CRATE+"Ai castigat VIP Aur pentru o saptamana!");
					local cvip = ReadIniInteger(VIPGOLD,VIP,player.Name);
					cvip += 1080;
					WriteIniInteger(VIPGOLD,VIP,player.Name,cvip);
					break;
				}
				case 12:
				{
					MSGPLR(CRATE+"You won VIP Gold for 1 month!",player,CRATE+"Ai castigat VIP Aur pentru o luna!");
					local cvip = ReadIniInteger(VIPGOLD,VIP,player.Name);
					cvip += 43200;
					WriteIniInteger(VIPGOLD,VIP,player.Name,cvip);
					break;
				}
				case 13:
				{
					MSGPLR(CRATE+"You won VIP Emerald for 1 hour!",player,CRATE+"Ai castigat VIP Smarald pentru o ora!");
					local cvip = ReadIniInteger(VIPEMERALD,VIP,player.Name);
					cvip += 60;
					WriteIniInteger(VIPEMERALD,VIP,player.Name,cvip);
					break;
				}
				case 14:
				{
					MSGPLR(CRATE+"You won VIP Emerald for 1 day!",player,CRATE+"Ai castigat VIP Smarald pentru o zi!");
					local cvip = ReadIniInteger(VIPEMERALD,VIP,player.Name);
					cvip += 1440;
					WriteIniInteger(VIPEMERALD,VIP,player.Name,cvip);
					break;
				}
				case 15:
				{
					MSGPLR(CRATE+"You won VIP Emerald for 1 week!",player,CRATE+"Ai castigat VIP Smarald pentru o saptamana!");
					local cvip = ReadIniInteger(VIPEMERALD,VIP,player.Name);
					cvip += 1080;
					WriteIniInteger(VIPEMERALD,VIP,player.Name,cvip);
					break;
				}
				case 16:
				{
					MSGPLR(CRATE+"You won VIP Emerald for 1 month!",player,CRATE+"Ai castigat VIP Smarald pentru o luna!");
					local cvip = ReadIniInteger(VIPEMERALD,VIP,player.Name);
					cvip += 43200;
					WriteIniInteger(VIPEMERALD,VIP,player.Name,cvip);
					break;
				}
				case 17:
				{
					MSGPLR(CRATE+"You won an admin level 1: Moderator",player,CRATE+"Ai castigat admin level 1: Moderator");
					if(ReadIniInteger(ADMINFILE,ADMIN,player.Name) == 0)
					{
						WriteIniInteger(ADMINFILE,ADMIN,player.Name,1);
					}
					else MSGPLR(CRATE+"Oops, you are already an admin. What a waste of money.",player,
					CRATE+"Opps, esti deja admin, ce risipa de bani.");
					break;
				}
				case 18:
				{
					MSGPLR(CRATE+"You won the maximum number of money an 32-bit integer can hold",player,CRATE+"Ai castigat bani cat un integer de 32 de biti poate sa tina.");
					player.Cash = 0x7fffffff;
					break;
				}
				case 19:
				{
					MSGPLR(CRATE+"You 2 crates!",player,CRATE+"Ai castigat 2 crate-uri!");
					d = 3;
					break;
				}
				case 20:
				{
					MSGPLR(CRATE+"You won 10 crates!",player,CRATE+"Ai castigat 10 crate-uri!")
					d = 11;
					break;
				}
			}
			a -= 1;
			a += d;
			WriteIniInteger(CRATES_FILE,CRATES,player.Name,a);
			MSGPLR(CRATE+"Crates ramaining:"+a,player,CRATE+"Crate-uri ramase "+a);
		}
		default: break;
	}
	UpdateClientSide(player,-1,-1);
}
CARBUYER <- -1;
CARINDEX <- 130;
BCARID <- -1;
jugg <- array(100,0);
function ValidateIndex(id,counter_st)
{
	if(id == 129) id = 6431;
	if(id == 237) id = 6400;
	if(id == 6399) id = 236;
	if(id == 6432) id = 130;
	
	if(id == 165) id += counter_st;
	if(id == 180)
	{
		if(counter_st == 1)
		{
			id = 182;
		}
		if(counter_st == -1)
		{
			id = 179;
		}
	}
	if(id == 181)
	{
		if(counter_st == 1)
		{
			id = 182;
		}
		if(counter_st == -1)
		{
			id = 179;
		}
	}
	return id;
}
GL_PLR_ARRAY <- array(100,0);

function TXTAddLine(filename, text)
{
	
}
