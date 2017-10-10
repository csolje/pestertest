<#-----------------------------------------------------------------------------
  Testing PowerShell with Pester

  Author: Robert C. Cain | @ArcaneCode | arcane@arcanetc.com
          http://arcanecode.com
 
  This module is Copyright (c) 2016 Robert C. Cain. All rights reserved.
  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted. 
  This module may not be reproduced in whole or in part without the express
  written consent of the author. 
-----------------------------------------------------------------------------#>

# Test Harness for the Podcast-Database Tests
Import-Module Pester

$dbPath = 'C:\PS\Pester-course\demo\completed-final-module\Podcast-Database'
Set-Location $dbPath 

Invoke-Pester "$dbPath\Podcast-Database.Module.Tests.ps1"

Invoke-Pester "$dbPath\function-Test-PodcastDatabase.Tests.ps1"
Invoke-Pester "$dbPath\function-New-PodcastDatabase.Tests.ps1"

Invoke-Pester "$dbPath\function-Test-PodcastTable.Tests.ps1"

Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" 

# With strict, pending and skipped tests are executed
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" -Strict

Invoke-Pester "$dbPath\function-Update-PodcastTable.Tests.ps1" -Tag 'Unit'
Invoke-Pester "$dbPath\function-Update-PodcastTable.Tests.ps1" -Tag 'Acceptance'

#region Advanced Invoke-Pester options ----------------------------------------
# Create test output compatible with NUnit
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" `
              -OutputFile "$dbPath\nunit.xml" `
              -OutputFormat NUnitXml

psedit "$dbPath\nunit.xml"

# Code Coverage
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" `
              -CodeCoverage "$dbPath\function-New-PodcastTable.ps1"


# PassThru
$testResults = Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" 
$testResults

$testResults = Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" -PassThru
$testResults 

# Strict

# Without strict, any skipped or pending tests are just listed, but don't fail
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1"

# With Strict, skipped or pending tests generate a failure
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" -Strict


# EnableExit
# Note, don't run this in the ISE or it will close it!
# This is used to cause PowerShell to exit with a return code
Invoke-Pester "$dbPath\function-New-PodcastTable.Tests.ps1" -EnableExit

# Instead, open up a new PowerShell command window and enter (or copy/paste)
# the line below.
$x = powershell.exe 'Invoke-Pester C:\PS\Pester-course\demo\completed-final-module\Podcast-Database\function-New-PodcastTable.Tests.ps1 -EnableExit'

# then print out the value of $x
$x

#endregion Advanced Invoke-Pester options 


