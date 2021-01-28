unit GlobalVars;
{.$DEFINE USE_CODESITE}
interface
Uses
  Winapi.Messages, Winapi.SHFolder,

  System.SysUtils,

  Vcl.Dialogs,

  Data.DB, nxdb,

  MSspecialFolders, GemINI

  {$IFDEF USE_CODESITE }, CodeSiteLogging  {$ENDIF} ;

type

  TTransportUsed = (tranWinSock, tranNamePipe, tranLocalServer, tranSharedMem, tranNone, tranError);


const
  WM_SHOWPRJSDIALOG         = WM_APP + 321;
  cBtnDefaultHieght         = 20;   // keep
  cSRSDpath                 = '\SlickRockSoftwareDesign\NxDelphiSqlTools';
  cPrjsSetUpComponents      = '\PrjSetUp.ini';         //keep //components values
  cMRUFileName              = '\MRUPrj.txt';  // ok   recent used projects
  cLocalServerAliases       = '\LocalDbs.txt'; //  keep
  cFloatingFormLocationsIni = '\FloatingFromLocations.ini';   // keep  // Floating form location and size memory


  cDelphiSqToolsDbPath = '\DelphiSqlToolsDb\';   // keep // Nexus Delphi Sql Tools database
  cFormLocSizeDef      = '\FormLocSizeDefs.xml'; // keep  // Location and size of forms memory

  cFilterIniFiles      = '\Filters\Filters.ini';   //keep
  cDefaultPathForPrjs  = '\NxSQL_Prjs'; // keep
  cThe_DefaultPrjPath = '\DefaultPrj'; // ok

//  cPrgFileName = '\ProjectSetup.prj'; // remove
  cUpdateInstallPath = '\Installer'; //ok
//  cSqlBtnsDbAlias    = 'NxDelphiSqlTools'; // ok
  cSqlFontFileName   = '\EditorFonts.bin'; // ok

  cNxDbTimeOut = 3000;

  cTransportTypes: array[TTransportUsed] of string = ('Win Sock', 'Named Pipe',
                                                      'Local Server', 'Shared Mem',
                                                      'None', 'Error');

  DbDataTypes: array[TFieldType] of String = ('ftUnknown',  'ftString', 'ftSmallint',
                       'ftInteger', 'ftWord', // 0..4       /
                       'ftBoolean', 'ftFloat', 'ftCurrency', 'ftBCD', 'ftDate',
                       'ftTime', 'ftDateTime', // 5..11         /
                       'ftBytes', 'ftVarBytes', 'ftAutoInc', 'ftBlob', 'ftMemo',
                       'ftGraphic', 'ftFmtMemo', // 12..18      /
                       'ftParadoxOle', 'ftDBaseOle', 'ftTypedBinary', 'ftCursor',
                       'ftFixedChar', 'ftWideString', // 19..24   /
                       'ftLargeint', 'ftADT', 'ftArray', 'ftReference', 'ftDataSet',
                       'ftOraBlob', 'ftOraClob', // 25..31        /
                       'ftVariant', 'ftInterface', 'ftIDispatch', 'ftGuid', 'ftTimeStamp',
                       'ftFMTBcd', // 32..37                      /
                       'ftFixedWideChar', 'ftWideMemo', 'ftOraTimeStamp', 'ftOraInterval', // 38..41        /
                       'ftLongWord', 'ftShortint', 'ftByte', 'ftExtended', 'ftConnection',
                       'ftParams', 'ftStream', //42..48
                       'ftTimeStampOffset', 'ftObject', 'ftSingle'); //49..51       /


type

{TGobalVarClass============================================================= }
  TGobalVarClass = record
    fSpecialFolders             : TGEMSystemFolders;
    fFloatFormLocIni            : string;
    fPrjsSetupCompomentsIni     : string;
    fAppPreferences             : string;
    fSqlFontStylesSaveFilePath  : string;   //keep
    fAppDefaultPrjPath          : string;
    fMRURecentPrjsFile          : string;
    fUpdateInstallPath          : string;
    fAppPath                    : string;// := GetAppSettingsPath;
    fPersonalFolder             : string;
    fAlisesFileForLocalServer   : string;
    fAppFormsLocations          : string;

//    fDefaultPathForPrjsFolder   : string;
    fNxSQLViewerDataIniFile     : tGemINI;
//    SetMainPath                 : string;
  private
    procedure SetProgramPaths;
//    function getWinSpecialFolder(CSIDLFolder : integer; IncludeBackSlash: boolean) : string;
  public
    constructor Create(aFileName: string); overload;
    procedure Destroy; overload;
//  published

    property PersonalFolder             : string read fPersonalFolder;
    property AppPath                    : string read fAppPath;
    property FloatFormLocIni            : string read fFloatFormLocIni;
    property PrjsSetupCompomentsIni     : string read fPrjsSetupCompomentsIni;
    property AppFormsLocations          : string read fAppFormsLocations;
    property SqlFontStylesSaveFilePath  : string read fSqlFontStylesSaveFilePath;   //keep
    property AppDefaultPrjPath          : string read fAppDefaultPrjPath;
    property MRURecentPrjsFile          : string read fMRURecentPrjsFile;
    property AlisesFileForLocalServer   : string read fAlisesFileForLocalServer;
    property UpdateInstallPath          : string read fUpdateInstallPath;


//    property DefaultPathForPrjsFolder   : string read fDefaultPathForPrjsFolder;
  end;

var
  gLoclDataStore : string;

//function SetaProgramPaths: string;


implementation


function GetPersonalFolderForPrjDefault: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'SetaProgramPaths' );{$ENDIF}

{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars A. in SetProgramPaths'); {$ENDIF}
  result := GetWinSpecialFolder(CSIDL_PERSONAL, false);
{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars B. in SetProgramPaths: '+ result); {$ENDIF}

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'SetaProgramPaths' );{$ENDIF}
end;

function GetAppFolderForAppSettings: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'SetaProgramPaths' );{$ENDIF}

{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars A. in SetProgramPaths'); {$ENDIF}
  result := GetWinSpecialFolder(CSIDL_APPDATA, false);
{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars B. in SetProgramPaths: '+ result); {$ENDIF}

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'SetaProgramPaths' );{$ENDIF}
end;

{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}

constructor TGobalVarClass.Create(aFileName: string);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'TGobalVarClass.Create' );{$ENDIF}
//  inherited;  // Call the parent Create method
  fSpecialFolders := TGEMSystemFolders.Create;
{$IFDEF USE_CODESITE}CodeSite.SendMsg('before SetaProgramPaths'); {$ENDIF}
   fAppPath :=  trim(GetAppFolderForAppSettings);

   fPersonalFolder := Trim(GetPersonalFolderForPrjDefault);
{$IFDEF USE_CODESITE}CodeSite.SendMsg('before Create Ini file: '+ fPathAndFileIni); {$ENDIF}
  SetProgramPaths;
  fNxSQLViewerDataIniFile := tGemINI.Create(''  );
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('after Create Ini file'); {$ENDIF}

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'TGobalVarClass.Create' );{$ENDIF}
end;


procedure TGobalVarClass.Destroy;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'TGobalVarClass.Destory' );{$ENDIF}

  FreeAndNil(fNxSQLViewerDataIniFile);
  FreeAndNil(fSpecialFolders);
  inherited;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'TGobalVarClass.Destory' );{$ENDIF}
end;


procedure TGobalVarClass.SetProgramPaths;

  procedure SetAppFilesPaths;
  begin
    fSqlFontStylesSaveFilePath := fAppPath + cSqlFontFileName;
    fMRURecentPrjsFile         := fAppPath + cMRUFileName;
    fAlisesFileForLocalServer  := fAppPath + cLocalServerAliases;
    fFloatFormLocIni           := fAppPath + cFloatingFormLocationsIni;
    fPrjsSetupCompomentsIni    := fAppPath + cPrjsSetUpComponents;
    fAppFormsLocations         := fAppPath + cFormLocSizeDef;

//    fDelphiDbDefaultPath       := fAppPath + cDelphiSqToolsDbPath;

  end;

begin
  if not DirectoryExists(fAppPath) then
  begin
    if not CreateDir(fAppPath) then
      MessageDlg('Could not Create the App Path folder. Error:'+IntToStr(GetLastError)+ #13+#10+
                  'Folder: '+ fAppPath , mtError, [mbOK], 0)
    else
      SetAppFilesPaths;
  end
  else
    SetAppFilesPaths;


  fAppDefaultPrjPath := fPersonalFolder + cDefaultPathForPrjs + '\';
  if not DirectoryExists(fAppDefaultPrjPath) then
    if not ForceDirectories(fAppDefaultPrjPath) then
      MessageDlg('Could Default project folder. Error:'+IntToStr(GetLastError), mtError, [mbOK], 0);


  fUpdateInstallPath := fAppPath + cUpdateInstallPath;
  if not DirectoryExists(fUpdateInstallPath) then
    if not ForceDirectories(fUpdateInstallPath) then
      MessageDlg('Could create Updater folder. Error:'+IntToStr(GetLastError), mtError, [mbOK], 0);
end;



end.


