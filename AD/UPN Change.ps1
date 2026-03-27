# ==================== UPN შეცვლა ====================

$Old = "moa.gov.ge"     # ძველი დომენი
$New = "mepa.gov.ge"    # ახალი დომენი

$WhatIf = $true         # შეცვალე $false-ზე, როცა რეალურად გინდა ცვლილება

# ===================================================

Get-ADUser -Filter * -SearchBase "OU=MOA,OU=moa.gov.ge,OU=MoaAll,DC=moa,DC=gov,DC=ge" | 
ForEach-Object { 
    $newUPN = $_.UserPrincipalName.Replace($Old, $New)
    Set-ADUser $_ -UserPrincipalName $newUPN -WhatIf:$WhatIf
}

Write-Host "სკრიპტი დასრულდა. რეჟიმი: $(if($WhatIf){"ტესტი"} else {"რეალური ცვლილება"})" -ForegroundColor $(if($WhatIf){"Yellow"} else {"Green"})