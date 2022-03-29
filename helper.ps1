function mainMenu(){
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n `t`t`t Defender Helper, almost a version`n"
        #Date 3/29/2022
        #Oita_Valentin_florin
        Write-Host -ForegroundColor Cyan "Main Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Exclusions"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Threat Scan"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Launch submenu1
        if($mainMenu -eq 1){
            subMenu1
        }
        # Launch submenu2
        if($mainMenu -eq 2){
            subMenu2
        }
    }
}

function subMenu1 {
    $subMenu1 = 'X'
    while($subMenu1 -ne ''){
        Clear-Host
        #Add
        Write-Host -ForegroundColor Cyan " Exclusions"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add Path Exclusion"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add Extension Exclusion"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add Process Exclusion"
        #Remove
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove Path Exclusion"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove Extension Exclusion"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove Process Exclusion"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List all Exclusions"
        $subMenu1 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M%M
        #Options
        if($subMenu1 -eq 1){
            $var = Read-Host -Prompt "Add Path"
            Add-MpPreference -ExclusionPath $var
            Write-Host -ForegroundColor DarkCyan "`nPath $var has been added to Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if($subMenu1 -eq 2){
            $var = Read-Host -Prompt "Add Extension"
            Add-MpPreference -ExclusionExtension $var
            Write-Host -ForegroundColor DarkCyan "`nFilename $var has been added to Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if($subMenu1 -eq 3){
            $var = Read-Host -Prompt "Add ProcessName"
            Add-MpPreference -ExclusionProcess $var
            Write-Host -ForegroundColor DarkCyan "`nProcess $var has been added to Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if($subMenu1 -eq 4){
            $var = Read-Host -Prompt "Remove Path"
            Remove-MpPreference -ExclusionPath $var
            Write-Host -ForegroundColor DarkCyan "`nPath $var has been removed from Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if($subMenu1 -eq 5){
            $var = Read-Host -Prompt "Remove Extension"
            Remove-MpPreference -ExclusionExtension $var
            Write-Host -ForegroundColor DarkCyan "`nExtension $var has been removed from Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if($subMenu1 -eq 6){
            $var = Read-Host -Prompt "Remove ProcessName"
            Remove-MpPreference -ExclusionProcess $var
            Write-Host -ForegroundColor DarkCyan "`nProcessName $var has been removed from Exclusions."
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)           
            }
        if($subMenu1 -eq 7){
            Get-MpPreference | Select-Object -Property ExclusionProcess,ExclusionPath,ExclusionExtension
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
        #Scans
        Write-Host -ForegroundColor Cyan " Threat Scans"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Run Threat Scan"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Run Offline Threat Scan"
        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M%M
        #Options
        if ($subMenu2 -eq 1){
            Write-Host -ForegroundColor DarkCyan "`nScan Started, please wait!"
            Start-MpScan
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)
            }
        if ($subMenu2 -eq 2){
            Write-Host -ForegroundColor DarkCyan "`n Offline Scan Started, restarting pc!"
            Start-MpWDOScan
            Write-Host "`nPress any key to return to main menu"
            [void][System.Console]::ReadKey($true)

        }
    }
}

mainMenu

#runAs admin 
#Before Set-ExecutionPolicy RemoteSigned
#After Set-ExecutionPolicy Restricted
