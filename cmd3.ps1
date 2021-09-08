$props_file = Get-Content "C:\logs\vars.txt"
$props = @{}
$props_file | % {
    $s = $_ -split "="
    $props.Add($s[0],$s[1])
}

# sg source and destination files 

$the_sourcedir = $props.'SG_SOURCE'
Write-Host $the_sourcedir

$the_destinationdir = $props.'SG_DESTINATION'
Write-Host $the_destinationdir

#hk source and destination files 


$the_sourcedir_hk = $props.'HK_SOURCE'
Write-Host $the_sourcedir_hk

$the_destinationdir_hk = $props.'HK_DESTINATION'
Write-Host $the_destinationdir_hk



#copying files from sg source to sg destination 

Copy-Item -Path $the_sourcedir\* -Destination $the_destinationdir

#copying files sg,hk source to sg destination 

Copy-Item -Path $the_sourcedir\*,$the_sourcedir_hk\* -Destination $the_destinationdir

#copying hk source to hk destination
Copy-Item -Path $the_sourcedir_hk\* -Destination $the_destinationdir_hk
