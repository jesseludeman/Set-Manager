function Set-Manager()
{
    Write-Host '***This will copy the Direct Reports from a terminated Manager to a new Manager***'

    $OldManager = Read-Host 'Enter a manager to copy from'
    $ManagerData = Get-ADUser -Identity $OldManager -Properties DirectReports | Select-Object -ExpandProperty DirectReports
    $NewManager = Read-Host 'Enter a new manager to copy to'
        
    foreach ($DirectReport in $ManagerData)
    {
        # Copy the Direct Reports across to the new user
        Get-ADUser -Identity $DirectReport | Set-ADUser -Manager $NewManager
    }
}