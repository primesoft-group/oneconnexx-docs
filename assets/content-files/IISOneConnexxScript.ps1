 $serverManagerModule = Get-Module -ListAvailable | where { $_.Name -eq "ServerManager" }

 $serverManagerCmd = (Test-Path -Path "c:/windows/system32/servermanagercmd.exe")

 if($serverManagerModule -Or $serverManagerCmd) {

	# Invoke-Expression Space handling with & and "
    if([Environment]::OSVersion.Version -ge (new-object 'Version' 6,2))
    {
		# Variables
		$ScriptRoot = (Split-Path -parent $MyInvocation.MyCommand.Definition)

		Write-host "InitWebServer ScriptRoot: $ScriptRoot"

		$additionalFeatures = @('Web-Asp-Net45', 'Web-Mgmt-Console', 'Web-Windows-Auth', 'NET-Framework-45-Core')

		# Import Modules
		Import-Module -Name ServerManager

		# Add Windows Features
		foreach($feature in $additionalFeatures) { 
			
			if(!(Get-WindowsFeature | where { $_.Name -eq $feature }).Installed) { 

				Install-WindowsFeature -Name $feature -LogPath "$env:TEMP\init-webservervm_feature_$($feature)_install_log_$((get-date).ToString("yyyyMMddHHmmss")).txt"   
			}
		}
    }
    else
    {
		if([Environment]::OSVersion.Version -ge (new-object 'Version' 6,1))
		{
			# .NET 3.5 via .NET Framework Core install (for Powershell windows auth)
			# IIS with ASP.NET wiva Web-Asp-Net
			$additionalFeatures = @('Web-Asp-Net45', 'Web-Mgmt-Console', 'Web-Windows-Auth', 'NET-Framework-45-Core')

			# Import Modules
			Import-Module -Name ServerManager

			# Add Windows Features
			Add-WindowsFeature -Name Web-Server -LogPath "$env:TEMP\init-webservervm_webserver_install_log_$((get-date).ToString("yyyyMMddHHmmss")).txt"
			foreach($feature in $additionalFeatures) { 
    
				if(!(Get-WindowsFeature | where { $_.Name -eq $feature }).Installed) { 

					Add-WindowsFeature -Name $feature -LogPath "$env:TEMP\init-webservervm_feature_$($feature)_install_log_$((get-date).ToString("yyyyMMddHHmmss")).txt"   
				}
			}
		}
		else
		{
			# .NET 3.5 via .NET Framework Core install (for Powershell windows auth)
			$additionalFeatures = @('Web-Asp-Net45', 'Web-Mgmt-Console', 'Web-Windows-Auth', 'NET-Framework-45-Core')
			CMD /C "servermanagercmd.exe /Install $($additionalFeatures -join ' ')"
		}
	}
 }
 else {
  Write-host "Script is executed on a Client OS - can't access ServerManager via Powershell or CMD. Skip 'InitWebServer' step." -foreground Yellow
  Write-host "If you are on a 64bit Server-OS, make sure you are using the x64 Powershell-Cmd and NOT the x86 Version" -foreground Yellow
 }