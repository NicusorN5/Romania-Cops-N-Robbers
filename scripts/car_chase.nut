function CarChaseTrigger()
{
	local cops_avalable = 0;
	for(local i =0 ; i< 100; i++)
	{
		if(FindPlayer(i) != null)
		{
			local player = FindPlayer(i);
			if(player.Vehicle != null)
			{
				for(local j =0; j <100 ; j++)
				{
					local plr = FindPlayer(j);
					if(plr != null)
					{
						if(CheckpointColors(plr,COPCOLOR) == true)
						{
							if(plr.Vehicle != null)
							{
								if(plr.ID == player.ID) continue;
								if(IsCopCar(plr.Vehicle) == false) continue;
								if(plr == player) continue;
								if(i == j) continue;
								if(player == null) continue;
								else cops_avalable += 1;
								if(DistanceFromPoint(plr.Pos.x,plr.Pos.y,player.Pos.x,player.Pos.y) < 50)
								{
									if(Speed(player.Vehicle) > 200)
									{							
										if(chaseplayer != i)
										{
											Stream.StartWrite();
											Stream.WriteInt(7);
											Stream.SendStream(player);
											Stream.StartWrite();
											Stream.WriteInt(8)
											Stream.WriteString("50 "+cops_avalable+" 0");
											Stream.SendStream(player);
											chaseplayer = player.ID;
											player.WantedLevel += 6;
											MSG(CHASE_EN+player+" is in a car chase.",CHASE_RO+player+" este implicat intro urmarire de masini.");
										}
									}
								}
								if(DistanceFromPoint(plr.Pos.x,plr.Pos.y,player.Pos.x,player.Pos.y) < 10)
								{
									if(Speed(player.Vehicle )< 50)
									{
										if(chaseplayer == i)
										{
										Stream.StartWrite();
										Stream.WriteInt(8)
										Stream.WriteString("-20 0 0");
										Stream.SendStream(player);
										}
									}
								}
								if(DistanceFromPoint(plr.Pos.x,plr.Pos.y,player.Pos.x,player.Pos.y) > 200)
								{
									if(chaseplayer == i)
									{
										Stream.StartWrite();
										Stream.WriteInt(8)
										Stream.WriteString("5 0 0");
										Stream.SendStream(player);
									}
								}
								if(chaseplayer == i)
								{
									Stream.StartWrite();
									Stream.WriteInt(8)
									Stream.WriteString("0 "+cops_avalable+" 0");
									Stream.SendStream(player);
								}
							}
						}
					}
				}
			}
		}
	}
}
NewTimer("CarChaseTrigger",1500,0);	