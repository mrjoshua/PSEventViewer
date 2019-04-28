﻿Describe 'Get-Events - Verify functionality' {
    $Date = (Get-Date).AddDays(-3)
    $Date1 = Get-Date

    $Events = Get-Events -Machine $Env:COMPUTERNAME -DateFrom $Date -DateTo $Date1 -ID 5617 -LogName 'Application'

    It 'Should have GatheredLogName, GatheredFrom fields properly filled in' {
        $Events[0].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[0].GatheredLogName | Should -Be 'Application'
    }
    It 'Should have more then 1 event' {
        $Events.Count | Should -BeGreaterThan 1
    }
    It 'Should return an Array' {
        $Events -is [Array] | Should -Be $true
    }
}