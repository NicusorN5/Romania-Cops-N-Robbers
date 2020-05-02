function Discord_SendMessage(msg)
{
	//EchoMessage(msg);
}

function SQ_onDiscordConnect(jsonFormattedData )
{
	Discord_SendMessage(":heavy_check_mark: Server Online!");
}
function SQ_onDiscordChannelMessage( serverID, channelID, userID,userName, message)
{
	if(userName == "Romania Cops N' Robbers") return;
	if(channelID != 518152916826193920) return
	local cmd = GetTok(message," ",1); 
	local msg = "";
	for(local i =2 ; i < 255; i++)
	{
		if(GetTok(message," ",i) == null) break;
		msg += GetTok(message," ",i)+" ";
	}
	SQ_onDiscordCommand(userID,userName,cmd,msg);
	Message(WHITE+"Discord:<"+RED+userName+WHITE+">: "+message);
}
function SQ_onDiscordCommand(userID,userName,command,message)
{
	switch(command)
	{
		case "!server":
		{
			Discord_SendMessage("IP: 86.34.203.146:8192"); 
			Discord_SendMessage("Website: rcnr.tk");
			Discord_SendMessage("Forum: romaniacopsnrobbers.boards.net");
			break;
		}
		case "!help":
		{
			Discord_SendMessage("Romania Cops N' Robbers bot commands:"); 
			Discord_SendMessage("!help,!server,!players");
			break;
		}
		case "!players":
		{
			local c=0,plrs = "";
			for(local i =0 ; i < 100;i++)
			{
				if(FindPlayer(i) != null)
				{
					plrs += FindPlayer(i).Name +"["+i+"] ";
					c++;
				}
			}
			Discord_SendMessage("Total players:"+c+" ");
			Discord_SendMessage("Players Online: **"+plrs+"** ");
			break;
		}
		case "!testcommand":
		{
			Discord_SendMessage("message: "+msg);
			break;
		}
		default: break;
	}
}
function SQ_onDiscordQuit()
{
	Discord_SendMessage(":x: Server Offline! :frowning: ");
}
function SQ_onDiscordDisconnect()
{
	Discord_SendMessage(":x: Server Offline! :frowning: ");
}