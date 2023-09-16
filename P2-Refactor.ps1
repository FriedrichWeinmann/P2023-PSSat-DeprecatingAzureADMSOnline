#----------------------------------------------------------------------------# 
#                                  Refactor                                  # 
#----------------------------------------------------------------------------# 

<#
Link: https://github.com/FriedrichWeinmann/Refactor

+ Code Analysis
+ Breaking Change Scan
+ Search and Replace / Refactoring using AST, rather than plain string replacements
+ Extensible Framework
#>

$rootPath = 'C:\code\GitHub\P2023-PSSat-DeprecatingAzureADMSOnline'
$resources = "$rootPath\resources"
code "$resources\refactor_example.transform.psd1"
code "$resources\refactor_script.ps1"

Import-ReTokenTransformationSet -Path "$resources\refactor_example.transform.psd1"
Convert-ReScriptFile -Path "$resources\refactor_script.ps1" -OutPath "$rootPath\new"


#----------------------------------------------------------------------------# 
#                              Breaking Change                               # 
#----------------------------------------------------------------------------# 

code "$resources\beer.breakingchange.psd1"
Import-ReBreakingChange -Path "$resources\beer.breakingchange.psd1"

$param = @{
	Module = 'BeerManager'
	FromVersion = '1.0.0'
	ToVersion = '3.0.0'
}
Get-ChildItem -Path "$resources\BeerStuff" | Search-ReBreakingChange @param

code "$resources\beer.transform.psd1"