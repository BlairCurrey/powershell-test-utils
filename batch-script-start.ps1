$Lines = Get-Content -Path .\machines.txt
$Config = Get-Content .\config.txt -Raw | ConvertFrom-Json

# Parse from file and run script for each
foreach($l in $Lines){
    # Split line, save name and domain
    $Tokens = $l.Split(".")
    $MachineName = $Tokens[0]
    $Domain = $Tokens[1]
    
    # Set User - Default to domain1
    $User = "$($Config.domain1.username)"

    # Switch user if domain2
    if ($Domain -eq "Domain2"){
        $User = "$($Config.domain2.username)"
    }

    # Scan location
    $Script = "C:\\Users\\$($User)\\Downloads\\SOME_DIR\\SOME_SCRIPT.cmd"
    
    # Run & return code
    $request = ([WMICLASS]"\\$($MachineName)\ROOT\CIMV2:win32_process").Create($Script)
    Write-Output "$($MachineName) Return Code: $($request.ReturnValue)"
}

Read-Host -Prompt "Press Enter to exit"