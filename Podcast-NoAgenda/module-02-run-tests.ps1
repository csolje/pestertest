$naPath =  'C:\GitHub\pestertest\Podcast-NoAgenda'
Set-Location $naPath

Import-Module Pester

Invoke-Pester "$naPath\Podcast-NoAgenda.Module.Ver01.Tests.ps1"