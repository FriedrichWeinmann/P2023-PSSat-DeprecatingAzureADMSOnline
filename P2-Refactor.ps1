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

$resources = 'C:\code\GitHub\P2023-PSSat-DeprecatingAzureADMSOnline\resources'
code "$resources\refactor_example.transform.psd1"
code "$resources\refactor_script.ps1"

Import-ReTokenTransformationSet -Path "$resources\refactor_example.transform.psd1"
Convert-ReScriptFile -Path "$resources\refactor_script.ps1" -Backup