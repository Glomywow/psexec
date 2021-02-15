$bks =  @(gc C:\service\admin\vtb.txt)
foreach ($bk in $bks){


cmd /c  "C:\service\psexec" -u bit\Bankklient -p 25gy9E5z \\$bk reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v proxyenable>>\\SRV-098-BUH-02\proxy\$bk.txt 
}

$bks =  @(gc C:\service\admin\bk.txt)
 foreach ($bk in $bks){
Invoke-Command -ComputerName $bk -ScriptBlock {
Get-ItemProperty -Path HKCU:"Software\Microsoft\Windows\CurrentVersion\Internet Settings" | select -Property ProxyEnable
}
}

CHCP 866 

Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | findstr ProxyServer


Invoke-Command -ComputerName vm-bk-80 -Credential bit\Bankklient  -ScriptBlock {Get-ItemProperty -Path HKCU:"Software\Microsoft\Windows\CurrentVersion\Internet Settings" | select -Property ProxyEnable}


$bks =  @(gc C:\service\admin\vtb.txt)
$bks

$bks =  @(gc C:\service\admin\bk1.txt)
$proxys = @(gc C:\service\admin\proxy1.txt)
foreach ($bk in $bks) {

cmd /c "C:\service\psexec" -u bit\Bankklient -p 25gy9E5z \\$bk reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_SZ /d 0 /f

}

$bks =  @(gc C:\service\admin\vtb.txt)


$bks =  @(gc C:\service\admin\bk1.txt)
foreach ($bk in $bks) {

cmd /c "C:\service\psexec" -u bit\Bankklient -p 25gy9E5z \\$bk reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f

}
