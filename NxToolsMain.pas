unit NxToolsMain;

interface
{.$DEFINE USE_CODESITE}
{.DEFINE MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages, Winapi.psAPI,

  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  System.ImageList, System.Types, System.UITypes, System.Actions, System.StrUtils,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, Vcl.Menus,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.ImgList,
  Vcl.Imaging.pngimage, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ActnList, Vcl.Mask, Vcl.AppEvnts, Vcl.CheckLst,

  adpMRU, SBPro, gemCustomButton, gemArrow,

  JvBaseDlg, JvWinDialogs, JvImageList, JvFormPlacement, JvComponentBase,
  JvAppStorage, JvAppXMLStorage, JvExControls, JvXPCore, JvXPButtons, JvPanel,
  JvSpeedButton, JvExStdCtrls, JvButton, JvBrowseFolder, JvListBox, JvMenus,
  JvExMask, JvSpin, JvExExtCtrls, JvExComCtrls, JvComCtrls, JvExtComponent,
  JvRollOut, JvCombobox, JvColorCombo, JvToolEdit, JvImage,

  PngImageList, PngBitBtn,

  ovcbase, ovcmru, ovcfiler, ovcstore,

  EsBase, EsMnuBtn, EsLabel, EsClrCbx,

  LbCipher, LbClass, GEMUpdaterPanel, PngSpeedButton,  PngCheckListBox,
  DB,

  nxsdTypes, nxsdServerEngine, nxdb,

  Global, floating, TableView, SQLView

  {$IFDEF  USE_CODESITE}, CodeSiteLogging{$ENDIF};

const
  FontLabelArray: Array[tSqlFontType] of String =
             ('lbl_SQLStatements', 'lbl_SQLComments', 'lbl_SQLNumeric',
              'lbl_SQLEditor', 'lbl_SQLTblNames', 'lbl_SQLFunctions');
  NumBtns = 4;
  TransBtnsArray: Array[1..NumBtns] of String =
             ('btn_SharedMem', 'btn_LocalServer', 'btn_NamedPipe', 'btn_TcpIp');
  numCatPanels = 3;
  mCatPanelsComponents: array[1..numCatPanels] of WideString =
                                                          ('catpan_SqlFontColors',
                                                           'catpan_SqlBtnsDefaualtSize',
                                                           'catpan_SetSplitViewAction');

type

  TChangeFontStuff = procedure(aFontStuff: TFontStuff) of object;

  TSqlFontParams = record
  private
    fSqlFontType   : tSqlFontType;
    fFontStuff     : TFontStuff;
    fFontsFileName : string;
    fOnChange      : TChangeFontStuff;
    fBackground    : tJvColorComboBox;
    fForeground    : tEsColorComboBox;
    fStyleCombo    : TJvCheckedComboBox;
    procedure jvccb_SQLBgColorChange(Sender: TObject);
    procedure esccb_SQLFgColorChange(Sender: TObject);
    procedure JvCheckedComboBoxChange(Sender: TObject);
    procedure SetFontStyles;
    procedure FontStuffChange(aFontStuff: TFontStuff);
  public
    constructor Create(BgCTop, BgCLeft, FgCTop, FgCLeft, CcbStyleTop, CcbStyleLeft: Integer;
                       aParent: TwinControl; aFontType: tSqlFontType; SaveFileName: string;
                       CCItems: TStrings);
    function SaveSettings: boolean;
    function ReadSettings: boolean;
    procedure ShowColorsStyles;
    procedure FreeResources;

    property SQLFontTypeFile: string read fFontsFileName write fFontsFileName;
    property FontStuff: TFontStuff read fFontStuff write fFontStuff;
    property OnChange: TChangeFontStuff read fOnChange write fOnChange;
  end;


  TFormsInfo = record
    TypeDockForm     : TDockingFormType;
    theForm          : TForm;
    ActiveIndex      : integer;
    ActiveUnDocked   : boolean;
    NumSqlForms      : integer;
    NumTblForms      : integer;
    SqlformNumbering : integer;
    TblformNumbering : integer;
  end;


  TTreeView = class (Vcl.ComCtrls.TTreeView)
  private
    fDragValue: string;
    procedure SetDragValue(const Value: string);
    function SetSelChildString: string;
    function SetSelParentString: string;
  public
    property DragValue         : string read fDragValue write SetDragValue;
    property SelParentText     : string read SetSelParentString;
    property SelChildText      : string read SetSelChildstring;
  end;


  Tfrm_NxToolsMain = class(TForm)
    mm_MainMenu                          : TMainMenu;
    mniRecent                            : TMenuItem;
    mniCreatePrjFolder                   : TMenuItem;
    N1                                   : TMenuItem;
    FileExitItem                         : TMenuItem;
    Preferences1                         : TMenuItem;
    SQLDefaultSizeofGridsandEditors1     : TMenuItem;
    Help1                                : TMenuItem;
    HelpAboutItem                        : TMenuItem;
    pnl_TopMain                          : TPanel;
    spltvw_ToolsCommands                 : TSplitView;
    jvpxmlflstrg_NxDbToolsPrefs          : TJvAppXMLFileStorage;
    jvfrmstrg_FormPrefs                  : TJvFormStorage;
    btn__SplitViewOpenClose              : TButton;
    il_AppImages                         : TImageList;
    il_imlIcons                          : TImageList;
    stsbrpr_StatusBar                    : TStatusBarPro;
    lbl_ActiveForm                       : TLabel;
    chk_ManualDock                       : TCheckBox;
    ActionList                           : TActionList;
    act_NxDbTcpIpTrans                   : TAction;
    act_NxDbNamedPipeTrans               : TAction;
    act_SQLStatementFunctions            : TAction;
    FontDialog                           : TFontDialog;
    btn_CloseProgram                     : TJvSpeedButton;
    jvmglst_AppImages                    : TJvImageList;
    dlg_SQLWindows                       : TJvOutOfMemoryDialog;
    pm_DockedTabSheet                    : TPopupMenu;
    CloseForm1                           : TMenuItem;
    Forms1                               : TMenuItem;
    Recent1                              : TMenuItem;
    act_ManageProjects                   : TAction;
    N2                                   : TMenuItem;
    AddLocalDbConnection1                : TMenuItem;
    RemoveLocalDbConnection1             : TMenuItem;
    act_AddAliasPath                     : TAction;
    act_RemoveAliasPath                  : TAction;
    act_LocalServer                      : TAction;
    jvpmn_AliasAndPath                   : TJvPopupMenu;
    AddLocalAliasandPath1                : TMenuItem;
    R1                                   : TMenuItem;
    pngbtbtn_PrjManManageProjects        : TPngBitBtn;
    act_PackTable                        : TAction;
    jvpmn_TableOptions                   : TJvPopupMenu;
    mn_iPackTable                        : TMenuItem;
    mniN3                                : TMenuItem;
    mniEnterDbsPassword1                 : TMenuItem;
    act_DbPassword                       : TAction;
    lblwfsh1                             : TLbBlowfish;
    mniShowPasswords1                    : TMenuItem;
    act_ShowPassword                     : TAction;
    act_CreateSQLWindow                  : TAction;
    act_EditAndPosition                  : TAction;
    jvpmn_EditBtns                       : TJvPopupMenu;
    mniChangeCaptionofButton1            : TMenuItem;
    mniChangeExtraTextforButton1         : TMenuItem;
    mniChangeTab1                        : TMenuItem;
    mniButtonWidth1                      : TMenuItem;
    mniEditorCursorbeforethischar1       : TMenuItem;
    mniUseExtendedSQL1                   : TMenuItem;
    mniSpaceAfterCursor1                 : TMenuItem;
    mniExtendedSQLCode1                  : TMenuItem;
    mniHint1                             : TMenuItem;
    mniHelpUrl1                          : TMenuItem;
    act_OpenSqlStatementsPanel           : TAction;
    act_OpenSqlFunctionsPanel            : TAction;
    ApplicationEvents1                   : TApplicationEvents;
    GEMAppUpdater                        : TGEMAppUpdater;
    N3                                   : TMenuItem;
    sv_Preferences                       : TSplitView;
    catpangrp_Preferences                : TCategoryPanelGroup;
    catpan_SqlFontColors                 : TCategoryPanel;
    catpan_SqlBtnsDefaualtSize           : TCategoryPanel;
    Label2                               : TLabel;
    sped_TopMargin                       : TJvSpinEdit;
    Label3                               : TLabel;
    sped_BtnSpacing                      : TJvSpinEdit;
    Label4                               : TLabel;
    sped_BtnHeight                       : TJvSpinEdit;
    Label5                               : TLabel;
    sped_LeftCol                         : TJvSpinEdit;
    Label6                               : TLabel;
    sped_RightCol                        : TJvSpinEdit;
    Label7                               : TLabel;
    sped_BtnWidth                        : TJvSpinEdit;
    pum_FontStyle                        : TJvPopupMenu;
    Bold1                                : TMenuItem;
    Italic1                              : TMenuItem;
    UnderLine1                           : TMenuItem;
    Strikeout1                           : TMenuItem;
    lbl_SQLNumeric                       : TLabel;
    lbl_SQLComments                      : TLabel;
    lbl_SQLStatements                    : TLabel;
    lbl_SQLEditor                        : TLabel;
    lbl_SQLTblNames                      : TLabel;
    lbl_SQLFunctions                     : TLabel;
    Label8                               : TLabel;
    Label9                               : TLabel;
    Label10                              : TLabel;
    pbb_Preferences                      : TPngBitBtn;
    SetFontsForSQLEditor1                : TMenuItem;
    catpan_SetSplitViewAction            : TCategoryPanel;
    ts_SetSplitViewActions               : TToggleSwitch;
    pgc_DockedForms                      : TPageControl;
    pgc_ToolsCommands                    : TPageControl;
    ts_DatabaseTools                     : TTabSheet;
    ts_SQLCommands                       : TTabSheet;
    pgc_SQLCommandsTab                   : TPageControl;
    ts_SQLStatement                      : TTabSheet;
    CheckBox1                            : TCheckBox;
    btn_SELECT                           : TButton;
    btn_DISTINCT                         : TButton;
    btn_INNERJOIN                        : TButton;
    btn_OUTERJOIN                        : TButton;
    btn_WHERE                            : TButton;
    btn_OR                               : TButton;
    btn_AND                              : TButton;
    btn_ORDERBY                          : TButton;
    btn_ISNULL                           : TButton;
    btn_BETWEEN                          : TButton;
    btn_IN                               : TButton;
    btn_LIKE                             : TButton;
    btn_DATE                             : TButton;
    btn_RIGHTJOIN                        : TButton;
    btn_LEFTJOIN                         : TButton;
    btn_UNION                            : TButton;
    btn_NOTNULL                          : TButton;
    btn_GroupBy                          : TButton;
    btn_Not                              : TButton;
    btn_SelectTop                        : TButton;
    btn_Having                           : TButton;
    btn_Exist                            : TButton;
    btn_All                              : TButton;
    btn_Any                              : TButton;
    ts_SQLFunctions                      : TTabSheet;
    btn_Med                              : TButton;
    btn_Std                              : TButton;
    btn_List                             : TButton;
    btn_SUBSTRING                        : TButton;
    btn_TRIM                             : TButton;
    btn_CHR                              : TButton;
    btn_ToString                         : TButton;
    btn_TOSTRINGLEN                      : TButton;
    btn_UPPER                            : TButton;
    btn_LOWER                            : TButton;
    btn_SQRT                             : TButton;
    btn_Round                            : TButton;
    btn_BROUND                           : TButton;
    btn_EXTRACT                          : TButton;
    btn_ORD                              : TButton;
    btn_CURRENT_DATE                     : TButton;
    btn_CURRENT_TIME                     : TButton;
    btn_LOCALTIMESTAMP                   : TButton;
    btn_CURRENT_TIMESTAMP                : TButton;
    btn_Avg                              : TButton;
    btn_Count                            : TButton;
    btn_Max                              : TButton;
    btn_Sum                              : TButton;
    btn_Min                              : TButton;
    chkPositionRunTime2                  : TCheckBox;
    btn_SYSDATE                          : TButton;
    Panel1                               : TPanel;
    img_SQLTabDockImage                  : TImage;
    img_SQLTabUndockImage                : TImage;
    ts_TablesAndFieldsTools              : TTabSheet;
    gemArrow1                            : TgemArrow;
    gemShapeBtn1                         : TgemShapeBtn;
    Label19                              : TLabel;
    tv_TablesAndFields                   : TTreeView;
    JvPanel1                             : TJvPanel;
    img_TableFieldToolsUndocked          : TImage;
    img_TableFieldToolsDocked            : TImage;
    jvpnl_Transport                      : TJvPanel;
    btn_SharedMem                        : TSpeedButton;
    Label16                              : TLabel;
    btn_LocalServer                      : TSpeedButton;
    btn_NamedPipe                        : TSpeedButton;
    btn_TcpIp                            : TSpeedButton;
    lbl_ServersLabel                     : TLabel;
    lst_ServerListBox                    : TListBox;
    img_DBToolsUnDock                    : TImage;
    img_DBToolsDock                      : TImage;
    jvpnl_TranpsortAlias                 : TJvPanel;
    jvxpbtn_CreateSQLWindow              : TJvXPButton;
    Label1                               : TLabel;
    sv_ProjectInfo                       : TSplitView;
    pbb_Project                          : TPngBitBtn;
    mem_ProjectStats                     : TMemo;
    Label11                              : TLabel;
    act_ExpandTree                       : TAction;
    psb_ExpandCollapse                   : TPngSpeedButton;
    PngSpeedButton1                      : TPngSpeedButton;
    act_CollapseTree                     : TAction;
    Label12                              : TLabel;
    tv_AliasAndTables                    : TJvTreeView;
    jvpmn_TreeViewDbTables               : TJvPopupMenu;
    mniSetthisTransportAsDefault1        : TMenuItem;
    mniSetThisServerasDefault1           : TMenuItem;
    mniSetthisDbasdefault1               : TMenuItem;
    mniN4                                : TMenuItem;
    mniSetTransportserverthendb1         : TMenuItem;
    act_SetTransDefault                  : TAction;
    act_SetServerDefault                 : TAction;
    act_SetDbDefualt                     : TAction;
    mniN5                                : TMenuItem;
    mniSettoDefaultProject1              : TMenuItem;
    act_SetToDefaultPrj                  : TAction;
    PngSpeedButton2                      : TPngSpeedButton;
    PngSpeedButton3                      : TPngSpeedButton;
    Label13                              : TLabel;
    act_ExpandTreeTF                     : TAction;
    act_CollapseTreeTF                   : TAction;

    procedure FormCreate(Sender: TObject);
    procedure btn__SplitViewOpenCloseClick(Sender: TObject);
    procedure pgc_ToolsChange(Sender: TObject);
    procedure img_DBToolsUnDockClick(Sender: TObject);
    procedure img_DBToolsDockClick(Sender: TObject);
    procedure img_SQLTabDockImageClick(Sender: TObject);
    procedure img_SQLTabUndockImageClick(Sender: TObject);
    procedure img_TableFieldToolsUndockedClick(Sender: TObject);
    procedure img_TableFieldToolsDockedClick(Sender: TObject);
    procedure pgc_DockedFormsChange(Sender: TObject);
    procedure pgc_DockedFormsDockOver(Sender: TObject; Source: TDragDockObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure pgc_DockedFormsGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure pgc_DockedFormsUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure act_NxDbTcpIpTransExecute(Sender: TObject);
    procedure act_NxDbNamedPipeTransExecute(Sender: TObject);
    procedure lst_ServerListBox1Click(Sender: TObject);
    procedure btn_SQLFunctionStatementsClick(Sender: TObject);
    procedure gmrw_MoveTableSQLarrowbtnClick(Sender: TObject);
    procedure ext(Sender: TObject);
    procedure btn_CloseProgramClick(Sender: TObject);
    procedure CloseForm1Click(Sender: TObject);
    procedure pgc_DockedFormsMouseDown(Sender: TObject; Button: TMouseButton;
                                       Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure btn_FormName(Sender: TObject);
    procedure Forms1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SQLDefaultSizeofGridsandEditors1Click(Sender: TObject);
    procedure act_ManageProjectsExecute(Sender: TObject);
    procedure stsbrpr_StatusBarPanels3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure act_RemoveAliasPathExecute(Sender: TObject);
    procedure act_LocalServerExecute(Sender: TObject);
    procedure act_LocalServerUpdate(Sender: TObject);
    procedure act_NxDbTcpIpTransUpdate(Sender: TObject);
//    procedure lst_AliasListBox1MouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
    procedure act_DbPasswordExecute(Sender: TObject);
    procedure act_ShowPasswordExecute(Sender: TObject);
    procedure act_DbPasswordUpdate(Sender: TObject);
//    procedure lst_TablesListBox1Click(Sender: TObject);
    procedure act_CreateSQLWindowExecute(Sender: TObject);
    procedure act_CreateSQLWindowUpdate(Sender: TObject);
//    procedure lst_TablesLB1MouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
    procedure act_OpenSqlStatementsPanelExecute(Sender: TObject);
    procedure act_OpenSqlFunctionsPanelExecute(Sender: TObject);

    procedure ApplicationEvents1ModalBegin(Sender: TObject);
    procedure ApplicationEvents1ModalEnd(Sender: TObject);
    procedure pbb_PreferencesClick(Sender: TObject);
    procedure SetFontsForSQLEditor1Click(Sender: TObject);
    procedure catpan_PreferenceExpand(Sender: TObject);
//    procedure lst_AliasListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
//      Y: Integer);
//    procedure lst_AliasListBox1Click(Sender: TObject);
    procedure tv_TablesAndFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tv_AliasAndTablesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnFontStuffChange(aFontStuff: TFontStuff);
    procedure OnPrjInfoTransportChange(aTransport: TTransportUsed);
    procedure OnPrjInfoServerChange(aServer: tStr45);
    procedure OnPrjInfoAliasChange(aAlias: tStr95);
    procedure lst_ServerListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure sv_ProjectInfoOpened(Sender: TObject);
    procedure pbb_ProjectClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure fullexpandButton2Click(Sender: TObject);
    procedure act_ExpandTreeExecute(Sender: TObject);
    procedure act_CollapseTreeExecute(Sender: TObject);
    procedure spltvw_ToolsCommandsOpening(Sender: TObject);
    procedure act_SetTransDefaultExecute(Sender: TObject);
    procedure act_SetServerDefaultExecute(Sender: TObject);
    procedure act_SetDbDefualtExecute(Sender: TObject);
    procedure act_SetToDefaultPrjExecute(Sender: TObject);
    procedure act_SetDbDefualtUpdate(Sender: TObject);
    procedure act_SetServerDefaultUpdate(Sender: TObject);
    procedure mniSetTransportserverthendb1Click(Sender: TObject);
    procedure act_ExpandTreeTFExecute(Sender: TObject);
    procedure act_CollapseTreeTFExecute(Sender: TObject);

  private
    { Private declarations }
    fOrgMemoryUsed     : Cardinal;// = 0;
    fSQLArrayDockForm  : array of Tfrm_SQLView;
    fTblArrayDockForm  : array of Tfrm_TableView;
    fFontLabelArray    : array[tSqlFontType] of TLabel;
    fTransBtnsArray    : array[0..NumBtns] of TSpeedButton;
    ctgrypnl_Array     : array[1..numCatPanels] of TCategoryPanel;
    fSqlEditorFonts    : array[tSqlFontType] of TSqlFontParams;
    fSQLCommandsFF     : TFloatingForm;
    fTableFieldToolsFF : TFloatingForm;
    fDatabaseToolsFF   : TFloatingForm;
    fPanelLengths      : array[TStatusPanelOrder] of integer;
    tv_TblAndFields    : TTreeView;
    fLocalAliasPaths   : tStringList;
    fProjectInfo       : TProjectInfo;
    fPasFileLoc        : tStr255;
    fFormShowing       : Boolean;

    // floating forms
    function GetSQLCommandsFF: TFloatingForm;
    function GetBtnHeight: Integer;
    function GetBtnWidth: integer;
    function GetBtnTopMargin: integer;
    function GetBtnSpacing: integer;
    function GetBtnLeftColStart: integer;
    function GetBtnRightColStart: integer;
//    procedure lst_AcsvTableFieldsWidthliasListBox1Click(Sender: TObject);
    procedure SetPasFileLoc(const Value: tStr255);
    property SQLCommandsFF   : TFloatingForm read GetSQLCommandsFF;
    procedure SQLCommandsFFOnDestroyFloat(Sender: TObject);
    procedure SQLCommandsFFOnShowFloat(Sender: TObject);

    // Table Field Tools
    function GetTableFieldToolsFF: TFloatingForm;
    property TableFieldToolsFF   : TFloatingForm read GetTableFieldToolsFF;
    procedure TableFieldToolsFFOnDestroyFloat(Sender: TObject);
    procedure TableFieldToolsFFOnShowFloat(Sender: TObject);

    // Database  Tools
    function GetDatabaseToolsFF: TFloatingForm;
    property DatabaseToolsFF   : TFloatingForm read GetDatabaseToolsFF;
    procedure DatabaseToolsFFOnDestroyFloat(Sender: TObject);
    procedure DatabaseToolsFFOnShowFloat(Sender: TObject);
    {END ====== Floating Form stuff ===}

    function GetAppVersionStr: string;
    function FindDockedByCaption(const aCaption: string): integer;
    function SetDockingFormType(aControl: TControl): Boolean;
    procedure setEnableTransportBtns(theEnabled: Boolean);
    function SetServerTransport: TTransportUsed;
    procedure AddTextToRichEdit(aIndex: Integer; aEditorStr: string;
                                aPlaceCursorBeforeChar: string;
                                aSpacesAfterCursor,
                                aUseExtendedSQL: boolean;
                                aExtendedText: TStrings);
    procedure SetMemoryUsageLabel;
    procedure AddFormsToWindowsMenu;
    procedure DestroyFromMenuItems;

    procedure FreeBtns;
    procedure GetProject(OpenPrjManWin: boolean);

    function CheckIntersectPanels(aPanel: integer): Boolean;
    procedure WMHOWPRJSDIALOG(var Message: TMessage); message WM_SHOWPRJSDIALOG;
    procedure DoConfigChange(aFontStuff: TFontStuff);
    procedure SetupTreeViewTableFields(aNode: tTreeNode);
    procedure SetupTreeViewAliasTables;
    function GetJustPathAlias(aAlisPath: string): string;
    procedure ClearTree;
    procedure Create_TablesView(aNode: tTreeNode; aTableName: string);
    procedure CreateSQLWindow(aNode: tTreeNode);
    function SaveProjectToDb: tFunctionReturns3;
    function GetRootNodeByText(ATree: TJvTreeView; AValue: String; AVisible: Boolean): TTreeNode;
    function SetDb(aTreeView: tJvTreeView; aValue: string): Boolean;
    procedure FreeTreeDataDbs;
    procedure FreeSQLandTableForms;
    procedure SaveSqlFormEditors;

  public
    { Public declarations }
    DockingFormsInfo: TFormsInfo;

    procedure EditBtn(aIndex: integer; aIsInsertBtn: boolean);
    procedure btn_CreateBtns;

    procedure SetServer;
    procedure SetAlias(var aDataBase: TnxDatabase);

    procedure ClearProjectInfo;
    procedure DeleteSQLX(const Index: Cardinal);
    procedure DeleteTblX(const Index: Cardinal);
    procedure SetActiveFormOnDelete(WasItFloat: boolean);
    function FindMenuItem(StartMenuItem: Vcl.Menus.TMenuItem; aNameCaption: string;
                          UseCaptionNotName: boolean): Vcl.Menus.TMenuItem;
    procedure TurnOffSQLStuff;

    property BtnHeight: Integer read GetBtnHeight;// write fBtnHeight;
    property BtnWidth: integer read GetBtnWidth;// write fBtnWidth;
    property BtnTopMargin: integer read GetBtnTopMargin;// write fBtnTopMargin;
    property BtnSpacing      : integer read GetBtnSpacing;// write fBtnSpacing;
    property BtnLeftColStart : integer read GetBtnLeftColStart;// write fBtnLeftColStart;
    property BtnRightColStart: integer read GetBtnRightColStart;  // write fBtnRightColStart;

    property PasFileLoc: tStr255 read fPasFileLoc write SetPasFileLoc;
    property ProjectInfo: TProjectInfo read fProjectInfo write fProjectInfo;
  end;

var
  frm_NxToolsMain: Tfrm_NxToolsMain;
  StringValue: string;
  IntegerValue: Integer;


implementation

Uses
  DataMod, MSspecialFolders, GemINI, GetPrjList,
  GEMUseFullRoutines, Dimmer, frm_GetAliasPath, MoveResizeComponents,
  SQLChildFormChangeInterface, FontStuffTest;

const
  cBtnColor               = $00FF8080;
  cClickColor             = clSilver;
  cBtnIntersectColor      = clRed;
  cFontColor              = clYellow;
  cPanelBtnLocationsColor = clRed;
  cBtnBevelWidthClicked   = 1;
  cBtnBevelWidthNorm      = 1;
  cDarkerTextPercent      = 80;

  csvDatabaseWidth = 255;
  csvSQLWidth = 260;
  csvTableFieldsWidth = 300;//215;

{$R *.dfm}
{.$R button.res}

function AddThousandSeparator(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  I := Length(S) - 2;
  while I > 1 do
  begin
    Insert(Chr, Result, I);
    I := I - 3;
  end;
end;


function CurrentProcessMemory: Cardinal;
{$REGION 'DOC'}{
Not sure where I got the basics of this, but I added some better error handling
to it and made it a function. WorkingSetSize is the amount of memory currently
used. You can use similar code to get other values for the current process
(or any process). You will need to include psAPI in your uses statement.

The PROCESS_MEMORY_COUNTERS record includes:

PageFaultCount
PeakWorkingSetSize
WorkingSetSize
QuotaPeakPagedPoolUsage
QuotaPagedPoolUsage
QuotaPeakNonPagedPoolUsage
QuotaNonPagedPoolUsage
PagefileUsage
PeakPagefileUsage
You can find all of these values in Task Manager or Process Explorer.
}{$ENDREGION}
var
  MemCounters: TProcessMemoryCounters;
begin
  result := 0;
  MemCounters.cb := SizeOf(MemCounters);
  if GetProcessMemoryInfo(GetCurrentProcess,
      @MemCounters,
      SizeOf(MemCounters)) then
    Result := MemCounters.WorkingSetSize
  else
    RaiseLastOSError;
end;


function MemoryUsed: cardinal;
{$REGION 'DOC'}{
this method shows the amount of memory allocated by the application, not the
amount of memory used by it (like memory allocated by 3rd party dlls, ocx/COM,
etc) For that, a much more reliable solution is the one given by Jim McKeeth
below, provided that MemCounters.PagefileUsage is also added to the result. –
ciuly Oct 24 '13 at 14:48
}{$ENDREGION}
var
  st: TMemoryManagerState;
  sb: TSmallBlockTypeState;
begin
  GetMemoryManagerState(st);
  result := st.TotalAllocatedMediumBlockSize + st.TotalAllocatedLargeBlockSize;
  for sb in st.SmallBlockTypeStates do begin
      result := result + sb.UseableBlockSize * sb.AllocatedBlockCount;
  end;
end;


procedure Tfrm_NxToolsMain.DoConfigChange(afontStuff: TFontStuff );
var
  cnt : integer;
  icc : IConfigChanged;
begin
  for cnt := 0 to -1 + Screen.FormCount do begin
    if Supports(Screen.Forms[cnt], IConfigChanged, icc) then
      icc.ApplyConfigChange(afontStuff);
  end;
end;


function Tfrm_NxToolsMain.GetBtnHeight: Integer;
begin
  Result := StrToInt(sped_BtnHeight.Text);
end;


function Tfrm_NxToolsMain.GetBtnLeftColStart: integer;
begin
  Result := StrToInt(sped_LeftCol.Text);
end;


function Tfrm_NxToolsMain.GetBtnRightColStart: integer;
begin
  Result := StrToInt(sped_RightCol.Text);
end;


function Tfrm_NxToolsMain.GetBtnSpacing: integer;
begin
  Result := StrToInt(sped_BtnSpacing.Text);
end;


function Tfrm_NxToolsMain.GetBtnTopMargin: integer;
begin
  Result := StrToInt(sped_TopMargin.Text);
end;


function Tfrm_NxToolsMain.GetBtnWidth: integer;
begin
  Result := StrToInt(sped_BtnWidth.Text);
end;


procedure Tfrm_NxToolsMain.EditBtn(aIndex: integer; aIsInsertBtn: boolean);
begin
  case  dm_DataMod.NxSqlButtonsDbTPanelNum.AsInteger of
    1:  begin
          SQLBtnsArray[aIndex].parent := ts_SQLStatement;
    end;
    2:  begin
      SQLBtnsArray[aIndex].parent := ts_SQLFunctions;
    end
    else
      MessageDlg('msg 682-No Parent set!', mtError, [mbOK], 0);
  end;

  SQLBtnsArray[aIndex].Tag         := aIndex;
  SQLBtnsArray[aIndex].Transparent := false;
  SQLBtnsArray[aIndex].Color       := cBtnColor;
  SQLBtnsArray[aIndex].Hint := dm_DataMod.NxSqlButtonsDbTHints.AsString;
  SQLBtnsArray[aIndex].ShowHint    := true;
  SQLBtnsArray[aIndex].UrlHelp := dm_DataMod.NxSqlButtonsDbTNexusDbHelpUrl.AsString;

  SQLBtnsArray[aIndex].Font.Color := cFontColor;
  SQLBtnsArray[aIndex].BevelOuter := bvRaised;

  SQLBtnsArray[aIndex].BtnId := dm_DataMod.NxSqlButtonsDbTBtnId.AsInteger;
  SQLBtnsArray[aIndex].Panel := dm_DataMod.NxSqlButtonsDbTPanelNum.AsInteger;
  SQLBtnsArray[aIndex].Width := dm_DataMod.NxSqlButtonsDbTBtnWidth.AsInteger;

  SQLBtnsArray[aIndex].Height            := cBtnDefaultHieght;
  TwinControl(SQLBtnsArray[aIndex]).Top  := dm_DataMod.NxSqlButtonsDbTBtnTop.AsInteger;
  TwinControl(SQLBtnsArray[aIndex]).Left := dm_DataMod.NxSqlButtonsDbTBtnLeft.AsInteger;
  SQLBtnsArray[aIndex].Top               := dm_DataMod.NxSqlButtonsDbTBtnTop.AsInteger;
  SQLBtnsArray[aIndex].Left              := dm_DataMod.NxSqlButtonsDbTBtnLeft.AsInteger;

  SQLBtnsArray[aIndex].PanelRect := Rect(SQLBtnsArray[aIndex].Left, SQLBtnsArray[aIndex].Top,
                                         SQLBtnsArray[aIndex].Left + SQLBtnsArray[aIndex].Width,
                                         SQLBtnsArray[aIndex].Top + SQLBtnsArray[aIndex].Height);

  SQLBtnsArray[aIndex].Caption := dm_DataMod.NxSqlButtonsDbTCaption.AsString;
  SQLBtnsArray[aIndex].ExtraText := dm_DataMod.NxSqlButtonsDbTExtraText.AsString;
  SQLBtnsArray[aIndex].CusorBeforeLastChar := dm_DataMod.NxSqlButtonsDbTCursorBeforeThisChar.AsString;
  SQLBtnsArray[aIndex].SpaceAfterCursor := dm_DataMod.NxSqlButtonsDbTSpaceAfterCursor.AsBoolean;
  SQLBtnsArray[aIndex].UseExtendedSQL :=  dm_DataMod.NxSqlButtonsDbTUseExtendedSql.AsBoolean;
  if SQLBtnsArray[aIndex].UseExtendedSQL then begin
    SQLBtnsArray[aIndex].SQLExtended.Assign(dm_DataMod.NxSqlButtonsDbTSqlCode);
  end;
  SQLBtnsArray[aIndex].OnClick     := btn_SQLFunctionStatementsClick;
end;


procedure Tfrm_NxToolsMain.ClearProjectInfo;
begin
  fProjectInfo.Transport := tranNone;
  fProjectInfo.ActiveServer := '';
  fProjectInfo.ActiveDb := '';

  lst_ServerListBox.Clear;
end;


procedure Tfrm_NxToolsMain.btn_SQLFunctionStatementsClick(Sender: TObject);
{$REGION 'DOC'}{   TODO : This is wrong.  need to rewrite it or delete it
 the tags of 1,2,3 means the buttons caption if click will be printed in a
 SQL editor.  The tag tells the program to either add a space or a "("
 after the caption is printed. The tag tells the program which char to print after the button
 caption. Buttons with a tag of '1' are on index 0 of SQLCommandsTab page
 control. Buttons with either a '2' or a '3' are on index 1 SQLCommandsTab
 page control.
}{$ENDREGION}
var
  s, se: string;
begin
  s :=  (Sender as tJvPanel).Caption;
  se := (Sender as tJvPanel).ExtraText;
  s := s + se;
  AddTextToRichEdit(DockingFormsInfo.ActiveIndex, s,
                   (Sender as tJvPanel).CusorBeforeLastChar,
                   (Sender as tJvPanel).SpaceAfterCursor,
                   (Sender as tJvPanel).UseExtendedSQL,
                   (Sender as tJvPanel).SQLExtended);
end;


procedure Tfrm_NxToolsMain.btn_CreateBtns;
var
  Index: Integer;

  procedure PlaceButton;
  begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn_CreateBtns/PlaceButton' );{$ENDIF}
    dm_DataMod.NxSqlButtonsDbT.First;
    while not dm_DataMod.NxSqlButtonsDbT.Eof do begin
        SQLBtnsArray[Index] := tJvPanel.Create(nil);

      EditBtn(Index, false);
      SQLBtnsArray[Index].ChangedBtn := false;

      dm_DataMod.NxSqlButtonsDbT.Next;
      {$IFDEF USE_CODESITE}CodeSite.sendmsg('btn_CreateBtns -- Left= '+ IntToStr(SQLBtnsArray[Index].Left)+
                                            '  Top: '+ IntToStr(SQLBtnsArray[Index].Top));{$ENDIF}
      Inc(Index);
    end;
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn_CreateBtns/PlaceButton' );{$ENDIF}

  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn_CreateBtns' );{$ENDIF}
  try
    FreeBtns;
    dm_DataMod.NxSqlButtonsDbT.Open;
    SetLength(SQLBtnsArray, dm_DataMod.NxSqlButtonsDbT.RecordCount);
    Index := 0;
    // set to first col of buttons
    PlaceButton;
  except
    on E : Exception do
      begin
        ShowMessage('Msg 783-Error creating SQL buttons'+#10+#13+E.Message);
        {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'Msg 770-'+ E.Message);{$ENDIF}

      end;
  end;

  CheckIntersectPanels(1);
  CheckIntersectPanels(2);
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'btn_CreateBtns' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.FreeBtns;
var
  index, Count: Integer;

begin
{$REGION 'Doc'}
  {
    When you remove a control the number of controls is also reduced. So get the
    control count before you start freeing the controls.  Then when you free them
    only free controls[0]
  }
{$ENDREGION}
  Count := ts_SQLStatement.ControlCount;
  for index := 0 to Count - 1 do
    ts_SQLStatement.Controls[0].Free;

  Count := ts_SQLFunctions.ControlCount;
  for index := 0 to Count - 1 do
    ts_SQLFunctions.Controls[0].Free;
  SetLength(SQLBtnsArray, 0);
end;


procedure Tfrm_NxToolsMain.SetMemoryUsageLabel;
var
  Temp: Cardinal;
  s, s1: string;
  CaptionStr: string;
begin
  Temp := MemoryUsed;

  s :=  AddThousandSeparator( IntToStr(temp), ',');
  s1 :=  AddThousandSeparator( IntToStr(CurrentProcessMemory), ',');
  if fOrgMemoryUsed > Temp then
    CaptionStr := 'Mem Allocated (going Down): ' + s
  else
    CaptionStr := 'Mem Allocated (going Up): ' + s;

  stsbrpr_StatusBar.Panels[ord(spoMemory)].Text := 'Process Memory Used: '+s1 + '       '+
                                                    CaptionStr;
  fOrgMemoryUsed := Temp;
end;


procedure Tfrm_NxToolsMain.SetPasFileLoc(const Value: tStr255);
begin
  fProjectInfo.PasFileSaveLoc := Value;
end;


function Tfrm_NxToolsMain.GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]); //build
end;


procedure Tfrm_NxToolsMain.CloseForm1Click(Sender: TObject);
var
  index: Integer;
begin
  try
    index := FindDockedByCaption(pgc_DockedForms.ActivePage.Caption);
    DockingFormsInfo.ActiveIndex := index;
    if AnsiPos('SQL', pgc_DockedForms.ActivePage.Caption) > 0 then begin
      fSQLArrayDockForm[index].Close;
      if Length(fSQLArrayDockForm) < 1 then begin
        pgc_ToolsCommands.activepage := ts_DatabaseTools;
      end;

    end
    else
      fTblArrayDockForm[index].Close;
  except
    showmessage('msg 886-Error ColorToString(SQLView Window');
  end;

  SetMemoryUsageLabel;
end;


procedure Tfrm_NxToolsMain.SetFontsForSQLEditor1Click(Sender: TObject);
begin
  if not sv_Preferences.Opened then
    sv_Preferences.Open;
end;


function Tfrm_NxToolsMain.CheckIntersectPanels(aPanel: integer): Boolean;

  function CheckIntersectRect(aRect, bRect: TRect): Boolean;
  begin
    result := False;
    try
      if (not IsRectEmpty(aRect)) and (not IsRectEmpty(bRect))  then
        Result := IntersectRect(aRect, bRect)
      else
        Result := False;

    except on E: Exception do
      ShowMessage('Msg:912-'+E.Message);
    end;
  end;


  procedure SetBtnsToNoOverLapColor;
  var
    fIndex: integer;
  begin
    for fIndex := Low(SQLBtnsArray) to High(SQLBtnsArray) do
      if SQLBtnsArray[fIndex].Panel = aPanel then
        SQLBtnsArray[fIndex].Color := cBtnColor;
  end;


var
  fIndex, j: integer;

begin
  SetBtnsToNoOverLapColor;
  result := false;
  for fIndex := Low(SQLBtnsArray) to High(SQLBtnsArray)-1  do
    for j := fIndex+1 to High(SQLBtnsArray) do
      if (SQLBtnsArray[j].Panel = aPanel) and (SQLBtnsArray[fIndex].Panel = aPanel) then
        if CheckIntersectRect(SQLBtnsArray[j].PanelRect, SQLBtnsArray[fIndex].PanelRect) then begin
          SQLBtnsArray[j].Color := cBtnIntersectColor;
          SQLBtnsArray[fIndex].Color := cBtnIntersectColor;
          result := true;
        end;
end;


//===============================

procedure Tfrm_NxToolsMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fLocalAliasPaths.Free;

//  IniWriteString(PathAndFileIni, 'DefaultPrj','Path', stsbrpr_StatusBar.Panels[ord(spoDefaultPrjDir)].Text);
  FreeAndNil(fTheProjects);
end;


function Tfrm_NxToolsMain.SaveProjectToDb: tFunctionReturns3;
begin
  result := frTrue;
  if fProjectInfo.PrjName = '' then begin
    Result := frFalse1;
    Exit;
  end;

  if fProjectInfo.PrjName <> 'DefaultPrj' then
    with dm_DataMod do
      if nxtbl_NxDbSqlToolsPrjs.Locate('PrjName', fProjectInfo.PrjName, [loCaseInsensitive]) then begin
        nxtbl_NxDbSqlToolsPrjs.Edit;
//          nxtbl_NxDbSqlToolsPrjsPrjPath.AsString := String(fProjectInfo.PrjPath);
          nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := Ord(fProjectInfo.Transport);
          nxtbl_NxDbSqlToolsPrjsServer.AsString := String(fProjectInfo.Server);
          nxtbl_NxDbSqlToolsPrjsAlias.AsString := String(fProjectInfo.Alias);
        nxtbl_NxDbSqlToolsPrjs.Post;
      end
      else begin
        Result := frFalse2;
      end;
end;


procedure Tfrm_NxToolsMain.SaveSqlFormEditors;
var
  index: integer;
begin
  for index :=  Low(fSQLArrayDockForm) to High(fSQLArrayDockForm) do begin
    if not fSQLArrayDockForm[index].SQLSaved then
      if MessageDlg('msg 991-'+QuotedStr(fSQLArrayDockForm[index].caption) +
            ': Save SQL code to File?', mtWarning, [mbYes, mbNo],0)  = mrYes then
        fSQLArrayDockForm[index].SaveEditorFileAs(edtSQL);

    if not fSQLArrayDockForm[index].DelphiSaved then
      if MessageDlg('msg 996-'+QuotedStr(fSQLArrayDockForm[index].caption) +
            ': Save Delphi code to File?', mtWarning, [mbYes, mbNo],0)  = mrYes then
        fSQLArrayDockForm[index].SaveEditorFileAs(edtDelphi);
  end;
end;


procedure Tfrm_NxToolsMain.FreeTreeDataDbs;
var
  rNode: tTreeNode;
begin
  if tv_AliasAndTables.Items.Count > 0 then begin
    rNode := tv_AliasAndTables.Items[0];
    while rNode <> nil do begin
      if tRootNodeDb(rnode.Data^).DataBase.Active then
        tRootNodeDb(rnode.Data^).DataBase.Close;
      tRootNodeDb(rnode.Data^).DataBase.free;
      Dispose(rNode.Data);
      rNode := rNode.GetNextSibling;
    end;
  end;
end;


procedure Tfrm_NxToolsMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  index: tSqlFontType;
begin
  SaveSqlFormEditors;
  FreeSQLandTableForms;

  for index := Low(tSqlFontType) to High(tSqlFontType) do begin
    fSqlEditorFonts[index].SaveSettings;
    fSqlEditorFonts[index].FreeResources;
  end;

  case SaveProjectToDb of
    frFalse1: MessageDlg('msg 1035-Project NOT saved, No PrjName!', mtWarning, [mbOK], 0);

    frFalse2: MessageDlg('msg 1037-Could NOT save any changes to project:'+#13+#10+String(fProjectInfo.PrjName),
                        mtWarning, [mbOK], 0);
  end;

  FreeTreeDataDbs;
  FreeAndNil(tv_AliasAndTables);
  FreeAndNil(tv_TblAndFields);
end;


procedure Tfrm_NxToolsMain.FormShow(Sender: TObject);

  procedure SetPanelLengths;
  var
    Index: TStatusPanelOrder;
  begin
    fPanelLengths[spoAlias]         := 100;
    fPanelLengths[spoMemory]        := 225;
    fPanelLengths[spoCurrenPrj]     := 250;
    fPanelLengths[spoDbVer]         := 250;
    fPanelLengths[spoDbStatus]      := 175;
    fPanelLengths[spoDefaultPrjDir] := 350;

    for Index := Low(TStatusPanelOrder) to High(TStatusPanelOrder) do begin
      stsbrpr_StatusBar.Panels[Ord(Index)].Width := fPanelLengths[index];
    end;
  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormShow' );{$ENDIF}
//  fProjectInfo.ClearPrj;
  sv_Preferences.Opened := False;

  lst_ServerListBox.Clear;

  fOrgMemoryUsed := 0;
  SetMemoryUsageLabel;
  stsbrpr_StatusBar.Panels[ord(spoDbVer)].Text := 'NexusDb: '+dm_DataMod.nxWinsockTransport.Version;

  Recent1.Enabled := True;
  SetPanelLengths;

  fProjectInfo.OnChangeTransport := OnPrjInfoTransportChange;
  fProjectInfo.OnChangeServer    := OnPrjInfoServerChange;
  fProjectInfo.OnChangeAlias     := OnPrjInfoAliasChange;

  // Allows the main form to be shown while showing another form.
  PostMessage(Self.Handle, WM_SHOWPRJSDIALOG, 0, 0);
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormShow' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.WMHOWPRJSDIALOG(var Message: TMessage);
begin
  GetProject(true);
  btn_CreateBtns;
end;


procedure Tfrm_NxToolsMain.FormCreate(Sender: TObject);

  procedure GetFonts;
  var
    index     : tSqlFontType;
    fTopIndex : integer;
    CCItems   : TStringList;
  const
    cFLeft   = 60;
    cSLeft   = 205;
    ctLeft   = 320;
    cSpacing = 51;
  begin
    CCItems := TStringList.Create;
    try
      CCItems.Add('Bold');
      CCItems.Add('Italic');
      CCItems.Add('Underline');
      CCItems.Add('Strikeout');

      fTopIndex := 0;
      for index := Low(tSqlFontType) to High(tSqlFontType) do begin
        fSqlEditorFonts[index].Create(36 + fTopIndex, cFLeft, 34 + fTopIndex,
                                      cSLeft, 35 + fTopIndex, ctLeft,
                                      catpan_SqlFontColors, index,
                                      SqlFontStylesSaveFilePath, CCItems);
        fSqlEditorFonts[index].ReadSettings;
        fSqlEditorFonts[index].OnChange := OnFontStuffChange;

        fFontLabelArray[index].top := fTopIndex + 36;
        inc(fTopIndex, cSpacing);
      end;
    finally
      CCItems.Free;
    end;
  end;

  procedure SetupDocking;
  begin
    DockingFormsInfo.theForm          := nil;
    DockingFormsInfo.ActiveIndex      := -1;
    DockingFormsInfo.ActiveUnDocked   := false;
    DockingFormsInfo.NumSqlForms      := -1;
    DockingFormsInfo.NumTblForms      := -1;
    DockingFormsInfo.SqlformNumbering := -1;
    DockingFormsInfo.TblformNumbering := -1;
  end;

var
  indexL     : tSqlFontType;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormCreate' );{$ENDIF}
  fFormShowing := true;

  fTheProjects := TStringList.Create;
  SetProgramPaths;

  GEMAppUpdater.UpdaterApplicationLocName := ExtractFileDir(ParamStr(0)) + '\SRSDAppUpdater.exe';
  GEMAppUpdater.LocalInstallPath := UpdateInstallPath;
  GEMAppUpdater.IconFileLocation := ExtractFileDir(ParamStr(0)) + '\NxDbSQLTableViewer_Icon.ico';

  jvpxmlflstrg_NxDbToolsPrefs.FileName := PathAndFileAtFormLocSize;

  spltvw_ToolsCommands.Opened := False;
  sv_ProjectInfo.Opened := False;
  pgc_ToolsCommands.ActivePageIndex := 0;
  spltvw_ToolsCommands.Opened := true;
  pgc_ToolsChange(Sender);

  SetupDocking;

  for indexL := Low(tSqlFontType) to High(tSqlFontType) do
    fFontLabelArray[indexL] := FindComponent(FontLabelArray[indexL]) as TLabel;

  GetFonts;

  frm_NxToolsMain.Caption := 'Nexus SQL and Table Delphi Workshop: ' + GetAppVersionStr;

  for var cnt: integer := 1 to numCatPanels do begin
    ctgrypnl_Array[cnt] := FindComponent(mCatPanelsComponents[cnt]) as TCategoryPanel;
    ctgrypnl_Array[cnt].Collapsed := true;
    ctgrypnl_Array[cnt].tag := cnt;
  end;

  for var index: integer := 1 to NumBtns do
    fTransBtnsArray[index] := FindComponent(TransBtnsArray[index]) as TSpeedButton;

  pgc_ToolsCommands.ActivePage := ts_DatabaseTools;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormCreate' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.FormDestroy(Sender: TObject);
begin
  DestroyFromMenuItems;
end;


procedure Tfrm_NxToolsMain.Forms1Click(Sender: TObject);
begin
  AddFormsToWindowsMenu;
end;

procedure Tfrm_NxToolsMain.DestroyFromMenuItems;
begin
  // Count down, not up!
  if mm_MainMenu.Items[1].Count - 1 > -1 then
    for var I := mm_MainMenu.Items[1].Count - 1 downto 0 do  begin
      mm_MainMenu.Items[1].Items[I].Free;
    end;
end;


procedure Tfrm_NxToolsMain.AddFormsToWindowsMenu;
var
  NewItem: TMenuItem;
begin
  DestroyFromMenuItems;
{$REGION 'DOC'}
    { first create the separator }
  //  NewItem := TMenuItem.Create(mm_MainMenu.Items[1]);
  //  NewItem.Name:= 'mm_Forms';
  //  NewItem.Caption := 'Forms';
  //  { add the new item to the Windows menu }
  //  mm_MainMenu.Items[1].Add(NewItem);
{$ENDREGION}
{ now create and add a menu item for each form }
  for var I := 0 to Screen.FormCount-1 do
  begin
    NewItem := TMenuItem.Create(mm_MainMenu.Items[1]);
    NewItem.Caption := Screen.Forms[I].Name + 'Item';
    NewItem.Name := Screen.Forms[I].Name;
    NewItem.Caption := Screen.Forms[I].Caption;
    NewItem.Tag := I;
    NewItem.OnClick := btn_FormName;
    mm_MainMenu.Items[1].Add(NewItem);
   end;
end;


procedure Tfrm_NxToolsMain.btn_FormName(Sender: TObject);
begin
  if Sender is TMenuItem then begin
    Screen.Forms[(Sender as TMenuItem).Tag].Show;
  end;
end;


//function Tfrm_NxToolsMain.GetNodeByText(ATree: TJvTreeView; AValue: String; AVisible: Boolean): TTreeNode;
//var
//  Node: TTreeNode;
//begin
//  Result := nil;
//  if ATree.Items.Count = 0 then
//   Exit;
//  Node := ATree.Items[0];
//  while Node <> nil do begin
//    if UpperCase(Node.Text) = UpperCase(AValue) then begin
//      Result := Node;
//      if AVisible then
//        Result.MakeVisible;
//      Break;
//    end;
//    Node := Node.GetNext;
//  end;
//end;


function Tfrm_NxToolsMain.GetRootNodeByText(ATree: TJvTreeView; AValue: String; AVisible: Boolean): TTreeNode;
var
  Node: TTreeNode;
begin
  Result := nil;
  if ATree.Items.Count = 0 then
   Exit;
  Node := ATree.Items[0];
  while Node <> nil do begin
    if UpperCase(Node.Text) = UpperCase(AValue) then begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNextSibling;
  end;
end;


function Tfrm_NxToolsMain.SetDb(aTreeView: tJvTreeView; aValue: string): Boolean;
var
  tn : TTreeNode;
begin
  result := False;
  tn := GetRootNodeByText(aTreeView, aValue, true);
  if tn = nil then
    MessageDlg('msg 1263-Could not find project Db: ' + QuotedStr(aValue) + '.', mtError, [mbOK], 0)
//    ShowMessage('msg 1264-Could not find project Db.')
  else begin
    aTreeView.SetFocus;
    tn.Selected := True;
    SetAlias(pRootNodeDb(tn.Data)^.DataBase);
    Result := True;
  end;
end;


function Tfrm_NxToolsMain.FindMenuItem(StartMenuItem: Vcl.Menus.TMenuItem; aNameCaption: string;
                                       UseCaptionNotName: boolean): Vcl.Menus.TMenuItem;
begin
  Result := nil;
  if (StartMenuItem.Count > 0) then
    for var items_counter := 0 to StartMenuItem.Count-1 do begin
      if (UseCaptionNotName) and (StartMenuItem.Items[items_counter].Caption = aNameCaption) then begin
        // item found
        Result := StartMenuItem.Items[items_counter];
        Exit;
      end;
      if (not UseCaptionNotName) and (StartMenuItem.Items[items_counter].Name = aNameCaption) then begin
          // item found
        Result := StartMenuItem.Items[items_counter];
        Exit;
        end;
    end;
end;


procedure Tfrm_NxToolsMain.GetProject(OpenPrjManWin: boolean);
var
  s: string;
  index: Integer;

  function SetServer: boolean;
  begin
    result := true;
    index := lst_ServerListBox.Perform(LB_FINDSTRING, $FFFFFFFF, PWideChar(s));
    if index > -1 then  begin
      lst_ServerListBox.ItemIndex := index;
    end
    else begin
      MessageDlg('msg 1306-Could NOT find project server: '+#13+#10+String(fProjectInfo.ActiveServer),
                  mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'GetProject' );{$ENDIF}
  if OpenPrjManWin then begin
    frm_SelectProject.PrjInfo := fProjectInfo;
    case SaveProjectToDb of
      frFalse1:; // MessageDlg('msg 1316-Project NOT saved, No PrjName!', mtWarning, [mbOK], 0);

      frFalse2: MessageDlg('msg 1318-Could NOT save any changes to project:'+#13+#10+String(fProjectInfo.PrjName),
                          mtWarning, [mbOK], 0);
    end;
    frm_SelectProject.ShowModal;

    fProjectInfo := frm_SelectProject.PrjInfo;
  end;

  fProjectInfo.BeginUpdate;
  try
    s := String(fProjectInfo.ActiveServer) + #0;

    case fProjectInfo.ActiveTrans of
      tranWinSock: begin
        act_NxDbTcpIpTrans.Execute;
        if SetServer then begin
          lst_ServerListBox1Click(self);
          if SetDb(tv_AliasAndTables, String(fProjectInfo.ActiveDb)) then begin
//            SetAlias;
        end;
        end;
      end;

      tranNamePipe: begin
        act_NxDbNamedPipeTrans.Execute;
        SetServer;
        lst_ServerListBox1Click(self);
        if SetDb(tv_AliasAndTables, String(fProjectInfo.ActiveDb)) then begin
//          SetAlias;
        end;
      end;

      tranLocalServer: act_LocalServer.Execute;

      tranSharedMem: ;
      tranNone: ;
      tranError: ;
    end;
  finally
    fProjectInfo.EndUpdate;
  end;

  stsbrpr_StatusBar.Panels[ord(spoDefaultPrjDir)].Text := String(fProjectInfo.PrjName+#13+#10+fProjectInfo.PrjPath);
  {$IFDEF USE_CODESITE}CodeSite.exitMethod( Self, 'GetProject' );{$ENDIF}

end;


function Tfrm_NxToolsMain.FindDockedByCaption(const aCaption: string): integer;

  function SQLStuff: integer;
  var
    cnt: Integer;
  begin
    result := 0;
    for cnt := Low(fSQLArrayDockForm) to High(fSQLArrayDockForm) do begin
      if fSQLArrayDockForm[cnt].Caption = aCaption then begin
        DockingFormsInfo.theForm := fSQLArrayDockForm[cnt];
        result := cnt;
        Break;
      end;
    end;
  end;

  function TblStuff: Integer;
  var
    cnt: Integer;
  begin
    result := 0;
    for cnt := Low(fTblArrayDockForm) to High(fTblArrayDockForm) do begin
      if fTblArrayDockForm[cnt].Caption = aCaption then begin
        DockingFormsInfo.theForm := fTblArrayDockForm[cnt];
        result := cnt;
        break;
      end;
    end;
  end;

begin
  Result := -1;
  if not frm_NxToolsMain.Active then
    Exit;

  if AnsiPos('SQL', aCaption) > 0 then begin
    result := SQLStuff;
  end
  else begin
    result := TblStuff;
  end;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsChange(Sender: TObject);
begin
  FindDockedByCaption(pgc_DockedForms.ActivePage.Caption);
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is Tfrm_SQLView) or
            (Source.Control is Tfrm_TableView);

  if Accept then begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := pgc_DockedForms.ClientToScreen(Point(0, 0));
    ARect.BottomRight := pgc_DockedForms.ClientToScreen(
      Point(Self.ClientWidth div 3, pgc_DockedForms.Height));
    Source.DockRect := ARect;
  end;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsGetSiteInfo(Sender: TObject;
  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
  var CanDock: Boolean);
begin
  CanDock := SetDockingFormType(DockClient);
  if not CanDock then
    exit;

  lbl_ActiveForm.Caption := 'Active Form: ' + DockingFormsInfo.theForm.Caption;
  DockingFormsInfo.ActiveUndocked := false;
  DockingFormsInfo.ActiveIndex := DockingFormsInfo.theForm.Tag;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
begin
  if SetDockingFormType(Client) then begin
  end;
end;


procedure Tfrm_NxToolsMain.pgc_ToolsChange(Sender: TObject);
begin
  case pgc_ToolsCommands.activePageIndex of
    0: begin
      spltvw_ToolsCommands.Width := csvDatabaseWidth;
    end;
    //pgc_Tools
    1: begin
      if not(DockingFormsInfo.TypeDockForm = TSQLForm) or (DockingFormsInfo.NumSqlForms = -1) then
        pgc_ToolsCommands.ActivePageIndex := 0
      else
       spltvw_ToolsCommands.Width := csvSQLWidth;
    end;

    2: begin
      if not(DockingFormsInfo.TypeDockForm = TSQLForm) or (DockingFormsInfo.NumSqlForms = -1) then
       pgc_ToolsCommands.ActivePageIndex := 0
      else
       spltvw_ToolsCommands.Width := csvTableFieldsWidth;
    end;
  end;
end;


procedure Tfrm_NxToolsMain.PngSpeedButton1Click(Sender: TObject);
begin
  tv_AliasAndTables.FullCollapse;
end;


procedure Tfrm_NxToolsMain.fullexpandButton2Click(Sender: TObject);
begin
  tv_AliasAndTables.FullExpand;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    pgc_DockedForms.ActivePageIndex :=  pgc_DockedForms.IndexOfTabAt(x, Y);
end;


function Tfrm_NxToolsMain.SetDockingFormType(aControl: TControl): Boolean;
begin
  result := false;
  DockingFormsInfo.theForm := nil;

  if aControl is Tfrm_TableView then begin
    DockingFormsInfo.theForm := (aControl as Tfrm_TableView);
    result := true;
  end;

  if aControl is Tfrm_SQLView then begin
    DockingFormsInfo.theForm := (aControl as Tfrm_SQLView);
    result := true;
  end;
end;


procedure Tfrm_NxToolsMain.pbb_PreferencesClick(Sender: TObject);
begin
  if sv_Preferences.Opened then
    sv_Preferences.Close
  else begin
    sv_Preferences.Open;
    if ts_SetSplitViewActions.State = tssOff then
      spltvw_ToolsCommands.Opened := False;
      sv_ProjectInfo.Opened := False;
  end;
end;


procedure Tfrm_NxToolsMain.pbb_ProjectClick(Sender: TObject);
begin
  if sv_ProjectInfo.Opened then
    sv_ProjectInfo.Close
  else begin
    sv_ProjectInfo.Open;
    if ts_SetSplitViewActions.State = tssOff then  begin
      spltvw_ToolsCommands.Opened := False;
      sv_Preferences.Opened := False;
    end;
  end;
end;


procedure Tfrm_NxToolsMain.btn__SplitViewOpenCloseClick(Sender: TObject);
begin
  if spltvw_ToolsCommands.Opened then
    spltvw_ToolsCommands.Close
  else begin
    pgc_ToolsChange(sender);
    spltvw_ToolsCommands.Open;
    if ts_SetSplitViewActions.State = tssOff then  begin
      sv_Preferences.Opened := False;
      sv_ProjectInfo.Opened := False;
    end;
  end;
end;


procedure Tfrm_NxToolsMain.catpan_PreferenceExpand(Sender: TObject);
var
  cnt: Integer;
  pt, ptComponent: tPoint;
begin
  GetCursorPos(pt);
  ptComponent:= Point((Sender as TCategoryPanel).Left, (Sender as TCategoryPanel).top);
  for cnt := 1 to numCatPanels  do begin
    if ctgrypnl_Array[cnt].Name <> (Sender as TCategoryPanel).Name then
      ctgrypnl_Array[cnt].Collapsed := true;
  end;

  ptComponent := Point(ptComponent.x - (Sender as TCategoryPanel).Left,
                        ptComponent.y - (Sender as TCategoryPanel).Top);
  SetCursorPos(pt.x - ptComponent.x, pt.y - ptComponent.y);
end;

{ Floating Form stuff ===}
{ Floating Form stuff ===}
{ Floating Form stuff ===}

// Db Tools =====
function Tfrm_NxToolsMain.GetDatabaseToolsFF: TFloatingForm;
begin
  if fDatabaseToolsFF = nil then begin
    fDatabaseToolsFF := TFloatingForm.Create(self, ts_DatabaseTools, img_DBToolsUnDock, img_DBToolsDock);

    fDatabaseToolsFF.Visible := False;
    fDatabaseToolsFF.OnShowFloat := DatabaseToolsFFOnShowFloat;
    fDatabaseToolsFF.OnDestroyFloat := DatabaseToolsFFOnDestroyFloat;
    fDatabaseToolsFF.Caption := 'Database Tools';
  end;
  result := fDatabaseToolsFF;
end;


function Tfrm_NxToolsMain.GetJustPathAlias(aAlisPath: string): string;
var
  beginPos: Integer;
  endPos: integer;
begin
  beginPos := Pos('(', aAlisPath) + 1;
  endPos := Pos(')', aAlisPath);
  if beginPos > 0 then
    Result := Copy(aAlisPath, beginPos, endPos - beginPos) + '\'
  else
    Result := aAlisPath+'\';
end;


procedure Tfrm_NxToolsMain.DatabaseToolsFFOnDestroyFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    NxSQLViewerDataIniFile.WriteInteger('DatabaseToolsFF','Left', fDatabaseToolsFF.Left);
    NxSQLViewerDataIniFile.WriteInteger('DatabaseToolsFF', 'Top', fDatabaseToolsFF.Top);
    NxSQLViewerDataIniFile.WriteInteger('DatabaseToolsFF', 'Width', fDatabaseToolsFF.ClientWidth);
    NxSQLViewerDataIniFile.WriteInteger('DatabaseToolsFF', 'Height', fDatabaseToolsFF.ClientHeight);
  finally
    DestroyIniFile;
  end;
end;


procedure Tfrm_NxToolsMain.DatabaseToolsFFOnShowFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    fDatabaseToolsFF.Left         := NxSQLViewerDataIniFile.ReadInteger('DatabaseToolsFF', 'Left', 10);
    fDatabaseToolsFF.Top          := NxSQLViewerDataIniFile.ReadInteger('DatabaseToolsFF', 'Top', 10);
    fDatabaseToolsFF.ClientWidth  := NxSQLViewerDataIniFile.ReadInteger('DatabaseToolsFF', 'Width', 235);
    fDatabaseToolsFF.ClientHeight := NxSQLViewerDataIniFile.ReadInteger('DatabaseToolsFF', 'Height', 524);
  finally
    DestroyIniFile;
  end;
end;


procedure Tfrm_NxToolsMain.img_DBToolsUnDockClick(Sender: TObject);
begin
  DatabaseToolsFF.Float;
end;

procedure Tfrm_NxToolsMain.img_DBToolsDockClick(Sender: TObject);
begin
  Close;
  pgc_ToolsChange(Sender);
end;


// SQL Statements and functions  ====

function Tfrm_NxToolsMain.GetSQLCommandsFF: TFloatingForm;
begin
  if fSQLCommandsFF = nil then begin
    fSQLCommandsFF := TFloatingForm.Create(self, ts_SQLCommands, img_SQLTabUndockImage, img_SQLTabDockImage);

    fSQLCommandsFF.Visible := False;
    fSQLCommandsFF.OnShowFloat := SQLCommandsFFOnShowFloat;
    fSQLCommandsFF.OnDestroyFloat := SQLCommandsFFOnDestroyFloat;
    fSQLCommandsFF.Caption := 'SQL Statements and Functions';
  end;
  result := fSQLCommandsFF;
end;


procedure Tfrm_NxToolsMain.SQLCommandsFFOnDestroyFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    NxSQLViewerDataIniFile.WriteInteger('SQLCommandsFF', 'Left', fSQLCommandsFF.Left);
    NxSQLViewerDataIniFile.WriteInteger('SQLCommandsFF', 'Top', fSQLCommandsFF.Top);
    NxSQLViewerDataIniFile.WriteInteger('SQLCommandsFF', 'Width', fSQLCommandsFF.ClientWidth);
    NxSQLViewerDataIniFile.WriteInteger('SQLCommandsFF', 'Height', fSQLCommandsFF.ClientHeight);
  finally
    DestroyIniFile;
  end;
end;


procedure Tfrm_NxToolsMain.SQLCommandsFFOnShowFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    fSQLCommandsFF.Left         := NxSQLViewerDataIniFile.ReadInteger('SQLCommandsFF', 'Left', 10);
    fSQLCommandsFF.Top          := NxSQLViewerDataIniFile.ReadInteger('SQLCommandsFF', 'Top', 10);
    fSQLCommandsFF.ClientWidth  := NxSQLViewerDataIniFile.ReadInteger('SQLCommandsFF', 'Width', 207);
    fSQLCommandsFF.ClientHeight := NxSQLViewerDataIniFile.ReadInteger('SQLCommandsFF', 'Height', 475);
  finally
    DestroyIniFile;
  end;
end;



procedure Tfrm_NxToolsMain.img_SQLTabUndockImageClick(Sender: TObject);
begin
  SQLCommandsFF.Float;
  pgc_ToolsChange(Sender);
end;


procedure Tfrm_NxToolsMain.img_SQLTabDockImageClick(Sender: TObject);
begin
  Close;
  pgc_ToolsChange(Sender);
end;


// Table Field Tools  =

function Tfrm_NxToolsMain.GetTableFieldToolsFF: TFloatingForm;
begin
  if fTableFieldToolsFF = nil then begin
    fTableFieldToolsFF := TFloatingForm.Create(self, ts_TablesAndFieldsTools, img_TableFieldToolsUndocked, img_TableFieldToolsDocked);

    fTableFieldToolsFF.Visible := False;
    fTableFieldToolsFF.OnShowFloat := TableFieldToolsFFOnShowFloat;
    fTableFieldToolsFF.OnDestroyFloat := TableFieldToolsFFOnDestroyFloat;
    fTableFieldToolsFF.Caption := 'Table and Field Tools';
  end;
  result := fTableFieldToolsFF;
end;


procedure Tfrm_NxToolsMain.TableFieldToolsFFOnDestroyFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    NxSQLViewerDataIniFile.WriteInteger('TableFieldToolsFF','Left', fTableFieldToolsFF.Left);
    NxSQLViewerDataIniFile.WriteInteger('TableFieldToolsFF', 'Top', fTableFieldToolsFF.Top);
    NxSQLViewerDataIniFile.WriteInteger('TableFieldToolsFF', 'Width', fTableFieldToolsFF.ClientWidth);
    NxSQLViewerDataIniFile.WriteInteger('TableFieldToolsFF', 'Height', fTableFieldToolsFF.ClientHeight);
  finally
    DestroyIniFile;
  end;
end;


procedure Tfrm_NxToolsMain.TableFieldToolsFFOnShowFloat(Sender: TObject);
begin
  CreateIniFile;
  try
    fTableFieldToolsFF.Left         := NxSQLViewerDataIniFile.ReadInteger('TableFieldToolsFF', 'Left', 10);
    fTableFieldToolsFF.Top          := NxSQLViewerDataIniFile.ReadInteger('TableFieldToolsFF', 'Top', 10);
    fTableFieldToolsFF.ClientWidth  := NxSQLViewerDataIniFile.ReadInteger('TableFieldToolsFF', 'Width', 235);
    fTableFieldToolsFF.ClientHeight := NxSQLViewerDataIniFile.ReadInteger('TableFieldToolsFF', 'Height', 524);
  finally
    DestroyIniFile;
  end;
end;


procedure Tfrm_NxToolsMain.TurnOffSQLStuff;
begin
  pgc_ToolsCommands.ActivePageIndex := 0;
end;


procedure Tfrm_NxToolsMain.act_CollapseTreeExecute(Sender: TObject);
begin
  tv_AliasAndTables.FullCollapse;
  act_ExpandTree.Visible := true;
  act_CollapseTree.Visible := False;
end;


procedure Tfrm_NxToolsMain.act_CollapseTreeTFExecute(Sender: TObject);
begin
  tv_TablesAndFields.FullCollapse;
  act_ExpandTreeTF.Visible := true;
  act_CollapseTreeTF.Visible := False;
end;

procedure Tfrm_NxToolsMain.act_ExpandTreeExecute(Sender: TObject);
begin
  tv_AliasAndTables.FullExpand;
  act_ExpandTree.Visible := false;
  act_CollapseTree.Visible := true;
end;

procedure Tfrm_NxToolsMain.act_ExpandTreeTFExecute(Sender: TObject);
begin
  tv_TablesAndFields.FullExpand;
  act_ExpandTreeTF.Visible := false;
  act_CollapseTreeTF.Visible := true;
end;


procedure Tfrm_NxToolsMain.img_TableFieldToolsUndockedClick(Sender: TObject);
begin
  TableFieldToolsFF.Float;
  pgc_ToolsChange(Sender);
end;


procedure Tfrm_NxToolsMain.img_TableFieldToolsDockedClick(Sender: TObject);
begin
  Close;
  pgc_ToolsChange(Sender);
end;


// General function ===
procedure Tfrm_NxToolsMain.FreeSQLandTableForms;
var
  index: Cardinal;
begin
  // first sql
  if length(fSQLArrayDockForm) > 0 then
    for index := Low(fSQLArrayDockForm) to High(fSQLArrayDockForm) do
      DeleteSQLX(0);

  if length(fTblArrayDockForm) > 0 then
    for index := Low(fTblArrayDockForm) to High(fTblArrayDockForm) do
      DeleteTblX(0);
end;


procedure Tfrm_NxToolsMain.DeleteSQLX(const Index: Cardinal);
var
  ALength: Cardinal;
  i: Cardinal;
  WasItFloat: boolean;
  fIndex: Integer;
begin
  fIndex := DockingFormsInfo.ActiveIndex;
  WasItFloat := fSQLArrayDockForm[fIndex].Floating;

  ALength := Length(fSQLArrayDockForm);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do begin
    fSQLArrayDockForm[i].tag := fSQLArrayDockForm[i].tag - 1;
    fSQLArrayDockForm[i - 1] := fSQLArrayDockForm[i];
  end;
  SetLength(fSQLArrayDockForm, ALength - 1);
  dec(DockingFormsInfo.NumSqlForms);

  ts_TablesAndFieldsTools.Enabled := DockingFormsInfo.NumSqlForms > -1;
  ts_SQLCommands.Enabled := DockingFormsInfo.NumSqlForms > -1;
  SetActiveFormOnDelete(WasItFloat);

  SetMemoryUsageLabel;
end;


procedure Tfrm_NxToolsMain.DeleteTblX(const Index: Cardinal);
var
  ALength: Cardinal;
  i: Cardinal;
  WasItFloat: boolean;
begin
  WasItFloat := fTblArrayDockForm[DockingFormsInfo.ActiveIndex].Floating;

  ALength := Length(fTblArrayDockForm);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do begin
    fTblArrayDockForm[i].tag := fTblArrayDockForm[i].tag - 1;
    fTblArrayDockForm[i - 1] := fTblArrayDockForm[i];
  end;
  SetLength(fTblArrayDockForm, ALength - 1);
  dec(DockingFormsInfo.NumTblForms);

  SetActiveFormOnDelete(WasItFloat);

  SetMemoryUsageLabel;
end;


procedure Tfrm_NxToolsMain.SetActiveFormOnDelete(WasItFloat: boolean);
begin
  if WasItFloat then

  if pgc_DockedForms.ActivePageIndex > -1 then begin
    pgc_DockedForms.ActivePageIndex := 0;
  end;
end;


{ Actions Form stuff ===}
{ Actions Form stuff ===}
{ Actions Form stuff ===}

//====== Transports ===

procedure Tfrm_NxToolsMain.btn_CloseProgramClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_NxToolsMain.CreateSQLWindow(aNode: tTreeNode);

  procedure FillTableFunctionsNames;
  begin
    try
//      pRootNodeDb(aNode.Data)^.DataBase.open;
      fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].nxQuery.Database :=
                                              pRootNodeDb(aNode.Data)^.DataBase;
      fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].nxtbl_MasterTable.Database :=
                                              pRootNodeDb(aNode.Data)^.DataBase;

      pRootNodeDb(aNode.Data)^.DataBase.GetTableNames(
          fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.TableNames);

//      fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.TableNames.Assign(
      with  dm_DataMod do begin
        NxSqlButtonsDbT.First;
        while NxSqlButtonsDbT.eof do begin
          if NxSqlButtonsDbTAddToEditorFunctionList.AsBoolean then
            fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.FunctionNames.Add(NxSqlButtonsDbTCaption.AsString);

          NxSqlButtonsDbT.next;
        end;
      end;
    except
      on E : Exception do  begin
        MessageDlg('msg 1890-Could NOT open Database.'+#13+#10+E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  end;


  procedure SetEditorFonts;
  begin
    //KeyAttri
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.KeyAttri.Background :=
                             fSqlEditorFonts[sftStatements].FontStuff.BackColor;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.KeyAttri.Foreground :=
                                 fSqlEditorFonts[sftStatements].FontStuff.Color;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.KeyAttri.Style      :=
                                 fSqlEditorFonts[sftStatements].FontStuff.Style;
    // comment attri
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.CommentAttri.Background :=
                               fSqlEditorFonts[sftComments].FontStuff.BackColor;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.CommentAttri.Foreground :=
                                   fSqlEditorFonts[sftComments].FontStuff.Color;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.CommentAttri.Style      :=
                                   fSqlEditorFonts[sftComments].FontStuff.Style;
    //Numeric
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.NumberAttri.Background :=
                                fSqlEditorFonts[sftNumeric].FontStuff.BackColor;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.NumberAttri.Foreground :=
                                    fSqlEditorFonts[sftNumeric].FontStuff.Color;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.NumberAttri.Style      :=
                                    fSqlEditorFonts[sftNumeric].FontStuff.Style;
    //Editor font
//    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].synm_SQLEditor.Font.Color :=
//                                     fSqlEditorFonts[sftEditor].FontStuff.Color;
//    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].synm_SQLEditor.Font.Style :=
//                                     fSqlEditorFonts[sftEditor].FontStuff.Style;
    // Table names
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.TableNameAttri.Background :=
                                 fSqlEditorFonts[sftTables].FontStuff.BackColor;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.TableNameAttri.Foreground :=
                                     fSqlEditorFonts[sftTables].FontStuff.Color;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.TableNameAttri.Style      :=
                                     fSqlEditorFonts[sftTables].FontStuff.Style;
    // functions
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.FunctionAttri.Background :=
                              fSqlEditorFonts[sftFunctions].FontStuff.BackColor;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.FunctionAttri.Foreground :=
                                  fSqlEditorFonts[sftFunctions].FontStuff.Color;
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].SynSQLSyn.FunctionAttri.Style      :=
                                  fSqlEditorFonts[sftFunctions].FontStuff.Style;
  end;

begin
{$IFDEF DEBUG}
  showmessage('msg 1943-b. InSQL: ' + aNode.Text);
{$ENDIF}
  inc(DockingFormsInfo.NumSqlForms);
  SetLength(fSQLArrayDockForm, DockingFormsInfo.NumSqlForms+1);
  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms] := Tfrm_SQLView.Create(Nil);

  inc(DockingFormsInfo.SqlformNumbering);

  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].NodeDbIndex := aNode.AbsoluteIndex;
  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].Caption := 'SQL-' + IntToStr(DockingFormsInfo.SqlformNumbering);
  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].tag := DockingFormsInfo.NumSqlForms;
  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].PrjPath := String(fProjectInfo.PrjPath);
  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].PasFileSaveLoc := String(fProjectInfo.PasFileSaveLoc);

  DockingFormsInfo.ActiveIndex := DockingFormsInfo.NumSqlForms;

  // set fonts
  SetEditorFonts;
  FillTableFunctionsNames;

  fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].Show;

  if chk_ManualDock.Checked then begin
    fSQLArrayDockForm[DockingFormsInfo.NumSqlForms].ManualDock(pgc_DockedForms);
    pgc_DockedForms.ActivePageIndex := pgc_DockedForms.PageCount - 1;
  end;

  ts_TablesAndFieldsTools.Enabled := DockingFormsInfo.NumSqlForms > -1;
  ts_SQLCommands.Enabled := DockingFormsInfo.NumSqlForms > -1;

  SetMemoryUsageLabel;
end;


procedure Tfrm_NxToolsMain.act_CreateSQLWindowExecute(Sender: TObject);  //fix
var
  rNode: tTreeNode;
begin
  rNode := tv_AliasAndTables.selected;
  if rNode.Level = 1 then
    rNode := rNode.Parent;
{$IFDEF DEBUG}
  showmessage('msg 1985-a. In Create SQL: '+rNode.text);
{$ENDIF}
  CreateSQLWindow(rNode);
  SetupTreeViewTableFields(rNode);
end;


procedure Tfrm_NxToolsMain.act_CreateSQLWindowUpdate(Sender: TObject);
var
  rNode: tTreeNode;
begin
  if tv_AliasAndTables.SelectionCount > 0 then begin
    rNode := tv_AliasAndTables.selected;
    if rNode.Level = 1 then
      rNode := rNode.Parent;

    if rNode.HasChildren then begin
//      fProjectInfo.Node := rNode;
//      jvxpbtn_CreateSQLWindow.Font.Color := clGreen;
      act_CreateSQLWindow.Enabled := true;
    end
    else
      act_CreateSQLWindow.Enabled := false;
  end
  else
    act_CreateSQLWindow.Enabled := false;
end;


procedure Tfrm_NxToolsMain.setEnableTransportBtns(theEnabled: Boolean);
begin
  act_NxDbTcpIpTrans.Enabled := theEnabled;
  act_NxDbNamedPipeTrans.Enabled := theEnabled;
  act_LocalServer.Enabled := theEnabled;
end;


procedure Tfrm_NxToolsMain.act_SetDbDefualtExecute(Sender: TObject);
var
  aSelNode: tTreeNode;
begin
  act_SetTransDefault.Execute;
  act_SetServerDefault.Execute;
  aSelNode := tv_AliasAndTables.selected;
  if aSelNode <> nil then
    fProjectInfo.Alias := tstr95(aSelNode.Text)
  else
    MessageDlg('msg 2047-Could NOT find Database from the Database tree!', mtWarning, [mbOK], 0);
end;

procedure Tfrm_NxToolsMain.act_SetDbDefualtUpdate(Sender: TObject);
begin
//  act_SetDbDefualt.Enabled := tv_AliasAndTables.SelectedCount > 0;
end;

procedure Tfrm_NxToolsMain.act_SetServerDefaultExecute(Sender: TObject);
begin
  if lst_ServerListBox.ItemIndex > -1 then begin
    act_SetTransDefault.Execute;
    fProjectInfo.Server := tstr45(lst_ServerListBox.Items[lst_ServerListBox.ItemIndex]);
  end
  else
    MessageDlg('msg 2061-Could NOT Select server Due to no Server Being Selected.', mtWarning, [mbOK], 0);
end;


procedure Tfrm_NxToolsMain.act_SetServerDefaultUpdate(Sender: TObject);
begin
  act_SetServerDefault.Enabled := lst_ServerListBox.ItemIndex > -1;
end;

procedure Tfrm_NxToolsMain.act_SetToDefaultPrjExecute(Sender: TObject);
begin
  fProjectInfo.ActiveTrans := fProjectInfo.Transport;
  fProjectInfo.ActiveServer := fProjectInfo.Server;
  fProjectInfo.ActiveDb := fProjectInfo.Alias;
  GetProject(false);
end;

procedure Tfrm_NxToolsMain.act_SetTransDefaultExecute(Sender: TObject);
begin
  fProjectInfo.Transport := tranWinSock;
end;


procedure Tfrm_NxToolsMain.act_ShowPasswordExecute(Sender: TObject);
begin
  act_ShowPassword.Checked := not act_ShowPassword.Checked;
end;


procedure Tfrm_NxToolsMain.act_DbPasswordExecute(Sender: TObject);
const
  aPromptChecked = 'Enter Password: ';
  aPromptUnchecked = #31'Enter Password: ';
var
  fPassword: string;
  fPrompt  : string;
begin
  if act_ShowPassword.checked then
    fPrompt := aPromptChecked
  else
    fPrompt := aPromptUnchecked;

  if inputQuery('Database Password', fPrompt, fPassword) then begin
    fProjectInfo.DBPassWord := ShortString(lblwfsh1.EncryptString(string(fPassword)));
//    WriteProjectSetup(fProjectInfo);
  end
  else
    fProjectInfo.DBPassWord := '';
end;


procedure Tfrm_NxToolsMain.act_DbPasswordUpdate(Sender: TObject); //fix
begin
//  act_DbPassword.Enabled := lst_AliasListBox.ItemIndex > -1;
end;


procedure Tfrm_NxToolsMain.act_ManageProjectsExecute(Sender: TObject);
begin
  GetProject(true);
end;


//==============================================================================
//==============================================================================
//==============================================================================

function Tfrm_NxToolsMain.SetServerTransport: TTransportUsed;

  procedure CheckIfTransportsAreOpened;
  begin
    if dm_DataMod.nxWinsockTransport.Active then
     dm_DataMod. nxWinsockTransport.Close;

    if dm_DataMod.nxNamedPipeTransport.Active then
     dm_DataMod. nxNamedPipeTransport.Close;
  end;

  procedure ifWinSock;
  begin
    try
      dm_DataMod.nxWinsockTransport.ServerNameRuntime := lst_ServerListBox.Items[lst_ServerListBox.ItemIndex];
      dm_DataMod.nxWinsockTransport.ServerName := lst_ServerListBox.Items[lst_ServerListBox.ItemIndex];
      dm_DataMod.nxWinsockTransport.Open;
      result := tranWinSock;
    except
      on E : Exception do
        begin
          ShowMessage('Msg:2150-Error Setting WinSock Transport'+#10+#13+E.Message);
        end;
    end;
  end;

  procedure ifNamedPipe;
  begin
    try
      dm_DataMod.nxNamedPipeTransport.ServerNameRuntime := lst_ServerListBox.Items[lst_ServerListBox.ItemIndex];
      dm_DataMod.nxNamedPipeTransport.ServerName := lst_ServerListBox.Items[lst_ServerListBox.ItemIndex];
      dm_DataMod.nxNamedPipeTransport.Open;
      result := tranNamePipe;
    except
      on E : Exception do
        begin
          ShowMessage('Msg:2165-Error Setting Named Pipe Transport'+#10+#13+E.Message);
        end;
    end;
  end;

  procedure ifLocalServer;
  begin
    dm_DataMod.nxSession.ServerEngine := dm_DataMod.nxsrvrngn_Local;
//    dm_DataMod.nxSession.Open;
    result := tranLocalServer;
  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetServerTransport' );{$ENDIF}
  setEnableTransportBtns(False);
  result := tranNone;
  dm_DataMod.nxSession.Close;
  dm_DataMod.nxDatabase.Close;
  dm_DataMod.nxDatabase.AliasName := '';
  dm_DataMod.nxDatabase.AliasPath := '';

  try
    dm_DataMod.nxSession.Close;

    CheckIfTransportsAreOpened;

    if btn_TcpIp.Down then
      ifWinSock;

    if btn_NamedPipe.Down then
      ifNamedPipe;

    if btn_LocalServer.Down then
      ifLocalServer;
  except
    result := tranError;
    MessageDlg('Msg 2201-Error Setting up Transport!', mtError, [mbOK], 0);
  end;
  setEnableTransportBtns(true);
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetServerTransport' );{$ENDIF}
end; // set transport


procedure Tfrm_NxToolsMain.SetAlias(var aDataBase: TnxDatabase);   //fix
var
  aAlias, aPath: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetAlias' );{$ENDIF}


    aDatabase.Close;
    aDatabase.AliasName := '';
    aDatabase.AliasPath := '';

    if fProjectInfo.Transport = tranLocalServer then begin
      if ExtractAliasAndPath(String(fProjectInfo.ActiveDb), aAlias, aPath) then
        MessageDlg('msg 2221-Could NOT extract Alias and Path', mtError, [mbOK],0);
      aDatabase.AliasPath := aPath;
      aDatabase.Session := dm_DataMod.nxsn_SqlTools;
    end
    else begin
      aDatabase.AliasName := String(fProjectInfo.Alias);  //stsbrpr_StatusBar.Panels[Ord(spoAlias)].Text;
      aDatabase.Session := dm_DataMod.nxSession;
    end;

    try
      aDatabase.Open;
      stsbrpr_StatusBar.Panels[ord(spoDbStatus)].Color := clGreen;
      stsbrpr_StatusBar.Panels[ord(spoDbStatus)].Text := 'Database Opened';

      if fProjectInfo.Transport <> tranLocalServer then
        fProjectInfo.ActiveDb := ShortString(aDatabase.AliasName)
      else
        fProjectInfo.ActiveDb := ShortString(aDatabase.AliasPath);

    except
      on E : Exception do
        begin
          ShowMessage('Msg 2243-Could not Open Db:'+#10+#13+ 'Exception message = '+E.Message);
          stsbrpr_StatusBar.Panels[Ord(spoDbStatus)].Color := clRed;
          stsbrpr_StatusBar.Panels[Ord(spoDbStatus)].Text := 'Error Openning Database';
          exit;
        end;
    end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetAlias' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.SetServer;  // only for named pipe and winsock
var
  tranResult: TTransportUsed;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetServer' );{$ENDIF}
  tranResult := SetServerTransport;
  if tranResult in [tranError, tranNone] then begin
    fProjectInfo.Transport := tranResult;
    MessageDlg('msg 2261-Could NOT open a transport!', mtError, [mbOK], 0);
    Exit;
  end;
  try
//    fProjectInfo.Alias := '';

    case fProjectInfo.Transport of
      tranWinSock,
      tranNamePipe: begin
        dm_DataMod.nxRemoteServerEngine.Open;
        dm_DataMod.nxSession.Open;
      end;

      tranLocalServer: begin
        dm_DataMod.nxsqlngn_Local.Open;
        dm_DataMod.nxSession.Open;
      end;

      else begin
        Exit;
      end;
    end;
//    SetAlias;
    if lst_ServerListBox.ItemIndex > -1 then
      fProjectInfo.ActiveServer := ShortString(lst_ServerListBox.Items[lst_ServerListBox.ItemIndex])
    else
      fProjectInfo.ActiveServer := '';
  except
    on E : Exception do
      begin
        ShowMessage('Msg 2291-Could not Open Server engine:' + #13+#10+ E.Message);
      end;
  end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetServer' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.lst_ServerListBox1Click(Sender: TObject);
begin
  if (length(fSQLArrayDockForm) > 0) or (length(fTblArrayDockForm) > 0) then
    if (MessageDlg('Changing Servers will close all opened sql and table forms.'+#13+#10+
                   'Continue?', mtWarning, [mbYes, mbNo], 0) in [mrYes, mrNone]) then begin
      SaveSqlFormEditors;
      FreeSQLandTableForms;
    end;

  FreeTreeDataDbs;
  SetServer;
  SetupTreeViewAliasTables;
 end;


procedure Tfrm_NxToolsMain.lst_ServerListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  lst_ServerListBox.Canvas.TextRect(Rect, 27, Rect.Top, lst_ServerListBox.Items[index]);
  il_AppImages.Draw(lst_ServerListBox.Canvas, 0, Rect.Top-5, 16);
end;

// click the transport buttons  ================================================

procedure Tfrm_NxToolsMain.act_LocalServerExecute(Sender: TObject);
begin
  fProjectInfo.ActiveTrans := tranLocalServer; // this triggers ontranportchange

  if fLocalAliasPaths = nil then
    fLocalAliasPaths := TStringList.Create
  else
    fLocalAliasPaths.Clear;

  setEnableTransportBtns(False);

  try
    try
      if FileExists(LocalServerAliasesPath) then begin
        fLocalAliasPaths.LoadFromFile(LocalServerAliasesPath)
      end
      else
        MessageDlg('msg 2381-The local db path file does not exist.', mtWarning, [mbOK], 0);
    except
      MessageDlg('msg 2383-No Saved Local Db''s to open.'+#13+'Add a local Db using the File Menu', mtError, [mbOk],0);
    end;
  finally
    btn_LocalServer.Down := True;
    lst_ServerListBox1Click(Sender);
    setEnableTransportBtns(true);
    SetMemoryUsageLabel;
  end;
end;


procedure Tfrm_NxToolsMain.act_LocalServerUpdate(Sender: TObject);  //fix
begin
  act_AddAliasPath.Enabled := fProjectInfo.Transport = tranLocalServer;   // menu item
//  act_RemoveAliasPath.Enabled := (fProjectInfo.Transport = tranLocalServer) and  // menu item
//                                 (lst_AliasListBox.Count > 0);

//  act_LocalServer.Enabled := fProjectInfo.PrjName <> '';
  lst_ServerListBox.Enabled := fProjectInfo.Transport <> tranLocalServer;

//  lbl_AliasPath.caption := CaptionBaseBoolean('Select Alias (right click for options):',
//                                              'Select Alias  Path (right click for options):',
//                                              fProjectInfo.Transport <> tranLocalServer);
end;


procedure Tfrm_NxToolsMain.act_NxDbNamedPipeTransExecute(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  try
    fProjectInfo.ActiveTrans := tranNamePipe;  // this triggers ontranportchange

    setEnableTransportBtns(False);

    dm_DataMod.nxRemoteServerEngine.Transport :=  dm_DataMod.nxNamedPipeTransport;
    dm_DataMod.nxSession.ServerEngine := dm_DataMod.nxRemoteServerEngine;
    dm_DataMod.nxNamedPipeTransport.GetServerNames(lst_ServerListBox.Items, 5000);
    setEnableTransportBtns(true);

    SetMemoryUsageLabel;
  finally
    btn_NamedPipe.Down := True;
    screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_NxToolsMain.act_NxDbTcpIpTransExecute(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  fProjectInfo.ActiveTrans := tranWinSock; // this triggers ontranportchange
  try
    setEnableTransportBtns(False);
    dm_DataMod.nxRemoteServerEngine.Transport :=  dm_DataMod.nxWinsockTransport;
    dm_DataMod.nxWinsockTransport.GetServerNames(lst_ServerListBox.Items, 5000);
    dm_DataMod.nxSession.ServerEngine := dm_DataMod.nxRemoteServerEngine;

    setEnableTransportBtns(true);

    SetMemoryUsageLabel;

  finally
    btn_TcpIp.Down := True;
    screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_NxToolsMain.act_NxDbTcpIpTransUpdate(Sender: TObject);
begin
end;

//  End click transport button ==================================================


procedure Tfrm_NxToolsMain.act_OpenSqlFunctionsPanelExecute(Sender: TObject);
begin
  ts_SqlStatement.Visible := false;
  ts_SQLFunctions.Align := alClient;
  ts_SQLFunctions.Visible := true;
end;


procedure Tfrm_NxToolsMain.act_OpenSqlStatementsPanelExecute(Sender: TObject);
begin
  ts_SQLFunctions.Visible := false;
  ts_SqlStatement.Align := alClient;
  ts_SqlStatement.Visible := true;
end;


procedure Tfrm_NxToolsMain.ClearTree;
var
  AAindex: Integer;
begin
  tv_AliasAndTables.Items.BeginUpdate;
  for AAindex := tv_AliasAndTables.Items.Count - 1 downto 0 do begin
    if tv_AliasAndTables.Items[AAindex].Level <> 1 then
      tv_AliasAndTables.Items[AAindex].Delete;
  end;
  tv_AliasAndTables.Items.EndUpdate;
end;


procedure Tfrm_NxToolsMain.SetupTreeViewAliasTables;
type
  tPassCodeStatus = (pcsOk, pcsNotOk, pscGiveUp);
var
  fTables: TStringList;
  fAlias: TStringList;
  AAIndex:Integer;
  Aindex: Integer;
  TIndex: Integer;
  rNode : TTreeNode;
  cNode : TTreeNode;
//  PassCodeNeed: tPassCodeStatus;
  rNodeObjectPtr: pRootNodeDb;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetupTreeViewAliasTables' );{$ENDIF}
  AAIndex := 0;
  act_ExpandTree.Visible := true;
  act_CollapseTree.Visible := false;
  ClearTree;
  fAlias := TStringList.Create;
  fTables := TStringList.Create;

//  if True then


  if fProjectInfo.Transport <> tranLocalServer then begin
    try
      if not dm_DataMod.nxSession.Active then
        dm_DataMod.nxSession.Open;

      dm_DataMod.nxSession.GetAliasNames(fAlias);
    except
      MessageDlg('msg 2474-Could NOT Open Db Session!', mtError, [mbOK], 0);
      Exit;
    end;
  end
  else
    fAlias.assign(fLocalAliasPaths);

  tv_AliasAndTables.Items.BeginUpdate;
  try
    try
      for Aindex := 0 to fAlias.Count -1 do begin
        new(rNodeObjectPtr);
        rNodeObjectPtr^.DataBase := TnxDatabase.Create(nil);

        rNodeObjectPtr^.DataBase.Session := dm_DataMod.nxSession;
        if fProjectInfo.Transport = tranLocalServer then begin
          rNodeObjectPtr^.DataBase.AliasPath := GetJustPathAlias(fAlias[Aindex]);
        end
        else
          rNodeObjectPtr^.DataBase.AliasName := fAlias[Aindex];

        try
          rNodeObjectPtr^.DataBase.Open;
          rNodeObjectPtr^.DataBase.GetTableNames(fTables);
        except
          on E : Exception do
          begin
            fTables.Clear;
          end;
        end;

        rNode := tv_AliasAndTables.Items.AddObject(nil, fAlias[Aindex], rNodeObjectPtr);
        if (fAlias[Aindex] = String(fProjectInfo.Alias)) and
           (fProjectInfo.ActiveServer = fProjectInfo.Server) then begin
          rNode.ImageIndex    := 19;//now you can change any  property of the node
          rNode.SelectedIndex := 19;//now you can change any  property of the node
          rNode.StateIndex    := -1;//now you can change any  property of the node
        end
        Else begin
          rNode.ImageIndex := 0;//now you can change any  property of the node
          rNode.SelectedIndex := 0;//now you can change any  property of the node
          rNode.StateIndex := -1;//now you can change any  property of the node
        end;
        rNode.Selected := True;
        for TIndex := 0 to fTables.Count -1 do begin
          if tv_AliasAndTables.Selected  = nil then
            exit;
          cNode := tv_AliasAndTables.Items.AddChild(tv_AliasAndTables.Selected,fTables[TIndex]) ;
          cNode.ImageIndex := 9;//now you can change any property of the node
          cNode.SelectedIndex := 9;//now you can change any property of the node
          cNode.StateIndex := -1;//now you can change any property of the node
        end;
        AAIndex := AIndex;
      end;
    finally
      fTables.Free;
      fAlias.Free;
    end;
  except
    on E : Exception do
      begin
        ShowMessage('Msg 2534-Could NOT open Alias and Tables:'+#13+#10+
                    fAlias[AAIndex] +#10+#13+E.Message);
        ClearTree;
      end;
  end;
  tv_AliasAndTables.Items.EndUpdate;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetupTreeViewAliasTables' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.SetupTreeViewTableFields(aNode: tTreeNode);
type
  tPassCodeStatus = (pcsOk, pcsNotOk, pscGiveUp);
var
  fTables: TStringList;
  fFields: TStringList;
  Tindex: Integer;
  FIndex: Integer;
  rNode : TTreeNode;
  cNode : TTreeNode;

  procedure ClearTree;
  var
    tIndex: Integer;
  begin
    tv_TablesAndFields.Items.BeginUpdate;
    for Tindex := tv_TablesAndFields.Items.Count - 1 downto 0 do begin
      if tv_TablesAndFields.Items[Tindex].Level <> 1 then
        tv_TablesAndFields.Items[Tindex].Delete;
    end;
    tv_TablesAndFields.Items.EndUpdate;
  end;


  function CheckPassword(fTableName: string): tPassCodeStatus;
  var
    fPos: Integer;
    value: string;
  begin
    result := pcsOk;
    repeat
      try
        value := '';
//        Result := pcsOk;
        dm_DataMod.nxTable.Open;
      except
        on E : Exception do
          begin
            fPos := AnsiPos('Invalid password given', E.Message);
            if fPos > 0 then begin
              Result := pcsNotOk;
              if not InputQuery('Password', 'Type table: '+QuotedStr(fTableName)+ ' password.', value) then
                Result := pscGiveUp
              else
                dm_DataMod.nxTable.Password  := value;
            end
            else begin
              Result := pscGiveUp;
              ShowMessage('Msg 2593-Exception message = '+E.Message);
            end;
          end;
      end;
    until result in [pcsOk, pscGiveUp];

    if (result = pcsOk) {and (dm_DataMod.nxTable.Password <> '')} then  begin
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
        dm_DataMod.nxtbl_NxDbSqlToolsPrjsDbPassWord.AsString := dm_DataMod.nxTable.Password;
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
    end;
  end;

begin
  if aNode  = nil then begin
    MessageDlg('msg 2610-No Database Selected.  Select Db and try again.', mtWarning, [mbOK], 0);
    Exit;
  end;

  ClearTree;     //Nodes.Clear;
  fTables := TStringList.Create;
  fFields := TStringList.Create;
  tv_TablesAndFields.Items.BeginUpdate;

  dm_DataMod.nxTable.Database := pRootNodeDb(aNode.Data)^.DataBase;
  pRootNodeDb(aNode.Data)^.DataBase.GetTableNames(fTables);
  try
    try
      for Tindex := 0 to fTables.Count -1 do begin
        dm_DataMod.nxTable.TableName := fTables[Tindex];
        if CheckPassword(fTables[Tindex]) = pcsOk then begin
          dm_DataMod.nxTable.Fields.GetFieldNames(fFields);
          rNode := tv_TablesAndFields.Items.Add(nil,fTables[Tindex]) ;
          rNode.ImageIndex := 0;//now you can change any  property of the node
          rNode.Selected := True;
          for fIndex := 0 to fFields.Count -1 do begin
            if tv_TablesAndFields.Selected  = nil then
              exit;
            cNode:=tv_TablesAndFields.Items.AddChild(tv_TablesAndFields.Selected,fFields[Findex]) ;
            cNode.ImageIndex:=0;//now you can change any property of the node
          end;
          dm_DataMod.nxTable.Close;
        end
        else begin
          MessageDlg('Msg 2639-Errror Openning db table: '+ QuotedStr(fTables[Tindex]) +' Tables and Fields are not ready.',
                     mtWarning, [mbOK], 0);
          Break;
        end;
      end;
    finally
      fTables.Free;
      fFields.Free;
    end;
  except
    on E : Exception do
      begin
        ShowMessage('Msg 2651-Could NOT open tables for Tables and Field Tab'+#10+#13+E.Message);
        ClearTree;
      end;
  end;
  tv_TablesAndFields.Items.EndUpdate;
end;


procedure Tfrm_NxToolsMain.spltvw_ToolsCommandsOpening(Sender: TObject);
begin
  if not fFormShowing then
    if not SetDb(tv_AliasAndTables, String(fProjectInfo.Alias)) then
      MessageDlg('msg 2641-Database NOT found in Database tree!', mtWarning, [mbOK], 0);
  fFormShowing := false;
end;


{ ListBox Form stuff ===}
{ ListBox Form stuff ===}
{ ListBox Form stuff ===}

procedure Tfrm_NxToolsMain.tv_AliasAndTablesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  HT : THitTests;
  rNode: TTreeNode;
  pNode: TTreeNode;

  procedure SetIcon(aNode: TTreeNode);
  begin

    if aNode.text = String(fProjectInfo.Alias) then
      aNode.ImageIndex := 19//now you can change any  property of the node
    Else
      aNode.ImageIndex := 0;//now you can change any  property of the node

  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'tv_AliasAndTablesMouseDown' );{$ENDIF}
  HT := tv_AliasAndTables.GetHitTestInfoAt(x,y);
  if (htOnItem in HT) then  begin
    rNode := tv_AliasAndTables.GetNodeAt(x,y);
    if rNode.Level = 1 then begin
      pNode := rNode.parent;
      fProjectInfo.ActiveDb := tStr95(pNode.Text);
      fProjectInfo.Table := tStr25(rNode.Text);
      fProjectInfo.Node := pNode;

    {$IFDEF DEBUG}
      showmessage('msg 2700. In MouseDown: '+pNode.Text);
    {$ENDIF}
      Create_TablesView(pNode, rNode.Text);
    end
    else begin
      fProjectInfo.ActiveDb := tStr95(rNode.text);
      fProjectInfo.Node := rNode;
    end;
  end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'tv_AliasAndTablesMouseDown' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.tv_TablesAndFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  HT : THitTests;
  rNode: TTreeNode;
  pNode: TTreeNode;
begin
  HT := tv_TablesAndFields.GetHitTestInfoAt(x,y);
  if (htOnItem in HT) then  begin
    rNode := tv_TablesAndFields.GetNodeAt(x,y);
    if rNode.Level = 1 then begin
      pNode := rNode.parent;
      tv_TablesAndFields.fDragValue := pNode.Text + '.' + rNode.text;
    end
    else
      tv_TablesAndFields.fDragValue := rNode.text;
  end;

  if Button = mbRight then
    tv_TablesAndFields.BeginDrag(false);
end;


//procedure Tfrm_NxToolsMain.lst_TablesLB1MouseDown(Sender: TObject;
//  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//begin
////  if Button = mbRight then
////    lst_TablesLB.BeginDrag(false);
//end;
//

procedure Tfrm_NxToolsMain.mniSetTransportserverthendb1Click(Sender: TObject);
begin
  jvpmn_TreeViewDbTables.CloseMenu;
end;

procedure Tfrm_NxToolsMain.OnFontStuffChange(aFontStuff: tFontStuff);
begin
  DoConfigChange(aFontStuff) ;
end;


procedure Tfrm_NxToolsMain.OnPrjInfoTransportChange(aTransport: TTransportUsed);
//  TTransportUsed = (tranWinSock, tranNamePipe, tranLocalServer, tranSharedMem, tranNone, tranError);
begin
//  fProjectInfo.ClearPrj;
  ClearTree;
  lst_ServerListBox.Clear;
  lst_ServerListBox.Enabled := not (aTransport in [tranLocalServer, tranNone, tranError]);
  lbl_ServersLabel.Enabled  := not (aTransport in [tranLocalServer, tranNone, tranError]);

  act_CreateSQLWindow.Enabled := False;

  fProjectInfo.ActiveServer := '';
  fProjectInfo.ActiveDb := '';

  dm_DataMod.nxNamedPipeTransport.Close;
  dm_DataMod.nxWinsockTransport.Close;
  dm_DataMod.nxRemoteServerEngine.Close;
  dm_DataMod.nxSession.Close;
end;

procedure Tfrm_NxToolsMain.OnPrjInfoServerChange(aServer: tStr45);
begin
//
end;

procedure Tfrm_NxToolsMain.OnPrjInfoAliasChange(aAlias: tStr95);
begin
//
end;


//procedure Tfrm_NxToolsMain.lst_AliasListBox1MouseDown(Sender: TObject; //fix/remove
//  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  p:tpoint;
//begin
////  p.x:=x;
////  p.y:=y;
////  lst_AliasListBox.itemindex := lst_AliasListBox.ItemAtPos(p,true);
//end;
//

//procedure Tfrm_NxToolsMain.lst_AliasListBox1Click(Sender: TObject);
//begin
//  SetAlias;
//end;
//

//procedure Tfrm_NxToolsMain.lst_AliasListBox1MouseMove(Sender: TObject; //fix/remove
//  Shift: TShiftState; X, Y: Integer);
//var
//  k: integer;
//  s: string;
//begin
//  k := lst_AliasListBox.ItemAtPos(Point(X,Y),true);
//
//  if k = -1 then begin
//    lst_AliasListBox.ShowHint:=false;
//  end else begin
//    s := lst_AliasListBox.Items[k];
//    if lst_AliasListBox.Canvas.TextWidth(s)>lst_AliasListBox.Width-10 then begin
//      lst_AliasListBox.ShowHint := true;
//      lst_AliasListBox.Hint := lst_AliasListBox.Items[k];
//    end else begin
//      lst_AliasListBox.ShowHint := false;
//    end;
//  end;
//end;
//

//procedure Tfrm_NxToolsMain.lst_TablesListBox1Click(Sender: TObject);   //fix/remove

procedure Tfrm_NxToolsMain.Create_TablesView(aNode: tTreeNode; aTableName: string);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'Create_TablesView' );{$ENDIF}
{$IFDEF DEBUG}
  showmessage('msg 2812-d. in create tables: '+aNode.Text);
{$ENDIF}
  inc(DockingFormsInfo.NumTblForms);
  SetLength(fTblArrayDockForm, DockingFormsInfo.NumTblForms+1);

  fTblArrayDockForm[DockingFormsInfo.NumTblForms] := Tfrm_TableView.Create(Nil);

  inc(DockingFormsInfo.TblformNumbering);

  fTblArrayDockForm[DockingFormsInfo.NumTblForms].tag := DockingFormsInfo.NumTblForms;
  fTblArrayDockForm[DockingFormsInfo.NumTblForms].PrjPath := String(fProjectInfo.PrjPath);



  fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.Database :=
                                              tRootNodeDb(aNode.Data^).DataBase;

  try
    if fProjectInfo.DBPassWord <> '' then
      fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.Password :=
                        lblwfsh1.DecryptString(string(fProjectInfo.DBPassWord));
  except
    fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.Password := '';
  end;



  fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.TableName := aTableName;     //fix
//                           lst_TablesListBox.Items[lst_TablesListBox.ItemIndex];
  fTblArrayDockForm[DockingFormsInfo.NumTblForms].Caption :=
      String(fProjectInfo.Table) + '-'+IntToStr(DockingFormsInfo.TblformNumbering);
//      lst_TablesListBox.Items[lst_TablesListBox.ItemIndex]+'-'+IntToStr(DockingFormsInfo.TblformNumbering);

  fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.GetIndexNames(fTblArrayDockForm[DockingFormsInfo.NumTblForms].cbb_IndexComboBox.Items);
  try
    fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.Open;
    fTblArrayDockForm[DockingFormsInfo.NumTblForms].lbl_12.Caption :=
                 IntToStr(fTblArrayDockForm[DockingFormsInfo.NumTblForms].nxTable.RecordCount);
  except
    on E : Exception do
      begin
        ShowMessage('Msg 2873-Could NOT open table to get fields.'+#10+#13+E.Message);
        {$IFDEF USE_CODESITE}CodeSite.SendMsg('Msg 2874-'+ E.Message );{$ENDIF}
      end;
  end;
  fTblArrayDockForm[DockingFormsInfo.NumTblForms].Show;
  if chk_ManualDock.Checked then begin
    fTblArrayDockForm[DockingFormsInfo.NumTblForms].ManualDock(pgc_DockedForms);
    pgc_DockedForms.ActivePageIndex := pgc_DockedForms.PageCount - 1;
  end;
  SetMemoryUsageLabel;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'Create_TablesView' );{$ENDIF}
end;


procedure Tfrm_NxToolsMain.AddTextToRichEdit(aIndex: Integer; aEditorStr: string;
                                             aPlaceCursorBeforeChar: string;
                                             aSpacesAfterCursor,
                                             aUseExtendedSQL: boolean;
                                             aExtendedText: TStrings);
var
  Index: integer;
  memoText: string;
  yCaret, xCaret, tmpX, tmpY: Integer;
  //=====================
  function GetLocationInStr(var aEditorStr: string; aSubStr: String): integer;
  var
    i: Integer;
  begin
     i := LastDelimiter(aSubStr, aEditorStr);
     if aSpacesAfterCursor then
       Insert(' ', aEditorStr, i);

     Result := Length(aEditorStr) - i +1;
  end;
  //=====================

  procedure UseExtendedSQL;
  var
    bLines: Integer;
  begin
    tmpY := fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretY;
    tmpX := fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretX;
    for bLines :=0 to aExtendedText.Count-1 do begin
      memoText := aExtendedText[bLines];
      inc(tmpY);
      if Pos('^', memoText)> 0 then begin
        xCaret := Pos('^', memoText) + tmpX;
        yCaret := tmpY - 1;
      end;

      fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretX := tmpX;
      fSQLArrayDockForm[aIndex].synm_SQLEditor.SelText := memoText+#13;
    end;

    fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretX := xCaret;
    fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretY := yCaret;
  end;

  procedure NoExtendedSQL;
  begin
    if (aPlaceCursorBeforeChar = '') and  aSpacesAfterCursor then  begin
      index := 0;
      aEditorStr := aEditorStr + ' ';
    end;

    if (aPlaceCursorBeforeChar <> '') and  aSpacesAfterCursor then  begin
      Index := GetLocationInStr(aEditorStr, aPlaceCursorBeforeChar);
    end;

    if (aPlaceCursorBeforeChar <> '') and  not aSpacesAfterCursor then  begin
      Index := GetLocationInStr(aEditorStr, aPlaceCursorBeforeChar);
    end;


    if (aPlaceCursorBeforeChar = '') and  not aSpacesAfterCursor then  begin
      Index := 1;
    end;

    fSQLArrayDockForm[aIndex].synm_SQLEditor.SelText := aEditorStr;
    fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretX := fSQLArrayDockForm[aIndex].synm_SQLEditor.CaretX - Index;
  end;

begin
  if Length(aEditorStr) < 0 then
    Exit;

  index := 1;
  xCaret := 0;
  yCaret := 0;

  if aUseExtendedSQL then begin
    UseExtendedSQL;
  end
  else begin
    NoExtendedSQL;
  end;
  fSQLArrayDockForm[aIndex].synm_SQLEditor.SetFocus;
end;


procedure Tfrm_NxToolsMain.ApplicationEvents1ModalBegin(Sender: TObject);
begin
  if Assigned(DimmerForm) then DimmerForm.Display(self);
end;


procedure Tfrm_NxToolsMain.ApplicationEvents1ModalEnd(Sender: TObject);
begin
  if Assigned(DimmerForm) then DimmerForm.Hide;
end;


procedure Tfrm_NxToolsMain.gmrw_MoveTableSQLarrowbtnClick(Sender: TObject);
var
  tempSL: TStrings;
begin
  if DockingFormsInfo.TypeDockForm = TSQLForm then begin

    tempSL := TStringList.Create;
    try
      AddTextToRichEdit(DockingFormsInfo.ActiveIndex,
                        tv_TablesAndFields.DragValue,
                        '', True, False, tempSL);
    finally
      tempSL.Free;
    end;
  end
  else
    MessageDlg('msg 3001-Either there is no SQL window or a SQL window is NOT active.', mtError, [mbOK], 0);
end;


procedure Tfrm_NxToolsMain.ext(  Sender: TObject);
var
  s: string;
  tempSL: TStrings;
  fParentItemIndex: integer;
  fParentItem: string;
  fChildFieldItem: String;
begin
  fChildFieldItem := tv_TablesAndFields.SelChildText;

  if DockingFormsInfo.TypeDockForm = TSQLForm then begin
    s := ':';
    s := s + fChildFieldItem;
    tempSL := TStringList.Create;
    try
      AddTextToRichEdit(DockingFormsInfo.ActiveIndex,
                        s,
                        '', True, False, tempSL);
    finally
      tempSL.Free;
    end;
    // set the master table

//    property SelParentNode: TTreeNode read SetSelParentNode;
//    property SelChildNode: TTreeNode read SetSelChildNode;

    fParentItem := tv_TablesAndFields.SelParentText;

    fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].nxtbl_MasterTable.TableName :=
                      fParentItem;  //lst_TablesLB.Items[lst_TablesLB.ItemIndex];
    fParentItemIndex := fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].cbb_DatabaseTableNamesCB.items.IndexOf(fParentItem);
    fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].cbb_DatabaseTableNamesCB.ItemIndex := fParentItemIndex;
    // lst_TablesLB.ItemIndex;
    fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].nxtbl_MasterTable.GetFieldNames
        (fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].cbb_MasterFields.items);
    // Add comment to sql editor


    fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].synm_SQLEditor.Lines.Insert(0, '/* '+
                                  fChildFieldItem +
                                 ' From MasterTable: </'+fParentItem +'/> */' );
    fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].synm_SQLEditor.CaretY :=
       fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].synm_SQLEditor.CaretY + 1;
    try
      fSQLArrayDockForm[DockingFormsInfo.ActiveIndex].nxtbl_MasterTable.Open;
    except
      on E : Exception do
        begin
          ShowMessage('Msg 3053-Could NOT set Master Source relation.'+#13+#10+E.Message);
        end;
    end;
  end
  else
    MessageDlg('msg 3058-Either there is no SQL window or a SQL window is NOT active.', mtError, [mbOK], 0);
end;


procedure Tfrm_NxToolsMain.SQLDefaultSizeofGridsandEditors1Click(
                                                               Sender: TObject);
begin
  frm_MoveResizeComponents.ShowModal;
  btn_CreateBtns;
end;


procedure Tfrm_NxToolsMain.stsbrpr_StatusBarPanels3Click(Sender: TObject);
begin
  MessageDlg('msg 3072-Project path: '+#13+stsbrpr_StatusBar.Panels[ord(spoDefaultPrjDir)].Text, mtInformation, [mbOk], 0);
end;



procedure Tfrm_NxToolsMain.sv_ProjectInfoOpened(Sender: TObject);
begin
  mem_ProjectStats.Lines.Clear;
  mem_ProjectStats.Lines.Add('Project: '+QuotedStr(String(fProjectInfo.PrjName)));
  mem_ProjectStats.Lines.Add('  Project Path To save SQL files: '+ QuotedStr(String(fProjectInfo.PrjPath)));
  mem_ProjectStats.Lines.Add('  Project Transport: '+ QuotedStr(cTransportTypes[fProjectInfo.Transport]));
  mem_ProjectStats.Lines.Add('  Project Server: '+ QuotedStr(String(fProjectInfo.Server)));
  mem_ProjectStats.Lines.Add('  Project Database: '+ QuotedStr(String(fProjectInfo.Alias)));
  mem_ProjectStats.Lines.Add('  Active Transport: '+ QuotedStr(cTransportTypes[fProjectInfo.Transport]));
  mem_ProjectStats.Lines.Add('  Active Server: '+ QuotedStr(String(fProjectInfo.ActiveServer)));
  mem_ProjectStats.Lines.Add('  Active Database: '+ QuotedStr(String(fProjectInfo.ActiveDb)));
  mem_ProjectStats.Lines.Add('  Delphi File Save Location: '+ QuotedStr(String(fProjectInfo.PasFileSaveLoc)));
  mem_ProjectStats.Lines.Add('  Db Password: '+ QuotedStr(String(fProjectInfo.DBPassWord)));
end;

{ TSqlFontParams }

constructor TSqlFontParams.Create(BgCTop, BgCLeft, FgCTop, FgCLeft, CcbStyleTop,
  CcbStyleLeft: Integer; aParent: TwinControl; aFontType: tSqlFontType; SaveFileName: string;
  CCItems: TStrings);
begin
//  fChanged := false;
  fBackground := tJvColorComboBox.Create(nil);
  fForeground := tEsColorComboBox.Create(nil);
  fStyleCombo := TJvCheckedComboBox.Create(nil);

  fBackground.Parent   := aParent;
  fBackground.Top      := BgCTop;
  fBackground.Left     := BgCLeft;
  fBackground.Width    := 130;
  fBackground.AddColor($00DDFFFF, 'SQL Editor');
  fBackground.AddColor(clBlack, 'Black');
  fBackground.AddColor(clMaroon, 'Maroon');
  fBackground.AddColor(clGreen, 'Green');
  fBackground.AddColor(clOlive, 'Olive green');
  fBackground.AddColor(clNavy, 'Navy blue');
  fBackground.AddColor(clPurple, 'Purple');
  fBackground.AddColor(clTeal, 'Teal');
  fBackground.AddColor(clGray, 'Gray');
  fBackground.AddColor(clSilver, 'Silver');
  fBackground.AddColor(clRed, 'Red');
  fBackground.AddColor(clLime, 'Lime');
  fBackground.AddColor(clYellow, 'Yellow');
  fBackground.AddColor(clBlue, 'Blue');
  fBackground.AddColor(clFuchsia, 'Fuchsia');
  fBackground.AddColor(clAqua, 'Aqua');
  fBackground.AddColor(clWhite, 'White');
  fBackground.AddColor(clMoneyGreen, 'Money green');
  fBackground.AddColor(clSkyBlue, 'Sky blue');
  fBackground.AddColor(clCream, 'Cream');
  fBackground.AddColor(clMedGray, 'Medium gray');
  fBackground.Options  := [coText, coStdColors];
  fBackground.OnChange := jvccb_SQLBgColorChange;

  fForeground.Top      := FgCTop;
  fForeground.Left     := FgCLeft;
  fForeground.Width    := 105;
  fForeground.Parent   := aParent;
  fForeground.OnChange := esccb_SQLFgColorChange;

  fStyleCombo.Top      := CcbStyleTop;
  fStyleCombo.Left     := CcbStyleLeft;
  fStyleCombo.Width    := 170;
  fStyleCombo.Parent   := aParent;
  fStyleCombo.OnChange := JvCheckedComboBoxChange;
  fStyleCombo.Items.Assign(CCItems);

  fSqlFontType :=  aFontType;
  fFontsFileName := SaveFileName;
  fFontStuff.TypeFontItem := aFontType;

{$IFDEF DEBUG}
//  ShowmessageInt('msg 3129-create Font num: ', ord(aFontType));
{$ENDIF}
end;


procedure TSqlFontParams.FontStuffChange(aFontStuff: tFontStuff);
begin
  if Assigned(fOnChange) then
    fOnChange(fFontStuff);
end;


procedure TSqlFontParams.FreeResources;
begin
  fStyleCombo.Free;
  fBackground.Free;
  fForeground.free;
end;

procedure TSqlFontParams.esccb_SQLFgColorChange(Sender: TObject);
begin
  fFontStuff.Color := fForeground.SelectedColor;
  SetFontStyles;
  FontStuffChange(fFontStuff);
end;


procedure TSqlFontParams.jvccb_SQLBgColorChange(Sender: TObject);
begin
  fFontStuff.BackColor := fBackground.ColorValue;
  SetFontStyles;
{$IFDEF DEBUG}
  ShowmessageInt('msg 3181-SQLBgColorChange before Font num: ', ord(fFontStuff.TypeFontItem));
{$ENDIF}

  FontStuffChange(fFontStuff);
{$IFDEF DEBUG}
  ShowmessageInt('Msg 3186-SQLBgColorChange after Font num: ', ord(fFontStuff.TypeFontItem));
{$ENDIF}
end;


procedure TSqlFontParams.JvCheckedComboBoxChange(Sender: TObject);
begin
  fFontStuff.aBoldChecked      := fStyleCombo.Checked[0];
  fFontStuff.aItalicChecked    := fStyleCombo.Checked[1];
  fFontStuff.aUnderlineChecked := fStyleCombo.Checked[2];
  fFontStuff.aStrikeoutChecked := fStyleCombo.Checked[3];

  SetFontStyles;
  FontStuffChange(fFontStuff);
end;


function TSqlFontParams.ReadSettings: boolean;
var
  fFile: file of TFontStuff;

  procedure SetDefaults;
  begin
    fFontStuff.aBoldChecked      := false;
    fFontStuff.aItalicChecked    := false;
    fFontStuff.aUnderlineChecked := false;
    fFontStuff.aStrikeoutChecked  := false;

    fFontStuff.BackColor := $00DDFFFF;
    fFontStuff.Color := clBlack;
  end;

begin
  result := false;
  if fileexists(fFontsFileName) then  begin
    AssignFile(fFile, fFontsFileName);
    result := false;
    try
      try
        Reset(fFile);
        Seek(fFile, Ord(fSqlFontType));
        read(fFile, fFontStuff);
      finally
        CloseFile(fFile);

        fForeground.OnChange := nil;
        fStyleCombo.OnChange := nil;
        fBackground.OnChange := nil;

        fBackground.ColorValue    := fFontStuff.BackColor;
        fForeground.SelectedColor := fFontStuff.Color;

        try
          fStyleCombo.Checked[0] := fFontStuff.aBoldChecked;
          fStyleCombo.Checked[1] := fFontStuff.aItalicChecked;
          fStyleCombo.Checked[2] := fFontStuff.aUnderlineChecked;
          fStyleCombo.Checked[3] := fFontStuff.aStrikeoutChecked;
        finally
          fStyleCombo.OnChange := JvCheckedComboBoxChange;
          fForeground.OnChange := esccb_SQLFgColorChange;
          fBackground.OnChange := jvccb_SQLBgColorChange;
        end;
        result := True;
      end;
    except
      SetDefaults
    end;
  end
  else
    SetDefaults;

  SetFontStyles;
end;


function TSqlFontParams.SaveSettings: boolean;
var
  fFile: file of TFontStuff;
begin
  result := True;
  AssignFile(fFile, fFontsFileName);
  try
    try
      FileMode := fmOpenWrite;
      if FileExists(fFontsFileName) then
        Reset(fFile)
      else
        Rewrite(fFile);
      Seek(fFile, Ord(fSqlFontType));
      write(fFile, fFontStuff);
    finally
      CloseFile(fFile);
    end;
  except
    MessageDlg('msg 3321-Font Settigns Not Saved', mtError, [mbok], 0);
    result := False;
  end;
end;


procedure TSqlFontParams.SetFontStyles;
var
  TempFont: TFontStyles;
begin
  if fFontStuff.aBoldChecked then
    Include(TempFont, fsBold);

  if fFontStuff.aItalicChecked then
    Include(TempFont, fsItalic);

  if fFontStuff.aUnderlineChecked then
    Include(TempFont, fsUnderline);

  if fFontStuff.aStrikeoutChecked then
    Include(TempFont, fsStrikeOut);

   fFontStuff.Style := TempFont;
   fFontStuff.TypeFontItem := fSqlFontType;
//  fFontStyles := TFontStyles(Byte( (ord(fsBold) and (Ord(fSettings.aBoldChecked)
//                            shl Byte(ord(fsBold)))) or (ord(fsItalic) and (Ord(fSettings.aItalicChecked)
//                            shl Byte(ord(fsItalic)))) or (ord(fsStrikeOut) and (Ord(fSettings.aStrikutChecked)
//                            shl Byte(ord(fsStrikeOut)))) or (ord(fsUnderline) and (Ord(fSettings.aUnderlineChecked)
//                            shl Byte(ord(fsUnderline))))) );
{
CustomFont.Style := TFontStyles(Byte( (ord(fsBold) and (Ord(isBold) shl Byte(ord(fsBold)))) or (ord(fsItalic)
and (Ord(isItalic) shl Byte(ord(fsItalic)))) or (ord(fsStrikeOut)
and (Ord(isStrikeout) shl Byte(ord(fsStrikeOut)))) or (ord(fsUnderline)
and (Ord(isUnderline) shl Byte(ord(fsUnderline))))) );
}
end;

procedure TSqlFontParams.ShowColorsStyles;
begin
  Form1.ForeColor := fFontStuff.Color;
  Form1.BackColor := fFontStuff.BackColor;
  Form1.fFontStyles := fFontStuff.Style;

  Form1.ShowModal;
end;

{ TTreeView }

procedure TTreeView.SetDragValue(const Value: string);
var
  rNode: TTreeNode;
  pNode: TTreeNode;
begin
  rNode := Selected;
  if rNode <> Nil then begin
    if rNode.Level = 1 then begin
      pNode := rNode.parent;
      fDragValue := pNode.Text + '.' + rNode.text;
    end
    else
      fDragValue := rNode.text;
  end
  else
    fDragValue := '';
end;


function TTreeView.SetSelChildString: string;
var
  rNode: TTreeNode;
begin
  rNode := Selected;
  if rNode <> Nil then begin
    if rNode.Level = 1 then
      result := rNode.Text
    else
      result := '';
  end
  else
    result := '';
end;


function TTreeView.SetSelParentString: string;
var
  rNode: TTreeNode;
  pNode: TTreeNode;
begin
  rNode := Selected;
  if rNode <> Nil then begin
    if rNode.Level = 1 then begin
      pNode := rNode.Parent;
      result := pNode.Text;
    end
    else
     result := rNode.Text;
  end
  else
    result := '';
end;

end.
