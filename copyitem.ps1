$vdi= @(gc c:\service\admin\vdi1.txt)
$Users = Invoke-Command -ComputerName $vdi -ScriptBlock { Get-ChildItem C:\Users -Name -Exclude "All Users", "rsys","temp","Public","vmanage","voperator"}
  foreach ($vd in $vdi)   {
  foreach ($User in $Users) {
$comp = New-PSSession -ComputerName $vd

Copy-Item -Path "C:\service\admin\ibases.v8i" -ToSession $comp -Destination "c:\users\$user\appdata\local\temp\" -Force -ErrorAction SilentlyContinue
}}
