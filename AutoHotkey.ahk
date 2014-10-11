; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

!Down::
	Run nircmd.exe mutesysvolume 2 
Return

!Left::
	Run nircmd.exe changesysvolume -1000
Return 

!Right::
	Run nircmd.exe changesysvolume 1000
Return 

^!a::
	Run E:\Program_Distr\Utils\aida64extreme200_1747\aida64.exe
Return

^!d::
	Run C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe
Return

^!l::
	Run D:\Program Files (x86)\FlyLinkDC++\FlylinkDC.exe
Return

^!m::
	Run D:\Program Files\MATLAB\R2008a\bin\matlab.exe
Return

#n::
	Run D:\Program Files (x86)\Notepad++\notepad++.exe
Return

^!n::
	Run D:\Program Files (x86)\Notepad++\notepad++.exe
Return

^!o::
	Run D:\Program Files (x86)\EssentialPIM\EssentialPIM.exe
Return

^!p::
	Run D:\Program Files (x86)\AIMP3\AIMP3.exe
Return

^!s::
	Run D:\Program Files (x86)\Aptana Studio\AptanaStudio3.exe
Return

^!r::
	Run regedit
Return

^!t::
	Run cmd.exe
Return

^!w::
	Run D:\Program Files (x86)\VMware\vmware.exe
Return

^!v::
	Run C:\Program Files\Oracle\VirtualBox\VirtualBox.exe
Return

^!z::
	Run D:\Program Files (x86)\FileZilla FTP Client\filezilla.exe
Return

!^i::
	Run D:\Program Files\Wireshark\Wireshark.exe
Return

!^q::
	Run D:\Qt\Tools\QtCreator\bin\qtcreator.exe
Return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
