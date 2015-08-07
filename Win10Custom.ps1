#Imports a custom Start Menu Tile Layout to the default user profile
Import-StartLayout -LayoutPath CustomStartScreenLayout.bin -MountPath C:\

#Install the SNMP Windows Feature and Creates default Agent settings.  The rest is configured in Default Domain Group Policy
Enable-WindowsOptionalFeature -Online -FeatureName SNMP
$computerName = hostname
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\RFC1156Agent" /v sysContact /t REG_SZ /d $computerName /f | Out-null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\RFC1156Agent" /v sysLocation /t REG_SZ /d "DeviceLocation" /f | Out-null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\RFC1156Agent" /v sysServices /t REG_DWORD /d 79 /f | Out-null

#remove Pre-provisioned Windows 10 Apps
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.XboxApp_2015.617.130.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.WindowsMaps_2015.619.213.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.SkypeApp_3.2.1.0_neutral_~_kzf8qxf38zg5c
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.Office.OneNote_2015.4201.10091.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.MicrosoftSolitaireCollection_3.1.6103.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.Getstarted_2015.622.1108.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.MicrosoftOfficeHub_2015.4218.23751.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.3DBuilder_2015.624.2254.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.BingSports_10004.3.193.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.People_2015.627.626.0_neutral_~_8wekyb3d8bbwe
Remove-AppxProvisionedPackage -Online -PackageName Microsoft.WindowsPhone_2015.620.10.0_neutral_~_8wekyb3d8bbwe
Get-AppxPackage *xbox* | remove-appxpackage
Get-AppxPackage *WindowsMaps* | remove-appxpackage
Get-AppxPackage *Skype* | remove-appxpackage
Get-AppxPackage *OneNote* | remove-appxpackage
Get-AppxPackage *Solitaire* | remove-appxpackage
Get-AppxPackage *Getstarted* | remove-appxpackage
Get-AppxPackage *MicrosoftOfficeHub* | remove-appxpackage
Get-AppxPackage *3DBuilder* | remove-appxpackage
Get-AppxPackage *Bing* | remove-appxpackage
Get-AppxPackage *People* | remove-appxpackage
Get-AppxPackage *Phone* | remove-appxpackage

#Disable the Windows Store App
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f | Out-null
