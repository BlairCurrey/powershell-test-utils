# Script watches a registry entry and changes it to a desired value when
# it changes. Prints change event to console with timestamp.

# Configure registry value
$registryPath = "HKLM:SOME\REGISTRY\PATH" # needs proper assignment
$name = "someName"                        # needs proper assignment
$value = "someValue"                      # needs proper assignment

write-host "Ctrl-C to stop script"

while ($true){
    $currentValue = Get-ItemPropertyValue -Path $registryPath -Name $name
    if($currentValue -ne $value){
        $time = Get-Date -Format "HH:mm"
        Set-ItemProperty -Path $registryPath -Name $name -Value $value
        write-host $time":" "Changed from" $currentValue "to" $value
    }
}
