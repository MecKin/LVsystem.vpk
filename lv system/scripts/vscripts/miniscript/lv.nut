printl("LVsystem / SI controller.....ok");
printl("Tank Spawner......ok");

Vars.interval <- 40;
Vars.max <- 3;
Vars.domi <- 4;
Vars.tankcount <- RandomInt(40, 360);
Vars.countdown <- 0;
Vars.spawnguage <- Vars.tankcount/4;
Vars.counttankspawncheck <- "true";
Vars.tankspawnerToF <- "false";
Vars.hpswitch <- 1;
Vars.checkpointheal <- "false";
Vars.toggle <- -1;
Vars.tankspawncheck <- "false";

// 게임 시작시 메모장에서 세팅 불러오기(읽기) -> 게임내 설정과 동기화
::LVsystemSettingspawntime <-
{
	LVoptiontxt = "LVsystem/LevelingSystemOption_spawn_time.txt"
            RespawnTime = 45
}

::LVsystemSettingmaxinfected <-
{
	LVoptiontxt = "LVsystem/LevelingSystemOption_max_infected.txt"
            MaxSI = 3
}

::LVsystemSettingdominator <-
{
	LVoptiontxt = "LVsystem/LevelingSystemOption_max_dominator.txt"
            Dominator = 4
}

::LVsystemSettingtankspawner <-
{
	LVoptiontxt = "LVsystem/LevelingSystemOption_tank_spawner.txt"
            TankSpawner = false
}

::LVsystemSettingsaferoomhealing <-
{
	LVoptiontxt = "LVsystem/LevelingSystemOption_safe_room_healing.txt"
            SaferoomHealing = false
}

Vars.LVsystemLoad <- function () // 파일읽기
{
            local Filereading1 = FileToString(LVsystemSettingspawntime.LVoptiontxt); // 파일 있는지 없는지 확인용
            local Filereading2 = FileToString(LVsystemSettingmaxinfected.LVoptiontxt); // 파일 있는지 없는지 확인용
            local Filereading3 = FileToString(LVsystemSettingdominator.LVoptiontxt); // 파일 있는지 없는지 확인용
            local Filereading4 = FileToString(LVsystemSettingtankspawner.LVoptiontxt); // 파일 있는지 없는지 확인용
            local Filereading5 = FileToString(LVsystemSettingsaferoomhealing.LVoptiontxt); // 파일 있는지 없는지 확인용
            if(Filereading1 == null || Filereading2 == null || Filereading3 == null || Filereading4 == null || Filereading5 == null) // 하나라도 없으면
            {
               StringToFile(LVsystemSettingspawntime.LVoptiontxt, ""+LVsystemSettingspawntime.RespawnTime); // 메모장 만들기
               StringToFile(LVsystemSettingmaxinfected.LVoptiontxt, ""+LVsystemSettingmaxinfected.MaxSI); // 메모장 만들기
               StringToFile(LVsystemSettingdominator.LVoptiontxt, ""+LVsystemSettingdominator.Dominator); // 메모장 만들기
               StringToFile(LVsystemSettingtankspawner.LVoptiontxt, ""+LVsystemSettingtankspawner.TankSpawner); // 메모장 만들기
               StringToFile(LVsystemSettingsaferoomhealing.LVoptiontxt, ""+LVsystemSettingsaferoomhealing.SaferoomHealing); // 메모장 만들기
               local configtime = FileToString(LVsystemSettingspawntime.LVoptiontxt);
               configtime = configtime.tointeger();
               local configmax = FileToString(LVsystemSettingmaxinfected.LVoptiontxt);
               configmax = configmax.tointeger();
               local configdomi = FileToString(LVsystemSettingdominator.LVoptiontxt);
               configdomi = configdomi.tointeger();
	   local configspawner = FileToString(LVsystemSettingtankspawner.LVoptiontxt);
	   local configsafehp = FileToString(LVsystemSettingsaferoomhealing.LVoptiontxt);

               Vars.tankspawnerToF <- configspawner;
	   Vars.checkpointheal <- configsafehp;
               Vars.interval <- configtime;
               Vars.max <- configmax;
               Vars.domi <- configdomi;
		SessionOptions.SpecialRespawnInterval <- Vars.interval;
		SessionOptions.MaxSpecials <- Vars.max;
		SessionOptions.DominatorLimit <- Vars.domi;
 		SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
		SessionOptions.cm_MaxSpecials <- Vars.max;
		SessionOptions.cm_DominatorLimit <- Vars.domi;
                     Vars.SIlimit();
	         Vars.Domilimit();
            }
            else
         {
            local configtime = FileToString(LVsystemSettingspawntime.LVoptiontxt);
               configtime = configtime.tointeger();
            local configmax = FileToString(LVsystemSettingmaxinfected.LVoptiontxt);
               configmax = configmax.tointeger();
            local configdomi = FileToString(LVsystemSettingdominator.LVoptiontxt);
               configdomi = configdomi.tointeger();
	local configspawner = FileToString(LVsystemSettingtankspawner.LVoptiontxt);
	local configsafehp = FileToString(LVsystemSettingsaferoomhealing.LVoptiontxt);

            Vars.tankspawnerToF <- configspawner;
	Vars.checkpointheal <- configsafehp;
            Vars.interval <- configtime;
            Vars.max <- configmax;
            Vars.domi <- configdomi;
		SessionOptions.SpecialRespawnInterval <- Vars.interval;
		SessionOptions.MaxSpecials <- Vars.max;
		SessionOptions.DominatorLimit <- Vars.domi;
 		SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
		SessionOptions.cm_MaxSpecials <- Vars.max;
		SessionOptions.cm_DominatorLimit <- Vars.domi;
                  Vars.SIlimit();
                  Vars.Domilimit();
         }

}

Vars.LVsystemtimeSave <- function () // 파일쓰기
{
            LVsystemSettingspawntime.RespawnTime = Vars.interval;
            StringToFile(LVsystemSettingspawntime.LVoptiontxt, ""+LVsystemSettingspawntime.RespawnTime); // 메모장 만들기
}

Vars.LVsystemmaxSave <- function () // 파일쓰기
{
            LVsystemSettingmaxinfected.MaxSI = Vars.max; 
            StringToFile(LVsystemSettingmaxinfected.LVoptiontxt, ""+LVsystemSettingmaxinfected.MaxSI); // 메모장 만들기
}

Vars.LVsystemdomiSave <- function () // 파일쓰기
{
            LVsystemSettingdominator.Dominator = Vars.domi;
            StringToFile(LVsystemSettingdominator.LVoptiontxt, ""+LVsystemSettingdominator.Dominator); // 메모장 만들기 
}

Vars.LVsystemSave <- function () // 파일쓰기
{
            LVsystemSettingspawntime.RespawnTime = Vars.interval;
            LVsystemSettingmaxinfected.MaxSI = Vars.max; 
            LVsystemSettingdominator.Dominator = Vars.domi;
            StringToFile(LVsystemSettingspawntime.LVoptiontxt, ""+LVsystemSettingspawntime.RespawnTime); // 메모장 만들기
            StringToFile(LVsystemSettingmaxinfected.LVoptiontxt, ""+LVsystemSettingmaxinfected.MaxSI); // 메모장 만들기
            StringToFile(LVsystemSettingdominator.LVoptiontxt, ""+LVsystemSettingdominator.Dominator); // 메모장 만들기 
}


function ChatTriggers::time ( player, args, text ) // 채팅 커맨드 구성
{
              local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
               local intnumber = GetArgument(1);
               intnumber = intnumber.tointeger();
               Vars.interval = intnumber;
	   Vars.SIlimit();
	   Vars.Domilimit();
               Vars.LVsystemtimeSave();
   	   SessionOptions.SpecialRespawnInterval <- Vars.interval;
	   SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
	   ClientPrint(null,5,"\x04Special respawn time "+"\x01 : "+"\x05"+Vars.interval);			   
	  }
	  else
	  return 0;
}

function ChatTriggers::max ( player, args, text ) // 채팅 커맨드 구성
{
              local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
              local intmax = GetArgument(1);
	  intmax = intmax.tointeger();
	  Vars.max = intmax;
	  SessionOptions.MaxSpecials <- Vars.max;
	  SessionOptions.cm_MaxSpecials <- Vars.max;
	Vars.SIlimit();
	   Vars.Domilimit();
              Vars.LVsystemmaxSave();
                if(Vars.max>18)
                {
		ClientPrint(null,5,"\x04Special respawn time "+"\x01 : "+"\x05"+Vars.interval);
                 	Vars.max = 18;
                  	Vars.LVsystemSave();
                }
		ClientPrint(null,5,"\x04Max specials "+"\x01 : "+"\x05"+Vars.max);
		Vars.SIlimit();
	             Vars.Domilimit();
	  }
	  else
	  return 0;
}

function ChatTriggers::domi ( player, args, text ) // 채팅 커맨드 구성
{
      local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
	   local intdomi = GetArgument(1);
               intdomi = intdomi.tointeger();
	   Vars.domi = intdomi;
               Vars.LVsystemdomiSave();
	   Vars.Domilimit();
   	   SessionOptions.DominatorLimit <- Vars.domi;
	   SessionOptions.cm_DominatorLimit <- Vars.domi;
       	   ClientPrint(null,5,"\x04Max dominators "+"\x01 : "+"\x05"+Vars.domi);
	  }
	  else
	  return 0;
}

function ChatTriggers::hardfour ( player, args, text ) // 채팅 커맨드 구성
{
      local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
	    SessionOptions.cm_BaseSpecialLimit <- 2
		Vars.interval <- 15;
        Vars.max <- 4;
        Vars.domi <- 4;
		SessionOptions.SpecialRespawnInterval <- Vars.interval;
		SessionOptions.MaxSpecials <- Vars.max;
		SessionOptions.DominatorLimit <- Vars.domi;
 		SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
		SessionOptions.cm_MaxSpecials <- Vars.max;
		SessionOptions.cm_DominatorLimit <- Vars.domi;
                         Vars.LVsystemSave();
        Vars.SIlimit();
        ClientPrint(null,5,"\x04Max specials"+"\x01 : "+"\x05"+Vars.max+"\x04 Respawn time"+"\x01 : "+"\x05"+Vars.interval+"\x04 Max dominators"+"\x01 : "+"\x05"+Vars.domi);
	  }
	  else
	  return 0;
}

function ChatTriggers::hardsix ( player, args, text ) // 채팅 커맨드 구성
{
      local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
	    SessionOptions.cm_BaseSpecialLimit <- 2
		Vars.interval <- 15;
        Vars.max <- 6;
        Vars.domi <- 6;
		SessionOptions.SpecialRespawnInterval <- Vars.interval;
		SessionOptions.MaxSpecials <- Vars.max;
		SessionOptions.DominatorLimit <- Vars.domi;
 		SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
		SessionOptions.cm_MaxSpecials <- Vars.max;
		SessionOptions.cm_DominatorLimit <- Vars.domi;
                        Vars.LVsystemSave();
        Vars.SIlimit();
        ClientPrint(null,5,"\x04Max specials"+"\x01 : "+"\x05"+Vars.max+"\x04 Respawn time"+"\x01 : "+"\x05"+Vars.interval+"\x04 Max dominators"+"\x01 : "+"\x05"+Vars.domi);
	  }
	  else
	  return 0;
}

function ChatTriggers::hardeight ( player, args, text ) // 채팅 커맨드 구성
{
      local listenhost = player.IsServerHost();
	  if(listenhost == true)
	  {
	    SessionOptions.cm_BaseSpecialLimit <- 2
		Vars.interval <- 15;
        Vars.max <- 8;
        Vars.domi <- 8;
		SessionOptions.SpecialRespawnInterval <- Vars.interval;
		SessionOptions.MaxSpecials <- Vars.max;
		SessionOptions.DominatorLimit <- Vars.domi;
 		SessionOptions.cm_SpecialRespawnInterval <- Vars.interval;
		SessionOptions.cm_MaxSpecials <- Vars.max;
		SessionOptions.cm_DominatorLimit <- Vars.domi;
                        Vars.LVsystemSave();
        ClientPrint(null,5,"\x04Max specials"+"\x01 : "+"\x05"+Vars.max+"\x04 Respawn time"+"\x01 : "+"\x05"+Vars.interval+"\x04 Max dominators"+"\x01 : "+"\x05"+Vars.domi);
	    Vars.SIlimit();
	  }
	  else
	  return 0;
}

function ChatTriggers::info ( player, args, text ) // 채팅 커맨드 구성
{
      ClientPrint(null,5,"\x04Max specials"+"\x01 : "+"\x05"+Vars.max+"\x04 Respawn time"+"\x01 : "+"\x05"+Vars.interval+"\x04 Max dominators"+"\x01 : "+"\x05"+Vars.domi);
      if(Vars.tankspawnerToF == "true")
      ClientPrint(null,5,"\x04Tank"+"\x01 : "+"\x05"+Vars.spawnguage+"\x05%");
}

function Notifications::OnPostSpawn::levelconfirm(player, params) //플레이어가 들어왔을 때 세팅 로드
{
    if(player.GetType() == Z_SURVIVOR && player.IsHuman())
    {
        Vars.LVsystemLoad();
        delete Notifications.OnPostSpawn.levelconfirm;
    }
}

function Notifications::OnSurvivorsLeftStartArea::NotifyEveryoneGameStart ( ) // 게임 시작 시 소리+세팅 알림
{
      ClientPrint(null,5"\x01GAME START!");
      Utils.PlaySoundToAll("Hint.Critical");
      ClientPrint(null,5,"\x04Max specials"+"\x01 : "+"\x05"+Vars.max+"\x04 Respawn time"+"\x01 : "+"\x05"+Vars.interval+"\x04 Max dominators"+"\x01 : "+"\x05"+Vars.domi);
}

Vars.SIlimit <- function () // 몹 테이블
{
			  if(Vars.max > 6 && Vars.max < 13)
			  {
			        SessionOptions.HunterLimit <- 2;
                    SessionOptions.JockeyLimit <- 2;
                    SessionOptions.ChargerLimit <- 2;
                    SessionOptions.SmokerLimit <- 2;
                    SessionOptions.BoomerLimit <- 2;
                    SessionOptions.SpitterLimit <- 2;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
					
			  }
		else if(Vars.max == 0)
			  {
			        SessionOptions.HunterLimit <- 0;
                    SessionOptions.JockeyLimit <- 0;
                    SessionOptions.ChargerLimit <- 0;
                    SessionOptions.SmokerLimit <- 0;
                    SessionOptions.BoomerLimit <- 0;
                    SessionOptions.SpitterLimit <- 0;
			  }
			
			  else if(Vars.max > 12 && Vars.max < 19)
			  {
			        SessionOptions.HunterLimit <- 3;
                    SessionOptions.JockeyLimit <- 3;
                    SessionOptions.ChargerLimit <- 3;
                    SessionOptions.SmokerLimit <- 3;
                    SessionOptions.BoomerLimit <- 3;
                    SessionOptions.SpitterLimit <- 3;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			  }
			  else
                   {
                    SessionOptions.HunterLimit <- 1;
                    SessionOptions.JockeyLimit <- 1;
                    SessionOptions.ChargerLimit <- 1;
                    SessionOptions.SmokerLimit <- 1;
                    SessionOptions.BoomerLimit <- 1;
                    SessionOptions.SpitterLimit <- 1;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
                   }

	        return 0;
}

Vars.Domilimit <- function() // 몹 테이블 
{
		 if(Vars.domi == 0)
			  {
	        SessionOptions.HunterLimit <- 0;
                    SessionOptions.JockeyLimit <- 0;
                    SessionOptions.ChargerLimit <- 0;
                    SessionOptions.SmokerLimit <- 0;
                    SessionOptions.BoomerLimit <- 18;
                    SessionOptions.SpitterLimit <- 18;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			  }
                        else if(Vars.domi > 0 && Vars.domi < 5 && Vars.max < 13)
			{
	        SessionOptions.HunterLimit <- 4;
                    SessionOptions.JockeyLimit <- 4;
                    SessionOptions.ChargerLimit <- 4;
                    SessionOptions.SmokerLimit <- 4;
                    SessionOptions.BoomerLimit <- 4;
                    SessionOptions.SpitterLimit <- 4;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			}
		else if(Vars.domi == Vars.max || Vars.max < 5)
			{
	        SessionOptions.HunterLimit <- 1;
                    SessionOptions.JockeyLimit <- 1;
                    SessionOptions.ChargerLimit <- 1;
                    SessionOptions.SmokerLimit <- 1;
                    SessionOptions.BoomerLimit <- 1;
                    SessionOptions.SpitterLimit <- 1;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			}
		else if(Vars.domi == Vars.max == 0)
			{
	        SessionOptions.HunterLimit <- 0;
                    SessionOptions.JockeyLimit <- 0;
                    SessionOptions.ChargerLimit <- 0;
                    SessionOptions.SmokerLimit <- 0;
                    SessionOptions.BoomerLimit <- 0;
                    SessionOptions.SpitterLimit <- 0;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			}
		else if(Vars.max < 5 || Vars.domi == Vars.max || Vars.max < 9)
			{
	        SessionOptions.HunterLimit <- 3;
                    SessionOptions.JockeyLimit <- 3;
                    SessionOptions.ChargerLimit <- 2;
                    SessionOptions.SmokerLimit <- 2;
                    SessionOptions.BoomerLimit <- 2;
                    SessionOptions.SpitterLimit <- 2;
                    SessionOptions.ShouldAllowSpecialsWithTank <- true
			}
		else
		return 0;
}


function Notifications::OnSurvivorsLeftStartArea::TankspawnScriptStart ( ) // 게임 시작 시 탱크 스크립트 시작
{       
       Timers.AddTimerByName("TsTimer", 4.0, true, CountingTankspawn, Players.RandomAliveSurvivor() );
       if(Vars.tankspawnerToF == "true" && Vars.tankspawncheck == "false")
       ClientPrint(null,5,"\x04Tank"+"\x01 : "+"\x05"+Vars.spawnguage+"\x05%"+"\x01, Tank will spawn at 100%.");
       else
      return 0;
}

::CountingTankspawn <- function (player) // 탱크 스크립트 타이머
{            
         Vars.tankcount++;
         Vars.spawnguage = Vars.tankcount / 4;
         if(Vars.spawnguage >= 100.0 && Vars.counttankspawncheck == "true")
       {  
           Utils.PlaySoundToAll("HulkZombie.Yell");
           ClientPrint(null,5,"\x04Tank" + "\x01 will spawn in 5 sec.");
           Timers.AddTimerByName("Tankspawner", 1.0, true, Tankspawner, Players.RandomAliveSurvivor() );
       }    
         else
         return 0;
}

::Tankspawner <- function ( player )  // 탱크 스크립트 소환 코드
{        
         Vars.counttankspawncheck = "false";
         Vars.countdown++;
         if(Vars.countdown == 1)
        {
         Utils.PlaySoundToAll("Menu.Timer");
         ClientPrint(null,5,"\x01"+"5");
        }
         else if(Vars.countdown == 2)
        {
         Utils.PlaySoundToAll("Menu.Timer");
         ClientPrint(null,5,"\x01"+"4");
         }
         else if(Vars.countdown == 3)
         {
         Utils.PlaySoundToAll("Menu.Timer");
         ClientPrint(null,5,"\x01"+"3");
         }
         else if(Vars.countdown == 4)
         {
         Utils.PlaySoundToAll("Menu.Timer");
         ClientPrint(null,5,"\x01"+"2");
         }
         else if(Vars.countdown == 5)
         {
         Utils.PlaySoundToAll("Menu.Timer");
         ClientPrint(null,5,"\x01"+"1");
         }
         else if(Vars.countdown >= 6 && Vars.tankspawnerToF == "true")
         {
         SessionOptions.cm_AggressiveSpecials <- true;
         Utils.SpawnZombieNearPlayer( player, Z_TANK, 2000.0, 500.0 );
         Utils.PlaySoundToAll("Survivor.PlaytestStart");
         ClientPrint(null,5,"\x04Tank" + "\x01 has spawned!");
         }
         else
         return 0;
}

function Notifications::OnDeath::TankRagecount (victim, attacker, params ) // 탱크 스크립트가 작동하기 위해 몹이 처치될 때마다 카운트트 
{
               if ( attacker.GetType() == SURVIVOR && victim.GetType() == Z_INFECTED && Vars.tankspawnerToF == "true" ) 
               Vars.tankcount++;
}

function Notifications::OnFinaleRadioStart::TimerstopwhenFinal ( params ) // 피날레 시작 시 타이머 죽이기
{
             Timers.RemoveTimerByName("TsTimer");
	 SessionOptions.cm_ProhibitBosses <- false;
	 SessionOptions.ProhibitBosses <- false;
}

function Notifications::OnTankSpawned::Timerstopwhentankspawn (tank, params ) // 탱크가 스폰될 시 타이머 죽이기
{ 
              Vars.counttankspawncheck = "false";
	  Vars.tankspawncheck  = "true";
              Timers.RemoveTimerByName("TsTimer");
              Timers.RemoveTimerByName("Tankspawner");
	  SessionOptions.cm_ProhibitBosses <- true;
	  SessionOptions.ProhibitBosses <- true;
              delete Notifications.OnDeath.TankRagecount;
}

function Notifications::OnGeneratorStart::TimerstopwhenGenertatorOn ( params ) // 피날레 시작 시 타이머 죽이기
{
             Timers.RemoveTimerByName("TsTimer");
	 SessionOptions.cm_ProhibitBosses <- false;
	 SessionOptions.ProhibitBosses <- false;
}


function ChatTriggers::tank ( player, args, text )  // 채팅 커맨드 구성
{
       if(Vars.spawnguage < 100 && Vars.counttankspawncheck == "true" && Vars.tankspawnerToF  == "true") //스크립트 작동중
       ClientPrint(null,5,"\x04Tank"+"\x01 : "+"\x05"+Vars.spawnguage+"\x05%"+"\x01, Tank will spawn at 100%.");
       else if(Vars.spawnguage >= 100 && Vars.tankspawncheck == "true") // 스크립트로 탱크 소환
       ClientPrint(null,5,"\x01Tank has already spawned.");
       else if(Vars.tankspawncheck == "true" && Vars.tankspawnerToF  == "false") // 스크립트 끄고 AI Director가 탱크 소환
       ClientPrint(null,5,"\x01Tank has already spawned.");
       else if(Vars.tankspawncheck == "false" && Vars.tankspawnerToF  == "false") // 스크립트 끄고 AI Director가 탱크 소환 x
       ClientPrint(null,5,"\x01Tank script isn't running.");
       else
       ClientPrint(null,5,"\x01Tank script isn't running.");
       return 0;
}


Vars.toggleread <- function() //토글 커맨드
{
	   local configspawner = FileToString(LVsystemSettingtankspawner.LVoptiontxt);
               Vars.tankspawnerToF <- configspawner;
	   if(configspawner == "true")
	   Vars.toggle <- 1;
	   else
	   Vars.toggle <- -1;	   
}

Vars.toggleread();
function ChatTriggers::boss ( player, args, text ) // 채팅 커맨드 구성
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
	  Vars.toggle <- -Vars.toggle;
              if(Vars.toggle == 1)
             {
        	  Vars.tankspawnerToF <- "true";
              LVsystemSettingtankspawner.TankSpawner = Vars.tankspawnerToF;
	  StringToFile(LVsystemSettingtankspawner.LVoptiontxt, ""+LVsystemSettingtankspawner.TankSpawner); 
	  ClientPrint(null,5,"Tank script is running.");
             }
              else
             {
        	  Vars.tankspawnerToF <- "false";
              LVsystemSettingtankspawner.TankSpawner = Vars.tankspawnerToF;
	  StringToFile(LVsystemSettingtankspawner.LVoptiontxt, ""+LVsystemSettingtankspawner.TankSpawner); 
	  ClientPrint(null,5,"Tank script isn't running.");
             }
	}
	else
	return 0;
}

function ChatTriggers::hp ( player, args, text ) // 채팅 커맨드 구성
{
	 local listenhost = player.IsServerHost();
	 if(listenhost == true)
	{
	  Vars.hpswitch++;
	  Vars.hppswitch <- Vars.hpswitch%2;
              if(Vars.hppswitch == 0)
             {
              Vars.checkpointheal <- "true";
              LVsystemSettingsaferoomhealing.SaferoomHealing = Vars.checkpointheal;
	  StringToFile(LVsystemSettingsaferoomhealing.LVoptiontxt, ""+LVsystemSettingsaferoomhealing.SaferoomHealing); 
	  ClientPrint(null,5,"Safe room healing script is running.");
             }
              else
             {
              Vars.checkpointheal <- "false";
              LVsystemSettingsaferoomhealing.SaferoomHealing = Vars.checkpointheal;
	  StringToFile(LVsystemSettingsaferoomhealing.LVoptiontxt, ""+LVsystemSettingsaferoomhealing.SaferoomHealing); 
	  ClientPrint(null,5,"Safe room healing script isn't running.");
             }
	}
	else
	return 0;
}

function Notifications::OnEnterSaferoom::SurvivorsEnterSaferoom (player, params) // 안전구역 진입 시 체력 회복
{            
      local shp = player.GetRawHealth(); // 필 먹은거 낭비 안되게 함
      if(shp < 50 && Vars.checkpointheal == "true")
   {
      player.SetHealth(50);
      player.SetHealthBuffer(0);
   } 
   else 
   return 0;
}
