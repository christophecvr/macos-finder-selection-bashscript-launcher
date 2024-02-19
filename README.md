# Easy way to pass Finder selection to bash Script.

- This application just shows how to pass a finder selection to a bash script.
- It is here just a base setup.
- The FinderSelLauncher.app can be selected to open files selected in finder.
- Then it will pas it to MyBashScript.
- Here in this example the script will just echo the selected files
- into a FinderSelLauncher.log located in you're home directory.
- It is perfect as for example creating a x11 program launcher like for gedit.
- For that reason I just will also set the .app launcher I made to open
- documents in finder with the macports installed Gedit 3.38.2.
- I made a very simple apple script which I called FilesSelector.applescript
- It is located in submap Resources. This script will just make a POSIX file
- list of you're selection and return that as result.
- Then its is very easy to just set that list into a bash script array.
- That works in all bash shell version also in sh. Guess it will also work ok
- For all other shells You are using.
