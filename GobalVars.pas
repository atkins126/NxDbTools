unit GobalVars;

interface
Uses
  System.SysUtils,

  Vcl.Dialogs,

  MSspecialFolders, GemINI, Golbal;


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
  private
    procedure SetVarProgramPaths;
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

implementation


{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}
{ TGobalVarClass ==============================================================}

constructor TGobalVarClass.Create;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.Create' );{$ENDIF}
//  fSpecialFolders := TGEMSystemFolders.Create;
  SetVarProgramPaths;
showmessage('before Create Ini file');
  fNxSQLViewerDataIniFile := tGemINI.Create(fPathAndFileIni);
showmessage('after Create Ini file');

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TGobalVarClass.Create' );{$ENDIF}
end;


destructor TGobalVarClass.Destory;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.Destory' );{$ENDIF}

  FreeAndNil(fNxSQLViewerDataIniFile);
  FreeAndNil(fSpecialFolders);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TGobalVarClass.Destory' );{$ENDIF}
end;


procedure TGobalVarClass.SetVarProgramPaths;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TGobalVarClass.SetProgramPaths' );{$ENDIF}
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'before fapp path' );{$ENDIF}
  showmessage('before get gLoclDataStore');
  var tempstr: string := gLoclDataStore;
  showmessage('After get gLoclDataStore: '+tempstr);
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
