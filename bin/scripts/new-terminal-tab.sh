
osascript << END

display dialog "Oh hai!"
if (do shell script "cat /etc/hosts") does not contain "127.0.0.1" then
    display dialog "/etc/hosts doesnt contain the set string!"
else
    display dialog "YEP IT DOES"
end if

# Reset directory cache
try
    do shell script "/usr/bin/dscacheutil -flushcache" with administrator privileges
catch
    display dialog "didnt have required permissions..."
end try

display dialog "Done. Auto-exit in 8 seconds..." giving up after 8


tell application "iTerm"
        -- Are we running any actual terminals?
        set sess_count to (count (every session of every terminal))
        if sess_count = 0 then
                make new terminal
        end if
        tell the first terminal
                if not (exists session named "$SHELL_NAME") then
                        launch session "Default"
                        tell the current session
                                set name to "$SHELL_NAME"
                                write text "$SHELL_INTERPRETER"
                        end tell
                end if
                select session named "$SHELL_NAME"
        activate
        end tell
end tell


tell application "Terminal"
    activate
    tell application "System Events" to keystroke "t" using command down
    repeat while contents of selected tab of window 1 starts with linefeed
        delay 0.01
    end repeat
    do script "echo a" in window 1
end tell

END
