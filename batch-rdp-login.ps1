# Read config and machines from file
$Lines = Get-Content -Path .\machines.txt
$Config = Get-Content .\config.txt -Raw | ConvertFrom-Json

# Parse from file and open connection for each
foreach($l in $Lines){
    # Split line, save name and domain
    $Tokens = $l.Split(".")

    $MachineName = $Tokens[0]
    $Domain = $Tokens[1]
    # Default user to domain1
    $User = "$($Domain)\$($Config.domain1.username)"
    $Password = $Config.domain1.password

    # Switch username if domain2
    if ($Domain -eq "Domain2"){
        $User = "$($Domain)\$($Config.domain2.username)"
        $Password = $Config.domain2.password
    }

    #set credentials and open connection
    cmdkey /add:$MachineName /user:$User /pass:$Password
    mstsc /v:$MachineName
}