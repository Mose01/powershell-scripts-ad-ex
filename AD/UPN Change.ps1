$ENterDomain = Read-Host 'moa.gov.ge'
 
$routableDomain = $EnterDomain

$users = Get-ADUser -Filter {UserPrincipalName -like '*'} -SearchBase "OU=MOA,OU=moa.gov.ge,OU=MoaAll,DC=moa,DC=gov,DC=ge"
foreach ($user in $users) {
    $userName = $user.UserPrincipalName.Split('@')[0]
    $UPN = $userName + "@mepa.gov.ge" + $routableDomain
    
    Write-Host $user.Name $user.UserPrincipalName $UPN

    $user | Set-ADUser -UserPrincipalName $UPN
}
