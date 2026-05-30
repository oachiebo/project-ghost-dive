$Password = ConvertTo-SecureString "userpasswort" -AsPlainText -Force

Import-Csv "C:\User\Administrator\Desktop\section9-users.csv" | ForEach-Object {
    $OU = "OU=$($_.OU),OU=Section9,DC=section9,DC=gov,DC=jp"
    
    New-ADUser `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -Name "$($_.FirstName) $($_.LastName)" `
        -SamAccountName $_.Username `
        -UserPrincipalName "$($_.Username)@section9.gov.jp" `
        -Path $OU `
        -Department $_.Department `
        -AccountPassword $Password `
        -Enabled $true
}
