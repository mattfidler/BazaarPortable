SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel user
OutFile "..\..\BazaarCommand.exe"
Icon "..\..\App\AppInfo\appicon.ico"

!macro _PathIfExist ARG1
  DetailPrint "Checking for ${ARG1}"
  StrCpy $9 ""
  IfFileExists "${ARG1}" 0 +4
  System::Call 'Kernel32::GetEnvironmentVariable(t , t, i) i("PATH", .r0, ${NSIS_MAX_STRLEN}).r1'
  System::Call 'Kernel32::SetEnvironmentVariableA(t, t) i("PATH", "${ARG1};$0").r3'StrCpy $9 "1"
!macroend
!define PathIfExist '!insertmacro "_PathIfExist"'


Section "Main" sec_main ; Checked
  ; Description:
  ; Main Section for GvEdit Launch
  IfFileExists "$EXEDIR\App\Bazaar\bzr.exe" launch not_found
  launch:
    IfFileExists $EXEDIR\Data +2
    SetOutPath '$EXEDIR\Data'
    ${PathIfExist} "$EXEDIR\App\Bazaar"
    ;; BZR_HOME
    System::Call 'Kernel32::SetEnvironmentVariableA(t, t) i("BZR_HOME", "$EXEDIR\Data").r3'StrCpy $9 "1"
    ;; BZR_PLUGIN_PATH
    System::Call 'Kernel32::SetEnvironmentVariableA(t, t) i("BZR_PLUGIN_PATH", "$EXEDIR\App\Bazaar\plugins\").r3'StrCpy $9 "1"
    Exec "cmd.exe"
    Goto end
  not_found:
    MessageBox MB_OK "Could not find Bzr.exe.  Installation corrupt."
  end:
  SectionEnd ; sec_main
  
  
  
