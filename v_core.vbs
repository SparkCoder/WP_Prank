dim wshShell
dim sUserName
dim sCurrDir

Set wshShell = WScript.CreateObject("WScript.Shell")
sUserName = wshShell.ExpandEnvironmentStrings("%USERNAME%")
sCurrDir = WshShell.CurrentDirectory

Set oShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")

sWinDir = oFSO.GetSpecialFolder(0)
sWallPaper = sCurrDir + "\images\r_wp.png"

' Update in registry
oShell.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", sWallPaper
oShell.RegWrite "HKCU\Control Panel\Desktop\WallpaperStyle", 1

' Let the system know about the change
oShell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True

