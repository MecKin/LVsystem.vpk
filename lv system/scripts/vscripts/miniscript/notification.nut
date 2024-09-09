printl("Notification scripts initiating.......");

function Notifications::OnUpgradeDeployed::NotifyEveryoneUpgradeDeployed (deployer, upgrade, params)
{           
            local upgradename = upgrade.GetClassname();
            local deployername = deployer.GetName();
            if(upgradename == "upgrade_ammo_incendiary")
            ClientPrint(null,5,"\x04"+deployername+"\x01 deployed"+"\x05 incendiary ammo"+"\x01.");
            else
            ClientPrint(null,5,"\x04"+deployername+"\x01 deployed"+"\x05 explosive ammo"+"\x01.");
}

function Notifications::OnUpgradeReceived::NotifyEveryoneLaserSight (receiver, upgrade, params)
{         
          local laseruser = receiver.GetName();
          if (upgrade == "LASER_SIGHT" )
        {
            ClientPrint(null,5,"\x04"+laseruser+"\x01 used"+"\x05"+" laser sight"+"\x01.");
        }
         else
         return 0;
}

function Notifications::OnReviveSuccess::NotifyEveryoneBlacknWhite (revivee, revivor, params)
{
          local reviveestatus = revivee.IsLastStrike();
          local reviveename = revivee.GetName();
          if( reviveestatus == true)
             {
            ClientPrint(null,5,"\x04"+reviveename+"\x01 is"+"\x05 dying"+"\x01.");
             }
          else
          return 0;
}
