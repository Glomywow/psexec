$computer = get-content D:\comp.txt
$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration -computername $computer |where{$_.IPEnabled -eq “TRUE”}
  Foreach($NIC in $NICs) {

$DNSServers = “198.168.0.185",”198.168.0.245"
 $NIC.SetDNSServerSearchOrder($DNSServers)
 $NIC.SetDynamicDNSRegistration(“TRUE”)
}
