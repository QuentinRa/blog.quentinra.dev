# Azure SQL Database

<div class="row row-cols-lg-2"><div>

[Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/doc-changes-updates-release-notes-whats-new?view=azuresql) is a database on a managed [SQL Server](/programming-languages/databases/relational/dbms/mssql.md). It's a SAAS solution handling maintenance, backups, scaling, etc. for us.

* **Account**: your account which may be managed by your organization (sync to AD). API Authentication is made using a JWT.

* **Subscriptions**: a subscription is associated with a product such as visual studio. The administrator can grant us access to a subscription and give us specific roles within it.

You can access the login portal at [portal.azure.com](https://portal.azure.com/).

📚 [Azure SQL Managed Instances](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql) (MI) is a PAAS solution which can be used when we need to manage the SQL Server directly. 
</div><div>

```ps
Connect-AzAccount
$dump = Get-AzSqlServer
$servers = $dump | ForEach-Object { [PSCustomObject]@{sn=$_.ServerName; rgn=$_.ResourceGroupName} }
$databases =  $servers | ForEach-Object { Get-AzSqlDatabase -ResourceGroupName $_.rgn -ServerName $_.sn | Where-Object DatabaseName -ne "master" } | ForEach-Object { [PSCustomObject]@{sn=$_.ServerName; rgn=$_.ResourceGroupName; db=$_.DatabaseName} }
```

<details class="details-n">
<summary>Additional Powershell Functions</summary>

```ps
function Get-AzSqlDatabaseAutomaticTuning {
    param (
        [string]$ResourceGroupName,
        [string]$ServerName
    )
    $token = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($(Get-AzAccessToken -AsSecureString).Token))
    return (Invoke-RestMethod -Uri "https://management.azure.com/subscriptions/$((Get-AzContext).Subscription.Id)/resourceGroups/$ResourceGroupName/providers/Microsoft.Sql/servers/$ServerName/automaticTuning/current?api-version=2021-11-01" -Method Get -Headers @{Authorization = "Bearer $token"})
}
```
</details>
</div></div>

<hr class="sep-both">

## Azure SQL Database Hardening 🔒🛡️

Refer to [the official documentation](https://learn.microsoft.com/en-us/azure/azure-sql/database/security-overview?view=azuresql).

<div class="row row-cols-lg-2"><div>

#### ASD Hardening — SQL Server Exposure

By default, the ASD is available via a public endpoint such as `your-server-name.database.windows.net`. It should be private <small>(e.g. VPN...)</small>.

```ps
$dump | Select-Object ServerName,PublicNetworkAccess
```

The ASD is behind a firewall to limit which IPs can access it. The default firewall allows every IP (`0.0.0.0-0.0.0.0`) and is too permissive.

```
$servers | ForEach-Object { Get-AzSqlServerFirewallRule -ServerName $_.sn -ResourceGroupName $_.rgn } | Where-Object StartIpAddress -eq "0.0.0.0" | ft
```

Microsoft Entry ID authentication allow you to easily manage access to the database while adding additional mechanisms such as MFA.

```ps
$servers | ForEach-Object { $res = Get-AzSqlServerActiveDirectoryAdministrator -ServerName $_.sn -ResourceGroupName $_.rgn; [PSCustomObject]@{ServerName=$_.sn; EntraStatus=if ($res) { "Enabled" } else { "Disabled" } } }
```

<br>

#### ASD Hardening — Auditing And Logs

There is an "auditing" feature to monitor databases for security, compliance, and troubleshooting. You should enable it.

```ps
$databases | ForEach-Object { Get-AzSqlDatabaseAudit -ServerName $_.sn -ResourceGroupName $_.rgn -DatabaseName $_.db | Select-Object ServerName, AuditActionGroup, RetentionInDays }
```

You will then have to configure the auditing policy <small>(3 values expected for AuditActionGroup)</small>. At least one TargetState should be Enabled.

You should also ensure that log are not kept indefinitely <small>(<90)</small>. The default value is `PT0S` for `0 seconds` which is an indefinite period of time. [Documentation to understand each retention period](https://learn.microsoft.com/en-us/azure/azure-sql/database/long-term-backup-retention-configure?view=azuresql&tabs=portal).

```ps
$databases | ForEach-Object { Get-AzSqlDatabaseBackupLongTermRetentionPolicy -ServerName $_.sn -ResourceGroupName $_.rgn -DatabaseName $_.db | Select-Object ServerName, DatabaseName, WeeklyRetention, MonthlyRetention, YearlyRetention } | ft
```

Point in Time Restore (PITR) are short-term backups. They should be retained for seven days <small>(which is the default)</small>.

```ps
$databases | ForEach-Object { Get-AzSqlDatabaseBackupShortTermRetentionPolicy -ServerName $_.sn -ResourceGroupName $_.rgn -DatabaseName $_.db | Select-Object ServerName, DatabaseName, RetentionDays } | ft
```

✍️ Make sure to monitor firewall changes and apply the least privilege principle. Try to be as granular as possible.
</div><div>

#### ASD Hardening — Security Features

Advanced Data Security (ADS) is a feature that enable data classification, vulnerability assessment, and the Advanced Threat Protection service. You should enable it.

```ps
$servers | ForEach-Object { Get-AzSqlServerAdvancedDataSecurityPolicy -ServerName $_.sn -ResourceGroupName $_.rgn }
```

Advanced Threat Protection (ATP) service monitors for suspicious activity <small>(faulty SQL, new SQL statement, new logins and logins brute force, etc.)</small>. You should enable it <small>(and all alerts should be enabled, which is the default)</small>.

```ps
# az sql server advanced-threat-protection-setting -g $_.rgn -n $_.sn
$servers | ForEach-Object { Get-AzSqlServerAdvancedThreatProtectionSetting -ServerName $_.sn -ResourceGroupName $_.rgn }
```

The Vulnerability Assessment service scan the database for known vulnerabilities, misconfigurations, and weaknesses <small>(permissions, etc.)</small>. You should enable periodic recurring scans, email admins and specific users, and store assessments in a storage <small>(the "classic" configuration)</small>.

```ps
$databases | ForEach-Object { Get-AzSqlDatabaseVulnerabilityAssessmentSetting -ServerName $_.sn -ResourceGroupName $_.rgn -DatabaseName $_.db | Select-Object ServerName, DatabaseName, RecurringScansInterval, EmailAdmins, NotificationEmails, StorageAccountName } | ft
```

Transparent Data Encryption (TDE) is a mechanism to encrypt database data at rest. It should be enabled and configured not to use a ServiceManaged Key.

```ps
$databases | ForEach-Object { Get-AzSqlDatabaseTransparentDataEncryption -ServerName $_.sn -ResourceGroupName $_.rgn -DatabaseName $_.db | Select-Object ServerName, DatabaseName, @{Name='TdeStatus'; Expression={$_.State}}} | ft
$servers | ForEach-Object { Get-AzSqlServerKeyVaultKey -ServerName $_.sn -ResourceGroupName $_.rgn | Select-Object ServerName, Type } | ft
```

<br>

#### ASD Hardening — Backups, Performance, Uptime

To improve performances, you should enable Automatic Tuning and its 3 options. It will use AI to monitor databases and adapt settings.

```ps
$servers | ForEach-Object { Get-AzSqlDatabaseAutomaticTuning -ServerName $_.sn -ResourceGroupName $_.rgn | Add-Member -MemberType NoteProperty -Name "ServerName" -Value $_.sn -PassThru }
```

You should add databases in a fail-over group to ensure at least one is always available in case of failure.

```ps
$servers | ForEach-Object { $g = Get-AzSqlDatabaseFailoverGroup -ServerName $_.sn -ResourceGroupName $_.rgn; [PSCustomObject]@{ServerName=$_.sn; HasFailoverGroup = $g.Count -ne 0 } }
```
</div></div>