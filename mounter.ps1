$connectTestResult = Test-NetConnection -ComputerName frprdncusiissa.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"frprdncusiissa.file.core.windows.net`" /user:`"localhost\frprdncusiissa`" /pass:`"jH2CsFwNn71DGHwziXFQn7dTyRAB6VOsh5JA7QHpdI68HBOGNASn17nfHGfYcOvkQrSGP0m1B96L3InEeUEZOA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\frprdncusiissa.file.core.windows.net\fr-prd-ncus-iis-af" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
