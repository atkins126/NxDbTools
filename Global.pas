unit Global;

{$DEFINE USE_CODESITE}

interface
uses
  Winapi.Winsock, Winapi.Messages, Winapi.SHFolder,  WinApi.Windows,
  WinApi.KnownFolders,  WinApi.ShlObj,  Winapi.ActiveX,


  System.SysUtils, System.Inifiles, System.AnsiStrings, System.TypInfo,
  System.Classes, System.UITypes,  System.IOUtils, System.Types,

  Vcl.Graphics, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Controls, Vcl.Menus,
  Vcl.ComCtrls,

  Data.DB, nxdb, MSspecialFolders,

  GemINI, GlobalVars,

  JvPanel, JvDataSource,

  SynHighlighterSQL {$IFDEF USE_CODESITE }, CodeSiteLogging  {$ENDIF};







type
  TStatusPanelOrder = (spoMemory, spoAlias, spoDefaultPrjDir, spoDbStatus, spoDbVer, spoCurrenPrj);

  pRootNodeDb = ^tRootNodeDb;
  tRootNodeDb = record
    DataBase: TnxDatabase;
  end;

  tFunctionReturns3 = (frTrue, frFalse1, frFalse2);

  TEditAttri = (eaKeyAttri, eaCommentAttri, eaNumberAttri, eaSQLEditor,
                eaTableNameAttri, eaFunctionAttri);
  TDockingFormType = (TSQLForm, TTblForm, TNoForm);

  tStr95  = string[95];
  tStr45  = string[45];
  tStr25  = string[25];
  tStr255 = string[255];

  TChangeTransport   = procedure(aTransport: TTransportUsed) of Object;
  tChangeServer      = procedure(aServer: tStr45) of Object;
  tChangeAlias       = procedure(aAlias: tStr95) of Object;
  tChangeFileSaveLoc = procedure(aPath: string) of object;

  TProjectInfo = class
    fAppPath                : string;

    fIsDefaultPrj           : Boolean;

    fLocalAliasPath         : string;
    fLocalAlias             : string;

    fPrjName                : tStr25;
    fPrjPath                : tStr255;
    fPrjTransport           : TTransportUsed;
    fPrjServer              : tStr45;
    fPrjAlias               : tStr95;

    fActiveTransport        : TTransportUsed;
    fActiveServer           : tStr45;
    fActiveAlias            : tStr95;

    fPasSqlFileSaveLoc      : tStr255;
    fDefaultPasSqlFileLoc   : string;
    fIniFilterPathFile      : string;

    fDBPassWord             : tStr255;
    fTableName              : tStr25;
    fTreeNode               : TTreeNode;
    fUpdate                 : Boolean;

    fOnChangeTransport      : TChangeTransport;
    fOnChangeServer         : tChangeServer;
    fOnChangeAlias          : tChangeAlias;
    fOnChangeFileSaveLoc    : tChangeFIleSaveLoc;

    fDataSource             : TJvDataSource;
  private
    procedure PrjTransportChange(aTransport: TTransportUsed);
    procedure PrjServerChange(aServer: tStr45);
    procedure PrjAliasChange(aAlias: tStr95);
    procedure PrjFileSaveLocChange(aFilePath: string);
    procedure SetPrjAlias(const Value: tstr95);
    procedure SetPrjServer(const Value: tstr45);
    procedure SetPrjTransport(const Value: TTransportUsed);
    procedure SetDataSource(const Value: TJvDataSource);
    procedure SetIniPathFile(const Value: string);
    procedure SetIsDefaultPrj(const Value: Boolean);
//    procedure SetIniPathFile(const Value: string);
//    procedure SetDefaultPasSqlFileLoc(const Value: string);
//    procedure SetDataSource(const Value: TJvDataSource);
  public
    constructor Create(aPrjName: string; aDataSet: TDataSet);
    destructor Destory;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure ClearPrj;

//    function DefaultPasSqlFiles: string;

    function LoadPropertiesFromTable(var Msg: string; aPrjName: string): Boolean; overload;
    function LoadPropertiesFromTable(var Msg: string): Boolean; overload;

    procedure PrjPropertiesToActive;

    function SavePropertiesToTable(var Msg: string; aPrjName: string): Boolean;
    function InsertPrjIntoDb(var Msg: string): Boolean;
    function DeletePrj(var Msg: string; aPrjName: string): Boolean;

    property IsDefaultPrj: Boolean read fIsDefaultPrj write SetIsDefaultPrj;

    property DataSource           : TJvDataSource read fDataSource write SetDataSource;
    property PrjName              : tStr25 read fPrjName write fPrjName;
    property PrjPath              : tStr255 read fPrjPath write fPrjPath;
    property PasSqlFileSaveLoc    : tStr255 read fPasSqlFileSaveLoc write fPasSqlFileSaveLoc;
    property DefaultPasSqlFileLoc : string read fDefaultPasSqlFileLoc;
    property PrjDBPassWord        : tStr255 read fDBPassWord write fDBPassWord;

    property IniFilterPathFile    :string read fIniFilterPathFile write SetIniPathFile;

    property LocalAliasPath       : string read fLocalAliasPath;
    property LocalAlias           : string read fLocalAlias;
    property PrjTransport         : TTransportUsed read fPrjTransport write SetPrjTransport;
    property PrjServer            : tstr45 read fPrjServer write SetPrjServer;
    property PrjAlias             : tstr95 read fPrjAlias write SetPrjAlias;

    property ActiveTrans          : TTransportUsed read fActiveTransport write fActiveTransport;
    property ActiveServer         : tstr45 read fActiveServer write fActiveServer;
    property ActiveAlias          : tstr95 read fActiveAlias write fActiveAlias;

    property Table                : tStr25 read fTableName write fTableName;
    property Node                 : tTreeNode read fTreeNode write fTreeNode;

    property OnChangeTransport    : TChangeTransport read fOnChangeTransport write fOnChangeTransport;
    property OnChangeServer       : tChangeServer read fOnChangeServer write fOnChangeServer;
    property OnChangeAlias        : tChangeAlias read fOnChangeAlias write fOnChangeAlias;
    property OnChangeFileSaveLoc  : tChangeFileSaveLoc read fOnChangeFileSaveLoc write fOnChangeFileSaveLoc;
  end;

  TSQLBtnsDefaults = record
    TopMargin: Integer;
    Spacing  : Integer;
    Height   : Integer;
    Col1Left : Integer;
    Col2Left : Integer;
  end;

  tSqlFontType = (sftStatements, sftComments, sftNumeric, sftEditor, sftTables, sftFunctions);

  TFontStuff = record
    BackColor         : tColor;
    Color             : tColor;
    aBoldChecked      : boolean;
    aItalicChecked    : Boolean;
    aUnderlineChecked : Boolean;
    aStrikeoutChecked : Boolean;
    Style             : TFontStyles;
    TypeFontItem      : tSqlFontType;
  end;

//  TDefaultSettingsSQLBtns = record
//    TopMargin: Integer;
//    Spacing  : Integer;
//    Height   : Integer;
//    Col1Left : Integer;
//    Col2Left : Integer;
//  end;

  // intercepter or interposer class
  tJvPanel = class(JvPanel.tJvPanel) //(Vcl.StdCtrls.TButton)
  private
    fExtraText: string;
    fCusorBeforeLastChar: string;
    fSpaceAfterCursor: Boolean;
    fUseExtendedSQL: Boolean;
    fSQLExtended: TStrings;
    fEdited: boolean;
    fTop: integer;
    fLeft: integer;
    fPanel: integer;
    fPanelRect: TRect;
    fBtnId: integer;
    fChangedBtn: boolean;
    fBeforeClickBtnColor: tColor;
    fBtnHint: string;
    fUrlHelp: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    // using tag for the Panel Index of the button or in this new way the panel
    // the buttons top and left are the location of button on panel.
    property ExtraText: string read fExtraText write fExtraText;
    property CusorBeforeLastChar: string read fCusorBeforeLastChar write fCusorBeforeLastChar;
    property SpaceAfterCursor: Boolean  read fSpaceAfterCursor write fSpaceAfterCursor;
    property UseExtendedSQL: Boolean read fUseExtendedSQL write fUseExtendedSQL;
    property SQLExtended: TStrings read fSQLExtended write fSQLExtended;
    property Edited: Boolean read fEdited write fEdited;
    property Top: Integer read fTop write fTop;
    property Left: Integer read fLeft write fLeft;
    property Panel: integer read fPanel write fPanel;
    property PanelRect: tRect read fPanelRect write fPanelRect;
    property BtnId: Integer read fBtnId write fBtnId;
    property ChangedBtn: boolean read fChangedBtn write fChangedBtn;
    property BeforeClickBtnColor: tColor read fBeforeClickBtnColor write fBeforeClickBtnColor;
    property BtnHint: string read fBtnHint write fBtnHint;
    property UrlHelp: string read fUrlHelp write fUrlHelp;
  end;


var
//  PathAndFileIni             : string;
//  PrjSetupCompomentsIni      : string;
//  PathAndFileAtFormLocSize   : string;
////  AppPath                    : string; //remove
//  DelphiDbDefaultPath        : string;
////  BtnDefaultSettingsPathFile : string;
////  BtnDefaultSettingsRec      : File of TDefaultSettingsSQLBtns;
////  DefaultSettingsSQLBtns     : TDefaultSettingsSQLBtns;
//  IniNxSQLPathFile           : string;   // location of saved SQL files
//  DefaultPathForPrjsFolder   : string;
////  fthe_DefaultPrjPath        : string;
////  fTheProjects               : TStringList;
//  MRUFile                    : string;
//  UpdateInstallPath          : string;
//  SqlFontStylesSaveFilePath  : string;   //keep
////  fPrjPathValidChars         : Boolean;
//  LocalServerAliasesPath     : string;

  NxSQLViewerDataIniFile     : tGemINI;
  SQLBtnsArray               : Tarray<tJvPanel>;
  gGobalVarClass             : TGobalVarClass;
  gProjectInfo               : TProjectInfo;
  gLoclDataStore             : string;



  { ///////////////  Computer Info     //////////// }
procedure SetProgramPaths;
//procedure CreateIniFile;
//procedure DestroyIniFile;
function LocalIP: AnsiString;

// font stuff ==================================================================
//function SaveFontStuffToIni(const aSctionName: string; aFont: TFont): boolean;
//function GetFontStuffFromIni(const aSectionName: string): TFontStuff;

function iif(Test: boolean; const TrueR, FalseR: string): string; overload;
function iif(Test: boolean; const TrueR, FalseR: integer): integer; overload;
function iif(Test: boolean; const TrueR, FalseR: extended): extended; overload;

function ExtractTextInsideGivenTagEx(const bTag, eTag, Text: string): string;

function ExtractAliasAndPath(aOrgStr: string; out aAlias, aPath: string): Boolean;

function BoolToStr(aBool: boolean): string;

//function getWinSpecialFolder(CSIDLFolder : integer; IncludeBackSlash: boolean) : string;

//function GetAppSettingsPath: string;

//procedure GetProjectList;//(Out aResults: TStrings);

//function ReadProjectSetup(var aProjectInfo: TProjectInfo): boolean;
//
//procedure WriteProjectSetup(aProjectInfo: TProjectInfo);

//procedure ClearPrj(var aProjectInfo: TProjectInfo);

//===================================

implementation
uses
  GEMUseFullRoutines;


//function getWinSpecialFolder(CSIDLFolder : integer; IncludeBackSlash: boolean) : string;
//var
//  vSFolder :  pItemIDList;
//  vSpecialPath : array[0..MAX_PATH] of Char;
//begin
//  try
//    ShowMessage('In CSIDLFolder');
//
//    SHGetSpecialFolderLocation(0, CSIDLFolder, vSFolder);
//    ShowMessage('In SHGetSpecialFolderLocation');
//    SHGetPathFromIDList(vSFolder, vSpecialPath);
//    ShowMessage('In SHGetPathFromIDList');
//    Result := StrPas(vSpecialPath);
//    ShowMessage('In Result');
//    if (Result <> '') then begin
//      if IncludeBackSlash then
//        Result := IncludeTrailingPathDelimiter(result); //   IncludeTrailingBackslash(Result)
//    end
//    else
//      result := 'ERROR';
//    ShowMessage('End CSIDLFolder');
//  except
//     on E: Exception do begin
//       ShowMessage('Exception class name = '+E.ClassName);
//       ShowMessage('Exception message = '+E.Message);
//     end;
//  end;
//  ShowMessage('Real End CSIDLFolder');
//  ShowMessage(result);
////  Dispose(vSFolder);
//end;


//procedure GetProjectList;//(Out aResults: TStrings);
//var
//  strFiles: TStringDynArray;
//  i: integer;
//
//  function getProjectName(aPath: string):string;
//  var
//    position: Integer;
//  begin
//    position := LastDelimiter( '\', aPath );
//    result := Copy ( aPath, position + 1, Length(aPath) - position);
//  end;
//
//begin
//  fTheProjects.Clear;
//  strFiles := TDirectory.GetDirectories(DefaultPathForPrjsFolder);
//  for i := 0  to High(strFiles) do begin
//    fTheProjects.Add(getProjectName(strFiles[i]) + '=' + strFiles[i]);
//  end;
//end;


{Begin tJvPanel }
constructor TJvPanel.Create(AOwner: TComponent);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'Create' );{$ENDIF}

  inherited;
  SQLExtended := TStringList.Create;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'Create' );{$ENDIF}
end;


destructor TJvPanel.Destroy;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'Destroy' );{$ENDIF}

  SQLExtended.Free;
  inherited;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'Destroy' );{$ENDIF}
end;
{End tJvPanel }


function BoolToStr(aBool: boolean): string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'BoolToStr' );{$ENDIF}

  if aBool then
    Result := 'True'
  else
    Result := 'False';

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'BoolToStr' );{$ENDIF}
end;


function ExtractTextInsideGivenTagEx(const bTag, eTag, Text: string): string;
var
  StartPos,  EndPos: integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'ExtractTextInsideGivenTagEx' );{$ENDIF}

  result := '';
  StartPos := Pos(bTag, Text) + Length(bTag);
  EndPos := Pos(eTag, Text);
  result := Copy(Text, StartPos, EndPos - StartPos);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'ExtractTextInsideGivenTagEx' );{$ENDIF}
end;


function ExtractAliasAndPath(aOrgStr: string; out aAlias, aPath: string): Boolean;
const
  bdelimiter = ' ';
  edelimiter = ')';
var
  indexDelimiter: Byte;
  endDelimiter: Byte;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'ExtractAliasAndPath' );{$ENDIF}

  result := True;
  try
    indexDelimiter := Pos(bdelimiter, aOrgStr);
    endDelimiter := Pos(edelimiter, aOrgStr);
    aAlias := Copy(aOrgStr, 1, indexDelimiter -1);
    aPath := Copy(aOrgStr, indexDelimiter + 2, endDelimiter - indexDelimiter - 2);
  except
    result := False;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'ExtractAliasAndPath' );{$ENDIF}
end;


function iif(Test: boolean; const TrueR, FalseR: string): string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'iif' );{$ENDIF}

  if Test then
    Result := TrueR
  else
    Result := FalseR;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'iif' );{$ENDIF}
end;


function iif(Test: boolean; const TrueR, FalseR: integer): integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'iif' );{$ENDIF}

  if Test then
    Result := TrueR
  else
    Result := FalseR;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'iif' );{$ENDIF}
end;


function iif(Test: boolean; const TrueR, FalseR: extended): extended;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'iif' );{$ENDIF}

  if Test then
    Result := TrueR
  else
    Result := FalseR;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'iif' );{$ENDIF}
end;


//function GetAppSettingsPath: string;
//begin
//  result := getWinSpecialFolder(CSIDL_LOCAL_APPDATA, False) + cSRSDpath;
//end;
//

procedure SetProgramPaths;

begin
//  fPrjPathValidChars := True;
//  fTheProjects.NameValueSeparator := '=';
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('Global A. SetProgramPaths'); {$ENDIF}
  gLoclDataStore := GetWinSpecialFolder(CSIDL_PERSONAL, false);
  {$IFDEF USE_CODESITE}CodeSite.SendMsg('Global B. SetProgramPaths: '+ gLoclDataStore); {$ENDIF}
{
  DefaultPathForPrjsFolder := AppPath + cDefaultPathForPrjs + '\';
//  DefaultPathForPrjsFolder := getWinSpecialFolder(CSIDL_PERSONAL, false) + cDefaultPathForPrjs + '\';
//  fPrjPathValidChars       := TPath.HasValidPathChars(DefaultPathForPrjsFolder, false);

  MRUFile                  := AppPath + cMRUFileName;  //DefaultPathForPrjsFolder +
//  fthe_DefaultPrjPath      := DefaultPathForPrjsFolder + cthe_DefaultPrjPath;
  UpdateInstallPath        := AppPath + cUpdateInstallPath;

  ForceDirectories(AppPath);

  ForceDirectories(DefaultPathForPrjsFolder);
//  ForceDirectories(fthe_DefaultPrjPath);

  ForceDirectories(UpdateInstallPath);

  IniNxSQLPathFile := DefaultPathForPrjsFolder + cFilterIniFiles;

  SqlFontStylesSaveFilePath := AppPath + cSqlFontFileName;

  PathAndFileIni             := AppPath + cNxTableViewerIni;

  PrjSetupCompomentsIni      := AppPath + cPrjSetUpComponents;
  DelphiDbDefaultPath        := AppPath + cDelphiSqToolsDbPath;
  PathAndFileAtFormLocSize   := AppPath + cFormLocSizeDef;
//  MRUMenuItemsPathFile       := AppPath + MRUItemsIni;
  LocalServerAliasesPath     := AppPath + cLocalServerAliases;
 }
end;


// ==================================================================

//procedure CreateIniFile;
//begin
//  NxSQLViewerDataIniFile := tGemINI.Create(PathAndFileIni);
//end;
//
//// ==================================================================
//
//procedure DestroyIniFile;
//begin
//  FreeAndNil(NxSQLViewerDataIniFile);
//end;
//
// ==================================================================

function LocalIP: AnsiString;
type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
var
    phe: PHostEnt;
    pptr: PaPInAddr;
    Buffer: array [0..63] of AnsiChar;
    i: Integer;
    GInitData: TWSADATA;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'LocalIP' );{$ENDIF}

    WSAStartup($101, GInitData);
    Result := '';
    GetHostName(Buffer, SizeOf(Buffer));
    phe :=GetHostByName(buffer);
    if phe = nil then
      Exit;
    pptr := PaPInAddr(Phe^.h_addr_list);
    i := 0;
    while pptr^[i] <> nil do begin
      result:= System.AnsiStrings.StrPas(inet_ntoa(pptr^[i]^));
      Inc(i);
    end;

    WSACleanup;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'LocalIP' );{$ENDIF}
end;

// font stuff ==================================================================

procedure SetFontAsStr(Var aFont : TFont; const aFontStr: String);
Var
  FontStrList : TStringList;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'SetFontAsStr' );{$ENDIF}

  FontStrList := TStringList.Create;
  try
    FontStrList.QuoteChar := '''';
    FontStrList.Delimiter := ';';
    FontStrList.DelimitedText := aFontStr;
    if Assigned(aFont) then begin
      aFont.Name := FontStrList.Values['Name'];
      aFont.Size := StrToInt(FontStrList.Values['Size']);
      aFont.Color := StringToColor(FontStrList.Values['Color']);
      aFont.Pitch := TFontPitch(GetEnumValue(TypeInfo(TFontPitch),
                       FontStrList.Values['Pitch']));
      aFont.Style := TFontStyles(Byte(StrToIntDef(FontStrList.Values['Style'], 0)));
    end;
  finally
    FontStrList.Free;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'SetFontAsStr' );{$ENDIF}
end;


function GetFontAsStr(aFont : TFont) : String;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'GetFontAsStr' );{$ENDIF}

  If Assigned(aFont) Then
  Begin
    Result := QuotedStr('Name=' + aFont.Name);
    Result := Result + ';Size=' + IntToStr(aFont.Size);
    Result := Result + ';Color=' + ColorToString(aFont.Color);
    Result := Result + ';Pitch=' + GetEnumName(TypeInfo(TFontPitch),
                Ord(aFont.Pitch));
    Result := Result + ';Style=' + IntToStr(Byte(aFont.Style));
  End
  Else
    Result := 'DEFAULT';

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'GetFontAsStr' );{$ENDIF}
end;


function SetToInt(const aSet; const Size: integer): integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'SetToInt' );{$ENDIF}

  Result := 0;
  Move(aSet, Result, Size);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'SetToInt' );{$ENDIF}
end;


procedure IntToSet(const Value: integer; var aSet; const Size:integer);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( 'IntToSet' );{$ENDIF}

  Move(Value, aSet, Size);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( 'IntToSet' );{$ENDIF}
end;


//function SaveFontStuffToIni(const aSctionName: string; aFont: TFont): boolean;
//var
//  theStyles: TFontStyles;
//begin
//  result := true;
//  try
//    CreateIniFile;
//    try
//      NxSQLViewerDataIniFile.WriteInteger(aSctionName, 'Color', aFont.Color);
//      theStyles := aFont.Style;
//      NxSQLViewerDataIniFile.WriteInteger(aSctionName, 'Style', SetToInt(theStyles, SizeOf(theStyles)));
//    finally
//      DestroyIniFile;
//    end;
//  except
//    result := False;
//  end;
//end;


//function GetFontStuffFromIni(const aSectionName: string): TFontStuff;
//var
//  SetStyles: TFontStyles;
//begin
//  CreateIniFile;
//  try
//    Result.Color := NxSQLViewerDataIniFile.ReadInteger(aSectionName, 'Color', clBlack);
//    IntToSet(NxSQLViewerDataIniFile.ReadInteger(aSectionName, 'Style', 0), SetStyles, SizeOf(SetStyles));
//    Result.Style := SetStyles;
//  finally
//    DestroyIniFile;
//  end;
//end;


{ TProjectInfo ================================================================}
{ TProjectInfo ================================================================}
{ TProjectInfo ================================================================}

procedure TProjectInfo.SetPrjTransport(const Value: TTransportUsed);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SetPrjTransport' );{$ENDIF}

  if Value <> fPrjTransport then begin
    fPrjTransport := Value;
    if not fUpdate then begin
      PrjTransportChange(fPrjTransport);
      fPrjServer := '';
      fPrjAlias := '';
    end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetPrjTransport' );{$ENDIF}
end;

procedure TProjectInfo.SetPrjServer(const Value: tstr45);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SetPrjServer' );{$ENDIF}

  if Value <> fPrjServer then begin
    fPrjServer := Value;
    if not fUpdate then begin
      PrjServerChange(fPrjServer);
      fPrjAlias := '';
    end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetPrjServer' );{$ENDIF}
end;


function TProjectInfo.SavePropertiesToTable(var Msg: string; aPrjName: string): Boolean;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SavePropertiesToTable' );{$ENDIF}

  result := False;
  if fDataSource.DataSet = nil then
  begin
    Msg := 'Data Source not Assigned';
    Exit;
  end;
  if DataSource.DataSet.Locate('PrjName', aPrjName, [loCaseInsensitive]) then
  begin
    DataSource.DataSet.Edit;
    DataSource.DataSet.FieldByName('PrjName').AsString      := fPrjName;
    DataSource.DataSet.FieldByName('PrjPath').AsString      := fPrjPath;
    DataSource.DataSet.FieldByName('TransportID').AsInteger := Ord(fPrjTransport);
    DataSource.DataSet.FieldByName('Server').AsString       := fPrjServer;
    DataSource.DataSet.FieldByName('Alias').AsString        := fPrjAlias;
    DataSource.DataSet.FieldByName('DbPassWord').AsString   := fDBPassWord;
    DataSource.DataSet.Post;
    result := True;
  end
  else
    Msg := 'Could Not Locate Project';

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SavePropertiesToTable' );{$ENDIF}
end;


function TProjectInfo.LoadPropertiesFromTable(var Msg: string): Boolean;
var
  s: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.LoadPropertiesFromTable' );{$ENDIF}

  result := False;
  if fDataSource.DataSet = nil then
  begin
    Msg := 'Data Source not Assigned';
    Exit;
  end;
  try
    s := 'Reading fPrjName';
    fPrjName   := ShortString(DataSource.DataSet.FieldByName('PrjName').AsString);
    s := 'Reading PrjPath';
    fPrjPath   := ShortString(DataSource.DataSet.FieldByName('PrjPath').AsString);
    s := 'Reading TransportID';
    fPrjTransport := TTransportUsed(DataSource.DataSet.FieldByName('TransportID').AsInteger);

    result := True;
  except
    on e: EDatabaseError do
      begin
        ShowMessage('Database Error Last Action: Open - '+s);
        ShowMessage('Error Msg: ' + E.Message);
        result := False;
      end;

    on E: Exception do
      begin
        ShowMessage('General Exception Error Msg: ' + E.Message);
        result := False;
      end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.LoadPropertiesFromTable' );{$ENDIF}
end;


function TProjectInfo.LoadPropertiesFromTable(var Msg: string; aPrjName: string): Boolean;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.LoadPropertiesFromTable' );{$ENDIF}


  result := False;
  if fDataSource.DataSet = nil then
  begin
    Msg := 'Data Source not Assigned';
    Exit;
  end;

{$IFDEF DEBUG}
  ShowMessage('PrjName' + '-- '+ aPrjName);
{$ENDIF}
  if DataSource.DataSet.Locate('PrjName', aPrjName, [loCaseInsensitive]) then
  begin
    fPrjName           := ShortString(DataSource.DataSet.FieldByName('PrjName').AsString);
    fPrjPath           := ShortString(DataSource.DataSet.FieldByName('PrjPath').AsString);
    fPrjTransport      := TTransportUsed(DataSource.DataSet.FieldByName('TransportID').AsInteger);
    fPrjServer         := ShortString(DataSource.DataSet.FieldByName('Server').AsString);
    fPrjAlias          := ShortString(DataSource.DataSet.FieldByName('Alias').AsString);
    fDBPassWord        := ShortString(DataSource.DataSet.FieldByName('DbPassWord').AsString);
    fPasSqlFileSaveLoc := DataSource.DataSet.FieldByName('PassFileSaveLoc').AsString;
    fLocalAliasPath    := DataSource.DataSet.FieldByName('LocalServerDbPath').AsString;
    Result := True;
  end
  else
    Msg := 'Could Not Locate Project: '+ aPrjName;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.LoadPropertiesFromTable' );{$ENDIF}
end;


function TProjectInfo.InsertPrjIntoDb(var Msg: string): Boolean;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.InsertPrjIntoDb' );{$ENDIF}

  result := False;
  if fDataSource.DataSet = nil then
  begin
    Msg := 'Data Source not Assigned';
    Exit;
  end;
  try
    DataSource.DataSet.Insert;
    DataSource.DataSet.FieldByName('PrjName').AsString      := fPrjName;
    DataSource.DataSet.FieldByName('PrjPath').AsString      := fPrjPath;
    DataSource.DataSet.FieldByName('TransportID').AsInteger := Ord(fPrjTransport);
    DataSource.DataSet.FieldByName('Server').AsString       := fPrjServer;
    DataSource.DataSet.FieldByName('Alias').AsString        := fPrjAlias;
    DataSource.DataSet.FieldByName('DbPassWord').AsString   := fDBPassWord;
    DataSource.DataSet.FieldByName('PassFileSaveLoc').AsString   := fPasSqlFileSaveLoc;
    DataSource.DataSet.FieldByName('LocalServerDbPath').AsString := fLocalAliasPath;
    DataSource.DataSet.Post;
    Result := True;
  except
    Msg := 'Error Writting Project to Db';
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.InsertPrjIntoDb' );{$ENDIF}
end;


function TProjectInfo.DeletePrj(var Msg: string; aPrjName: string): Boolean;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.DeletePrj' );{$ENDIF}

  result := False;
  if fDataSource.DataSet = nil then
  begin
    Msg := 'Data Source not Assigned';
    Exit;
  end;
  if DataSource.DataSet.Locate(PrjName, aPrjName, [loCaseInsensitive]) then
  begin
    DataSource.DataSet.Delete;
    Result := true
  end
  else
    result := false;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.DeletePrj' );{$ENDIF}
end;


procedure TProjectInfo.SetPrjAlias(const Value: tstr95);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SetPrjAlias' );{$ENDIF}

  if Value <> fPrjAlias then begin
    fPrjAlias := Value;
    if not fUpdate then
      PrjAliasChange(fPrjAlias);
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetPrjAlias' );{$ENDIF}
end;

procedure TProjectInfo.SetDataSource(const Value: TJvDataSource);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetDataSource' );{$ENDIF}

  fDataSource := Value;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetDataSource' );{$ENDIF}
end;

procedure TProjectInfo.SetIniPathFile(const Value: string);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SetIniPathFile' );{$ENDIF}

  fIniFilterPathFile := Value;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetIniPathFile' );{$ENDIF}
end;


procedure TProjectInfo.SetIsDefaultPrj(const Value: Boolean);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.SetIsDefaultPrj' );{$ENDIF}

  if Value then
  begin

  end;

  fIsDefaultPrj := Value;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.SetIsDefaultPrj' );{$ENDIF}
end;


procedure TProjectInfo.PrjTransportChange(aTransport: TTransportUsed);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.PrjTransportChange' );{$ENDIF}

  if Assigned(fOnChangeTransport) then
    fOnChangeTransport(aTransport);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.PrjTransportChange' );{$ENDIF}
end;

procedure TProjectInfo.PrjServerChange(aServer: tStr45);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.PrjServerChange' );{$ENDIF}

  if Assigned(fOnChangeServer) then
    fOnChangeServer(aServer);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.PrjServerChange' );{$ENDIF}
end;


procedure TProjectInfo.PrjAliasChange(aAlias: tStr95);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.PrjAliasChange' );{$ENDIF}

  if Assigned(fOnChangeAlias) then
    fOnChangeAlias(aAlias);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.PrjAliasChange' );{$ENDIF}
end;


procedure TProjectInfo.PrjFileSaveLocChange(aFilePath: string);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'PrjFileSaveLocChange' );{$ENDIF}

  if Assigned(fOnChangeFileSaveLoc) then
    fOnChangeAlias(aFilePath);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.PrjFileSaveLocChange' );{$ENDIF}
end;


procedure TProjectInfo.PrjPropertiesToActive;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.PrjPropertiesToActive' );{$ENDIF}

   fActiveTransport := fPrjTransport;
   fActiveServer    := fPrjServer;
   fActiveAlias     := fPrjAlias;
//   fActiveLocalServerPath :=

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.PrjPropertiesToActive' );{$ENDIF}
end;


procedure TProjectInfo.BeginUpdate;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.BeginUpdate' );{$ENDIF}

  fUpdate := True;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.BeginUpdate' );{$ENDIF}
end;


procedure TProjectInfo.EndUpdate;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.EndUpdate' );{$ENDIF}

  fUpdate := false;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.EndUpdate' );{$ENDIF}
end;


procedure TProjectInfo.ClearPrj;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.ClearPrj' );{$ENDIF}

  fPrjName               := '';
  fPrjPath               := '';
  fPrjTransport          := tranNone;
  fPrjServer             := '';
  fPrjAlias              := '';
  fPasSqlFileSaveLoc     := '';
  fDBPassWord            := '';
  fActiveTransport       := tranNone;
  fActiveServer          := '';
  fActiveAlias           := '';
  fTreeNode              := nil;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.ClearPrj' );{$ENDIF}
end;


//procedure TProjectInfo.SetIniPathFile(const Value: string);
//var
//  fPath: string;
//begin
//  if Value = '' then
//    Exit;
//
//  fIniFilterPathFile := ExtractFilePath(Value);
//
//  fIniFilterPathFile := RemoveTrailingSlash(fIniFilterPathFile);
//  fIniFilterPathFile := fIniFilterPathFile + cFilterIniFiles;
//
//  fPath := ExtractFilePath(fIniFilterPathFile);
//  if not System.SysUtils.DirectoryExists(fPath) then
//    if not CreateDir(fPath) then
//      raise Exception.Create('Cannot create C:\temp');
//end;


constructor TProjectInfo.Create(aPrjName: string; aDataSet: TDataSet);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.Create' );{$ENDIF}

  fDataSource := tJvDataSource.Create(Nil);
  fPrjName := ShortString(aPrjName);
  fDataSource.DataSet := aDataSet;
  fAppPath := gGobalVarClass.AppPath;
  fDefaultPasSqlFileLoc := fAppPath + cDefaultPathForPrjs;
  fIniFilterPathFile := fDefaultPasSqlFileLoc + cFilterIniFiles;
  fIsDefaultPrj := False;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.Create' );{$ENDIF}
end;


destructor TProjectInfo.Destory;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TProjectInfo.Destory' );{$ENDIF}

  FreeAndNil(fDataSource);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TProjectInfo.Destory' );{$ENDIF}
end;



end.



