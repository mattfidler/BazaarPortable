!define VER 2.4.2-1
SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On
RequestExecutionLevel user
OutFile "..\..\BazaarPortable-Install-${VER}.exe"
Icon "..\..\App\AppInfo\appicon.ico"
Name "BazaarPortable 2.4.2-1"
BrandingText "BazaarPortable"
!include "MUI2.nsh"
!include "FileFunc.nsh"
!define MUI_ICON "..\..\App\AppInfo\appicon.ico"
!define MUI_HEADERIMAGE

!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING
!define MUI_PAGE_HEADER_TEXT "BazaarPortable"
!define MUI_PAGE_HEADER_SUBTEXT "Bazaar on the Go"

!define MUI_COMPONENTSPAGE_SMALLDESC

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "GPLv2.rtf"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

SectionGroup "Bazaar Portable" sec_bazaar_portable ; Collapsed
  ; Description:
  ; Bazaar Portable
  Section "Base Files" sec_base_files ; Checked
    ; Description:
    ; Base Bazaar Files
    RmDir /r "$INSTDIR"
    SetOutPath "$INSTDIR"
    File "..\..\Readme.html"
    File "..\..\BazaarCommand.exe"
    SetOutPath "$INSTDIR\App\AppInfo"
    File "..\..\App\AppInfo\*.*"
    SetOutPath "$INSTDIR\App\Bazaar"
    File "..\..\App\Bazaar\*.exe"
    File "..\..\App\Bazaar\ms*.dll"
    File "..\..\App\Bazaar\python*.dll"
    File "..\..\App\Bazaar\*.bat"
    SetOutPath "$INSTDIR\App\Bazaar\lib"
    File /r "..\..\App\Bazaar\lib\*.*"
    SetOutPath "$INSTDIR\App\Bazaar\imageformats"
    File /r "..\..\App\Bazaar\imageformats\*.*"
  SectionEnd ; sec_base_files
  SectionGroup "Documentation" sec_documentation ; Collapsed
    ; Description:
    ; Documentation
    Section "English" sec_english ; Checked
      ; Description:
      ; English
      SetOutPath "$INSTDIR\App\Bazaar"
      File "..\..\App\Bazaar\bzr-en.chm"
    SectionEnd ; sec_english
    Section /o "Japanese" sec_japanese 
      ; Description:
      ; Japanese
      SetOutPath "$INSTDIR\App\Bazaar"
      File "..\..\App\Bazaar\bzr-ja.chm"
    SectionEnd ; sec_japanese
    Section /o "Spanish" sec_spanish ; Unchecked (/o)
      ; Description:
      ; Spanish
      SetOutPath "$INSTDIR\App\Bazaar"
      File "..\..\App\Bazaar\bzr-es.chm"
    SectionEnd ; sec_spanish
    Section /o "Russian" sec_russian ; Unchecked (/o)
      ; Description:
      ; Russian
      SetOutPath "$INSTDIR\App\Bazaar"
      File "..\..\App\Bazaar\bzr-ru.chm"
    SectionEnd ; sec_russian
    Section "Developer Documentation" sec_developer_documentation ; Checked
      ; Description:
      ; Developer Documentation
      SetOutPath "$INSTDIR\App\Bazaar"
      File "..\..\App\Bazaar\bzr-developers.chm"
    SectionEnd ; sec_developer_documentation
  SectionGroupEnd ; sec_documentation
  SectionGroup "Plugins" sec_plugins ; Collapsed
    ; Description:2
    ; Bazaar Plugins
    Section "BzrTools" sec_bzrtools ; Checked
      ; Description:
      ; BzrTools (miscellaneous additions)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\bzrtools"
      File /r "..\..\App\Bazaar\plugins\bzrtools\*.*"
    SectionEnd ; sec_bzrtools
    Section "Colo" sec_colo ; Checked
      ; Description:
      ; Colo (work with colocated branches)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\colo"
      File /r "..\..\App\Bazaar\plugins\colo\*.*"
    SectionEnd ; sec_colo
    Section "Changelog Merge" sec_changelog_merge ; Checked
      ; Description:
      ; Merge hook for GNU Changelog files
      SetOutPath "$INSTDIR\App\Bazaar\plugins\changelog_merge"
      File /r "..\..\App\Bazaar\plugins\changelog_merge\*.*"
    SectionEnd ; sec_changelog_merge
    Section "Explorer" sec_explorer ; Checked
      ; Description:
      ; Bazaar Explorer
      SetOutPath "$INSTDIR\App\Bazaar\plugins\explorer"
      File /r "..\..\App\Bazaar\plugins\explorer\*.*"
      SetOutPath "$INSTDIR\"
      File "..\..\BazaarExplorerPortable.exe"
    SectionEnd ; sec_explorer
    Section "FastImport" sec_fastimport ; Checked
      ; Description:
      ; FastImport (import/export of history)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\fastimport"
      File /r "..\..\App\Bazaar\plugins\fastimport\*.*"
    SectionEnd ; sec_fastimport
    Section "Launchpad" sec_launchpad ; Checked
      ; Description:
      ; Launchpad.net integration
      SetOutPath "$INSTDIR\App\Bazaar\plugins\launchpad"
      File /r "..\..\App\Bazaar\plugins\launchpad\*.*"
    SectionEnd ; sec_launchpad    
    Section "Loom" sec_loom ; Checked
      ; Description:
      ; Loom (manage a stack of patches over an upstream)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\loom"
      File /r "..\..\App\Bazaar\plugins\loom\*.*"
    SectionEnd ; sec_loom
    Section "Netrc Credential Store" sec_netrc_credential_store ; Checked
      ; Description:
      ; netrc (credential store example)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\netrc_credential_store"
      File /r "..\..\App\Bazaar\plugins\netrc_credential_store\*.*"
    SectionEnd ; sec_netrc_credential_store
    Section "News Merge" sec_news_merge ; Checked
      ; Description:
      ; Smart Merging of NEWS files
      SetOutPath "$INSTDIR\App\Bazaar\plugins\news_merge"
      File /r "..\..\App\Bazaar\plugins\news_merge\*.*"
    SectionEnd ; sec_news_merge
    Section "Pipeline" sec_pipeline ; Checked
      ; Description:
      ; Pipeline (work on large changes as smaller pieces)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\pipeline"
      File /r "..\..\App\Bazaar\plugins\pipeline\*.*"
    SectionEnd ; sec_pipeline
    Section "QBzr" sec_qbzr ; Checked
      ; Description:
      ; QBzr (dialogs for GUI applications and IDEs)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\qbzr"
      File /r "..\..\App\Bazaar\plugins\qbzr\*.*"
    SectionEnd ; sec_qbz
    Section "Rewrite" sec_rewrite ; Checked
      ; Description:
      ; Rewrite (work on large changes as smaller pieces)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\rewrite"
      File /r "..\..\App\Bazaar\plugins\rewrite\*.*"
    SectionEnd ; sec_rewrite
    Section "SVN" sec_svn ; Checked
      ; Description:
      ; Subversion 1.6 integration
      SetOutPath "$INSTDIR\App\Bazaar\plugins\svn"
      File /r "..\..\App\Bazaar\plugins\svn\*.*"
    SectionEnd ; sec_svn
    Section "Upload" sec_upload ; Checked
      ; Description:
      ; Upload working tree
      SetOutPath "$INSTDIR\App\Bazaar\plugins\upload"
      File /r "..\..\App\Bazaar\plugins\upload\*.*"
    SectionEnd ; sec_upload
    Section "XmlOutput" sec_xmloutput ; Checked
      ; Description:
      ; XmlOutput (interface for IDEs)
      SetOutPath "$INSTDIR\App\Bazaar\plugins\xmloutput"
      File /r "..\..\App\Bazaar\plugins\xmloutput\*.*"
    SectionEnd ; sec_xmloutputr
  SectionGroupEnd ; sec_plugins
  Section /o "Nsis Portable Launcher and installation scripts" sec_nsis_portable_launcher_and_installation_scripts ; Unchecked (/o)
    ; Description:
    ; NSIS sources for Bazaar Portable
    SetOutPath "$INSTDIR\Other"
    File /r "..\..\Other\*.*"
  SectionEnd ; sec_nsis_portable_launcher_and_installation_scripts
SectionGroupEnd ; sec_bazaar_portable

Var PA
Function GetDriveVars
  StrCmp $9 "c:\" spa
  StrCmp $8 "HDD" gpa
  StrCmp $9 "a:\" spa
  StrCmp $9 "b:\" spa
  
  gpa:
    IfFileExists "$9PortableApps" 0 spa
    StrCpy $PA "$9PortableApps"
  spa:
    Push $0
FunctionEnd

Function .onInit
  StrCpy $PA ""
  ${GetDrives} "FDD+HDD" "GetDriveVars"
  StrCpy $INSTDIR "$PA\BazaarPortable"
  IntOp $0 ${SF_RO} | ${SF_SELECTED}
  SectionSetFlags ${sec_base_files} $0
FunctionEnd

;--------------------------------
;Description(s)
LangString DESC_sec_bazaar_portable ${LANG_ENGLISH} "Bazaar Portable"
LangString DESC_sec_nsis_portable_launcher_and_installation_scripts ${LANG_ENGLISH} "NSIS sources for Bazaar Portable"
LangString DESC_sec_explorer ${LANG_ENGLISH} "Bazaar Explorer"
LangString DESC_sec_developer_documentation ${LANG_ENGLISH} "Developer Documentation"
LangString DESC_sec_russian ${LANG_ENGLISH} "Russian"
LangString DESC_sec_spanish ${LANG_ENGLISH} "Spanish"
LangString DESC_sec_japanese ${LANG_ENGLISH} "Japanese"
LangString DESC_sec_english ${LANG_ENGLISH} "English"
LangString DESC_sec_documentation ${LANG_ENGLISH} "Documentation"
LangString DESC_sec_qbzr ${LANG_ENGLISH} "QBzr (dialogs for GUI applications and IDEs)"
LangString DESC_sec_xmloutput ${LANG_ENGLISH} "XmlOutput (interface for IDEs)"
LangString DESC_sec_upload ${LANG_ENGLISH} "Upload working tree"
LangString DESC_sec_svn ${LANG_ENGLISH} "Subversion 1.6 integration"
LangString DESC_sec_rewrite ${LANG_ENGLISH} "Rewrite (work on large changes as smaller pieces)"
LangString DESC_sec_pipeline ${LANG_ENGLISH} "Pipeline (work on large changes as smaller pieces)"
LangString DESC_sec_loom ${LANG_ENGLISH} "Loom (manage a stack of patches over an upstream)"
LangString DESC_sec_fastimport ${LANG_ENGLISH} "FastImport (import/export of history)"
LangString DESC_sec_colo ${LANG_ENGLISH} "Colo (work with colocated branches)"
LangString DESC_sec_bzrtools ${LANG_ENGLISH} "BzrTools (miscellaneous additions)"
LangString DESC_sec_news_merge ${LANG_ENGLISH} "Smart Merging of NEWS files"
LangString DESC_sec_netrc_credential_store ${LANG_ENGLISH} "netrc (credential store example)"
LangString DESC_sec_launchpad ${LANG_ENGLISH} "Launchpad.net integration"
LangString DESC_sec_changelog_merge ${LANG_ENGLISH} "Merge hook for GNU Changelog files"
LangString DESC_sec_plugins ${LANG_ENGLISH} "Bazaar Plugins"
LangString DESC_sec_base_files ${LANG_ENGLISH} "Base Bazaar Files"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_nsis_portable_launcher_and_installation_scripts} $(DESC_sec_nsis_portable_launcher_and_installation_scripts)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_explorer} $(DESC_sec_explorer)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_developer_documentation} $(DESC_sec_developer_documentation)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_russian} $(DESC_sec_russian)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_spanish} $(DESC_sec_spanish)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_japanese} $(DESC_sec_japanese)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_english} $(DESC_sec_english)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_documentation} $(DESC_sec_documentation)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_qbzr} $(DESC_sec_qbzr)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_xmloutput} $(DESC_sec_xmloutput)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_upload} $(DESC_sec_upload)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_svn} $(DESC_sec_svn)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_rewrite} $(DESC_sec_rewrite)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_pipeline} $(DESC_sec_pipeline)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_loom} $(DESC_sec_loom)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_fastimport} $(DESC_sec_fastimport)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_colo} $(DESC_sec_colo)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_bzrtools} $(DESC_sec_bzrtools)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_news_merge} $(DESC_sec_news_merge)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_netrc_credential_store} $(DESC_sec_netrc_credential_store)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_launchpad} $(DESC_sec_launchpad)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_changelog_merge} $(DESC_sec_changelog_merge)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_plugins} $(DESC_sec_plugins)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_base_files} $(DESC_sec_base_files)
  !insertmacro MUI_DESCRIPTION_TEXT ${sec_bazaar_portable} $(DESC_sec_bazaar_portable)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
