function Get-DCStatistics {
	[CmdletBinding()]
	param (
		[string]
		$Name = '*',

		[string]
		$Server,

		[pscredential]
		$Credential
	)
	process {
		$param = $PSBoundParameters | ConvertTo-PSFHashtable -ReferenceCommand Get-ADComputer
		foreach ($computer in Get-ADComputer @param -LDAPFilter "(&(Name=$Name)(PrimaryGroupID=516))") {

			$replication = Invoke-PSFCommand -ComputerName $computer -ScriptBlock {
				repadmin /showrepl
			}
			$diagnostics = Invoke-PSFCommand -ComputerName $computer -ScriptBlock {
				dcdiag
			}
			$services = Invoke-PSFCommand -ComputerName $computer -ScriptBlock {
				Get-Service
			}
			$system = Invoke-PSFCommand -ComputerName $computer -ScriptBlock {
				Get-CimInstance win32_SystemInfo
			}

			[PSCustomObject]@{
				ComputerName = $computer.DNSHostName
				Replication  = $replication
				Diagnostics  = $diagnostics
				Services     = $services
				System       = $system
			}
		}
	}
}