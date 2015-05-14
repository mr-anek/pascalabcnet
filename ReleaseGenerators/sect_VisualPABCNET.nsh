﻿  Section $(DESC_Envr) VisualPABCNET
    SectionIn 1 2 RO
    SetOutPath "$INSTDIR"
    File "..\bin\ICSharpCode.TextEditor.dll" 
	File "..\bin\ICSharpCode.AvalonEdit.dll"	
    File "..\bin\PluginsSupport.dll"    
    File "..\bin\PascalABCNET.exe"   
    ;File "..\bin\PascalABCNET.exe.manifest"   
    File "..\bin\Debugger.Core.dll"
	File "..\bin\NETXP.Controls.dll"
	File "..\bin\NETXP.Controls.Bars.dll"
	File "..\bin\NETXP.Library.dll"
	File "..\bin\NETXP.Win32.dll"
    File "..\bin\PascalABCNET.chm"
    File "..\bin\CodeCompletion.dll"
    File "..\bin\WeifenLuo.WinFormsUI.Docking.dll"
    File "..\bin\HelpExamples.ini"
	File "..\bin\template.pct"
	File "..\bin\samples.pct"
    File "..\bin\Pause.exe"
	File "..\bin\rc.exe"
	File "..\bin\RcDll.dll"
	File "..\bin\FormatterOptions.ini"
	File "..\bin\ProgrammRunner.exe"
	File "..\bin\pabcworknet.ini"
	
	;dobavljaem fajly v uninst.log
	${AddFile} "ICSharpCode.TextEditor.dll"
	${AddFile} "ICSharpCode.AvalonEdit.dll"	
    ${AddFile} "PluginsSupport.dll"    
    ${AddFile} "PascalABCNET.exe"   
    ;File "..\bin\PascalABCNET.exe.manifest"   
    ${AddFile} "Debugger.Core.dll"
    ${AddFile} "PascalABCNET.chm"
    ${AddFile} "CodeCompletion.dll"
	${AddFile} "NETXP.Controls.dll"
	${AddFile} "NETXP.Controls.Bars.dll"
	${AddFile} "NETXP.Library.dll"
	${AddFile} "NETXP.Win32.dll"
    ${AddFile} "WeifenLuo.WinFormsUI.Docking.dll"
    ${AddFile} "HelpExamples.ini"
	${AddFile} "template.pct"
	${AddFile} "samples.pct"
    ${AddFile} "Pause.exe"
	${AddFile} "rc.exe"
	${AddFile} "RcDll.dll"
	${AddFile} "FormatterOptions.ini"
	${AddFile} "ProgrammRunner.exe"
	
    SetOutPath "$INSTDIR\Temp"
    SetOutPath "$INSTDIR"
    Push "Pause.exe"
    Call NGEN

    ;Временно
    ;Delete "$INSTDIR\PascalABCNET.ini"

    CreateShortCut "$DESKTOP\PascalABCNET.lnk" "$INSTDIR\PascalABCNET.exe"
    CreateShortCut "$SMPROGRAMS\PascalABC.NET\PascalABC.NET.lnk" "$INSTDIR\PascalABCNET.exe" 
    Push "PascalABCNET.exe"
    Call NGEN
    Push "ICSharpCode.TextEditor.dll"
	Call NGEN
    Push "Debugger.Core.dll"
    Call NGEN
    Push "CodeCompletion.dll"
    Call NGEN
	Push "NETXP.Controls.dll"
    Call NGEN
	Push "NETXP.Controls.Bars.dll"
	Call NGEN
	Push "NETXP.Library.dll"
	Call NGEN
	Push "NETXP.Win32.dll"
	Call NGEN
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    CreateShortCut "$SMPROGRAMS\PascalABC.NET\$(DESC_Remove) PascalABC.NET.lnk" "$INSTDIR\Uninstall.exe"
    System::Call 'Shell32::SHChangeNotify(i ${SHCNE_ASSOCCHANGED}, i ${SHCNF_IDLIST}, i 0, i 0)'  
    Delete "$PABCWorkNETPath\Output\*.pcu"
	FileOpen $4 "$INSTDIR\pabcworknet.ini" w
    FileWrite $4 "$PABCWorkNETPath"
    FileClose $4
  SectionEnd