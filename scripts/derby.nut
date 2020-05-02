DERBY_WORLD <- 10;
DERBY_St <- 0;
DERBY_Cash <- 0;

DERBY_CARS <- array(4,-1);
DERBY_PLRS <- array(4,-1);
DERBY_STARTER <- 0;

DERBYM <- RED+"[DERBY]"+WHITE;

function EnterDerby(player,vehicle)
{
	if(DERBY_St == 1)
	{
		if(vehicle == null) MSGPLR(RED+"You are not in a car",player,RED+"Nu esti intr-o masina");
		else
		{
			if(player == null) return false;
			else
			{
				for(local i =0; i < 4;i++)
				{
					if(DERBY_CARS[i] == -1)
					{
						local v = player.Vehicle;
						player.Vehicle.World = DERBY_WORLD;
						player.World = DERBY_WORLD;
						player.Vehicle = v;
						player.Vehicle.Fix();
						player.Frozen = true;
						player.Vehicle.Pos = Vector(-1317.28, 1333.54, 83.8882);
						player.Vehicle.Pos.x += (i *3);
						MSG(DERBYM+player+" joined ["+(i+1)+"/4]",DERBYM+player+" a intrat. ["+(i+1)+"/4]");
						DERBY_PLRS[i] = player.ID;
						DERBY_CARS[i] = player.Vehicle.ID;
						v.Immunity = 0;
						v.Health = 1000;
						break;
					}
				}
			}
		}
	}
}
function CreateDerby(player,cash)
{
	if(player.Cash < cash)
	{
		MSGPLR(RED+"You don't have enough cash!",player,RED+"Nu ai destui bani!");
		return;
	}
	if(DERBY_St == 0)
	{
		DERBY_St = 1;
		DERBY_Cash = cash;
		MSG(DERBYM+"A derby match was created by "+player,DERBYM+"Un meci de derby a fost creat de:"+player);
		MSG(DERBYM+"Bet: "+cash,DERBYM+"Pariu:"+cash);
		MSG(DERBYM+"Use /derby to enter.",DERBYM+"Foloseste /derby ca sa intri.");
		MSGPLR(DERBYM+"Use /startderby to start!",player,DERBYM+"Foloseste /startderby ca sa pornesti meciul");
		DERBY_STARTER = player.ID;
		player.Cash -= cash;
		if(player.Vehicle != null) EnterDerby(player,player.Vehicle);
	}
	else MSGPLR(MSG_ERROR_EN+"An derby match is already created.",player,MSG_ERROR_RO+"Un meci derby e deja creat");
}
function StartDerby(player)
{
	if(player.ID != DERBY_STARTER)
	{
		MSGPLR(MSG_ERROR_EN+"You didn't create this derby match.",player,MSG_ERROR_RO+"Nu ai creat acest meci derby.");
		return false;
	}
	for(local i =0; i < 4;i++)
	{
		if(FindPlayer(DERBY_PLRS[i]) != null) FindPlayer(DERBY_PLRS[i]).Frozen = false;
	}
	Message(DERBYM+"GO GO GO");
	MSG(DERBYM+"Destroy the other vehicles.",DERBYM+"Distruge celelalte masini.");
	DERBY_St = 2;
	return true;
}
function DerbyUpdate()
{
	if(DERBY_St == 2)
	{
		local c =0, possible_winner = -1;
		for(local i =0; i < 4; i++)
		{
			if(DERBY_PLRS[i] != -1)
			{
				local veh = FindVehicle(DERBY_CARS[i]);
				local plr = FindPlayer(DERBY_PLRS[i]);
				if(plr.Vehicle == null)
				{
					plr.World = 1;
					MSG(DERBYM+plr+" got eliminated because he exited the car.",DERBYM+plr+" a fost eliminat fiindca a iesit din masina.");
					DERBY_CARS[i] = -1;
					DERBY_PLRS[i] = -1;
					}
				if(veh.World != DERBY_WORLD)
				{
					plr.World = 1;
					MSG(DERBYM+plr+" got eliminated.",DERBYM+plr+" a fost eliminat");
					DERBY_CARS[i] = -1;
					DERBY_PLRS[i] = -1;
				}
				if(plr.World != DERBY_WORLD)
				{
					DERBY_CARS[i] = -1;
					DERBY_PLRS[i] = -1;
					MSG(DERBYM+plr+" exited.",DERBYM+plr+" a iesit din event.");
				}
				if(plr.World == DERBY_WORLD)
				{
					if(plr.Vehicle.ID == DERBY_CARS[i])
					{
						possible_winner = i;
						c++;
					}
				}
			}
		}
		for(local i =0; i < 4;i++)
		{
			if(FindPlayer(DERBY_PLRS[i]) != null)
			{
				Announce("Remaining players:"+c,FindPlayer(DERBY_PLRS[i]),1);
			}
		}
		if(c == 1)
		{
			local winner = FindPlayer(DERBY_PLRS[possible_winner]);
			MSG(DERBYM+winner+" won "+DERBY_Cash,DERBYM+winner+" a castigat "+DERBY_Cash);
			winner.Cash += DERBY_Cash;
			
			local veh = winner.Vehicle;
			winner.Vehicle.World = 1;
			winner.World = 1;
			winner.Vehicle = veh;
			
			DERBY_St =0;
			DERBY_Cash = 0;
			for(local i=0 ; i < 4; i++)
			{
				DERBY_CARS[i] = -1;
				DERBY_PLRS[i] = -1;
			}
		}
	}
}
DERBY_TIMER <- NewTimer("DerbyUpdate",500,0);