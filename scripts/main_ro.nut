IN_DEBUG <- true;

::sX <- GUI.GetScreenSize().X;
::sY <- GUI.GetScreenSize().Y;

/*
Hunger +  Health +  Armour bars
*/
::hplabel2 <- GUILabel(VectorScreen(sX * 0.75,80),Colour(255,255,255),"Health");
::hplabel2.FontSize = 12;
::hp <- GUIProgressBar(VectorScreen(sX * 0.75,100),VectorScreen(100,25),Colour(255,0,0))
::hp.MaxValue = 100;
::hp.Value = 100;
::hp.StartColour = Colour(200,0,0);
::hp.EndColour = Colour(255,0,0);
::armlabel <- GUILabel(VectorScreen(sX * 0.65,80),Colour(255,255,255),"Armour");
::armlabel.FontSize = 12;
::arm <- GUIProgressBar(VectorScreen(sX * 0.65,100),VectorScreen(100,25),Colour(50,50,50))
::arm.MaxValue = 100;
::arm.Value = 0;
::arm.StartColour = Colour(50,50,50);
::arm.EndColour = Colour(128,128,128);
::hungertext <- GUILabel(VectorScreen(sX * 0.65,125),Colour(255,255,255),"Hunger");
::hunger <- GUIProgressBar(VectorScreen(sX * 0.65, 145),VectorScreen(200,25),Colour(255,178,0));
::hunger.MaxValue = 100;
::hunger.Value = 0;
::hunger.StartColour = Colour(155, 49,0)
::hunger.EndColour = Colour(255,178,0)

KeyE <- KeyBind(0x45);
KeyX <- KeyBind(0x58);
KeyG <- KeyBind(0x47);
KeyRET <- KeyBind(0x48); //it is now H instead of ENTER/RETURN
/*
Login GUI instances
*/
::Login_sprite1 <- GUISprite("logo.png",VectorScreen(0,0));
::Login_sprite1.Size = VectorScreen(sX,sY);
::Login_wnd <- GUIWindow(VectorScreen(sX/ 2, sY/2),VectorScreen(200,100),Colour(200,200,200),"Login/Register");
::Login_label1 <- GUILabel(VectorScreen(10,10),Colour(0,0,0),"Password:")
::Login_button1 <- GUIButton(VectorScreen(10,40),VectorScreen(40,20),Colour(0,0,255),"Login");
::Login_TextBox1 <- GUIEditbox(VectorScreen(80,10),VectorScreen(100,20),Colour(255,255,255),"password");
::Login_button2 <- GUIButton(VectorScreen(60,40),VectorScreen(50,20),Colour(0,0,255),"Register");
::Login_wnd.AddChild(Login_label1);
::Login_wnd.AddChild(Login_button1);
::Login_wnd.AddChild(Login_TextBox1);
::Login_wnd.AddChild(Login_button2);
GUI.SetMouseEnabled(true);

/*
Register GUI Instances
*/
::Register_wnd <- null;
::Register_label1 <- null;
::Register_label2 <- null;
::Register_label3 <- null;
::Register_Textbox1 <- null;
::Register_Textbox2 <- null;
::Register_Textbox3 <- null;
::Register_button1 <-null;
::IsRegisterWNDOpen <- false;

/*
Job GUI Instances
*/
::Job_wnd <- null;
::Job_button1 <- null;
::Job_button2 <- null;
::Job_label1 <- null;
::Job <- "";

/*
Vehicle GUI Instances
*/
::Buycar_wnd <- null;
::Buycar_button1 <- null;
::Buycar_button2 <- null;
::Buycar_button3 <- null;
::Buycar_label1 <- null;
::Buycar_label2 <- null;
::Buycar_index <- 130;
/*
Car chase GUI instances
*/
::Chase_base <- null;
::Chase_pbar1 <- null;
::Chase_l1 <- null
::Chase_l2 <- null
::Chase_l3 <- null
::Chase_l4 <- null
::Chase_icon1 <- null;
::Chase_icon2 <- null;

::Cops_active <- 0;
::Cops_disabled <- 0;

/*
Skin system GUI instances
*/
::Skin_base <- null;
::Skin_label1 <- null;
::Skin_button1 <- null;
::Skin_button2 <- null;
::Skin_button3 <- null;
/*
Player stats text
*/
::PS_label <- GUILabel(VectorScreen(sX*0.01,sY*0.96),Colour(255,128,0),"SAMPLE TEXT M8");
::PS_label.FontSize = 20;
::XP <- 0;
::Hunger <- 0;
::PS_Box <- GUISprite("semitransparent.png",VectorScreen(0,sY*0.94))
::PS_Box.Size = VectorScreen(sX ,sY*0.2 );
::PS_Box.SendToBottom();

::VS <- GUILabel(VectorScreen(sX*0.01,sY*0.96),Colour(255,128,0),"");
::VS.FontSize = 20;
/*
Food system
*/
::Food_base <- null;
::Food_image1 <- null;
::Food_button1 <- null;
::Food_button2 <- null;
::Food_button3 <- null;
::foods_index <- 0;

/*
Pay N Spray
*/
::PayNSpray_base <- null;
::PayNSpray_button1 <- null;
::PayNSpray_button2 <- null;
::PayNSpray_button3 <- null;
/*
BASIC TUNING
*/
::Tunning_base <- null;
::Tunning_button1 <- null;
::Tunning_button2 <- null;
::Tunning_button3 <- null;
::Tunning_button4 <- null;
::Tunning_button5 <- null;
::Tunning_button6 <- null;
::Tunning_button7 <- null;
::Tunning_button8 <- null;

/*
WEP BUY SYSTEM (copied from RCNR-Redux)
*/
::gun_wnd <- null;
::sprite1 <- null; 
::button26 <- null;
::button27 <- null;
::button28 <- null;
::label3 <- null;
::label4 <- null;
::selectedweapon <- 1;
::weaponprice <- 500;
::weaponname <- "Brass Knucles";

/*
SCOPED M4/AK IMAGES
*/
::Weapon_Scoped <- false;
::Weapon_Scope <- null;
::SCOPEBUTTON <- KeyBind(0x02);

/*
BUY INTERIOUR SYSTEM
*/
::interior_WND <- null;
::interior_b3 <- null;
::interior_b1 <- null;
::interior_b2 <- null;

/*
CRATE SYSTEM
*/
::CRATE_WND <- null;
::CRATE_BUTTONROLL <- null;
::CRATESPRITE1 <- null;
::CRATESPRITE2 <- null;
::CRATESPRITE3 <- null;
::CRATESPRITE4 <- null;
::CRATESPRITE5 <- null;
::CRATEPICKER <- null;
::CRATE_ROLL <- false;
::CRATE_TIMER <- 300;
::CRATE_VALUES <- array(5,null);
::CRATE_INTV <- array(5,-1);

function Script::ScriptProcess()
{
	if((CRATE_WND != null) && (CRATE_ROLL == true))
	{
		::CRATESPRITE1.Position.X -= 5;
		if(::CRATESPRITE1.Position.X <= 0) 
		{
			local r = rand() % 10;
			::CRATESPRITE1.Position.X = 360;
			::CRATESPRITE1.SetTexture(CrateImage(r));
			::CRATE_VALUES[0] = CrateValue(r);
			::CRATE_INTV[0] =r;
		}

		::CRATESPRITE2.Position.X -= 5;
		if(::CRATESPRITE2.Position.X <= 0) 
		{
			local r = rand() % 10;
			::CRATESPRITE2.Position.X = 360;
			::CRATESPRITE2.SetTexture(CrateImage(r));
			::CRATE_VALUES[1] = CrateValue(r);
			::CRATE_INTV[1] =r;
		}

		::CRATESPRITE3.Position.X -= 5;
		if(::CRATESPRITE3.Position.X <= 0)
		{
			local r = rand() % 10;
			::CRATESPRITE3.Position.X = 360;
			::CRATESPRITE3.SetTexture(CrateImage(r));
			::CRATE_VALUES[2] = CrateValue(r);
			::CRATE_INTV[2] =r;
		}

		::CRATESPRITE4.Position.X -= 5;
		if(CRATESPRITE4.Position.X <= 0)
		{
			local r = rand() % 10;
			 ::CRATESPRITE4.Position.X = 360;
			 ::CRATESPRITE4.SetTexture(CrateImage(r));
			 ::CRATE_VALUES[3] = CrateValue(r);
			 ::CRATE_INTV[3] =r;
		}

		::CRATESPRITE5.Position.X -= 5;
		if(::CRATESPRITE5.Position.X <= 0) 
		{
			local r = rand() % 10;
			::CRATESPRITE5.Position.X = 360;
			::CRATESPRITE5.SetTexture(CrateImage(r));
			::CRATE_VALUES[4] = CrateValue(r);
			::CRATE_INTV[4] =r;
		}

		::CRATE_TIMER -= 1;
		if(::CRATE_TIMER <= 0 )
		{
			local distances = array(5,0);
			distances[0] = CRATESPRITE1.Position.X;
			distances[1] = CRATESPRITE2.Position.X;
			distances[2] = CRATESPRITE3.Position.X;
			distances[3] = CRATESPRITE4.Position.X;
			distances[4] = CRATESPRITE5.Position.X;

			local result = -1;

			for(local i =0 ; i < 5;i++)
			{
				if(Between(distances[i],distances[i]+64,180))
				{
					result = i;
					break;
				}
			}
			if(result == -1)
			{
				::CRATE_TIMER = 300;
			}
			else
			{
				::CRATE_ROLL = false;
				local str = Stream();
				str.WriteInt(37);
				str.WriteString(CRATE_VALUES[result]);
				Server.SendData(str);
				if(IN_DEBUG)
				{
					Console.Print("result:"+CRATE_VALUES[result]+" "+CRATE_INTV[result]);
					Console.Print("Crate values and images:");
					for(local i =0 ; i < 5;i++)
					{
						Console.Print("Image:"+CrateImage(CRATE_INTV[i])+"  integer value "+::CRATE_INTV[i]+" String value :"+CRATE_VALUES[i]);
					}
				}
			}
		}
	}
}

function Server::ServerData(stream) 
{
	local integer = stream.ReadInt();
	local str = stream.ReadString();
	switch(integer)
	{
		//login
		case 0:
		{
			GUI.SetMouseEnabled(false);
			::Login_wnd = null;
			::Login_button1 = null;
			::Login_label1 = null;
			::Login_sprite1 = null;
			break;
		}
		case 1:
		{
			GUI.SetMouseEnabled(false);
			::Login_wnd = null;
			::Login_button1 = null;
			::Login_label1 = null;
			::Login_sprite1 = null;
			::Register_wnd = null;
			::Register_label1 = null;
			::Register_Textbox1 = null;
			::Register_label2 = null;
			::Register_Textbox2 = null;
			::Register_label3 = null;
			::Register_Textbox3 = null;
			::Register_button1 = null;
			break;
		}
		case 2:
		{
			::Register_wnd = null;
			::Register_label1 = null;
			::Register_Textbox1 = null;
			::Register_label2 = null;
			::Register_Textbox2 = null;
			::Register_label3 = null;
			::Register_Textbox3 = null;
			::Register_button1 = null;
			break;
		}
		//job
		case 3:
		{
			GUI.SetMouseEnabled(true);
			::Job_wnd = GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(300,100),Colour(200,200,200),"Job");
			::Job_label1 = GUILabel(VectorScreen(10,10),Colour(0,0,0),"Do you want to be a "+str+"?");
			::Job_button1 = GUIButton(VectorScreen(10,30),VectorScreen(50,20),Colour(0,255,0),"Yes");
			::Job_button2 = GUIButton(VectorScreen(70,30),VectorScreen(50,20),Colour(255,0,0),"No");
			::Job_wnd.AddChild(Job_label1);
			::Job_wnd.AddChild(Job_button1);
			::Job_wnd.AddChild(Job_button2);
			::Job = str;
			break;
		}
		case 4:
		{
			GUI.SetMouseEnabled(false);
			::Job = "";
			::Job_wnd = null;
			::Job_button1 = null;
			::Job_button2 = null;
			::Job_label1 = null;
			break;
		}
		//buy car
		case 5:
		{
			GUI.SetMouseEnabled(true);
			::Buycar_wnd = GUIWindow(VectorScreen(sY/3,sX/3),VectorScreen(300,200),Colour(200,200,200),"Car shop");
			::Buycar_label1 = GUILabel(VectorScreen(10,10),Colour(0,0,0),"Vehicle name:");
			::Buycar_label2 = GUILabel(VectorScreen(10,30),Colour(0,0,0),"Vehicle price:");
			::Buycar_button1 = GUIButton(VectorScreen(10,100),VectorScreen(100,20),Colour(0,255,0),"Buy this car!");
			::Buycar_button2 = GUIButton(VectorScreen(100,50),VectorScreen(20,20),Colour(0,255,0),"<");
			::Buycar_button3 = GUIButton(VectorScreen(130,50),VectorScreen(20,20),Colour(0,255,0),">");
			::Buycar_wnd.AddChild(Buycar_label1);
			::Buycar_wnd.AddChild(Buycar_label2);
			::Buycar_wnd.AddChild(Buycar_button1);
			::Buycar_wnd.AddChild(Buycar_button2);
			::Buycar_wnd.AddChild(Buycar_button3);
			::Buycar_index = 130;
			Buycar_Event1(0)
			break;
		}
		case 6:
		{
			GUI.SetMouseEnabled(false);
			::Buycar_wnd = null;
			::Buycar_button1 = null;
			::Buycar_button2 = null;
			::Buycar_button3 = null;
			::Buycar_label1 = null;
			::Buycar_label2 = null;
			break;
		}
		//chase system
		case 7:
		{
			::Chase_base <- GUISprite("wnd.png",VectorScreen(sX * 0.3,sY * 0.8))
			::Chase_base.Size = VectorScreen(sX * 0.4,sY * 0.2);
			::Chase_base.SendToBottom();
			
			::Chase_icon1 <- GUISprite("alive_cops.png",VectorScreen(sX * 0.31,sY * 0.81));
			::Chase_icon1.Size = VectorScreen(sX * 0.1,sY * 0.1);
			
			::Chase_icon2 <- GUISprite("dead_cops.png",VectorScreen(sX * 0.59,sY * 0.81));
			::Chase_icon2.Size = VectorScreen(sX * 0.1,sY * 0.1);
			
			::Chase_pbar1 <- GUIProgressBar(VectorScreen(sX * 0.31, sY * 0.95),VectorScreen(sX * 0.39,sY *0.05),Colour(255,0,0));
			::Chase_pbar1.MaxValue = 100;
			::Chase_pbar1.Value = 0;
			::Chase_pbar1.StartColour = Colour(255,0,0);
			::Chase_pbar1.EndColour = Colour(0,0,255);
			
			::Chase_l1 <- GUILabel(VectorScreen(sX*0.31,sY* 0.90),Colour(0,0,0),"Active:"+Cops_active);
			::Chase_l1.SendToTop();
			
			::Chase_l2 <- GUILabel(VectorScreen(sX*0.61,sY* 0.90),Colour(0,0,0),"Disabled:"+Cops_disabled);
			::Chase_l2.SendToTop();
			
			::Chase_l3 <- GUILabel(VectorScreen(sX*0.31,sY*0.93),Colour(255,0,0),"BUSTED");
			::Chase_l3.SendToTop();
			::Chase_l3.FontSize = 12;
			
			::Chase_l4 <- GUILabel(VectorScreen(sX*0.61,sY*0.93),Colour(0,0,255),"EVADE");
			::Chase_l4.SendToTop();
			::Chase_l4.FontSize = 12;
			
			::Cops_active = 0;
			::Cops_disabled = 0;
			break;
		}
		case 8:
		{
			local pbar = GetTok(str," ",1).tointeger();
			if (GetTok(str," ",2).tointeger() > 0) ::Cops_active = GetTok(str," ",2).tointeger();
			else ::Cops_active += GetTok(str," ",2).tointeger();
			::Cops_disabled += GetTok(str," ",3).tointeger();
			
			::Chase_l1.Text = "Active:"+Cops_active;
			::Chase_l2.Text = "Disabled:"+Cops_disabled;
			::Chase_pbar1.Value += pbar;
			if(::Chase_pbar1.Value == 0)
			{
				local str = Stream();
				str.WriteInt(8);
				Server.SendData(str);
			}
			if(::Chase_pbar1.Value == 100)
			{
				local str = Stream();
				str.WriteInt(9);
				Server.SendData(str);
			}
			if(Cops_active < 0)
			{
				local str = Stream();
				str.WriteInt(9);
				Server.SendData(str);
			}
			break;
		}
		case 9:
		{
			::Chase_base = null;
			::Chase_icon1 = null;
			::Chase_icon2 = null;
			::Chase_l1 = null;
			::Chase_l2 = null;
			::Chase_l3 = null;
			::Chase_l4 = null;
			::Chase_pbar1 = null;
			break;
		}
		//skin sys
		case 10:
		{
			GUI.SetMouseEnabled(true);
			::Skin_base <- GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(300,150),Colour(255,255,255),"Choose a skin.");
			::Skin_label1 <- GUILabel(VectorScreen(10,10),Colour(0,0,0),"Choose a skin by pressing the 2 buttons");
			::Skin_button1 <- GUIButton(VectorScreen(10,30),VectorScreen(20,20),Colour(255,255,0),"<");
			::Skin_button2 <- GUIButton(VectorScreen(40,30),VectorScreen(20,20),Colour(255,255,0),">");
			::Skin_button3 <- GUIButton(VectorScreen(10,60),VectorScreen(60,20),Colour(255,255,0),"Buy");
			::Skin_base.AddChild(::Skin_button1);
			::Skin_base.AddChild(::Skin_button2);
			::Skin_base.AddChild(::Skin_button3);
			::Skin_base.AddChild(::Skin_label1);
			break;
		}
		//stats
		case 11:
		{
			::hp.Value = str.tointeger();
			break;
		}
		case 12:
		{
			::arm.Value = str.tointeger();
			break;
		}
		case 13:
		{
			::VS.Text = "";
			if(GetTok(str," ",3).tointeger() != -1) ::XP = GetTok(str," ",3).tointeger()
			::PS_label.Text = World.FindLocalPlayer().Name+ ": Cash:"+GetTok(str," ",1)+" Wanted Level:"+GetTok(str," ",2)+" XP:"+ ::XP;
			if(GetTok(str," ",4).tointeger() != -1) ::hunger.Value = GetTok(str," ",4).tointeger();
			break;
		}
		//food
		case 14:
		{
			GUI.SetMouseEnabled(true);
			::Food_base = GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(200,200),Colour(255,255,255),"Buy food");
			::Food_image1 = GUISprite("water.png",VectorScreen(10,10));
			::Food_image1.Size = VectorScreen(50,50);
			::Food_button1 = GUIButton(VectorScreen(10,70),VectorScreen(20,20),Colour(255,255,0),"<");
			::Food_button2 = GUIButton(VectorScreen(40,70),VectorScreen(20,20),Colour(255,255,0),">");
			::Food_button3 = GUIButton(VectorScreen(10,90),VectorScreen(60,20),Colour(0,255,0),"Buy");
			::Food_base.AddChild(Food_button1);
			::Food_base.AddChild(Food_button2);
			::Food_base.AddChild(Food_button3);
			::Food_base.AddChild(Food_image1);
			break;
		}
		case 15:
		{
			::VS.Text = "ID:"+GetTok(str," ",1)+" Owner:"+GetTok(str," ",2)+" Fuel:"+GetTok(str," ",3)+" NOS:"+GetTok(str," ",4);
			::PS_label.Text = "";
			break;
		}
		case 16:
		{
			::hunger.Value = GetTok(str," ",1).tointeger();
			break;
		}
		//car repair
		case 17:
		{
			GUI.SetMouseEnabled(true);
			::PayNSpray_base = GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(200,200),Colour(255,255,255),"Pay N' Spray");
			::PayNSpray_button1 = GUIButton(VectorScreen(10,10),VectorScreen(60,20),Colour(255,255,0),"Respray");
			::PayNSpray_button2 = GUIButton(VectorScreen(10,40),VectorScreen(60,20),Colour(255,255,0),"Repair");
			::PayNSpray_button3 = GUIButton(VectorScreen(10,70),VectorScreen(60,20),Colour(255,255,0),"Refuel");
			::PayNSpray_base.AddChild(PayNSpray_button1);
			::PayNSpray_base.AddChild(PayNSpray_button2);
			::PayNSpray_base.AddChild(PayNSpray_button3);
			break;
		}
		//basic tuning
		case 18:
		{
			GUI.SetMouseEnabled(true);
			::Tunning_base = GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(200,300),Colour(255,255,255),"Tuning system");
			::Tunning_button1 = GUIButton(VectorScreen(10,10),VectorScreen(20,20),Colour(255,255,0),"<");
			::Tunning_button2 = GUIButton(VectorScreen(30,10),VectorScreen(20,20),Colour(255,255,0),">");
			::Tunning_button3 = GUIButton(VectorScreen(10,30),VectorScreen(140,20),Colour(0,255,0),"Buy paint for main colour");
			::Tunning_button4 = GUIButton(VectorScreen(10,60),VectorScreen(20,20),Colour(255,255,0),"<");
			::Tunning_button5 = GUIButton(VectorScreen(30,60),VectorScreen(20,20),Colour(255,255,0),">");
			::Tunning_button6 = GUIButton(VectorScreen(10,90),VectorScreen(140,20),Colour(0,255,0),"Buy paint for second colour");
			::Tunning_button7 = GUIButton(VectorScreen(10,120),VectorScreen(100,20),Colour(0,255,0),"Buy armour");
			::Tunning_button8 = GUIButton(VectorScreen(10,150),VectorScreen(100,20),Colour(0,255,0),"Buy NO2");
			
			::Tunning_base.AddChild(::Tunning_button1);
			::Tunning_base.AddChild(::Tunning_button2);
			::Tunning_base.AddChild(::Tunning_button3);
			::Tunning_base.AddChild(::Tunning_button4);
			::Tunning_base.AddChild(::Tunning_button5);
			::Tunning_base.AddChild(::Tunning_button6);
			::Tunning_base.AddChild(::Tunning_button7);
			::Tunning_base.AddChild(::Tunning_button8);
			break;
		}
		case 19:
		{
				GUI.SetMouseEnabled(true);
				::gun_wnd <- GUIWindow(VectorScreen(sX / 2, sY / 2),VectorScreen(250,250),Colour(255,255,255),"Gun Shop");
				::sprite1 = GUISprite( "fist.png", VectorScreen( 10, 10));
				::sprite1.Size = VectorScreen(60,60);
				::button26 = GUIButton(VectorScreen(10,70),VectorScreen(30,20),Colour(0,255,0),"<");
				::button27 = GUIButton(VectorScreen(40,70),VectorScreen(30,20),Colour(0,255,0),">");
				::button28 = GUIButton(VectorScreen(10,110),VectorScreen(60,20),Colour(0,255,0),"Buy weapon");
				::label3 = GUILabel(VectorScreen(70,10),Colour(0,0,0),weaponname);
				::label4 = GUILabel(VectorScreen(70,30),Colour(0,0,0),"Cost: $"+weaponprice);
				::gun_wnd.AddChild(sprite1);
				::gun_wnd.AddChild(button26);
				::gun_wnd.AddChild(button27);
				::gun_wnd.AddChild(button28);
				::gun_wnd.AddChild(label3);
				::gun_wnd.AddChild(label4);
				gun_wnd_event1();
			break;
		}
		case 20:
		{
			::Weapon_Scoped = true;
			break;
		}
		case 21:
		{
			::Weapon_Scoped = false;
			::Weapon_Scope = null;
			break;
		}
		case 22:
		{
			GUI.SetMouseEnabled(true);
			::interior_WND =  GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(200,120),Colour(255,255,255),"Interiour Shop");
			::interior_b1 = GUIButton(VectorScreen(10,10),VectorScreen(20,20),Colour(255,0,0),"<");
			::interior_b2 = GUIButton(VectorScreen(40,10),VectorScreen(20,20),Colour(255,0,0),">");
			::interior_b3 = GUIButton(VectorScreen(10,40),VectorScreen(50,20),Colour(0,255,0),"Buy");
			::interior_WND.AddChild(::interior_b1);
			::interior_WND.AddChild(::interior_b2);
			::interior_WND.AddChild(::interior_b3);
			break;
		}
		case 23:
		{
			GUI.SetMouseEnabled(false);
			::interior_WND = null;
			::interior_b1 = null;
			::interior_b2 = null;
			::interior_b3 = null;
			break;
		}
		case 24:
		{
			GUI.SetMouseEnabled(true);
			local r = array(5,-1);
			for(local i =0 ; i < 5; i++)
			{
				r[i] = rand() % 10;
			}
			::CRATE_WND = GUIWindow(VectorScreen(sX/4,sY/4),VectorScreen(450,400),Colour(255,255,255),"Crates");
			::CRATESPRITE1 = GUISprite(CrateImage(r[0]),VectorScreen(10,10));
			::CRATESPRITE1.Size = VectorScreen(64,64);
			::CRATESPRITE2 = GUISprite(CrateImage(r[1]),VectorScreen(80,10));
			::CRATESPRITE2.Size = VectorScreen(64,64);
			::CRATESPRITE3 = GUISprite(CrateImage(r[2] ),VectorScreen(150,10));
			::CRATESPRITE3.Size = VectorScreen(64,64);
			::CRATESPRITE4 = GUISprite(CrateImage(r[3]),VectorScreen(220,10));
			::CRATESPRITE4.Size = VectorScreen(64,64);
			::CRATESPRITE5 = GUISprite(CrateImage(r[4]),VectorScreen(290,10));
			::CRATESPRITE5.Size = VectorScreen(64,64);
			::CRATEPICKER = GUISprite("semitransparent.png",VectorScreen(180,10))
			::CRATEPICKER.Size = VectorScreen(10,32);
			::CRATE_BUTTONROLL = GUIButton(VectorScreen(150,80),VectorScreen(60,20),Colour(0,255,0),"Buy crate");
			::CRATE_WND.AddChild(CRATESPRITE1);
			::CRATE_WND.AddChild(CRATESPRITE2);
			::CRATE_WND.AddChild(CRATESPRITE3);
			::CRATE_WND.AddChild(CRATESPRITE4);
			::CRATE_WND.AddChild(CRATESPRITE5);
			::CRATE_WND.AddChild(CRATEPICKER);
			::CRATE_WND.AddChild(CRATE_BUTTONROLL);
		}
		default: break;
	}
}


function GUI::ElementClick(element, mouseX, mouseY)
{
	if(element == Login_button1)
	{
		local str = Stream();
		str.WriteInt(0);
		str.WriteString(Login_TextBox1.Text);
		Server.SendData(str);
	}
	if(element == Login_button2)
	{
		if(::IsRegisterWNDOpen == false)
		{
			::IsRegisterWNDOpen = true;
			::Register_wnd = GUIWindow(VectorScreen(sX/2,sY/2),VectorScreen(210,150),Colour(200,200,200),"Register");
			::Register_label1 = GUILabel(VectorScreen(10,10),Colour(0,0,0),"Email:")
			::Register_Textbox1 = GUIEditbox(VectorScreen(50,10),VectorScreen(150,20),Colour(255,255,255),"user@domain.com")
			::Register_label2 = GUILabel(VectorScreen(10,40),Colour(0,0,0),"Forum account");
			::Register_Textbox2 = GUIEditbox(VectorScreen(90,40),VectorScreen(70,20),Colour(255,255,255),"user")
			::Register_label3 = GUILabel(VectorScreen(10,70),Colour(0,0,0),"Password:");
			::Register_Textbox3 = GUIEditbox(VectorScreen(70,70),VectorScreen(70,20),Colour(255,255,255),"password")
			::Register_button1 = GUIButton(VectorScreen(10,100),VectorScreen(70,20),Colour(0,255,0),"Register");
			::Register_wnd.AddChild(Register_label1)
			::Register_wnd.AddChild(Register_label2)
			::Register_wnd.AddChild(Register_label3)
			::Register_wnd.AddChild(Register_Textbox1)
			::Register_wnd.AddChild(Register_Textbox2)
			::Register_wnd.AddChild(Register_Textbox3)
			::Register_wnd.AddChild(Register_button1)
		}
	}
	if(element == Register_button1)
	{
		local message = Stream();
		message.WriteInt(1);
		if(Register_Textbox1.Text == "") Register_Textbox1.Text = "";
		if(Register_Textbox2.Text == "") Register_Textbox1.Text = "";
		if(Register_Textbox3.Text == "") Register_Textbox3.Text = "password";
		message.WriteString(Register_Textbox3.Text+" "+Register_Textbox1.Text+" "+Register_Textbox2.Text);
		Server.SendData(message);
	}
	if(element == Job_button1)
	{
		local msg = Stream();
		msg.WriteInt(3);
		msg.WriteString(::Job);
		Server.SendData(msg);
		
	    local msg2 = Stream();
		msg2.WriteInt(4);
		Server.SendData(msg2);
	}
	if(element == Job_button2)
	{
		local msg = Stream();
		msg.WriteInt(4);
		Server.SendData(msg);
	}
	if(element == Buycar_button2)
	{
		::Buycar_index -= 1;
		Buycar_Event1(-1);
	}
	if(element == Buycar_button3)
	{
		::Buycar_index += 1;
		Buycar_Event1(1);
	}
	if(element == Buycar_button1)
	{
		local msg = Stream();
		msg.WriteInt(5);
		msg.WriteString(::Buycar_index+" "+GetVehCash(GetVehName(::Buycar_index))+" "+GetVehName(::Buycar_index));
		Server.SendData(msg);
	}
	if(element == ::Skin_button1)
	{
		local msg = Stream();
		msg.WriteInt(12);
		Server.SendData(msg);
	}
	if(element == ::Skin_button2)
	{
		local msg = Stream();
		msg.WriteInt(13);
		Server.SendData(msg);
	}
	if(element == ::Skin_button3)
	{
		local msg = Stream();
		msg.WriteInt(14);
		Server.SendData(msg);
	}
	if(element == ::Food_button1)
	{
		::foods_index -= 1;
		buyfood_event1();
	}
	if(element == ::Food_button2)
	{
		::foods_index += 1;
		buyfood_event1();
	}
	if(element == ::Food_button3)
	{
		local msg = Stream();
		msg.WriteInt(15);
		msg.WriteString(::foods_index+"");
		Server.SendData(msg);
	}
	if(element == ::PayNSpray_button1)
	{
		local msg = Stream();
		msg.WriteInt(16);
		Server.SendData(msg);
	}
	if(element == ::PayNSpray_button2)
	{
		local msg = Stream();
		msg.WriteInt(17);
		Server.SendData(msg);
	}
	if(element == ::PayNSpray_button3)
	{
		local msg = Stream();
		msg.WriteInt(18);
		Server.SendData(msg);
	}
	
	if(element == ::Tunning_button1)
	{
		local msg = Stream();
		msg.WriteInt(19);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button2)
	{
		local msg = Stream();
		msg.WriteInt(20);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button3)
	{
		local msg = Stream();
		msg.WriteInt(21);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button4)
	{
		local msg = Stream();
		msg.WriteInt(22);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button5)
	{
		local msg = Stream();
		msg.WriteInt(23);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button6)
	{
		local msg = Stream();
		msg.WriteInt(24);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button7)
	{
		local msg = Stream();
		msg.WriteInt(25);
		Server.SendData(msg);
	}
	if(element == ::Tunning_button8)
	{
		local msg = Stream();
		msg.WriteInt(26);
		Server.SendData(msg);
	}
	if(element == ::Buycar_button2)
	{
		local msg = Stream();
		msg.WriteInt(30);
		Server.SendData(msg);
	}
	if(element == ::Buycar_button3)
	{
		local msg = Stream();
		msg.WriteInt(31);
		Server.SendData(msg);
	}
	if(element == ::button26)
	{
		::selectedweapon += -1;
		gun_wnd_event1();
	}
	if(element == ::button27)
	{
		::selectedweapon += 1;
		gun_wnd_event1();
	}
	if(element == ::button28)
	{
		local Data = Stream();
		Data.WriteInt(27);
		Data.WriteString(selectedweapon+" "+weaponprice);
		Server.SendData(Data);
	}
	if(element == ::interior_b1)
	{
		local Data = Stream();
		Data.WriteInt(33);
		Server.SendData(Data);
	}
	if(element == ::interior_b2)
	{
		local Data = Stream();
		Data.WriteInt(34);
		Server.SendData(Data);
	}
	if(element == ::interior_b3)
	{
		local Data = Stream();
		Data.WriteInt(35);
		Server.SendData(Data);
	}
	if(element == ::CRATE_BUTTONROLL)
	{
		::CRATE_ROLL = true;
		::CRATE_TIMER = 300;
	}
}
function GUI::WindowClose(window)
{
	if(window == Login_wnd)
	{
		local str = Stream();
		str.WriteInt(-1);
		Server.SendData(str);
	}
	else if(window == Register_wnd)
	{
		::IsRegisterWNDOpen = false;
	}
	else
	{
		if(window == Buycar_wnd)
		{
			local str = Stream();
			str.WriteInt(32);
			Server.SendData(str);
		}
		if(window == interior_WND)
		{
			local Data = Stream();
			Data.WriteInt(36);
			Server.SendData(Data);
		}
		GUI.SetMouseEnabled(false);
	}
}
function Buycar_Event1(counter_st)
{
	::Buycar_index = Index_Limits(::Buycar_index,counter_st); 
	local veh_name = GetVehName(::Buycar_index)
	::Buycar_label1.Text = "Vehicle name:"+veh_name;
	::Buycar_label2.Text = "Vehicle price:"+GetVehCash(veh_name);
}
function Index_Limits(id,counter_st)
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
function GetVehCash(veh)
{
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
	if(veh == "chevrolet camaro") return 7000000;
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
	
	if(veh == 6400) return "hondacivic";
	if(veh == 6401) return "bmwm3gtr";
	if(veh == 6402) return "corvette";
	if(veh == 6403) return "cheetahsa";
	if(veh == 6404) return "bansheesa";
	if(veh == 6405) return "skyline";
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
function GetWeaponName(id)
{
	if(id == 1) return "Brass Knuckles";
}
function KeyBind::OnDown(key)
{
	if(key == KeyE)
	{
		local msg = Stream();
		msg.WriteInt(7);
		Server.SendData(msg);
	}
	if(key == KeyX)
	{
		local str = Stream();
		str.WriteInt(10);
		Server.SendData(str);
	}
	if(key == SCOPEBUTTON)
	{
		if(Weapon_Scoped)
		{
			::Weapon_Scope = GUISprite("scope.png",VectorScreen(0,0));
			::Weapon_Scope.Size = VectorScreen(sX,sY);
			::Weapon_Scope.SendToBottom();
		}
	}
	if(key == KeyRET)
	{
		local str = Stream();
		str.WriteInt(29);
		Server.SendData(str);
	}

}
function KeyBind::OnUp(key)
{
	if(key == KeyX)
	{
		local str = Stream();
		str.WriteInt(11);
		Server.SendData(str);
	}
	if(key == SCOPEBUTTON)
	{
		if(::Weapon_Scoped)
		{
			::Weapon_Scope = null;
		}
	}
}
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
function foodimage(index)
{
	switch(index)
	{
		case 1: return "coca cola.png";
		case 2: return "french fries.png";
		case 3: return "hamburger.png";
		case 4: return "kebab.png";
		case 5: return "pizza.png";
		case 6: return "salad.png";
		case 7: return "sprite.png";
		case 8: return "water.png";
		default: return "coca cola.png";
	}
	return 1;
}
function buyfood_event1()
{
	if(::foods_index > 8) ::foods_index = 1;
	if(::foods_index < 1) ::foods_index = 8;
	Food_image1.SetTexture(foodimage(foods_index));
}
function gun_wnd_event1()
{
	//LIMITE
	if(::selectedweapon == 0) ::selectedweapon = 122;
	if(::selectedweapon == 102) ::selectedweapon = 33;
	if(::selectedweapon == 34) ::selectedweapon = 103;
	if(::selectedweapon == 123) ::selectedweapon = 1;
	//TEXTURA LA sprite1
	switch(selectedweapon)
	{
		case 1:
		{
			::weaponname = "Brass Knucles";
			::weaponprice = 500;
			::sprite1.SetTexture("brassknuckle.png");
			break;
		}
		case 2:
		{
			::weaponname = "Screwdriver";
			::weaponprice = 300;
			::sprite1.SetTexture("screwdriver.png");
			break;
		}
		case 3:
		{
			::weaponname = "Golf Club";
			::weaponprice = 800;
			::sprite1.SetTexture("golfclub.png");
			break;
		}
		case 4:
		{
			::weaponname = "Nitestick";
			::weaponprice = 1000;
			::sprite1.SetTexture("nitestick.png");
			break;
		}
		case 5:
		{
			::weaponname = "Knife";
			::weaponprice = 800;
			::sprite1.SetTexture("knifecur.png");
			break;
		}
		case 6:
		{
			::weaponname = "Baseball Bat";
			::weaponprice = 1000;
			::sprite1.SetTexture("bat.png");
			break;
		}
		case 7:
		{
			::weaponname = "Hammer";
			::weaponprice = 250;
			::sprite1.SetTexture("hammer.png");
			break;
		}
		case 8:
		{
			::weaponname = "Meat Cleaver";
			::weaponprice = 650;
			::sprite1.SetTexture("cleaver.png");
			break;
		}
		case 9:
		{
			::weaponname = "Machete";
			::weaponprice = 1200;
			::sprite1.SetTexture("machete.png");
			break;
		}
		case 10:
		{
			::weaponname = "Katana";
			::weaponprice = 1500;
			::sprite1.SetTexture("katana.png");
			break;
		}
		case 11:
		{
			::weaponname = "Chainsaw";
			::weaponprice = 2500;
			::sprite1.SetTexture("chnsaw.png");
			break;
		}
		case 12:
		{
			::weaponname = "Grenades";
			::weaponprice = 1800;
			::sprite1.SetTexture("grenade.png");
			break;
		}
		case 13:
		{
			::weaponname = "Remote Grenades";
			::weaponprice = 2000;
			::sprite1.SetTexture("bomb.png");
			break;
		}
		case 14:
		{
			::weaponname = "Tear Gas";
			::weaponprice = 1600;
			::sprite1.SetTexture("teargas.png");
			break;
		}
		case 15:
		{
			::weaponname = "Molotov";
			::weaponprice = 1500;
			::sprite1.SetTexture("molotov.png");
			break;
		}
		case 16:
		{
			::weaponname = "Bank Bomb";
			::weaponprice = 2500;
			::sprite1.SetTexture("rocketla.png");
			break;
		}
		case 17:
		{
			::weaponname = "Colt .45";
			::weaponprice = 3000;
			::sprite1.SetTexture("colt45.png");
			break;
		}
		case 18:
		{
			::weaponname = "Python .357";
			::weaponprice = 3750;
			::sprite1.SetTexture("python.png");
			break;
		}
		case 19:
		{
			::weaponname = "Pump-Action Shotgun";
			::weaponprice = 5000;
			::sprite1.SetTexture("chromegun.png");
			break;
		}
		case 20:
		{
			::weaponname = "S.p.a.s 12";
			::weaponprice = 8000;
			::sprite1.SetTexture("shotgspa.png");
			break;
		}
		case 21:
		{
			::weaponname = "Stubby Shotgun";
			::weaponprice = 6500;
			::sprite1.SetTexture("buddyshot.png");
			break;
		}
		case 22:
		{
			::weaponname = "Tec-9";
			::weaponprice = 2500;
			::sprite1.SetTexture("tec9.png");
			break;
		}
		case 23:
		{
			::weaponname = "Uzi";
			::weaponprice = 3000;
			::sprite1.SetTexture("uzi.png");
			break;
		}
		case 24:
		{
			::weaponname = "Mac-10";
			::weaponprice = 4000;
			::sprite1.SetTexture("ingramsl.png");
			break;
		}
		case 25:
		{
			::weaponname = "MP5";
			::weaponprice = 5000;
			::sprite1.SetTexture("mp5lng.png");
			break;
		}
		case 26:
		{
			::weaponname = "M4";
			::weaponprice = 15000;
			::sprite1.SetTexture("m4.png");
			break;
		}
		case 27:
		{
			::weaponname = "Kruger";
			::weaponprice = 10000;
			::sprite1.SetTexture("ruger.png");
			break;
		}
		case 28:
		{
			::weaponname = "Sniper Rifle";
			::weaponprice = 8000;
			::sprite1.SetTexture("sniper.png");
			break;
		}
		case 29:
		{
			::weaponname = "Laser Sniper";
			::weaponprice = 11000;
			::sprite1.SetTexture("laser.png");
			break;
		}
		case 30:
		{
			::weaponname = "RPG-7";
			::weaponprice = 20000;
			::sprite1.SetTexture("rocketla.png");
			break;
		}
		case 31:
		{
			::weaponname = "Flame-Trower";
			::weaponprice = 12000;
			::sprite1.SetTexture("flame.png");
			break;
		}		
		case 32:
		{
			::weaponname = "M60";
			::weaponprice = 25000;
			::sprite1.SetTexture("m60.png");
			break;
		}		
		case 33:
		{
			::weaponname = "Minigun (VIP Exclusive)";
			::weaponprice = 50000;
			::sprite1.SetTexture("minigun.png");
			break;
		}			
		case 103:
		{
			::weaponname = "IMI Desert Eagle .50 AE";
			::weaponprice = 7500;
			::sprite1.SetTexture("deserteagle.png");
			break;
		}		
		case 104:
		{
			::weaponname = "PP19-Bizon M1";
			::weaponprice = 9500;
			::sprite1.SetTexture("ppbizon.png");
			break;
		}
		case 105:
		{
			::weaponname = "AWP (VIP Exclusive)"
			::weaponprice = 25000;
			::sprite1.SetTexture("awp.png");
			break;
		}
		case 106:
		{
			::weaponname = "Glock (VIP Exclusive)"
			::weaponprice = 1500;
			::sprite1.SetTexture("glock.png");
			break;
		}
		case 107:
		{
			::weaponname = "AK 47";
			::weaponprice = 30000;
			::sprite1.SetTexture("ak47.png");
			break;
		}
		case 108:
		{
			::weaponname = "Vector Kriss";
			::weaponprice = 17500;
			::sprite1.SetTexture("vector.png");
			break;
		}
		case 109:
		{
			::weaponname = "AK-47 w/ GP-25 Grenade Launcher";
			::weaponprice = 70000;
			::sprite1.SetTexture("ak47.png");
			break;
		}
		case 110:
		{
			::weaponname = "AK-47 Scoped";
			::weaponprice = 40000;
			::sprite1.SetTexture("ak47.png");
			break;
		}
		case 111:
		{
			::weaponname = "AK-47 w/ Extended Magazines";
			::weaponprice = 45000;
			::sprite1.SetTexture("ak47.png");
			break;
		}
		case 112:
		{
			::weaponname = "M4 w/ Extended Magazines";
			::weaponprice = 30000;
			::sprite1.SetTexture("m4.png");
			break;
		}
		case 113:
		{
			::weaponname = "M4 w/ M203 Grenade Launcher";
			::weaponprice = 55000;
			::sprite1.SetTexture("m4.png");
			break;
		}
		case 114:
		{
			::weaponname = "M4 Scoped";
			::weaponprice = 25000;
			::sprite1.SetTexture("m4.png");
			break;
		}
		case 115:
		{
			::weaponname = "M4 Silenced";
			::weaponprice = 20000;
			::sprite1.SetTexture("m4.png");
			break;
		}
		case 116:
		{
			::weaponname = "MP5SD";
			::weaponprice = 10000;
			::sprite1.SetTexture("mp5sd.png");
			break;
		}
		case 117:
		{
			::weaponname = "MP5 w/ Extended Magazines";
			::weaponprice = 10000;
			::sprite1.SetTexture("mp5lng.png");
			break;
		}
		case 118:
		{
			::weaponname = "M60 w/ Extended Magazines";
			::weaponprice = 30000;
			::sprite1.SetTexture("m60.png");
			break;
		}
		case 119:
		{
			::weaponname = "Colt .45 Silenced";
			::weaponprice = 5000;
			::sprite1.SetTexture("colt45.png");
			break;
		}
		case 120:
		{
			::weaponname = "Pump-Action Shotgun w/ Silencer";
			::weaponprice = 6000;
			::sprite1.SetTexture("chromegun.png");
			break;
		}
		case 121:
		{
			::weaponname = "Armour";
			::weaponprice = 2000;
			::sprite1.SetTexture("armour.png");
			break;
		}
		case 122:
		{
			::weaponname = "Juggernaut";
			::weaponprice = 1000000;
			::sprite1.SetTexture("juggernaut.png");
			break;
		}
		default:
		{
			break;
		}
	}
	::label3.Text = weaponname;
	::label4.Text = "Cost: $"+weaponprice;
}



function Player::PlayerShoot(player, weapon, hitEntity, hitPosition)
{
	local lplr = World.FindLocalPlayer();
	if(player == lplr)
	{
		if((weapon == 113) || (weapon == 109))
		{
			local msg = Stream();
			msg.WriteInt(28);
			msg.WriteString(hitPosition.X+" "+hitPosition.Y+" "+hitPosition.Z+" "+player.Name);
			Server.SendData(msg);
		}
	}
}

function CrateChance()
{
	local r = rand() % 101;
	if(Between(0,1)) return 0; //rare car
	if(Between(1,6)) return 1; // common car
	if(Between(6,21)) return 2;//bronze vip
	if(Between(21,31)) return 3;//silver vip
	if(Between(31,36)) return 4;//gold vip
	if(Between(36,37)) return 5; //emerald vip
	if(Between(37,38)) return 6;//admin
	if(Between(38,53)) return 7; //max cash
	if(Between(53,68)) return 8;//extra 2 crates
	if(Between(68,78)) return 9//extra 10 crates;
	if(Between(78,100)) return 7;
}
function CrateValue(input)
{
	switch(input)
	{
		case 0: return "0 1";
		case 1: return "0 0";
		case 2: return 1+(rand() % 4)+"";
		case 3: return 5+(rand() % 4)+"";
		case 4: return 9+(rand() % 4)+"";
		case 5: return 13+(rand() % 4)+"";
		case 6: return "17";
		case 7: return "18";
		case 8: return "19";
		case 9: return "20";
		default: return "18";
	}
}
function CrateImage(input)
{
	switch(input)
	{
		case 0: return "Car_Legendary.png";
		case 1: return "Car_Rare.png";
		case 2: return "VIP_Common.png";
		case 3: return "VIP_Uncommon.png";
		case 4: return "VIP_Rare.png";
		case 5: return "VIP_Legendary.png";
		case 6: return "Legendary_Admin.png";
		case 7: return "Common_MaxCash.png";
		case 8: return "Crate_Uncommon.png";
		case 9: return "Crate_Common.png";
		default: return "Common_MaxCash.png";
	}
}
function GetCrateCommonLevel(input)
{
	switch(input)
	{
		case 0: return "Legendary";
		case 1: return "Rare";
		case 2: return "Common";
		case 3: return "Uncommon";
		case 4: return "Rare";
		case 5: return "Legendary";
		case 6: return "Legendary";
		case 7: return "Common";
		case 8: return "Uncommon";
		case 9: return "Common";
		default: return "Common";
	}
}
function Between(x,y,v)
{
	if((v >= x) && (v <= y)) return true;
	return false;
}