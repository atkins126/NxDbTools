unit Global;

interface
uses
  Winapi.Winsock, Winapi.Messages,

  System.SysUtils, System.Inifiles, System.AnsiStrings, System.TypInfo,
  System.Classes, System.UITypes,  System.IOUtils, System.Types,

  Vcl.Graphics, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Controls, Vcl.Menus,
  Vcl.ComCtrls,

  Data.DB, nxdb,

  MSspecialFolders, GemINI,

  JvPanel,

  SynHighlighterSQL;

type
  TStatusPanelOrder = (spoMemory, spoAlias, spoDefaultPrjDir, spoDbStatus, spoDbVer, spoCurrenPrj);

  pRootNodeDb = ^tRootNodeDb;
  tRootNodeDb = record
    DataBase: TnxDatabase;
  end;

  tFunctionReturns3 = (frTrue, frFalse1, frFalse2);

  TEditAttri = (eaKeyAttri, eaCommentAttri, eaNumberAttri, eaSQLEditor,
                eaTableNameAttri, eaFunctionAttri);
  TTransportUsed = (tranWinSock, tranNamePipe, tranLocalServer, tranSharedMem, tranNone, tranError);
  TDockingFormType = (TSQLForm, TTblForm, TNoForm);

  tStr95  = string[95];
  tStr45  = string[45];
  tStr25  = string[25];
  tStr255 = string[255];

  TChangeTransport = procedure(aTransport: TTransportUsed) of Object;
  tChangeServer    = procedure(aServer: tStr45) of Object;
  tChangeAlias     = procedure(aAlias: tStr95) of Object;

  TProjectInfo = class
    fPrjName        : tStr25;
    fPrjPath        : tStr255;
    fTransport      : TTransportUsed;
    fServer         : tStr45;
    fAlias          : tStr95;
    fPasFileSaveLoc : tStr255;
    fDBPassWord     : tStr255;
    fTableName      : tStr25;

    fTreeNode       : TTreeNode;
    fActiveTransport: TTransportUsed;
    fActiveServer   : tStr45;
    fActiveDb       : tStr95;

    fUpdate         : Boolean;

    fOnChangeTransport: TChangeTransport;
    fOnChangeServer   : tChangeServer;
    fOnChangeAlias    : tChangeAlias;

  private
    procedure PrjTransportChange(aTransport: TTransportUsed);
    procedure PrjServerChange(aServer: tStr45);
    procedure PrjAliasChange(aAlias: tStr95);
    procedure SetAlias(const Value: tstr95);
    procedure SetServer(const Value: tstr45);
    procedure SetTransport(const Value: TTransportUsed);
  public
    constructor Create(aPrjName: string);
//    constructor Create(aPrjName, aPrjPath, aDBPassWord: string; aTrans: TTransportUsed); overload;
//    constructor Create(aPrjName, aServer, aAlias, aDBPassWord: string; aTrans: TTransportUsed); overload;

    procedure BeginUpdate;
    procedure EndUpdate;
    procedure ClearPrj;

    property PrjName: tStr25 read fPrjName write fPrjName;
    property PrjPath: tStr255 read fPrjPath write fPrjPath;
    property PasFileSaveLoc: tStr255 read fPasFileSaveLoc write fPasFileSaveLoc;
    property DBPassWord: tStr255 read fDBPassWord write fDBPassWord;

    property Transport   : TTransportUsed read fTransport write SetTransport;
    property Server      : tstr45 read fServer write SetServer;
    property Alias       : tstr95 read fAlias write SetAlias;

    property ActiveTrans : TTransportUsed read fActiveTransport write fActiveTransport;
    property ActiveServer: tstr45 read fActiveServer write fActiveServer;
    property ActiveDb    : tstr95 read fActiveDb write fActiveDb;

    property Table       : tStr25 read fTableName write fTableName;
    property Node        : tTreeNode read fTreeNode write fTreeNode;

    property OnChangeTransport: TChangeTransport read fOnChangeTransport write fOnChangeTransport;
    property OnChangeServer   : tChangeServer read fOnChangeServer write fOnChangeServer;
    property OnChangeAlias    : tChangeAlias read fOnChangeAlias write fOnChangeAlias;
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

  TDefaultSettingsSQLBtns = record
    TopMargin: Integer;
    Spacing  : Integer;
    Height   : Integer;
    Col1Left : Integer;
    Col2Left : Integer;
  end;

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
  PathAndFileIni             : string;
  PrjSetupCompomentsIni      : string;
  PathAndFileAtFormLocSize   : string;
  AppPath                    : string;
//  FunctionNamesPath          : string;
  DelphiDbDefaultPath        : string;
  NxSQLViewerDataIniFile     : tGemINI;
  SQLBtnsArray               : Tarray<tJvPanel>;
//  RootNodeDbArray            : Tarray<tRootNodeDb>;
  BtnDefaultSettingsPathFile : string;
  BtnDefaultSettingsRec      : File of TDefaultSettingsSQLBtns;
  DefaultSettingsSQLBtns     : TDefaultSettingsSQLBtns;
  LocalServerAliasesPath     : string;
  IniNxSQLPathFile           : string;
  DefaultPathForPrjsFolder   : string;
  fthe_DefaultPrjPath        : string;
  fTheProjects               : TStringList;
  MRUFile                    : string;
  UpdateInstallPath          : string;
  SqlFontStylesSaveFilePath  : string;
  fPrjPathValidChars         : Boolean;
  gProjectInfo               : TProjectInfo;


const
  WM_SHOWPRJSDIALOG = WM_APP + 321;

  cSRSDpath = '\SlickRockSoftwareDesign\NxDatabaseViewer';

  cNxTableViewerIni    = '\nxTableViewer.ini';   // keep  // Floating form location and size memory
  cDelphiSqToolsDbPath = '\DelphiSqlToolsDb\';   // keep // Nexus Delphi Sql Tools database
  cFormLocSizeDef      = '\FormLocSizeDefs.xml'; // keep  // Location and size of forms memory
  cPrjSetUpComponents  = '\PrjSetUp.ini';
  cBtnDefaultHieght    = 20;
  cLocalServerAliases  = '\LocalDbs.txt'; //
  cFilterIniFiles      = '\Filters.ini';
  cDefaultPathForPrjs  = '\NxSQL_Prjs'; // remove
  cThe_DefaultPrjPath = '\DefaultPrj';

  cPrgFileName = '\ProjectSetup.prj'; // remove
  cMRUFileName = '\MRUPrj.txt';  // ok
  cUpdateInstallPath = '\Installer'; //ok
  cSqlBtnsDbAlias    = 'NxDelphiSqlTools'; // ok
  cSqlFontFileName   = '\EditorFonts.bin'; // ok

  cNxDbTimeOut = 5000;


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

  { ///////////////  Computer Info     //////////// }
procedure SetProgramPaths;
procedure CreateIniFile;
procedure DestroyIniFile;
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

procedure GetProjectList;//(Out aResults: TStrings);

//function ReadProjectSetup(var aProjectInfo: TProjectInfo): boolean;
//
//procedure WriteProjectSetup(aProjectInfo: TProjectInfo);

//procedure ClearPrj(var aProjectInfo: TProjectInfo);

//===================================

implementation


procedure GetProjectList;//(Out aResults: TStrings);
var
  strFiles: TStringDynArray;
  i: integer;

  function getProjectName(aPath: string):string;
  var
    position: Integer;
  begin
    position := LastDelimiter( '\', aPath );
    result := Copy ( aPath, position + 1, Length(aPath) - position);
  end;

begin
  fTheProjects.Clear;
  strFiles := TDirectory.GetDirectories(DefaultPathForPrjsFolder);
  for i := 0  to High(strFiles) do begin
    fTheProjects.Add(getProjectName(strFiles[i]) + '=' + strFiles[i]);
  end;
end;


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


procedure SetProgramPaths;
begin
  fPrjPathValidChars := True;
  fTheProjects.NameValueSeparator := '=';

  AppPath := getWinSpecialFolder(CSIDL_LOCAL_APPDATA, False) + cSRSDpath;
  DefaultPathForPrjsFolder := getWinSpecialFolder(CSIDL_PERSONAL, false) + cDefaultPathForPrjs + '\';
  fPrjPathValidChars       := TPath.HasValidPathChars(DefaultPathForPrjsFolder, false);

  MRUFile                  := AppPath + cMRUFileName;  //DefaultPathForPrjsFolder +
  fthe_DefaultPrjPath      := DefaultPathForPrjsFolder + cthe_DefaultPrjPath;
  UpdateInstallPath        := AppPath + cUpdateInstallPath;

  ForceDirectories(AppPath);

  ForceDirectories(DefaultPathForPrjsFolder);

  ForceDirectories(fthe_DefaultPrjPath);

  ForceDirectories(UpdateInstallPath);

  IniNxSQLPathFile := DefaultPathForPrjsFolder + cFilterIniFiles;

  SqlFontStylesSaveFilePath := AppPath + cSqlFontFileName;


  PathAndFileIni             := AppPath + cNxTableViewerIni;


  PrjSetupCompomentsIni      := AppPath + cPrjSetUpComponents;
  DelphiDbDefaultPath        := AppPath + cDelphiSqToolsDbPath;
  PathAndFileAtFormLocSize   := AppPath + cFormLocSizeDef;
//  MRUMenuItemsPathFile       := AppPath + MRUItemsIni;
  LocalServerAliasesPath     := AppPath + cLocalServerAliases;

end;


// ==================================================================

procedure CreateIniFile;
begin
  NxSQLViewerDataIniFile := tGemINI.Create(PathAndFileIni);
end;

// ==================================================================

procedure DestroyIniFile;
begin
  FreeAndNil(NxSQLViewerDataIniFile);
end;

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

procedure TProjectInfo.SetTransport(const Value: TTransportUsed);
begin
  if Value <> fTransport then begin
    fTransport := Value;
    if not fUpdate then begin
      PrjTransportChange(fTransport);
      fServer := '';
      fAlias := '';
    end;
  end;
end;

procedure TProjectInfo.SetServer(const Value: tstr45);
begin
  if Value <> fServer then begin
    fServer := Value;
    if not fUpdate then begin
      PrjServerChange(fServer);
      fAlias := '';
    end;
  end;
end;

procedure TProjectInfo.SetAlias(const Value: tstr95);
begin
  if Value <> fAlias then begin
    fAlias := Value;
    if not fUpdate then
      PrjAliasChange(fAlias);
  end;
end;

procedure TProjectInfo.PrjTransportChange(aTransport: TTransportUsed);
begin
  if Assigned(fOnChangeTransport) then
    fOnChangeTransport(fTransport);
end;

procedure TProjectInfo.PrjServerChange(aServer: tStr45);
begin
  if Assigned(fOnChangeServer) then
    fOnChangeServer(fServer);
end;

procedure TProjectInfo.PrjAliasChange(aAlias: tStr95);
begin
  if Assigned(fOnChangeAlias) then
    fOnChangeAlias(fAlias);
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
  fPrjName := '';
  fPrjPath := '';
//  fTransport := tranNone;
  fServer := '';
  fAlias := '';
  fPasFileSaveLoc := '';
  fDBPassWord := '';
  fActiveServer := '';
  fActiveDb := '';
  fTreeNode := nil;
end;


constructor TProjectInfo.Create(aPrjName: string);
begin
  fPrjName := aPrjName;
end;

end.
