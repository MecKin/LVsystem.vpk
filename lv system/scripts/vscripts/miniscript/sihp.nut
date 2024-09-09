Vars.sihpcharger <- 600
Vars.sihpjockey <- 325
Vars.sihptank <- 4000
Vars.sihphunter <- 250
Vars.sihpsmoker <- 250
Vars.sihpsmokerchoke <- 50
Vars.sihpboomer <- 50
Vars.sihpspitter <- 100
Vars.sihpwitch <- 1000


// 게임 시작시 메모장에서 세팅 불러오기(읽기) -> 게임내 설정과 동기화
::LVsystemSettingboomerhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_boomer_hp.txt"
            Sihp = 50
}
::LVsystemSettingspitterhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_spitter_hp.txt"
            Sihp = 100
}
::LVsystemSettinghunterhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_hunter_hp.txt"
            Sihp = 250
}
::LVsystemSettingjockeyhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_jockey_hp.txt"
            Sihp = 325
}
::LVsystemSettingchargerhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_charger_hp.txt"
            Sihp = 600
}
::LVsystemSettingsmokerhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_smoker_hp.txt"
            Sihp = 250
}
::LVsystemSettingtankhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_tank_hp.txt"
            Sihp = 4000
}
::LVsystemSettingwitchhp <-
{
	Sihpt = "LVsystem/LevelingSystemOption_witch_hp.txt"
            Sihp = 1000
}


Vars.LVhpsystemLoad <- function () // 파일읽기
{
            local Filereading1 = FileToString(LVsystemSettingboomerhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading2 = FileToString(LVsystemSettingspitterhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading3 = FileToString(LVsystemSettinghunterhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading4 = FileToString(LVsystemSettingjockeyhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading5 = FileToString(LVsystemSettingsmokerhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading6 = FileToString(LVsystemSettingchargerhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading7 = FileToString(LVsystemSettingwitchhp.Sihpt); // 파일 있는지 없는지 확인용
            local Filereading8 = FileToString(LVsystemSettingtankhp.Sihpt); // 파일 있는지 없는지 확인용
            if(Filereading1 == null || Filereading2 == null || Filereading3 == null || Filereading4 == null || Filereading5 == null || Filereading6 == null || Filereading7 == null || Filereading8 == null) // 하나라도 없으면
            {
	StringToFile(LVsystemSettingboomerhp.Sihpt, ""+LVsystemSettingboomerhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingspitterhp.Sihpt, ""+LVsystemSettingspitterhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettinghunterhp.Sihpt, ""+LVsystemSettinghunterhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingjockeyhp.Sihpt, ""+LVsystemSettingjockeyhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingsmokerhp.Sihpt, ""+LVsystemSettingsmokerhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingchargerhp.Sihpt, ""+LVsystemSettingchargerhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingwitchhp.Sihpt, ""+LVsystemSettingwitchhp.Sihp); // 메모장 만들기
	StringToFile(LVsystemSettingtankhp.Sihpt, ""+LVsystemSettingtankhp.Sihp); // 메모장 만들기

	local configBhp = FileToString(LVsystemSettingboomerhp.Sihpt);
	local configChp = FileToString(LVsystemSettingchargerhp.Sihpt);
	local configThp = FileToString(LVsystemSettingtankhp.Sihpt);
	local configJhp = FileToString(LVsystemSettingjockeyhp.Sihpt);
	local configHhp = FileToString(LVsystemSettinghunterhp.Sihpt);
	local configShp = FileToString(LVsystemSettingspitterhp.Sihpt);
	local configGhp = FileToString(LVsystemSettingsmokerhp.Sihpt);
	local configWhp = FileToString(LVsystemSettingwitchhp.Sihpt);

	
	configBhp = configBhp.tointeger();
	configChp = configChp.tointeger();
	configThp = configThp.tointeger();
	configJhp = configJhp.tointeger();
	configHhp = configHhp.tointeger();
	configShp = configShp.tointeger();
	configGhp = configGhp.tointeger();
	configWhp = configWhp.tointeger();

	Vars.sihpcharger <- configChp;
	Vars.sihpjockey <- configJhp;
	Vars.sihptank <- configThp;
	Vars.sihphunter <- configHhp;
	Vars.sihpsmoker <- configGhp;
	Vars.sihpsmokerchoke <- configGhp/5;
	Vars.sihpboomer <- configBhp;
	Vars.sihpspitter <- configShp;
	Vars.sihpwitch <- configWhp;
	configBhp = configBhp.tointeger();
	configChp = configChp.tointeger();
	configThp = configThp.tointeger();
	configJhp = configJhp.tointeger();
	configHhp = configHhp.tointeger();
	configShp = configShp.tointeger();
	configGhp = configGhp.tointeger();
	configWhp = configWhp.tointeger();
	Convars.SetValue("z_exploding_health", configBhp);
	Convars.SetValue("z_charger_health", configChp);
	Convars.SetValue("z_tank_health", configThp);
	Convars.SetValue("z_jockey_health", configJhp);
	Convars.SetValue("z_hunter_health", configHhp);
	Convars.SetValue("z_spitter_health", configShp);
	Convars.SetValue("z_gas_health", configGhp);
	Convars.SetValue("tongue_break_from_damage_amount", configGhp/5);
	Convars.SetValue("z_witch_health", configWhp);
	}
	else
	{
	local configBhp = FileToString(LVsystemSettingboomerhp.Sihpt);
	local configChp = FileToString(LVsystemSettingchargerhp.Sihpt);
	local configThp = FileToString(LVsystemSettingtankhp.Sihpt);
	local configJhp = FileToString(LVsystemSettingjockeyhp.Sihpt);
	local configHhp = FileToString(LVsystemSettinghunterhp.Sihpt);
	local configShp = FileToString(LVsystemSettingspitterhp.Sihpt);
	local configGhp = FileToString(LVsystemSettingsmokerhp.Sihpt);
	local configWhp = FileToString(LVsystemSettingwitchhp.Sihpt);

	configBhp = configBhp.tointeger();
	configChp = configChp.tointeger();
	configThp = configThp.tointeger();
	configJhp = configJhp.tointeger();
	configHhp = configHhp.tointeger();
	configShp = configShp.tointeger();
	configGhp = configGhp.tointeger();
	configWhp = configWhp.tointeger();

	Vars.sihpcharger <- configChp;
	Vars.sihpjockey <- configJhp;
	Vars.sihptank <- configThp;
	Vars.sihphunter <- configHhp;
	Vars.sihpsmoker <- configGhp;
	Vars.sihpsmokerchoke <- configGhp/5;
	Vars.sihpboomer <- configBhp;
	Vars.sihpspitter <- configShp;
	Vars.sihpwitch <- configWhp;
	Convars.SetValue("z_exploding_health", configBhp);
	Convars.SetValue("z_charger_health", configChp);
	Convars.SetValue("z_tank_health", configThp);
	Convars.SetValue("z_jockey_health", configJhp);
	Convars.SetValue("z_hunter_health", configHhp);
	Convars.SetValue("z_spitter_health", configShp);
	Convars.SetValue("z_gas_health", configGhp);
	Convars.SetValue("tongue_break_from_damage_amount", configGhp/5);
	Convars.SetValue("z_witch_health", configWhp);
	}
}

Vars.LVhpsystemSave <- function () // 파일읽기
{
	LVsystemSettingboomerhp.Sihp = Vars.sihpboomer;
	LVsystemSettingchargerhp.Sihp = Vars.sihpcharger;
	LVsystemSettingtankhp.Sihp = Vars.sihptank;
	LVsystemSettingjockeyhp.Sihp = Vars.sihpjockey;
	LVsystemSettinghunterhp.Sihp = Vars.sihphunter;
	LVsystemSettingspitterhp.Sihp = Vars.sihpspitter;
	LVsystemSettingsmokerhp.Sihp = Vars.sihpsmoker;
	LVsystemSettingwitchhp.Sihp = Vars.sihpwitch;
	StringToFile(LVsystemSettingboomerhp.Sihpt, ""+LVsystemSettingboomerhp.Sihp); // 저장
	StringToFile(LVsystemSettingspitterhp.Sihpt, ""+LVsystemSettingspitterhp.Sihp); // 
	StringToFile(LVsystemSettinghunterhp.Sihpt, ""+LVsystemSettinghunterhp.Sihp); // 
	StringToFile(LVsystemSettingjockeyhp.Sihpt, ""+LVsystemSettingjockeyhp.Sihp); // 
	StringToFile(LVsystemSettingsmokerhp.Sihpt, ""+LVsystemSettingsmokerhp.Sihp); // 
	StringToFile(LVsystemSettingchargerhp.Sihpt, ""+LVsystemSettingchargerhp.Sihp); // 
	StringToFile(LVsystemSettingwitchhp.Sihpt, ""+LVsystemSettingwitchhp.Sihp); // 
	StringToFile(LVsystemSettingtankhp.Sihpt, ""+LVsystemSettingtankhp.Sihp); // 
}





Vars.LVhpsystemLoad(); // 게임 시작시 파일 로드

function ChatTriggers::chargerhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Convars.SetValue("z_charger_health", inthp);
		Vars.sihpcharger = inthp;
                        Vars.LVhpsystemSave();//세이브
		ClientPrint(null,5,"\x04Charger_HP"+"\x01 : "+"\x05"+inthp);
	}
	else
	return 0;
}

function ChatTriggers::tankhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihptank = inthp;
		Convars.SetValue("z_tank_health", inthp);
		ClientPrint(null,5,"\x04Tank_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::jockeyhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihpjockey = inthp;
		Convars.SetValue("z_jockey_health", inthp);
		ClientPrint(null,5,"\x04Jockey_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::hunterhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihphunter = inthp;
		Convars.SetValue("z_hunter_health", inthp);
		ClientPrint(null,5,"\x04Hunter"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::spitterhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihpspitter = inthp;
		Convars.SetValue("z_spitter_health", inthp);
		ClientPrint(null,5,"\x04Spitter_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::boomerhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihpboomer = inthp;
		Convars.SetValue("z_exploding_health", inthp);
		ClientPrint(null,5,"\x04Boomer_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::smokerhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihpsmoker = inthp;
		Vars.sihpsmokerchoke = inthp/5;
		Convars.SetValue("z_gas_health", inthp);
		Convars.SetValue("tongue_break_from_damage_amount", inthp/5);
		ClientPrint(null,5,"\x04Smoker_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::witchhp ( player, args, text )
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
		local inthp = GetArgument(1);
		inthp = inthp.tointeger();
		Vars.sihpwitch = inthp;
		Convars.SetValue("z_witch_health", inthp);
		ClientPrint(null,5,"\x04Witch_HP"+"\x01 : "+"\x05"+inthp);
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function ChatTriggers::resethp ( player, args, text )
{
	 local diffi = GetDifficulty();
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
	Convars.SetValue("z_exploding_health", 50);
	Convars.SetValue("z_charger_health", 600);
	Convars.SetValue("z_jockey_health", 325);
	Convars.SetValue("z_hunter_health", 250);
	Convars.SetValue("z_spitter_health", 100);
	Convars.SetValue("z_gas_health", 250);
	Convars.SetValue("tongue_break_from_damage_amount", 50);
	Convars.SetValue("z_witch_health", 1000);
	Vars.sihpcharger <- 600
	Vars.sihpjockey <- 325
	if(diffi == 0)
	{
	Convars.SetValue("z_tank_health", 2000);
	Vars.sihptank <- 2000;
	}
	else if(diffi == 1)
	{
	Convars.SetValue("z_tank_health", 4000);
	Vars.sihptank <- 4000;
	}
	else if(diffi == 2)
	{
	Convars.SetValue("z_tank_health", 6000);
	Vars.sihptank <- 6000;
	}
	else if(diffi == 3)
	{
	Convars.SetValue("z_tank_health", 8000);
	Vars.sihptank <- 8000;
	}
	else
	{
	Convars.SetValue("z_tank_health", 4000);
	Vars.sihptank <- 4000;
	}
	Vars.sihphunter <- 250
	Vars.sihpsmoker <- 250
	Vars.sihpsmokerchoke <- 50
	Vars.sihpboomer <- 50
	Vars.sihpspitter <- 100
	Vars.sihpwitch <- 1000
                        Vars.LVhpsystemSave();//세이브
	}
	else
	return 0;
}

function OnGameEvent_tank_spawn(params) // 로켓듀드 돚거
{
	local tank = EntIndexToHScript(params.tankid);
	local health = Vars.sihptank;
	tank.SetMaxHealth(Vars.sihptank)
	tank.SetHealth(Vars.sihptank)
}
//난이도 보정 탱체력 쉬움 0.75 보통 1 고급 2 전문가 2