Set objArgs = WScript.Arguments
Set FS = CreateObject("Scripting.FileSystemObject")
zip = FS.GetAbsolutePathName(objArgs(0))
out = FS.GetAbsolutePathName(objArgs(1))

Set objShell = CreateObject("Shell.Application")

If NOT (FS.FolderExists(out)) Then
	FS.CreateFolder(out)
End If

Set source = objShell.NameSpace(zip).Items

objShell.NameSpace(out).CopyHere(source)

Do Until objShell.NameSpace(out).Items.Count = objShell.NameSpace(zip).Items.Count
	WScript.Sleep 1000
Loop

