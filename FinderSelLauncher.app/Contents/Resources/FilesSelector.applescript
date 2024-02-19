set AppleScript's text item delimiters to linefeed
tell application "Finder"
    set SelList to text items of (selection as text)
    repeat with I in SelList
        set contents of I to POSIX path of I
    end repeat
return SelList as text
end tell
