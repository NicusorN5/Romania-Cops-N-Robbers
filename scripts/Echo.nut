// IRC
const FBS_NICK = "RCNRBOT"; // The name of the echo bot
const FBS_BPASS = "rcnr"; // The NickServ password of the echo bot
const FBS_SERVER = "irc.liberty-unleashed.co.uk"; // The numerical ip of the irc server - this will join irc.nl.project-apollo.co.uk "94.23.157.172" 91.121.134.5 94.23.61.36
const FBS_PORT = 6667;	// The port for that irc server
const FBS_CHAN = "#rcnr"; // The channel that you wont your echo bot to join
const FBS_CPASS = "rcnr"; // The password for that channel, if there isnt one leave it as "".

class FBSLIST
{
	// This is how we are going to store the user level information for each nick currently on the channel
	Name = null;
	Level = 1;
}

function FBSLIST::AddNick( szNick, iAdmin )
{
	Name = szNick;
	Level = iAdmin;
}

function ActivateEcho()
{
	print( "Confirming echo bot details..." );
	FBS_BOT <- NewSocket( "FBSProcess" );

	FBS_BOT.Connect( FBS_SERVER, FBS_PORT );
	FBS_BOT.SetNewConnFunc( "FBSLogin" );
	print( "Bot details confirmed!" );
	
	FBS_NICKS <- array( 50, null );
}

function DisconnectBots()
{
	print( "Disconnecting bot from IRC..." );
	
	if(FBS_BOT != null) FBS_BOT.Send( "QUIT " + FBS_NICK + "\n" );
	FBS_BOT = null;
	
	print( FBS_NICK + " has succesfully disconnected from IRC." );
}

function FBSLogin()
{
	print( "Attempting to set user, nick and mode...." );
	// Set the bots name and real name
	FBS_BOT.Send( "USER " + FBS_NICK + " 0 * :Server ECHO_BOT\n" );
	// Set the nick that the bot will use on the irc server
	FBS_BOT.Send( "NICK " + FBS_NICK + "\n" );
	// Set it so that the network classes the bot as a bot
	FBS_BOT.Send( "MODE " + FBS_NICK + " +B\n" );
	print( "Task completed successfully." );
}
function FBSProcess( sz )
{
	// This function is used to process the raw data that the bot is recieving from the irc server	
  local raw = split( sz, "\r\n" ), a, z = raw.len(), line;
	
	for ( a = 0; a < z; a++ )
	{
		line = raw[ a ];
		
		local FBS_PING = GetTok( line, " ", 1 ), FBS_EVENT = GetTok( line, " ", 2 ), FBS_CHANEVENT = GetTok( line, " ", 3 ), 
		Count = NumTok( line, " " ), Nick, Command, Prefix, Text;

		// The most important thing is making sure that the bot stays connected to IRC
		if ( FBS_PING ) FBS_BOT.Send( "PONG " + FBS_PING + "\n" );
		
		if ( FBS_EVENT == "001" )
		{
			if ( FBS_BOT )
			{
				// Identify the bot with services, comment this line if its not registered
				FBS_BOT.Send( "PRIVMSG NickServ IDENTIFY  E-Tech " + FBS_BPASS + "\n" ); 
				// Set it so that the network classes the bot as a bot
				FBS_BOT.Send( "MODE " + FBS_NICK + " +B\n" );
				// Make the bot join the specified channel
				FBS_BOT.Send( "JOIN " + FBS_CHAN + " " + FBS_CPASS + "\n" ); 
				// The bot now needs to collect information about users in the channel
				print( "Succesfully joined " + FBS_CHAN + "!" );
			}
		}
		else if ( FBS_EVENT == "353" ) FBSSortNicks( sz );
		else if ( ( FBS_EVENT == "MODE" ) || ( FBS_EVENT == "NICK" ) || ( FBS_EVENT == "JOIN" ) || ( FBS_EVENT == "PART" ) || ( FBS_EVENT == "QUIT" ) ) FBS_BOT.Send( "NAMES :" + FBS_CHAN + "\n" );
		if ( FBS_CHANEVENT == FBS_CHAN )
		{
			// Grab the nick
			Nick = GetTok( line, "!", 1 ).slice( 1 );
			// Figure out what the command is
			Command = GetTok( line, " ", 4 );
			// Figure out what prefix was used
			Prefix = Command.slice( 1, 2 );
			Command = Command.slice( 1 );
			
		  // Figure out the text after the command
		  if ( NumTok( line, " " ) > 4 ) Text = GetTok( line, " ", 5, Count );
		  else Command = split( Command, "\r\n" )[ 0 ];
		  // Parse the command
		  // Parse the command
		  /*
		  if ( ( Prefix == "!" ) && ( Count > 4 ) ) FBSIrcCommand( Nick, Command.tolower(), Text );
		  else if ( ( Prefix == "!" ) && ( Count == 4 ) ) FBSIrcCommand( Nick, Command.tolower(), null );
		  */
		  if (Nick && Command && Text) { FBSIrcCommand( Nick, Command, Text ); }
		  else if (Nick && Command) { FBSIrcCommand( Nick, Command, null ); }
		}
	}
}
function LevelTag1(lvl) {
	lvl = (lvl ? lvl:0);
	switch (lvl) {
	case 2:
		return "IRC Moderator>";
	case 3:
		return "IRC Admin>";
	case 4:
		return "IRC Manager>";
	case 5:
		return "IRC Helper>";
	case 6:
		return "IRC Owner>";
	default:
		return "User";
	}
}
function lLevelTag(lvl) {
	lvl = (lvl ? lvl:0);
	switch (lvl) {
	case 2:
		return "11";
	case 3:
		return "7";
	case 4:
		return "3";
	case 5:
		return "4";
	case 6:
		return "12";
	default:
		return "5";
	}
}

function FBSIrcCommand( user, cmd, text )
{
	local NickInfo = FindNick( user ), level, tLevel, p;	
	if ( NickInfo ) level = NickInfo.Level.tointeger();
	if (cmd)
	{	
		if (cmd.slice(0,1)  == "." && cmd.len() > 1)
		{
			local msg = "=> (" + LevelTag1(level) + ")" + user + ": " + cmd.slice(1);
			if (text) msg = msg + " " + text;
			EchoMessage(lLevelTag(level) + msg);
			Message("[#00FF15]"+msg+"");
			print("(IRC)"+user+" :"+msg+"");
		}
	}



if ( cmd == "!cmds" ) //working
{
if(!text)EchoMessage( "say, ping, me, pm, players, loc, level, arm, hp, script, forum, website." );
//print("(IRC)"+user+" :"+msg+"");
}



if ( cmd == "!say" )//working
	{
		::Message(user+" : "+text);
	}
	
	else if ( cmd == "!ping" )//working
{
if ( !text ) EchoMessage( "Error - Syntax: " + cmd + " <Nick/ID> " );
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoMessage( "Invalid Player..." );
EchoMessage( "10" + plr.Name + "'s Ping: " + plr.Ping + ". " );
Message("[#FFF000]"+ plr.Name + "'s Ping: " + plr.Ping + ".")
}
}	

else if ( cmd == "!me" )//working
	{
		if ( !text ) EchoMessage( "Error - Syntax: !" + cmd + " <text> " );
		else ::Message( user + " " + text );	
	}
/*
 else if ( cmd == "!settime" ) //working
 {
    if (level<3) EchoNotice(user,ICOL_RED+"You Dont Have Access To That Command!");
    {
	
      if ( !text ) EchoNotice( user,"Correct syntax : /settime <hr> <min>" );
      else if ( split(text, " ").len() < 2) return EchoNotice(user,"Correct syntax : /settime <hr> <min>" )
      else
   {
   local a = split(text, " ");
      if ( !IsNum( a[0] )) EchoNotice( user,"Format: /settime <hr> <min>" );
      else if ( !IsNum( a[1] )) EchoNotice( user,"Format: /settime <hr> <min>" );
      else SetTime( a[0].tointeger(), a[1].tointeger() ) ;  
      }   
	  }
	  }
*/	
	else if ( cmd == "!pm" ) //working
 {
 if ( !text ) EchoNotice( user, ICOL_BLUE+"Usage: " + cmd + " [Player] [Message]" );
 else if ( NumTok( text, " " ) < 2 ) EchoNotice( user, ICOL_BLUE+"Usage: /" + cmd + " [User] [Message]" );
 else {
local plr = FindPlayer(GetTok( text, " ", 1 ));
 local msg = GetTok( text, " ", 2, NumTok( text, " " ));
 EchoNotice( user, ICOL_LBLUE+"> Private Message to "+ICOL_RED+""+plr+""+ICOL_LBLUE+": "+msg );
 MessagePlayer( WHITE+"> Private Message from "+RED+""+user+""+WHITE+": "+msg, plr );
 }
 }
 
 else if ( cmd == "!players" ) //working
{
local plr, buffer = "", MAX_PLAYERS = GetMaxPlayers();		
for( local i=0; i < MAX_PLAYERS; ++i )
{plr = FindPlayer( i );
if ( plr ) buffer = buffer + " " + plr.Name + "[" + plr.ID + "]";
}
if ( buffer != "" ) EchoMessage("Online Players: " + strip(buffer) );
EchoMessage( "Total players:[ " + GetPlayers() +" ]" );
}		
	
	
	else if ( cmd == "!loc" )//working
{
if ( !text ) EchoNotice( user,ICOL_RED+"Usage: !loc [Nick/ID]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user,ICOL_RED+"Error: Invalid Player.");
else if ( !plr.IsSpawned ) EchoNotice(user,ICOL_RED+"> [Error]: "+ICOL_BLUE+"This Player Doesn't Spawned!");
else {
Message("> "+plr.Name + "'s Location:[ "+GetDistrictName( plr.Pos.x, plr.Pos.y )+" ].");
EchoMessage("> "+plr.Name + "'s Location:[ "+GetDistrictName( plr.Pos.x, plr.Pos.y )+" ].");
}
}
}
	/*
else if (( cmd == "!lvl" )||( cmd == "!level" ))//working
{	      
if ( !text ) EchoNotice(user,ICOL_RED+"Usage: "+cmd+" [Nick/ID]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) ), level = GetLevel( plr );      
if ( !plr ) EchoNotice(user,ICOL_RED+"> [Error]: "+ICOL_BLUE+"Invalid Player." );
EchoMessage( "> "+plr+"'s Level:[ "+GetLevel( plr )+" ] Group:[ "+GetLevelTag( plr )+" ]." );
}
}
	
	
else if ( cmd == "!arm" )//working
{
if ( !text ) EchoNotice(user,ICOL_RED+"Usage: "+cmd+" [Nick/ID]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice(user,ICOL_RED+"> [Error]: "+ICOL_BLUE+"Invalid Player." );
EchoMessage("["+plr.ID+"] "+plr+" Armour:[ "+plr.Armour+"'% ]");
}
}

else if ( cmd == "!hp" )//working
{
if ( !text ) EchoNotice(user,ICOL_RED+"Usage: "+cmd+" [Nick/ID]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice(user,ICOL_RED+"> [Error]: "+ICOL_BLUE+"Invalid Player." );
EchoMessage("["+plr.ID+"] "+plr+" Health:[ "+plr.Health+"'% ]");
}
}
*/
 else if  ( cmd == "!script" ) 
    {
   		EchoMessage( "Main Developers: Athanatos, Angelo22" );
        EchoMessage( "Retired Developers: H1Z1" );
		EchoMessage( "Contribuitors: DRAGOSDRGM12, Mega_Wolf" );
		EchoMessage( "Testers: Adi, Andr, Mega_Wolf" );
   	}
	
	 else if  ( cmd == "!forum" ) 
    {
   		EchoMessage( "Our Forum :- http://www.romaniacopsnrobbers.boards.net" );
   	}
	
	 else if  ( cmd == "!website" ) 
    {
   		EchoMessage( "Our Website :- https://www.rcnr.tk" );
   	}





/*

	else if ( cmd == "!tempban" )
     {
       local txt_Split;
	   if (level<3) EchoNotice(user,ICOL_RED+"You Dont Have Access To That Command!");
          else if( !text ) EchoNotice(user,ICOL_RED+"[RBAN] !tempban <player> <days:hours:mins> <reason>");
          else 
          {
                if( NumTok( text, " " ) == 2 ) 
    {
         txt_Split = split( text, " " );
      local plr = FindPlayer( txt_Split[ 0 ] ), expire = txt_Split[ 1 ];
      if( plr ) IRCAddBan( user, plr, expire );
      else EchoNotice(user,ICOL_RED+"[RBAN] No such player." );
    }
     else if( NumTok( text, " " ) >= 3 ) 
            {
                                           txt_Split = split( text, " " );
                                           local plr = FindPlayer( txt_Split[ 0 ] ), expire = txt_Split[ 1 ], reason = GetTok( text, " ", 3, NumTok( text, " " ) );
										   if( plr ) IRCAddBan( user, plr, expire, reason );
      else EchoNotice(user,ICOL_RED+"[RBAN] No such player.");
    }
    else EchoNotice(user,ICOL_RED+"[RBAN] /tempban <player> <days:hours:mins> <reason>");
    }
     }
  else if( cmd == "!untempban" )
  {
  if (level<3) EchoNotice(user,ICOL_RED+"You Dont Have Access To That Command!");
    else if( !text ) EchoNotice(user,ICOL_RED+"[RBAN] !untempban <FullName>");
    else if( !IsBanned( text ) ) EchoNotice(user, ICOL_RED+"[RBAN]Player is not banned.");
    else 
    {
           QuerySQL( database, "DELETE FROM Banned WHERE ban_nick='" + text + "' COLLATE NOCASE" );
     Message(GREEN+"Admin " + user + " Unbanned (TempBan) Player: " + text );
	 EchoMessage(ICOL_GREEN+"Admin " + user + " Unbanned (TempBan) Player: " + text );
    }
  }
  
 else if ( cmd == "!ipalias" )
{
if ( level < 4 ) EchoNotice( user, ICOL_RED+"You Dont Have Access To That Command!");
else if ( !text ) EchoNotice( user, "Syntax: "+ cmd + " <Nick/ID>" );
else
{
local plr = GetPlayer( text );
if ( !plr ) EchoNotice( user, "Unknown Player." );
else ShowAliasIrc( user, plr, "ip" );
}
}

else if ( cmd == "!subnetalias" )
{
if ( level < 4 ) EchoNotice( user, ICOL_RED+"You Dont Have Access To That Command!");
else if ( !text ) EchoNotice( user, "Syntax: "+ cmd + " <Nick/ID>" );
else
{
local plr = GetPlayer( text );
if ( !plr ) EchoNotice( user, "Unknown Player." );
else ShowAliasIrc( user, plr, "subnet" );
}
}

else if ( cmd == "!tempbanlist" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED+"You Dont Have Access To That Command!");
else {
local query = QuerySQL( database, "SELECT * FROM Banned" ), a=0;
if ( !query ) EchoNotice(user, ICOL_RED+"> No Players Are Banned.");
else {
while ( GetSQLColumnData( query, 0 ) != null )
{
local Time_Left = TimeRem( GetSQLColumnData( query, 2 ).tointeger(), GetSQLColumnData( query, 4 ).tostring() );
EchoNotice( user, ICOL_RED+"> Admin "+GetSQLColumnData( query, 5 )+" TempBanned-Player "+GetSQLColumnData( query, 0 )+" ] "+WHITE+"Reason:[ "+GetSQLColumnData( query, 6 )+" ] Time:[ "+Time_Left+" ]" );
GetSQLNextRow( query );
a++;}
}
FreeSQLQuery( query );
}
}

else if ( cmd == "!transfer" )
{
if ( level < 6 ) EchoNotice( user, ICOL_RED+"You Dont Have Access To That Command!");
else if ( !text ) EchoNotice(user, ICOL_BLUE+"Usage: "+cmd+" [Nick] [NewNick]");
else if ( NumTok( text, " " ) < 2 ) EchoNotice(user, ICOL_BLUE+"Usage: "+cmd+" [Nick] [NewNick]");
else 
{
local plr = GetTok( text, " ", 1 );
local newnick = GetTok( text, " ", 2);
{
QuerySQL( db, "UPDATE Account SET User='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL(db,"UPDATE Account SET Name='"+newnick.tolower()+"' WHERE Name='"+plr.tolower()+"'");
QuerySQL(db,"UPDATE Bstats SET Name='" +newnick.tolower()+ "' WHERE Name='"+plr.tolower()+"'");
QuerySQL( db, "UPDATE BStats SET User='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE WStats SET User='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL(db,"UPDATE Wstats SET Name='" +newnick.tolower()+ "' WHERE Name='"+plr.tolower()+"'");
QuerySQL( db, "UPDATE LastActive SET Name='"+newnick+"' WHERE Name='"+plr+"'" );
QuerySQL( sp, "UPDATE Spawnloc SET Name='"+newnick+"' WHERE Name='"+plr+"'" );
QuerySQL( wr, "UPDATE Warns SET Name='"+newnick+"' WHERE Name='"+plr+"'" );
QuerySQL( vdb, "UPDATE Vehicles SET Owner='"+newnick+"' WHERE Owner='"+plr+"'" );
QuerySQL( vdb, "UPDATE Vehicles SET Shared='"+newnick+"' WHERE Shared='"+plr+"'" );
QuerySQL( db, "UPDATE Props SET Owner='"+newnick+"' WHERE Owner='"+plr+"'" );
QuerySQL( db, "UPDATE Props SET Shared='"+newnick+"' WHERE Shared='"+plr+"'" );
QuerySQL( db, "UPDATE Locs SET Creator='"+newnick+"' WHERE Creator='"+plr+"'" );
QuerySQL( db, "UPDATE Banlist SET Nick='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Spawnwep SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Warn SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Report SET Player='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Report SET Reporter='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE LastActive SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE MBans SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Mbans2 SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL(db,"UPDATE Emails SET Name='"+newnick.tolower()+"' WHERE Name='"+plr.tolower()+"'");
QuerySQL( db, "UPDATE Mbans2 SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Alias SET Name='"+newnick+"' WHERE User='"+plr+"'" );
QuerySQL( db, "UPDATE Banned SET Name='"+newnick+"' WHERE User='"+plr+"'" );
EchoMessage(ICOL_GREEN+"> Admin "+user+" Has Transfered User Account Of "+plr+"  To  "+newnick+" .");
Message(GREEN+"> Admin "+user+" Has Transfered User Account Of "+plr+"  To  "+newnick+" .");
}
}
}
else if ( cmd == "!uidalias" )
{
if ( level < 4 ) EchoNotice( user, ICOL_RED+"You Dont Have Access To That Command!");
else if ( !text ) EchoNotice( user, "Syntax: "+ cmd + " <Nick/ID>" );
else
{
local plr = GetPlayer( text );
if ( !plr ) EchoNotice( user, "Unknown Player." );
else ShowAliasIrc( user, plr, "uid" );
}
}


else if ( ( cmd == "!reload" ) || ( cmd == "!r" ) )
    {
    if( level < 4 ) EchoNotice( user,  "4[Error] - Dont be smart you are not a admin." );
    else {
dofile( "Scripts/Functions.nut" );
dofile( "Scripts/DNUS-SQ.nut" );
dofile( "Scripts/Commands.nut" );
dofile( "Scripts/CMS.nut" );
dofile( "Scripts/TuneSystem.nut" );
dofile( "Scripts/automsg.nut" );
dofile( "Scripts/top.nut" );
dofile( "Scripts/spawnwepfunctions.nut" );
dofile( "Scripts/Vehicles.nut" );
dofile( "Scripts/Ramps.nut" );
dofile( "Scripts/Echo-Nut.nut" );
        EchoMessage("8*** Script Reloaded ***");
        Message( "[#FFFF00]*** Script Reloaded ***");
	}
	}

else if ( cmd == "!lockserver" )
	{
	if ( level < 4 ) EchoMessage("[Erro] - You dont have access to this command!");
	else if ( !text ) EchoMessage("[Sintaxe] - !lockserver <password>");
	else {
	SetPassword( text );
	EchoMessage("Server Locked");
	}
	}
	
	else if ( cmd == "!unlockserver" )
	{
	if ( level < 4 ) EchoMessage("[Erro] - You dont have access to this command!");
	else {
	SetPassword( "" );
	EchoMessage("Server Unlocked");
	}
	}



else if ( ( cmd == "!admin" ) || ( cmd == "!admins" ) )
{
local plr, b;
for( local i = 0; i <= GetMaxPlayers(); i++ )
{
plr = FindPlayer( i );
if ( ( plr ) && ( stats[ plr.ID ].Level >= 2 ) )
{
      if ( b ) b = b + ", " + plr.Name + " (Level: " + stats[ plr.ID ].Level + ")"
      else b = plr.Name + " Level: " + stats[ plr.ID ].Level + ")"
}
}
if ( b ) EchoMessage(ICOL_GREEN+"> Admins Online:[ "+b+""+ICOL_GREEN+" ].");
else  EchoMessage(ICOL_RED+"> No Admins In-Game!");
}	
	
	
	
else if  ( cmd == "!server" ) 
{
local q = QuerySQL(db, "SELECT COUNT(Name) FROM Account");
EchoNotice(user,ICOL_PURPLE+"Server Name:[ "+GetServerName()+" ]." );
EchoNotice(user,ICOL_PINK+"Server on MASTERLIST." );
EchoNotice(user,ICOL_BLUE+"GameMode:[ "+GetGamemodeName()+" ]" );
EchoNotice(user,ICOL_GREEN+"MapName:[ "+GetMapName()+" ]" );
EchoNotice(user,ICOL_PINK+"Slots:[ "+GetMaxPlayers()+" ]" );
EchoNotice(user,ICOL_RED+"Total Registered Players:[ "+GetSQLColumnData(q,0)+" ]" );
}

else if  ( cmd == "!script" ) 
{
EchoNotice(user,ICOL_PURPLE+""+ICOL_BOLD+""+Author );
EchoNotice(user,ICOL_RED+""+ICOL_BOLD+""+Credits );
EchoNotice(user,ICOL_BLUE+""+ICOL_BOLD+"Script Version TDC Beta v4.0 C++" );
}

else if  ( cmd == "!forum" ) 
{
EchoMessage(  ICOL_BLUE + "Visit Our Forum: http://tdcofficial.forumtk.net");
}

else if ( cmd == "!country" )
{
if ( !text ) EchoMessage( "Usage: !country [Nick/ID]" );
else 
{
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoMessage( "Error: Invalid Player." );
else {
local c = IpToCountry(player.IP);
EchoMessage( "7" + plr.Name + "'s Country: [ "+ c +" ].");
}
} 
}


else if ( cmd == "!hitler" )
{
if ( level < 6 ) EchoNotice( user, "Error: Your level is not high enough to use that command." );
else if ( !text ) EchoNotice( user, "Usage: "+cmd+" [Nick/ID]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, "Error: Invalid Player.");
else {
CreateExplosion( plr.World, 6, plr.Pos.x, plr.Pos.y, plr.Pos.z, -1, true );
Message("[#FB2E18] " + plr.Name + " Has Been Nuked By Hitler!");
Message("[#FB2E18]Hitler Did Nothing Wrong!") ;
EchoMessage("4 " + plr.Name + " has been nuked by hitler!");
EchoMessage("4 卍 Hitler did nothing wrong 卍");
}
}
}
	

else if  ( cmd == "!svrhost" ) 
{
local TimeStart=(GetTickCount()-START)/1000;
EchoMessage(ICOL_GREEN+"Server-HostTime:[ "+GetTimeFormat(TimeStart)+" ].");
}

//else if ( ( cmd == "!cmds" ) || ( cmd == "!commands" ) )
//{
//EchoMessage(ICOL_BLUE+"> Available Commands: !svrhost, !hp, !arm, !loc, !forum, !say, !me, !players, !admins, !banlist, !script, !lvl, !ping, !server, !country, !acmds" );
//}

// Admin Cmds
else if ( ( cmd == "!acmds" ) || ( cmd == "!admincmds" ) )
{
if ( level < 2 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
else EchoNotice( user,ICOL_RED+"> Admin CMDS: !lockserver, !unlockserver, !baninfo, !ann, !setweather, !settime, !getip, !mute, !unmute, !permamute, !unpermamute, !freeze, !unfreeze, !slap, !drown, !kill, !kick, !tempban, !untempban, !tempbanlist, !ban, !unban, !banip, !unbanip, !macban, !unmacban, !ipalias, !uidalias, !subnetalias, !setlevel, !transfer, !reload, !exec" );
}
	
else if ( cmd == "!drown" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
else if ( !text ) EchoNotice( user, ICOL_RED + "Error - Syntax: " + cmd + " <Nick/ID> <Reason> ");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, "Error - Unknown player." );
else {
local msg = GetTok( text, " ", 2, NumTok( text, " " ) );
if ( !msg ) EchoNotice( user, "Error - Invalid format." );
else {
EchoMessage( ICOL_LGREEN + "Drowned Player:[ "  + plr.Name +  " ]. Reason:[ " + msg + " ]" );
Message( "Admin " + user + " has drowned Player: ["  + plr.Name +  " ] Reason: [ " + msg + " ]" );
plr.Pos = Vector( 283.521 , -1574.3 , 7.19846 );
}
}
}
}

else if ( cmd == "!permamute" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough to use that command." );
else if ( !text ) EchoNotice(user, ICOL_BLUE+"Usage: /"+cmd+" [Nick/ID] [Reason]" );
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice(user, ICOL_RED+"** [Error]: >> "+BLUE+"Player Invalid." );
else {
local reason = GetTok( text, " ", 2 NumTok( text, " " ) );
if ( reason == null ) reason = "None";
Mutes( plr, user, reason );
}
}
}

else if ( cmd == "!unpermamute" )
{
local q = QuerySQL( Mute, "SELECT * FROM Mutes WHERE Name='"+text+"'" );
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough to use that command." );
else if ( !text ) EchoNotice(user, ICOL_BLUE+"Usage: /" + cmd + " [Full/Nick]" );
else if ( GetSQLColumnData(q, 0 ) != text ) EchoNotice(user, ICOL_RED+"** [Error]: >> "+BLUE+"This Player:[ "+text+" ] Is Not Exist In PermaMute List." );
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
EchoNotice(user, ICOL_LBLUE+"> Admin "+user+" Un-PermaMuted "+text);
QuerySQL( Mute, "DELETE FROM Mutes WHERE Name='"+text+"'" );
status[ plr.ID ].Muted = false;
}
}

 else if ( cmd == "setweather" )
 {
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough to use that command." );
 else if ( !text ) EchoNotice ( user, PURPLE+"/setweather WeatherID." );
 else if ( !IsNum ( text ) ) EchoNotice (user, PURPLE+"The ID must be an integer." , player );
 else if ( GetWeather( ) == text.tointeger( ) ) EchoNotice(user, PURPLE+"The ID you put is already used!" , player );
 else
 {
 SetWeather ( text.tointeger ( ) );
 Message (PURPLE+"> Admin "+player.Name+" set weather to ID:" + text + "." );
 EchoMessage (ICOL_PURPLE+"> Admin "+player.Name+" set weather to ID:" + text + "." );
 }
 }

else if (( cmd == "!setlevel" ) || ( cmd == "!setlvl" ))
{
if ( level < 6 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough to use that command." );
else if ( !text ) EchoNotice( user, ICOL_RED + "Usage: " + cmd + " [Nick/ID] [Level]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, ICOL_RED + "Error: Invalid Player.");
else {
local level = GetTok(text, " ", 2);
if (!IsNum(level)) EchoNotice( user, ICOL_RED + "Level Must Be In Numbers.");
else {
EchoMessage( ICOL_LGREEN + "** Owner "+user+" Set Player [ " + plr.Name + " ] To Level: [ " + level + " ]" );
stats[plr.ID].Level = level.tointeger();
Message("[#FF0000]Admin "+user+" Set Level Of "+plr.Name+" To "+level+" Rank ["+GetLevelTag(plr)+"]");
}
}
}
}

else if ( cmd == "!kick" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough to use that command." );
else if ( !text ) EchoNotice( user, ICOL_RED + "Usage: "+cmd+" [Nick/ID] [Reason]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, "Error: Invalid Player.");
else {
local msg = GetTok( text, " ", 2, NumTok( text, " " ) );
if ( !msg ) EchoNotice( user, "Error: Invalid format." );
else {
Message( "Admin "+user+" Kicked Player: [ "+plr.Name+" ] Reason: [ "+msg+" ]" );
EchoMessage( "Admin "+user+" Kicked Player: [ "+plr.Name+" ] Reason: [ "+msg+" ]" );
plr.Kick();
}
}
}
} 

else if ( cmd == "!ban" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough." );
else if ( !text ) EchoNotice( user,ICOL_BLUE+"Usage: /" + cmd + " [Nick/ID] [Reason]" );
else if ( NumTok( text, " " ) < 2 ) EchoNotice( user,ICOL_BLUE+"Usage: /" + cmd + " [Nick/ID] [Reason]" );
else
{
local plr = FindPlayer( GetTok( text, " ", 1 ));
local ip = plr.IP;
local sub = split( ip, "." );
local reason = GetTok( text, " ", 2 );
QuerySQL( db, "INSERT INTO SubBans ( Name, IP, Admin, Reason ) VALUES ( '" + plr.Name + "', '" + sub[0].tofloat() + "." + sub[1].tofloat() + "', '" + user + "', '" + reason + "' )" );
Message(PURPLE+"> Admin "+user+" banned "+plr.Name+" Reason: "+reason);
EchoMessage(ICOL_RED+"> Admin "+user+" banned "+plr.Name+"! Reason: "+reason);
KickPlayer( plr );
}
}

else if ( cmd == "!unban" )
{
local q = QuerySQL( db,  "SELECT * FROM SubBans WHERE Name='" + text + "'" );
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough." );
else if ( !text ) EchoNotice( user,ICOL_BLUE+"Usage: /" + cmd + " [Nick/ID]", player );
else if ( GetSQLColumnData( q, 0 ) != text ) EchoMessage( "4[Error] - " + text + " is not Banned.");
else
{
local plr = GetTok( text, " ", 1 );
local reason = GetTok( text, " ", 1 );
QuerySQL( db, "DELETE FROM SubBans WHERE Name='" + text + "'" );
Message(RED+"> Admin "+user+" unbanned "+plr+"!");
EchoMessage(ICOL_RED+"> Admin "+user+" unbanned "+plr+"!");
}
}

else if ( cmd == "!banip" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough." );
else if ( !text ) EchoNotice( user,ICOL_RED +"Usage: " + cmd + " [Nick/ID] [Reason]");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user,"Error: Invalid Player.");
else {
local reason = GetTok( text, " ", 2 NumTok( text, " " ) );
if ( reason == null ) reason = "None";
Message("Admin "+user+" Banned Player: [ "+plr.Name+" ] Reason: [ "+reason+"]" );
EchoMessage("Admin "+user+" Banned Player: [ "+plr.Name+" ] Reason: [ "+reason+"]" );
BanPlayer( user, plr, reason );
}
}
}

else if ( cmd == "!unbanip" )
{
local q = QuerySQL( database2, "SELECT * FROM Banlist WHERE Nick='" + text + "' COLLATE NOCASE" );
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough." );
else {
if ( !text ) EchoNotice( user,ICOL_RED +"Usage: " + cmd + " [Full/Nick]");
else if ( GetSQLColumnData( q, 0 ) != text ) EchoNotice( user,ICOL_BLUE +"Error: " + text + " Is Not In Ban-List.");
else {
local nickname = GetSQLColumnData( q, 0 );
QuerySQL( database2,"DELETE FROM Banlist WHERE Nick='" + text + "' COLLATE NOCASE" );
FreeSQLQuery( q );
BannedNicks.remove( BannedNicks.find( nickname.tolower() ) ); 
Message("Admin "+user+" UnBanned Player: [ "+text+" ]");
}
}
}

else if ( cmd == "!banlist" )
{
local query = QuerySQL( db, "SELECT * FROM subbans" )
if ( !query ) EchoNotice( user,ICOL_RED +"** No Players Are Banned.");
else {
while( GetSQLColumnData( query, 0 ) != null )
{
EchoNotice( user,ICOL_RED +"** Admin: [ "+GetSQLColumnData( query, 2 )+" ] Banned Player: [ "+GetSQLColumnData( query, 0 )+" ] Reason: [ "+GetSQLColumnData( query, 3 )+" ].");
GetSQLNextRow( query );
a++;}
}
FreeSQLQuery( query );
}

else if ( cmd == "!baninfo" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error: Your level is not high enough." );
else if ( !text ) EchoNotice( user,ICOL_RED +"Usage: "+cmd+" [Full/Nick]");
else {
local q = QuerySQL( database2, "SELECT * FROM Banlist WHERE Nick='" + text + "' COLLATE NOCASE" );
if ( !GetSQLColumnData( q, 0 ) ) EchoNotice( user,ICOL_BLUE+"Error: This Player Is Not In Ban-List.");
else {
EchoNotice( user,ICOL_RED +"Banned Player Found!");
EchoNotice( user,ICOL_RED +"Player Nick: "+text);
EchoNotice( user,ICOL_RED +"Player IP: " + GetSQLColumnData( q, 1 ));
EchoNotice( user,ICOL_RED +"Banned by: " + GetSQLColumnData( q, 2 ));
EchoNotice( user,ICOL_RED +"Reason: " + GetSQLColumnData( q, 3 ));
}
}
}

else if ( cmd == "!kill" )
{
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
else if ( !text ) EchoNotice( user, ICOL_RED + "Error - Syntax: " + cmd + " <Nick/ID> <Reason> ");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, "Error - Unknown player." );
else {
local msg = GetTok( text, " ", 2, NumTok( text, " " ) );
if ( !msg ) EchoNotice( user, "Error - Invalid format." );
else {
EchoMessage( ICOL_LGREEN + "Killed Player:[ "  + plr.Name +  " ] Reason:[ " + msg + " ]" );
Message( "Admin " + user + " has killed "  + plr.Name +  ". Reason: " + msg + "." );
plr.Pos = plr.Pos
plr.Health = 0;
}
}
}
}

else if ( cmd == "!slap" )
{	 
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice( user, "Error - Invalid player." );
Message( "Admin " + user + " has slapped " + plr.Name + "." );
plr.Health -= 20;
}
}

else if ( cmd == "slap" )
{	 
if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
else if ( !text ) EchoNotice(user, ICOL_BLUE+"Usage: /" + cmd + " [Nick/ID] [Reason]");
else if ( !player.IsSpawned ) EchoNotice(user, ICOL_PURPLE+"** [Error]: >> "+BLUE+"First Spawned And Then Use It.");
else {
local plr = GetPlayer( GetTok( text, " ", 1 ) );
if ( !plr ) EchoNotice(user, ICOL_PURPLE+"** [Error]: >> "+BLUE+"Invalid Player." );
else if ( !plr.IsSpawned ) EchoNotice(user, ICOL_PURPLE+"** [Error]: >> "+BLUE+"This Player Doesn't Spawned." );
else {
local reason = GetTok( text, " ", 2, NumTok( text, " " ) );
if ( reason == null ) reason = "None";
Message(PURPLE+"> Admin "+player.Name+" Slapped-Player:[ "+plr.Name+" ] For Reason:[ "+reason+" ]." );
EchoMessage(ICOL_PURPLE+"> Admin "+player.Name+" Slapped-Player:[ "+plr.Name+" ] For Reason:[ "+reason+" ]." );
plr.Health -= 20;
plr.Pos = Vector(player.Pos.x, player.Pos.y, player.Pos.z+5)
}
}
}

else if ( cmd == "!ann" )
{
if( level < 2 )  EchoNotice( user, " /" + cmd + " <ID> <All/Nick/ID> <text>");
else if ( !text )  EchoNotice(user, " /" + cmd + " <ID> <All/Nick/ID> <text>");
else if ( NumTok( text, " " ) < 3 ) EchoNotice( user, " /" + cmd + " <ID> <All/Nick/ID> <text>");
else if (GetTok( text, " ", 2 ).tolower() =="all")
{
local mod = GetTok( text, " ", 1);
local msg = GetTok( text, " ", 3, NumTok( text, " " ) );
AnnounceAll( msg, mod.tointeger() );
EchoMessage("3Announced [ 4"+msg+" 3] 3To  All Player.");
}
else {
local plr = GetPlayer( GetTok( text, " ", 2 ) );
if (!plr) EchoNotice( user,"Invalid Player.");
else {
local mod = GetTok( text, " ", 1);
local msg = GetTok( text, " ", 3, NumTok( text, " " ) );
Announce( msg, plr, mod.tointeger() );
EchoMessage("3Announced [ 4"+msg+" 3] 3To Player [ 4"+plr+" 3]3.");
}
}
}
      
	  
	else if ( cmd == "!freeze" )
	{
		if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
        else if ( !text ) EchoNotice( user, ICOL_RED + "Error - Syntax: " + cmd + " <Nick/ID> <Reason> ");
	    else 
		{
		    local plr = GetPlayer( GetTok( text, " ", 1 ) );
		    if ( !plr ) EchoNotice( user, "Error - Unknow player." );
		    else
			{
				local msg = GetTok( text, " ", 2, NumTok( text, " " ) );
			    if ( !msg ) EchoNotice( user, "Error - Invalid format." );
                else 
				{
					EchoMessage( ICOL_LGREEN + "Freezed Player:[ "  + plr.Name +  " ]. Reason:[ " + msg + " ]" );
					Message( "Admin " + user + " has frozen Player:[ "  + plr.Name +  " ] Reason:[ " + msg + " ]" );
                    plr.IsFrozen = true;
                }
			}
		}
	}
	
	else if ( cmd == "!mute" )
	{
		if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
        else if ( !text ) EchoNotice( user, ICOL_RED + "Error - Syntax: " + cmd + " <Nick/ID> <Reason> ");
	    else 
		{
            local plr = FindPlayer( GetTok( text, " ", 1 ) );
          	if (!plr) EchoNotice( user, " Error - Unknown player" );
		    else
		    {
				local msg = GetTok( text, " ", 2, NumTok( text, " " ) );
			    if ( msg == null ) msg = "None"
                EchoMessage( ICOL_LGREEN + "Admin " + user + " has muted player:[ "  + plr.Name +  " ]. Reason:[ " + msg + " ]" );
				Message( "Admin " + user + " has muted Player:[ "  + plr.Name +  " ] Reason:[ " + msg + " ]" );
				stats[ plr.ID ].Mute = true;
			}
		}
	}
    
	else if ( cmd == "!unmute" )
    {
   		if ( level < 3 ) EchoNotice( user, ICOL_RED + "Error - Your level is not high enough to use that command." );
   		else if ( !text ) EchoNotice( user, ICOL_RED + " Error - Syntax: !unmute <Nick/ID> <Reason>" );
		else if ( NumTok( text, " " ) < 2 ) EchoNotice( user, ICOL_RED + " Error - Syntax: !unmute <Nick/ID> <Reason>" );
    	else 
        { 
            local plr = GetPlayer( GetTok( text, " ", 1 ) );
			local reason = GetTok( text, " ", 2, NumTok( text, " " ) );
          	if ( reason == null ) reasonp  = "None"
                EchoMessage( ICOL_BROWN + " Admin " + user + " has un-muted Player:[ " + plr.Name + " ] Reason:[ " + reason + " ]" );
			    Message( "Admin " + user + " has un-muted Player:[ " + plr.Name + " ] Reason:[ " + reason + " ]" );
				stats[ plr.ID ].Mute = false;
		}
	}
    
	
    else if ( cmd == "!unfreeze" )
   	{
   		if ( level < 3 ) EchoNotice( user, ICOL_RED + " Error - Your level is not high enough." );
   		else if ( !text ) EchoNotice( user, ICOL_RED + " Error - Syntax: !unfreeze <Nick/ID>" );
  		else 
        { 
            local plr = GetPlayer( GetTok( text, " ", 1 ) );
          	if (!plr) EchoNotice( user, " Error - Unknown Player" );
			else
			{
			    EchoMessage( ICOL_BLUE + "Admin " + user + " has un-frozen " + plr.Name + "." );
                Message( " **Admin " + user + " has un-frozen Player:[ " + plr.Name + " ]" );
                plr.IsFrozen = false;
            }
        }		
    }
	
	
    else if( cmd == "!exec" )
	{
		if ( !text )  EchoMessage( ICOL_RED + "Error - Syntax: !exec <Squirrel code>" );
		else if( level < 6 ) EchoNotice( user, ICOL_RED +  "You have to be an Owner to use such commands." );
		else
		{
		    try
			{
				local script = compilestring( text );
				if(script)
				{
					script();
					EchoNotice(user, "> 4Command Executed Successfully!" );
				}
				else EchoNotice(user, ">4Error!" );

			}
			catch(e) EchoMessage( "> Error:" + e );
		}
	}
	
	
	else if ( cmd == "!getip")
	{
	    if ( !text )  EchoMessage( ICOL_RED + "Error - Syntax: !getip <Nick/ID>" );
	    else if( level < 3 ) EchoNotice( user, ICOL_RED +  "You have to be an admin to use such commands." );
	    else
	    {
            local plr = GetPlayer( GetTok( text, " ", 1 ) );
            if (!plr) EchoNotice( user, " Error - Unknown Player" );
		    else
		    {
			    EchoNotice( user, ICOL_BLUE + " " + plr.Name + " IP:[ " + plr.IP + "]." );
            }
	    }
	}
*/
}

function EchoNotice( nick, text )
{
    // Send A notice :)
	FBS_BOT.Send( "NOTICE" + nick + " " + text + "\n" );
}

function EchoMessage( text )
{
	// This is used for events such as a player joining
	if(FBS_BOT)  FBS_BOT.Send( "PRIVMSG " + FBS_CHAN + " " + text + "\n" );
	//FBS_BOT.Send( "PRIVMSG " + FBS_CHAN + "[#ffffff]" + text + "\n" );
}

/*  The following functions below are to do with parsing nick information and levels
	DO NOT TOUCH ANYTHING BELOW THIS LINE.......EVER!
*/

function FBSSortNicks( szList )
{
	local a = NumTok( szList, " " );
	local NickList = GetTok( szList, " ", 6, a ), i = 1;
	
	FBS_NICKS <- array( 50, null );
	
	while( GetTok( NickList, " ", i ) != "366" )
	{
		local levelnick = GetTok( NickList, " ", i ), nick = levelnick.slice( 1 ), level = levelnick.slice( 0, 1 );
		
		if ( level == ":" ) { level = nick.slice( 0, 1 ); nick = nick.slice( 1 ); }
				
		if ( level == "+" ) AddNewNick( nick, 2 );
		else if ( level == "%" ) AddNewNick( nick, 3 );
		else if ( level == "@" ) AddNewNick( nick, 4 );
		else if ( level == "&" ) AddNewNick( nick, 5 );
		else if ( level == "~" ) AddNewNick( nick, 6 );
		else AddNewNick( nick, 1 );
		i ++;
	}
}

function AddNewNick( szName, iLevel )
{
	local i = FindFreeNickSlot();
	
	if ( i != -1 ) 
	{
		FBS_NICKS[ i ] = FBSLIST();
		FBS_NICKS[ i ].AddNick( szName, iLevel );
	}
}

function FindFreeNickSlot()
{
	for ( local i = 0; i < FBS_NICKS.len(); i++ )
	{
		if ( !FBS_NICKS[ i ] ) return i;
	}
	return -1;
}

function FindNick( szName )
{	
	for ( local i = 0; i < FBS_NICKS.len(); i++ )
	{
		if ( FBS_NICKS[ i ] )
		{
			if ( FBS_NICKS[ i ].Name == szName ) return FBS_NICKS[ i ];
		}
	}
	return null;
}

