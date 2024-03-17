use framework "Foundation"
use scripting additions

on run
	set text item delimiters to linefeed
	set myHomePath to system attribute "HOME"
	set myLogFile to myHomePath & "/Library/Logs/aLaunchTest.log" as text
	set myFile to open for access (myLogFile) with write permission
	set eof myFile to 0
	close access myFile
	set AppBundle to quoted form of text 1 through -2 of POSIX path of text of (path to current application as text)
	set AppName to name of current application as text
	set AppArgs to (current application's NSProcessInfo's processInfo's arguments) as list
	set AppInfoNumbers to count of AppArgs
	set AppRunningBin to quoted form of text item 1 of AppArgs as text
	set AppXargs to {}
	if AppInfoNumbers is greater than 1 then
		set AppInfoCnt to 0
		repeat with I in AppArgs
			set AppInfoCnt to (AppInfoCnt + 1)
			if AppInfoCnt is greater than 1 then
				set end of AppXargs to quoted form of text of I as text
			end if
		end repeat
	end if
	display dialog "Opening Application whitout file in open command or by clicking on app" giving up after 5
	set myFile to open for access (myLogFile) with write permission
	write "################# Start Logging of TestLaunchCvr Without file to open ##############################" to myFile starting at eof
	
	write "
The Application Bundle is: " & AppBundle as string to myFile starting at eof
	write "
The Application Name is: " & AppName to myFile starting at eof
	write "
The Application Run Bin is: " & AppRunningBin to myFile starting at eof
	if AppXargs is not equal to {} then
		set text item delimiters to " "
		write "
The Application Args are: " & AppXargs to myFile starting at eof
		set text item delimiters to linefeed
	end if
	write "
################# End Logging Of TestLaunchCvr Without File to open ################################" to myFile starting at eof
	close access myFile
end run

on open filepath
	set text item delimiters to linefeed
	set myHomePath to system attribute "HOME"
	set myLogFile to myHomePath & "/Library/Logs/aLaunchTest.log" as text
	set myFile to open for access (myLogFile) with write permission
	set eof myFile to 0
	close access myFile
	-- path whitout trailing backslash since the .app is a folder
	set AppBundle to quoted form of text 1 through -2 of POSIX path of text of (path to current application as text)
	set AppName to name of current application as text
	set AppArgs to (current application's NSProcessInfo's processInfo's arguments) as list
	set AppInfoNumbers to count of AppArgs
	set AppRunningBin to quoted form of text item 1 of AppArgs as text
	set AppXargs to {}
	if AppInfoNumbers is greater than 1 then
		set AppInfoCnt to 0
		repeat with I in AppArgs
			set AppInfoCnt to (AppInfoCnt + 1)
			if AppInfoCnt is greater than 1 then
				set end of AppXargs to quoted form of text of I as text
			end if
		end repeat
	end if
	set FilesPaths to {}
	set FilesArgsPaths to {}
	repeat with I in filepath
		set end of FilesPaths to quoted form of text of POSIX path of I as text
		if AppInfoNumbers is greater than 1 then
			set text item delimiters to " "
			set end of FilesArgsPaths to quoted form of text of POSIX path of I & " " & AppXargs as text
			set text item delimiters to linefeed
		end if
	end repeat
	display dialog "File Names to open: 
" & FilesPaths giving up after 5
	set myFile to open for access (myLogFile) with write permission
	write "################# Start Logging of TestLaunchCvr With file To Open##############################" to myFile starting at eof
	write "
The Application Bundle is: " & AppBundle as string to myFile starting at eof
	write "
The Application Name is: " & AppName to myFile starting at eof
	write "
The Files to open are: 
" & FilesPaths to myFile starting at eof
	write "
The Application Run Bin is: " & AppRunningBin to myFile starting at eof
	if AppXargs is not equal to {} then
		set text item delimiters to " "
		write "
The Application Args are: " & AppXargs to myFile starting at eof
		set text item delimiters to linefeed
	end if
	if FilesArgsPaths is not equal to {} then
		write "
The files to open with Arguments are : 
" & FilesArgsPaths to myFile starting at eof
	end if
	write "
################# End Logging Of TestLaunchCvr With File To Open################################" to myFile starting at eof
	close access myFile
end open