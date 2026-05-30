$alleUser = Get-ADUser -Filter * -SearchBase "OU=Section9,DC=section9,DC=gov,DC=jp" | Select -ExpandProperty SamAccountName

Add-ADGroupMember -Identity "GRP_AllUsers" -Members $alleUser
