#include <Array.au3>

local $alarm_hour[0]
local $alarm_min[0]
local $alarm_text[0]
$last_minute =0
$minute = 0

set_alarms()
while true
	$minute = @MIN
	if $minute <> $last_minute then check_alarm()
	sleep(1000)

wend


func set_alarms()
	$files = FileReadToArray('settings.txt')
  
	for $i = 0 to ubound($files)-1
		$array = stringsplit($files[$i], @tab, 2)
		$time  = stringsplit($array[0], ':', 2)
		_ArrayAdd($alarm_hour, $time[0])
		_arrayadd($alarm_min,  $time[1])
		_arrayadd($alarm_text, $array[1])
	next
  
endfunc


func check_alarm()
	for $t = 0 to ubound($alarm_hour)-1
		if (@HOUR = $alarm_hour[$t]) and (@MIN = $alarm_min[$t]) then
			sound_alarm($t)
			$last_minute = $minute
		endif
	next
  
endfunc


func sound_alarm($input)
	Beep(500, 10000)
	msgbox(1,'ALARM', $alarm_text[$input])
  
endfunc





