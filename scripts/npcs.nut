const MAX_NPCS = 200;

class NPC
{
	constructor(n,id,lume,pos,viata,damage)
	{
		local o = ::CreateObject(id,lume,pos,255);
		o.TrackingShots = true;
		ID = o.ID;
		Nume = n;
		Viata_Def = viata;
		Viata = viata;
		Position = pos;
		Daune = damage;
		RespawnTimer = -1;
		World = lume;
	}
	Nume = "";
	ID = -1;
	Viata_Def = -1;
	Viata = 0;
	Position = Vector(0,0,0);
	Daune = 0;
	RespawnTimer = -1;
	World = 0;
}
function CreateNPC(n,id,lume,pos,viata,damage)
{
	for(local i =0 ; i < MAX_NPCS;i++)
	{
		if(NPC_ARRAY[i] == null)
		{
			NPC_ARRAY[i] = NPC(n,id,lume,pos,viata,damage);
			break;
		}
	}
}
function NPC::Update()
{
	if(this.RespawnTimer >= 0)
	{
		this.RespawnTimer -= 100;
		if(this.RespawnTimer <= 0)
		{
			this.RespawnTimer =-1;
			::FindObject(this.ID).World = World;
		}
		return;
	}
	if(this.Viata < 0) return;
	if(this.ID == -1) return;
	local min_distance = 50.0;
	local npc = ::FindObject(this.ID),player= null,target_plr = -1;
	//obtine jucatorul tinta:
	for(local i =0 ;i < 100;i++)
	{
		player = ::FindPlayer(i);
		if(player == null) continue;
		local d = ::DistanceFromPoint(player.Pos.x,player.Pos.y,npc.Pos.x,npc.Pos.y);
		//THATS A LOT OF   D A M A G E
		if(d < 2 )
		{
			if(player.Health != 0)
			{
				if(player.Vehicle != null) player.Vehicle.Health -= this.Daune;
				else
				{
					if(player.Armour > 0)
					{
						local cha = player.Armour;
						player.Armour -= this.Daune;
						if(cha < player.Armour) player.Armour = 0 ;
					}
					else
					{
						local chp = player.Health;
						player.Health -= this.Daune;
						if(chp < player.Health) player.Kill();
					}
				}
			}
		}
		if( d < min_distance)
		{
			if(npc.World == player.World)
			{
				target_plr = i;
				min_distance = d;
			}
		}
	}
	if(target_plr != -1)
	{
		local victim = ::FindPlayer(target_plr);
		if(npc.Pos.x > victim.Pos.x) npc.Pos.x -= 0.1;
		if(npc.Pos.x < victim.Pos.x) npc.Pos.x += 0.1;	

		if(npc.Pos.y > victim.Pos.y) npc.Pos.y -= 0.1;
		if(npc.Pos.y < victim.Pos.y)  npc.Pos.y += 0.1;		
					
		if(npc.Pos.z > victim.Pos.z) npc.Pos.z -= 0.1;
		if(npc.Pos.z < victim.Pos.z) npc.Pos.z += 0.1;
		npc.RotateToEuler(Vector(0,0,victim.Angle),0);
	}
}
NPC_ARRAY <- array(MAX_NPCS,null);

function NPC_Update()
{
	for(local i =0 ; i < MAX_NPCS ; i++)
	{
		if(NPC_ARRAY[i] != null) NPC_ARRAY[i].Update();
	}
}


function WeaponDMG(weapon)
{
	local hp = 20
		if(weapon == 17) hp = 25 ; //colt17
		if(weapon == 18) hp =125; //357
		if(weapon == 19) hp = 80 ; //shotgun
		if(weapon == 20) hp =100; //spas
		if(weapon == 21) hp = 120; //stubby
		if(weapon == 22) hp = 20 ; //tec9
		if(weapon == 23) hp = 20; //uzil
		if(weapon == 24) hp = 15 ; //mac10
		if(weapon == 25) hp = 35; //mp5
		if(weapon == 26) hp = 40 ; //m4
		if(weapon == 27) hp = 35; //ruger
		if((weapon == 28) || ( weapon == 29)) hp = 120 ; //sniper
		if(weapon == 32) hp = 120;//m60
		if(weapon == 33) hp = 140;//minigun
		if(weapon == 103) hp = 175; //deagle
		if(weapon == 104) hp = 35; //ppm1-bizon
		if(weapon == 105) hp = 450; //awp
		if(weapon == 106) hp = 15; //glock
		if(weapon == 107) hp = 45; //ak-47
		if(weapon == 108) hp = 25; //v kriss
		if((weapon >= 109) && (weapon <= 111)) hp = 45; //ak-47
		if((weapon >= 112) && (weapon <= 115)) hp = 45; //m4
		if((weapon >= 116) && (weapon <= 117)) hp = 45; //mp5
		if(weapon == 118) hp = 120; //m60
		if(weapon == 119) hp = 25; //colt
		if(weapon == 119) hp = 80; //shotgun
	return hp;
}
function FindNPC(obj)
{
	for(local i =0; i < MAX_NPCS; i++)
	{
		if(NPC_ARRAY[i] != null) if(NPC_ARRAY[i].ID == obj) return i;
	}
	return -1;
}
function NPC::Damage(weapon,player)
{
	local npc = ::FindObject(this.ID);
	this.Viata -= ::WeaponDMG(weapon);
	if(this.Viata < 0) this.Viata = 0;
	if(this.Viata <= 0 ) this.OnDeath(player);
	::MSGPLR(WHITE+"You hurt "+this.Nume+". Remaining health:"+this.Viata,player,WHITE+"L-ai ranit pe "+this.Nume+". Viata ramasa:"+this.Viata); 
	return;
}
function NPC::OnDeath(player)
{
	local npc = ::FindObject(this.ID);
	::CreateExplosion(0,0,npc.Pos,-1,true)
    if(player != null)
	{
		local reward = this.Viata_Def * 10;
		::MSG(WHITE+"Player "+player+" killed NPC "+this.Nume,WHITE+"Jucatorul "+player+" a omorat NPCul "+this.Nume);
		::MessagePlayer(GREEN+"$ +"+reward,player);
		player.Cash += reward;
	}
	this.Viata = this.Viata_Def;
	npc.Pos = Vector(this.Position.x,this.Position.y,this.Position.z);
	this.RespawnTimer = this.Viata_Def*100;
	npc.World = World+10;
}