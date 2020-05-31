[Code]
function GetProgramFiles(Param: string): string;
begin
  if IsWin64 then Result := ExpandConstant('{pf64}')
    else Result := ExpandConstant('{pf32}')
end;
[Setup]
AppName=Chromium Browser
AppVerName=Chromium Browser
AppPublisher=The Chromium Project
AppPublisherURL=http://dev.chromium.org
DisableWelcomePage=yes
DisableProgramGroupPage=yes
DisableDirPage=yes
DefaultDirName={code:GetProgramFiles}\Chromium Browser
DefaultGroupName=Chromium Browser
DisableReadyPage=yes
UninstallDisplayIcon={app}\chrome.exe
OutputBaseFilename=chromium_windows_setup
OutputDir=.
SetupIconFile=icon.ico
SolidCompression=yes
; Tell Windows Explorer to reload the environment
ChangesEnvironment=yes

[Tasks]
Name: shortcuts; Description: "All"; GroupDescription: "Create Shortcuts:";
Name: shortcuts\desktop; Description: "Desktop"; GroupDescription: "Create Shortcuts:";
Name: shortcuts\startmenu; Description: "Startmenu Programs"; GroupDescription: "Create Shortcuts:"; Flags: unchecked

[Files]
Source:chrome-win-x64\*; DestDir: {app}; Flags: recursesubdirs; Check: IsWin64;
Source:chrome-win-x86\*; DestDir: {app}; Flags: recursesubdirs; Check: not IsWin64;

[UninstallDelete]
;Name: {app}; Type: filesandordirs

[Icons]
Name: "{commondesktop}\Chromium Browser"; Tasks: shortcuts\desktop; Filename: "{app}\chrome.exe"; 
Name: "{commonstartmenu}\Chromium Browser"; Tasks: shortcuts\startmenu; Filename: "{app}\chrome.exe";

[Registry]
; API key for certain features provided by google (e.g. account, translation, ...)
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "GOOGLE_API_KEY"; ValueData: "AIzaSyDJD3V3FQfT4IijkFIR5OLTWHPeqsqnMag"; Flags: createvalueifdoesntexist uninsdeletevalue
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "GOOGLE_DEFAULT_CLIENT_ID"; ValueData: "334183695846-l6k6ruadkhrjq000qeaadedterlskoom.apps.googleusercontent.com"; Flags: createvalueifdoesntexist uninsdeletevalue
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "GOOGLE_DEFAULT_CLIENT_SECRET"; ValueData: "8XZYC_wy6CIjQgXcMPVOM-p2"; Flags: createvalueifdoesntexist uninsdeletevalue

; File association command references
Root: HKCR; Subkey: "ChromiumHandler"; ValueType: string; ValueName: ""; ValueData: "ChromiumHandler"; Flags: deletekey uninsdeletekey
Root: HKCR; Subkey: "ChromiumHandler\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\chrome.exe,0"
Root: HKCR; Subkey: "ChromiumHandler\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\chrome.exe"""

; Register application
Root: HKLM; Subkey: "SOFTWARE\RegisteredApplications"; ValueType: string; ValueName: "Chromium Browser"; ValueData: "Software\Clients\StartMenuInternet\Chromium\Capabilities"; Flags: deletevalue uninsdeletevalue

; Windows integration as available default browser
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium"; ValueType: string; ValueName: ""; ValueData: "Chromium Browser"; Flags: deletekey uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\chrome.exe,0"   
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\chrome.exe"""
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "Chromium is an open-source browser project that aims to build a safer, faster, and more stable way for all users to experience the web."   
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities"; ValueType: string; ValueName: "ApplicationIcon"; ValueData: "{app}\chrome.exe,0"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities"; ValueType: string; ValueName: "pplicationName"; ValueData: "Chromium Browser"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\StartMenu"; ValueType: string; ValueName: "StartMenuInternet"; ValueData: "Chromium Browser"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\FileAssociations"; ValueType: string; ValueName: ".htm";   ValueData: "ChromiumHandler"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\FileAssociations"; ValueType: string; ValueName: ".html";  ValueData: "ChromiumHandler"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\FileAssociations"; ValueType: string; ValueName: ".shtml"; ValueData: "ChromiumHandler"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\FileAssociations"; ValueType: string; ValueName: ".xht";   ValueData: "ChromiumHandler" 
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\FileAssociations"; ValueType: string; ValueName: ".xhtml"; ValueData: "ChromiumHandler"  
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\URLAssociations";  ValueType: string; ValueName: "ftp";    ValueData: "ChromiumHandler"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\URLAssociations";  ValueType: string; ValueName: "http";   ValueData: "ChromiumHandler"
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\Chromium\Capabilities\URLAssociations";  ValueType: string; ValueName: "https";  ValueData: "ChromiumHandler"