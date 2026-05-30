$html = @"
<!DOCTYPE html>
<html>
<head><title>Section 9 Portal</title>
<style>
body{background:#0a0a0a;color:#00ff41;font-family:'Courier New';margin:40px}
h1{border-bottom:1px solid #00ff41}
table{border-collapse:collapse;width:100%}
th{background:#003300;padding:8px}
td{border:1px solid #009926;padding:8px}
</style></head>
<body>
<h1>PUBLIC SECURITY SECTION 9</h1>
<h2>Internal Portal - Authorized Personnel Only</h2>
<table>
<tr><th>Name</th><th>Abteilung</th><th>Rolle</th></tr>
<tr><td>Daisuke Aramaki</td><td>Command</td><td>Chief</td></tr>
<tr><td>Motoko Kusanagi</td><td>Command</td><td>Major</td></tr>
<tr><td>Batou</td><td>Field Ops</td><td>Field Agent</td></tr>
</table>
<p><em>"The Net is vast and infinite."</em></p>
</body></html>
"@
$html | Out-File "C:\inetpub\wwwroot\index.html" -Encoding UTF8
Write-Host "Portal erstellt!" -ForegroundColor Green