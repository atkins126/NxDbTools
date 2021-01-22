unit Global;

{$DEFINE USE_CODESITE}

interface
uses
  Winapi.Winsock, Winapi.Messages,

  System.SysUtils, System.Inifiles, System.AnsiStrings, System.TypInfo,
  System.Classes, System.UITypes,  System.IOUtils, System.Types,

  Vcl.Graphics, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Controls, Vcl.Menus,
  Vcl.ComCtrls,

  Data.DB, nxdb,

  MSspecialFolders, GemINI,

  JvPanel, JvDataSource,

  SynHighlighterSQL {$IFDEF USE_CODESITE }, CodeSiteLogging  {$ENDIF};

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
    fPrjName                : tStr25;
    fPrjPath                : tStr255;

    fPrjTransport           : TTransportUsed;
    fPrjServer              : tStr45;
    fPrjAlias               : tStr95;
    fPrjLocalServerPath     : string;

    fActiveTransport        : TTransportUsed;
    fActiveServer           : tStr45;
    fActiveAlias            : tStr95;
    fActiveLocalServerPath  : string;

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

    property DataSource           : TJvDataSource read fDataSource write SetDataSource;
    property PrjName              : tStr25 read fPrjName write fPrjName;
    property PrjPath              : tStr255 read fPrjPath write fPrjPath;
    property PasSqlFileSaveLoc    : tStr255 read fPasSqlFileSaveLoc write fPasSqlFileSaveLoc;
    property DefaultPasSqlFileLoc : string read fDefaultPasSqlFileLoc;
    property PrjDBPassWord        : tStr255 read fDBPassWord write fDBPassWord;

    property IniFilterPathFile    :string read fIniFilterPathFile write SetIniPathFile;

    property PrjTransport          : TTransportUsed read fPrjTransport write SetPrjTransport;
    property PrjServer             : tstr45 read fPrjServer write SetPrjServer;
    property PrjAlias              : tstr95 read fPrjAlias write SetPrjAlias;
    property PrjLocalServerPath    : string read fPrjLocalServerPath write fPrjLocalServerPath;

    property ActiveTrans           : TTransportUsed read fActiveTransport write fActiveTransport;
    property ActiveServer          : tstr45 read fActiveServer write fActiveServer;
    property ActiveAlias           : tstr95 read fActiveAlias write fActiveAlias;
    property ActiveLocalServerPath : string read fActiveLocalServerPath write fActiveLocalServerPath;

    property Table                 : tStr25 read fTableName write fTableName;
    property Node                  : tTreeNode read fTreeNode write fTreeNode;

    property OnChangeTransport     : TChangeTransport read fOnChangeTransport write fOnChangeTransport;
    property OnChangeServer        : tChangeServer read fOnChangeServer write fOnChangeServer;
    property OnChangeAlias         : tChangeAlias read fOnChangeAlias write fOnChangeAlias;
    property OnChangeFileSaveLoc   : tChangeFileSaveLoc read fOnChangeFileSaveLoc write fOnChangeFileSaveLoc;
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


  TGobalVarClass = class
    fPathAndFileIni             : string;
    fPrjSetupCompomentsIni      : string;
    fPathAndFileAtFormLocSize   : string;
    fDelphiDbDefaultPath        : string;
    fIniNxSQLPathFile           : string;   // location of saved SQL files
    fDefaultPathForPrjsFolder   : string;
    fMRUFile                    : string;
    fUpdateInstallPath          : string;
    fSqlFontStylesSaveFilePath  : string;   //keep
    fAlisesForLocalServer       : string;
    fNxSQLViewerDataIniFile     : tGemINI;
    fAppPath                    : string;// := GetAppSettingsPath;
  private
    procedure SetProgramPaths;
  public
    constructor Create;
    destructor Destory;
  published
    property AppPath                    : string read fAppPath;
    property PathAndFileIni             : string read fPathAndFileIni;
    property PrjSetupCompomentsIni      : string read fPrjSetupCompomentsIni;
    property PathAndFileAtFormLocSize   : string read fPathAndFileAtFormLocSize;
    property DelphiDbDefaultPath        : string read fDelphiDbDefaultPath;
    property IniNxSQLPathFile           : string read fIniNxSQLPathFile;   // location of saved SQL files
    property DefaultPathForPrjsFolder   : string read fDefaultPathForPrjsFolder;
    property MRUFile                    : string read fMRUFile;
    property UpdateInstallPath          : string read fUpdateInstallPath;
    property SqlFontStylesSaveFilePath  : string read fSqlFontStylesSaveFilePath;   //keep
    property AlisesForLocalServer       : string read fAlisesForLocalServer;
  end;

var
//  PathAndFileIni             : string;
//  PrjSetupCompomentsIni      : string;
//  PathAndFileAtFormLocSize   : string;
////  AppPath                    : string; //remove
//  DelphiDbDefaultPath        : string;
  NxSQLViewerDataIniFile     : tGemINI;
  SQLBtnsArray               : Tarray<tJvPanel>;
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

  gGobalVarClass             : TGobalVarClass;
  gProjectInfo               : TProjectInfo;



  { ///////////////  Computer Info     //////////// }
//procedure SetProgramPaths;
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
  inherited;
  SQLExtended := TStringList.Create;
end;


destructor TJvPanel.Destroy;
begin
  SQLExtended.Free;
  inherited;
end;
{End tJvPanel }


function BoolToStr(aBool: boolean): string;
begin
  if aBool then
    Result := 'True'
  else
    Result := 'False';
end;


function ExtractTextInsideGivenTagEx(const bTag, eTag, Text: string): string;
var
  StartPos,  EndPos: integer;
begin
  result := '';
  StartPos := Pos(bTag, Text) + Length(bTag);
  EndPos := Pos(eTag, Text);
  result := Copy(Text, StartPos, EndPos - StartPos);
end;


function ExtractAliasAndPath(aOrgStr: string; out aAlias, aPath: string): Boolean;
const
  bdelimiter = ' ';
  edelimiter = ')';
var
  indexDelimiter: Byte;
  endDelimiter: Byte;
begin
  result := True;
  try
    indexDelimiter := Pos(bdelimiter, aOrgStr);
    endDelimiter := Pos(edelimiter, aOrgStr);
    aAlias := Copy(aOrgStr, 1, indexDelimiter -1);
    aPath := Copy(aOrgStr, indexDelimiter + 2, endDelimiter - indexDelimiter - 2);
  except
    result := False;
  end;
end;


function iif(Test: boolean; const TrueR, FalseR: string): string;
begin
  if Test then
    Result := TrueR
  else
    Result := FalseR;
end;


function iif(Test: boolean; const TrueR, FalseR: integer): integer;
begin
  if Test then
    Result := TrueR
  else
    Result := FalseR;
end;


function iif(Test: boolean; const TrueR, FalseR: extended): extended;
begin
  if Test then
    Result := TrueR
  else
    Result := FalseR;
end;


//function GetAppSettingsPath: string;
//begin
//  result := getWinSpecialFolder(CSIDL_LOCAL_APPDATA, False) + cSRSDpath;
//end;
//

//procedure SetProgramPaths;
//
//begin
////  fPrjPathValidChars := True;
////  fTheProjects.NameValueSeparator := '=';
//
//  var AppPath: string := GetAppSettingsPath;
//  DefaultPathForPrjsFolder := AppPath + cDefaultPathForPrjs + '\';
////  DefaultPathForPrjsFolder := getWinSpecialFolder(CSIDL_PERSONAL, false) + cDefaultPathForPrjs + '\';
////  fPrjPathValidChars       := TPath.HasValidPathChars(DefaultPathForPrjsFolder, false);
//
//  MRUFile                  := AppPath + cMRUFileName;  //DefaultPathForPrjsFolder +
////  fthe_DefaultPrjPath      := DefaultPathForPrjsFolder + cthe_DefaultPrjPath;
//  UpdateInstallPath        := AppPath + cUpdateInstallPath;
//
//  ForceDirectories(AppPath);
//
//  ForceDirectories(DefaultPathForPrjsFolder);
////  ForceDirectories(fthe_DefaultPrjPath);
//
//  ForceDirectories(UpdateInstallPath);
//
//  IniNxSQLPathFile := DefaultPathForPrjsFolder + cFilterIniFiles;
//
//  SqlFontStylesSaveFilePath := AppPath + cSqlFontFileName;
//
//  PathAndFileIni             := AppPath + cNxTableViewerIni;
//
//  PrjSetupCompomentsIni      := AppPath + cPrjSetUpComponents;
//  DelphiDbDefaultPath        := AppPath + cDelphiSqToolsDbPath;
//  PathAndFileAtFormLocSize   := AppPath + cFormLocSizeDef;
////  MRUMenuItemsPathFile       := AppPath + MRUItemsIni;
//  LocalServerAliasesPath     := AppPath + cLocalServerAliases;
//
//end;


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
end;

// font stuff ==================================================================

procedure SetFontAsStr(Var aFont : TFont; const aFontStr: String);
Var
  FontStrList : TStringList;
begin
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
end;


function GetFontAsStr(aFont : TFont) : String;
begin
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
end;


function SetToInt(const aSet; const Size: integer): integer;
begin
  Result := 0;
  Move(aSet, Result, Size);
end;


procedure IntToSet(const Value: integer; var aSet; const Size:integer);
begin
  Move(Value, aSet, Size);
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


{ TProjectInfo }

procedure TProjectInfo.SetPrjTransport(const Value: TTransportUsed);
begin
  if Value <> fPrjTransport then begin
    fPrjTransport := Value;
    if not fUpdate then begin
      PrjTransportChange(fPrjTransport);
      fPrjServer := '';
      fPrjAlias := '';
    end;
  end;
end;

procedure TProjectInfo.SetPrjServer(const Value: tstr45);
begin
  if Value <> fPrjServer then begin
    fPrjServer := Value;
    if not fUpdate then begin
      PrjServerChange(fPrjServer);
      fPrjAlias := '';
    end;
  end;
end;


function TProjectInfo.SavePropertiesToTable(var Msg: string; aPrjName: string): Boolean;
begin
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
end;


function TProjectInfo.LoadPropertiesFromTable(var Msg: string): Boolean;
var
  s: string;
begin
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
end;


function TProjectInfo.LoadPropertiesFromTable(var Msg: string; aPrjName: string): Boolean;
begin

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
    Result := True;
  end
  else
    Msg := 'Could Not Locate Project: '+ aPrjName;
end;


function TProjectInfo.InsertPrjIntoDb(var Msg: string): Boolean;
begin
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
    DataSource.DataSet.Post;
    Result := True;
  except
    Msg := 'Error creating new project';
  end;
end;


function TProjectInfo.DeletePrj(var Msg: string; aPrjName: string): Boolean;
begin
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
end;


procedure TProjectInfo.SetPrjAlias(const Value: tstr95);
begin
  if Value <> fPrjAlias then begin
    fPrjAlias := Value;
    if not fUpdate then
      PrjAliasChange(fPrjAlias);
  end;
end;

procedure TProjectInfo.SetDataSource(const Value: TJvDataSource);
begin
  fDataSource := Value;
end;

procedure TProjectInfo.SetIniPathFile(const Value: string);
begin
  fIniFilterPathFile := Value;
end;

procedure TProjectInfo.PrjTransportChange(aTransport: TTransportUsed);
begin
  if Assigned(fOnChangeTransport) then
    fOnChangeTransport(aTransport);
end;

procedure TProjectInfo.PrjServerChange(aServer: tStr45);
begin
  if Assigned(fOnChangeServer) then
    fOnChangeServer(aServer);
end;


procedure TProjectInfo.PrjAliasChange(aAlias: tStr95);
begin
  if Assigned(fOnChangeAlias) then
    fOnChangeAlias(aAlias);
end;


procedure TProjectInfo.PrjFileSaveLocChange(aFilePath: string);
begin
  if Assigned(fOnChangeFileSaveLoc) then
    fOnChangeAlias(aFilePath);
end;


procedure TProjectInfo.PrjPropertiesToActive;
begin
   fActiveTransport := fPrjTransport;
   fActiveServer := fPrjServer;
   fActiveAlias :=  fPrjAlias;
end;


procedure TProjectInfo.BeginUpdate;
begin
  fUpdate := True;
end;


procedure TProjectInfo.EndUpdate;
begin
  fUpdate := false;
end;


procedure TProjectInfo.ClearPrj;
begin
  fPrjName               := '';
  fPrjPath               := '';
  fPrjTransport          := tranNone;
  fPrjServer             := '';
  fPrjAlias              := '';
  fPrjLocalServerPath    := '';
  fPasSqlFileSaveLoc     := '';
  fDBPassWord            := '';
  fActiveTransport       := tranNone;
  fActiveServer          := '';
  fActiveAlias           := '';
  fActiveLocalServerPath := '';
  fTreeNode              := nil;
end;


constructor TProjectInfo.Create(aPrjName: string; aDataSet: TDataSet);
begin

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
//
//
//constructor TProjectInfo.Create(aPrjName: string; aDataSet: TDataSet);
//begin
//  fDataSource := tJvDataSource.Create(Nil);
//  fPrjName := ShortString(aPrjName);
//  fDataSource.DataSet := aDataSet;
//  fAppPath := gGobalVarClass.AppPath;
//  fDefaultPasSqlFileLoc := fAppPath + cDefaultPathForPrjs;
//  fIniFilterPathFile := fDefaultPasSqlFileLoc + cFilterIniFiles;
//end;
//

destructor TProjectInfo.Destory;
begin
  FreeAndNil(fDataSource);
end;


{ TGobalVarClass }

constructor TGobalVarClass.Create;
begin
  SetProgramPaths;
  fNxSQLViewerDataIniFile := tGemINI.Create(fPathAndFileIni);
end;

destructor TGobalVarClass.Destory;
begin
  FreeAndNil(fNxSQLViewerDataIniFile);
end;


procedure TGobalVarClass.SetProgramPaths;
begin
  fAppPath                  := getWinSpecialFolder(CSIDL_LOCAL_APPDATA, False) + cSRSDpath;
  fDefaultPathForPrjsFolder := fAppPath + cDefaultPathForPrjs + '\';

  fMRUFile                  := fAppPath + cMRUFileName;
  fUpdateInstallPath        := fAppPath + cUpdateInstallPath;

  ForceDirectories(AppPath);

  ForceDirectories(fDefaultPathForPrjsFolder);

  ForceDirectories(UpdateInstallPath);

  fIniNxSQLPathFile := fDefaultPathForPrjsFolder + cFilterIniFiles;

  fSqlFontStylesSaveFilePath := AppPath + cSqlFontFileName;

  fPathAndFileIni             := AppPath + cNxTableViewerIni;

  fPrjSetupCompomentsIni      := AppPath + cPrjSetUpComponents;
  fDelphiDbDefaultPath        := AppPath + cDelphiSqToolsDbPath;
  fPathAndFileAtFormLocSize   := AppPath + cFormLocSizeDef;
  fLocalServerAliasesPath     := AppPath + cLocalServerAliases;
end;

end.


