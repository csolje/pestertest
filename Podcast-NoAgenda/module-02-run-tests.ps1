$naPath =  'C:\GitHub\pestertest\Podcast-NoAgenda'
Set-Location $naPath

Import-Module Pester

Invoke-Pester "$naPath\Podcast-NoAgenda.Module.Ver08.Tests.ps1"Invoke-Pester "$naPath\Podcast-NoAgenda.Module.Ver08.Tests.ps1"