# Azure SQL Database

<div class="row row-cols-lg-2"><div>

[Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/doc-changes-updates-release-notes-whats-new?view=azuresql) is a database on a managed [SQL Server](/programming-languages/databases/relational/dbms/mssql.md). It's a SAAS solution handling maintenance, backups, scaling, etc. for us.

* **Account**: your account which may be managed by your organization (sync to AD). API Authentication is made using a JWT.

* **Subscriptions**: a subscription is associated with a product such as visual studio. The administrator can grant us access to a subscription and give us specific roles within it.

You can access the login portal at [portal.azure.com](https://portal.azure.com/).

📚 [Azure SQL Managed Instances](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql) (MI) is a PAAS solution which can be used when we need to manage the SQL Server directly. 
</div><div>

```ps
$dump = Get-AzSqlServer
$servers = $dump | ForEach-Object { [PSCustomObject]@{sn=$_.ServerName; rgn=$_.ResourceGroupName} }
$databases =  $servers | ForEach-Object { Get-AzSqlDatabase -ResourceGroupName $_.rgn -ServerName $_.sn | Where-Object DatabaseName -ne "master" } | ForEach-Object { [PSCustomObject]@{sn=$_.ServerName; rgn=$_.ResourceGroupName; db=$_.DatabaseName} }
```
</div></div>

<hr class="sep-both">

## Azure SQL Database Hardening 🔒🛡️

<div class="row row-cols-lg-2"><div>

#### ASD Hardening — SQL Server Exposure

By default, the ASD is available via a public endpoint such as `your-server-name.database.windows.net`. It should be private <small>(e.g. VPN...)</small>.

```ps
$dump | Select-Object ServerName,PublicNetworkAccess
```

By default, the ASD is behind a firewall to limit which IPs can access it. The default firewall allows every IP (`0.0.0.0-0.0.0.0`).

```
```

Microsoft Entry ID authentication allow you to easily manage access to the database while adding additional mechanisms such as MFA.

```ps
$servers | ForEach-Object { $res = Get-AzSqlServerActiveDirectoryAdministrator -ServerName $_.sn -ResourceGroupName $_.rgn; [PSCustomObject]@{ServerName=$_.sn; EntraStatus=if ($res) { "Enabled" } else { "Disabled" } } }
```
</div><div>
</div></div>