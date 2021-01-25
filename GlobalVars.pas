unit GlobalVars;
{$DEFINE USE_CODESITE}
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
  WM_SHOWPRJSDIALOG = WM_APP + 321;

  cSRSDpath = '\SlickRockSoftwareDesign\NxDelphiSqlTools';

  cNxTableViewerIni    = '\nxTableViewer.ini';   // keep  // Floating form location and size memory
  cDelphiSqToolsDbPath = '\DelphiSqlToolsDb\';   // keep // Nexus Delphi Sql Tools database
  cFormLocSizeDef      = '\FormLocSizeDefs.xml'; // keep  // Location and size of forms memory
  cPrjSetUpComponents  = '\PrjSetUp.ini';         //keep //components values

  cBtnDefaultHieght    = 20;   // keep
  cLocalServerAliases  = '\LocalDbs.txt'; //  keep
  cFilterIniFiles      = '\Filters\Filters.ini';   //keep
  cDefaultPathForPrjs  = '\NxSQL_Prjs'; // keep
  cThe_DefaultPrjPath = '\DefaultPrj'; // ok

//  cPrgFileName = '\ProjectSetup.prj'; // remove
  cMRUFileName = '\MRUPrj.txt';  // ok   recent used projects
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
  TGobalVarClass = class
    fSpecialFolders             : TGEMSystemFolders;
    fPathAndFileIni             : string;
    fPrjSetupCompomentsIni      : string;
    fPathAndFileAtFormLocSize   : string;
    fDelphiDbDefaultPath        : string;
    fDefaultPathForPrjsFolder   : string;
    fMRUFile                    : string;
    fUpdateInstallPath          : string;
    fSqlFontStylesSaveFilePath  : string;   //keep
    fAlisesFileForLocalServer   : string;
    fNxSQLViewerDataIniFile     : tGemINI;
    fAppPath                    : string;// := GetAppSettingsPath;
    SetMainPath                 : string;
  private
    procedure SetProgramPaths;
//    function getWinSpecialFolder(CSIDLFolder : integer; IncludeBackSlash: boolean) : string;
  public
    constructor Create;
    destructor Destory;
  published
    property AppPath                    : string read fAppPath;
    property PathAndFileIni             : string read fPathAndFileIni;
    property PrjSetupCompomentsIni      : string read fPrjSetupCompomentsIni;
    property PathAndFileAtFormLocSize   : string read fPathAndFileAtFormLocSize;
    property DelphiDbDefaultPath        : string read fDelphiDbDefaultPath;
    property DefaultPathForPrjsFolder   : string read fDefaultPathForPrjsFolder;
    property MRUFile                    : string read fMRUFile;
    property UpdateInstallPath          : string read fUpdateInstallPath;
    property SqlFontStylesSaveFilePath  : string read fSqlFontStylesSaveFilePath;   //keep
    property AlisesFileForLocalServer   : string read fAlisesFileForLocalServer;
  end;

var
  gLoclDataStore : string;

implementation


function SetaProgramPaths: string;

begin
{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars A. in SetProgramPaths'); {$ENDIF}
  result := GetWinSpecialFolder(CSIDL_PERSONAL, false);
{$IFDEF USE_CODESITE}CodeSite.SendMsg('GlobalVars B. in SetProgramPaths: '+ result); {$ENDIF}
end;


{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}

constructor TGobalVarClass.Create;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.Create' );{$ENDIF}
//  fSpecialFolders := TGEMSystemFolders.Create;
{$IFDEF USE_CODESITE}CodeSite.SendMsg('before SetaProgramPaths'); {$ENDIF}
   SetMainPath := SetaProgramPaths;
{$IFDEF USE_CODESITE}CodeSite.SendMsg('before Create Ini file: '+ fPathAndFileIni); {$ENDIF}
  fNxSQLViewerDataIniFile := tGemINI.Create(fPathAndFileIni);
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('after Create Ini file'); {$ENDIF}

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TGobalVarClass.Create' );{$ENDIF}
end;


destructor TGobalVarClass.Destory;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.Destory' );{$ENDIF}

  FreeAndNil(fNxSQLViewerDataIniFile);
  FreeAndNil(fSpecialFolders);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TGobalVarClass.Destory' );{$ENDIF}
end;


procedure TGobalVarClass.SetProgramPaths;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.SetProgramPaths' );{$ENDIF}
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'before fapp path' );{$ENDIF}
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('before get gLoclDataStore'); {$ENDIF}
  var tempstr: string := SetMainPath;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('After get gLoclDataStore: '+tempstr); {$ENDIF}
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'TempStr: '+tempstr );{$ENDIF}
  fAppPath                  :=  tempstr+ cSRSDpath;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'after fapp pat' );{$ENDIF}

  fDefaultPathForPrjsFolder := fAppPath + cDefaultPathForPrjs + '\';
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'set 2 paths' );{$ENDIF}

  fMRUFile                  := fAppPath + cMRUFileName;
  fUpdateInstallPath        := fAppPath + cUpdateInstallPath;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'set next 2 paths' );{$ENDIF}

  ForceDirectories(AppPath);
  ForceDirectories(fDefaultPathForPrjsFolder);
  ForceDirectories(fUpdateInstallPath);
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'Force  3 paths' );{$ENDIF}

//  fIniNxSQLPathFile          := fDefaultPathForPrjsFolder + cFilterIniFiles; // filters for a project
  fSqlFontStylesSaveFilePath := AppPath + cSqlFontFileName;
  fPathAndFileIni            := AppPath + cNxTableViewerIni;

  fPrjSetupCompomentsIni     := AppPath + cPrjSetUpComponents;
  fDelphiDbDefaultPath       := AppPath + cDelphiSqToolsDbPath;
  fPathAndFileAtFormLocSize  := AppPath + cFormLocSizeDef;

  fAlisesFileForLocalServer  := fAppPath + cLocalServerAliases;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TGobalVarClass.SetProgramPaths' );{$ENDIF}
end;

end.
