-- Disable SSLV2------

invoke-Command -cn (gc C:\servers.txt) {pushd;sl "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0";
Set-ItemProperty -name Enabled  -path server -value “0” ; popd} | Out-file 'C:\log.log'


--NewFolder with SSLV2---

invoke-Command -cn (gc D:\servers.txt) {pushd;sl "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols";
New-Item -path "SSL 2.0" -name "Server" -itemType "directory"; } | Out-file 'C:\log.log'

invoke-Command -cn (gc D:\servers.txt) {pushd;sl "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0";
New-ItemProperty -name Enabled -PropertyType DWORD -path Server -value “0” ; popd} | Out-file 'C:\log2.log'



