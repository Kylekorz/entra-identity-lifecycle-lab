# Connect to your Entra lab with read-only user permissions.
$tenantId = Read-Host "Enter your Entra lab Tenant ID"

Connect-MgGraph -TenantId $tenantId -Scopes "User.Read.All" -ContextScope Process -UseDeviceAuthentication

# Retrieve Alex's current account details.
$alex = Get-MgUser -Filter "displayName eq 'Alex Morgan (Lab)'" -Property DisplayName,Department,JobTitle,AccountEnabled -ErrorAction Stop

if (-not $alex) {
    throw "Alex Morgan (Lab) was not found. Check the tenant and display name."
}

# Select the report columns.
$report = $alex | Select-Object DisplayName,Department,JobTitle,AccountEnabled

# Save the CSV in your Documents folder.
$reportPath = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Entra-Lab-User-Report.csv'

$report | Export-Csv -Path $reportPath -Encoding utf8

# Display the results and file location.
$report | Format-Table -AutoSize
Write-Host "Report saved to: $reportPath"

Disconnect-MgGraph