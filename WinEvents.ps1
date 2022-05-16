$events = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'

# ENTER THE EVENT ID IN THE LINE BELOW
    ID = EVENT_LOG_ID_NUMBER
}
foreach ($event in $events){
    [pscustomobject]@{
        UserName = $event.Properties[0].Value
        CallerComputer = $event.Properties[1].Value
        TimeStamp = $event.TimeCreated
		  User = $event.Properties[5].Value
    }
}
