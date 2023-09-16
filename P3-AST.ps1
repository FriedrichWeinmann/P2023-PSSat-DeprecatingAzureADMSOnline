#----------------------------------------------------------------------------# 
#                     Climbing the Abstract Syntax Tree                      # 
#----------------------------------------------------------------------------# 

$rootPath = 'C:\code\GitHub\P2023-PSSat-DeprecatingAzureADMSOnline'
$resources = "$rootPath\resources"

code "$resources\Get-DCStatistics.ps1"
$result = Read-ReAst -Path "$resources\Get-DCStatistics.ps1"
$result.Ast
$result.Ast.EndBlock.Statements[0].Body.ProcessBlock
$result.Ast.EndBlock.Statements[0].Body.ProcessBlock.Extent

Search-ReAst -Ast $result.Ast -Filter {
	$args[0] -is [System.Management.Automation.Language.VariableExpressionAst] -and
	$args[0].VariablePath.UserPath -eq 'param'
}