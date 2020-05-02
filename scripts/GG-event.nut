ggstatus <- 0;
ggplrs <- array(100,-1);
function GG_Start()
{
	if(ggstatus == 0)
	{
		MSG(RED+"[DM-GG]"+WHITE+" event was created. Join with /gg",RED+"[DM-GG]"+WHITE+" eventul a fost creat. Intra cu /gg");
		ggstatus = 1;
	}
}
function GG_Join(player)
{
	if(ggstatus == 1)
	{
		for(local i =0 ; i < 100 ; i++)
		{
			if(ggplrs[i] == -1)
			{
				ggplrs[player.ID] = 1;
				player.Disarm();
				player.GiveWeapon(17,9999);
				player.Health= 100;
				player.Pos = Vector(-905.27, 390.428, 11.1829);
				MSG(RED+"[DM-GG]"+WHITE+player+" joined.",RED+"[DM-GG]"+WHITE+player+" a intrat.");
				MSGPLR(RED+"[DM-GG]"+WHITE+"Use /leavegg to exit",player,RED+"[DM-GG]"+WHITE+"Foloseste /leavegg sa iesi.");
				break;
			}
		}
	}
	else MSGPLR(RED+"Event not started.",player,RED+"Nu a inceput niciun event dmgg.");
}
function GG_LVL(lvl)
{
	if(lvl == 1) return 17;
	if(lvl == 2) return 18;
	if(lvl == 3) return 19;
	if(lvl == 4) return 20;
	if(lvl == 5) return 21;
	if(lvl == 6) return 22;
	if(lvl == 7) return 23;
	if(lvl == 8) return 24;
	if(lvl == 9) return 25;
	if(lvl == 10) return 26;
	if(lvl == 11) return 27;
	if(lvl == 12) return 28;
	if(lvl == 13) return 29;
	if(lvl == 14) return 30;
	if(lvl == 15) return 31;
	if(lvl == 16) return 32;
	if(lvl == 17) return 33;
	if(lvl == 18) return 103;
	if(lvl == 19) return 104;
	if(lvl == 20) return 105;
	if(lvl == 21) return 106;
	if(lvl == 22) return 107;
	if(lvl == 23) return 108;
	if(lvl == 24) return 12;
	if(lvl == 25) return 13;
	if(lvl == 26) return 14;
	if(lvl == 27) return 15;
	if(lvl >= 28) return 11;
}
function GG_Update(player,status)
{
	if(ggstatus != 0)
	{
		if(ggplrs[player.ID] == -1) return;
		if(status == "died")
		{
			ggplrs[player.ID] -= 1;
			if(ggplrs[player.ID] < 1) ggplrs[player.ID] = 1;
			MessagePlayer(RED+"OOF!",player);
			PlaySound(0,50002,player.Pos);
			MSG(RED+"[DM-GG]"+WHITE+player+"Lost an level.",RED+"[DM-GG]"+WHITE+player+" a pierdut un nivel.");
		}
		if(status == "killer")
		{
			ggplrs[player.ID] += 1;
			if(ggplrs[player.ID] < 28) PlaySound(0,50001,player.Pos);
		}
		for(local i =0; i< 100 ; i++)
		{
			if(ggplrs[i] != -1)
			{
				if(FindPlayer(i) == null) continue;
				FindPlayer(i).Disarm();
				FindPlayer(i).GiveWeapon(GG_LVL(ggplrs[i]),9999);
			}
			if(ggplrs[i] >= 28)
			{
				PlaySound(0,50003,FindPlayer(i).Pos);
				MSG(RED+"[DM-GG]"+WHITE+FindPlayer(i)+" Reached the last level!",RED+"[DM-GG]"+WHITE+FindPlayer(i)+" a ajuns la ultimul nivel!");
			}
			if(ggplrs[i] >= 29) GG_Finish(FindPlayer(i));
		}
		MessagePlayer(BLUE+"Level:"+ggplrs[player.ID],player);
	}
}
function GG_Finish(winner)
{
	MSG(RED+"[DM-GG]"+WHITE+winner+" won!",RED+"[DM-GG]"+WHITE+winner+" a castigat!");
	winner.Cash += 150000;
	MessagePlayer(GREEN+" $ + 150000",winner);
	ggstatus = 0;
	for(local  i =0; i < 100; i++)
	{
		ggplrs[i] = -1;
	}
	ggstatus = 0;
}
function GG_Respawn(player)
{
	if(ggplrs[player.ID] == -1) return;
	if(ggstatus != 0)
	{
		player.Disarm();
		player.GiveWeapon(GG_LVL(ggplrs[player.ID]),9999);
		player.Pos = Vector(-905.27, 390.428, 11.1829);
	}
}