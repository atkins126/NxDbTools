unit NxToolsMain1;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  System.ImageList, System.Types,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, Vcl.Menus,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.ImgList,
  Vcl.Imaging.pngimage,

  Global, TableView, SQLView, floating, GemINI,

  SBPro, gemCustomButton, gemArrow,

  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppXMLStorage, JvExControls,
  JvXPCore, JvXPButtons, Vcl.ActnList, System.Actions,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;


type
  TDockingFormType = (TSQLForm, TTblForm, TNoForm);

  TFormsInfo = record
    TypeDockForm: TDockingFormType;
    theForm: TForm;
    ActiveIndex: integer;
    ActiveUnDocked: boolean;
    NumSqlForms: integer;
    NumTblForms: integer;
    SqlformNumbering: integer;
    TblformNumbering: integer;
  end;

  Tfrm_NxToolsMain = class(TForm)
    mm_MainMenu: TMainMenu;
    File1: TMenuItem;
    CloseAllSQLChd: TMenuItem;
    FileTableCloseItem: TMenuItem;
    CloseAllChidern: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Preferences1: TMenuItem;
    SQLDefaultSizeofGridsandEditors1: TMenuItem;
    SetFonts1: TMenuItem;
    SetSQLEditorFont1: TMenuItem;
    SetSQLCommentFont1: TMenuItem;
    SetSQLSyntaxFont: TMenuItem;
    SetSQLNumericFont1: TMenuItem;
    Set1: TMenuItem;
    SetFunctionNames1: TMenuItem;
    Window1: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowTileItem2: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    pnl_TopMain: TPanel;
    spltvw_ToolsCommands: TSplitView;
    blnhnt_Hints: TBalloonHint;
    jvpxmlflstrg_NxDbToolsPrefs: TJvAppXMLFileStorage;
    jvfrmstrg_FormPrefs: TJvFormStorage;
    btn__SplitViewOpenClose: TButton;
    il_AppImages: TImageList;
    il_imlIcons: TImageList;
    stsbrpr_StatusBar: TStatusBarPro;
    pgc_DockedForms: TPageControl;
    lbl_ActiveForm: TLabel;
    chk_ManualDock: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn__SplitViewOpenCloseClick(Sender: TObject);
    procedure pgc_ToolsCommandsChange(Sender: TObject);
    procedure img_DBToolsUnDockClick(Sender: TObject);
    procedure img_DBToolsDockClick(Sender: TObject);
    procedure img_SQLTabDockImageClick(Sender: TObject);
    procedure img_SQLTabUndockImageClick(Sender: TObject);
    procedure img_TableFieldToolsUndockedClick(Sender: TObject);
    procedure img_TableFieldToolsDockedClick(Sender: TObject);
    procedure chkPositionRunTime2Click(Sender: TObject);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pgc_DockedFormsChange(Sender: TObject);
    procedure btn_SQLFormClick(Sender: TObject);
    procedure pgc_DockedFormsDockOver(Sender: TObject; Source: TDragDockObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure pgc_DockedFormsGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure pgc_DockedFormsUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure lst_TablesListBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_TcpIpTransportExecute(Sender: TObject);
    procedure act_NamePipeTransportExecute(Sender: TObject);
  private
    { Private declarations }
    SQLArrayDockForm: array of Tfrm_SQLView;

    TblArrayDockForm: array of Tfrm_TableView;

    inReposition : boolean;
    oldPos : TPoint;
//    ControlPlacementIni: tGemINI;
//    ControlPlacementPath: string;
    { Floating Form stuff ====================================================}
    { Floating Form stuff ====================================================}
    { Floating Form stuff ====================================================}
    fSQLCommandsFF     : TFloatingForm;
    fTableFieldToolsFF : TFloatingForm;
    fDatabaseToolsFF   : TFloatingForm;

    // SQL Commands
    function GetSQLCommandsFF: TFloatingForm;
    property SQLCommandsFF : TFloatingForm read GetSQLCommandsFF;
    procedure SQLCommandsFFOnDestroyFloat(Sender: TObject);
    procedure SQLCommandsFFOnShowFloat(Sender: TObject);

    // Table Field Tools
    function GetTableFieldToolsFF: TFloatingForm;
    property TableFieldToolsFF : TFloatingForm read GetTableFieldToolsFF;
    procedure TableFieldToolsFFOnDestroyFloat(Sender: TObject);
    procedure TableFieldToolsFFOnShowFloat(Sender: TObject);

    // Database  Tools
    function GetDatabaseToolsFF: TFloatingForm;
    property DatabaseToolsFF : TFloatingForm read GetDatabaseToolsFF;
    procedure DatabaseToolsFFOnDestroyFloat(Sender: TObject);
    procedure DatabaseToolsFFOnShowFloat(Sender: TObject);
    { == end floating forms ======}

    function GetAppVersionStr: string;
    procedure ReadControlPlacement;
    procedure WriteControlPlacement;
    function FindDockedByCaption(aCaption: string): integer;
    function SetDockingFormType(aControl: TControl): Boolean;
    procedure setEnableTransportBtns(theEnabled: Boolean);
  public
    { Public declarations }
    DockingFormsInfo: TFormsInfo;
    procedure DeleteSQLX(const Index: Cardinal);
    procedure DeleteTblX(const Index: Cardinal);
    procedure SetActiveFormOnDelete(aWasItFloat: Boolean; FormType: TDockingFormType);
  end;

var
  frm_NxToolsMain: Tfrm_NxToolsMain;

implementation
Uses
  DataMod;
{$R *.dfm}
{$R button.res}

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


//=============================================================================
//============== Control placement stuff ======================================
//=============================================================================

procedure Tfrm_NxToolsMain.ReadControlPlacement;
var
  idx : integer;
  ctrl : TControl;
begin
  CreateIniFile;
  for idx := 0 to -1 + Self.ComponentCount do begin
    if (Components[idx] is TButton) and ((TButton(Components[idx]).Tag = 1) or
                                      (TButton(Components[idx]).Tag = 2) or
                                      (TButton(Components[idx]).Tag = 3)) then
    begin
      ctrl := TControl(Components[idx]);
      //ShowMessage('Read control: '+ctrl.Name);
      ctrl.Top := NxSQLViewerDataIniFile.ReadInteger(ctrl.Name,'Top',ctrl.Top);
      ctrl.Left := NxSQLViewerDataIniFile.ReadInteger(ctrl.Name,'Left',ctrl.Left);
      ctrl.Width := NxSQLViewerDataIniFile.ReadInteger(ctrl.Name,'Width',ctrl.Width);
      ctrl.Height := NxSQLViewerDataIniFile.ReadInteger(ctrl.Name,'Height',ctrl.Height);
    end;
  end;
  DestroyIniFile;
end; (*ReadControlPlacement*)


procedure Tfrm_NxToolsMain.WriteControlPlacement;
var
  idx : integer;
  ctrl : TControl;
begin
  CreateIniFile;
  for idx := 0 to -1 + Self.ComponentCount do begin
    if (Components[idx] is TButton) and ((TButton(Components[idx]).Tag = 1) or
                                      (TButton(Components[idx]).Tag = 2) or
                                      (TButton(Components[idx]).Tag = 3)) then
    begin
      ctrl := TControl(Components[idx]);
      NxSQLViewerDataIniFile.WriteInteger(ctrl.Name,'Top',ctrl.Top);
      NxSQLViewerDataIniFile.WriteInteger(ctrl.Name,'Left',ctrl.Left);
      NxSQLViewerDataIniFile.WriteInteger(ctrl.Name,'Width',ctrl.Width);
      NxSQLViewerDataIniFile.WriteInteger(ctrl.Name,'Height',ctrl.Height);
    end;
  end;
  DestroyIniFile;
end; (*WriteControlPlacement*)


procedure Tfrm_NxToolsMain.ControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// button needs to be on one of the tabs of the SQLCommandsTab page control.
begin
  if (Sender is TWinControl) and (((chkPositionRunTime.Checked) AND (pgc_SQLCommandsTab.ActivePageIndex = 0)) or
                                  ((chkPositionRunTime2.Checked) AND (pgc_SQLCommandsTab.ActivePageIndex = 1)))  then
  begin
    inReposition:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
  end;
end;


procedure Tfrm_NxToolsMain.ControlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
begin
  if inReposition then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(newPos);

      if ssShift in Shift then
      begin //resize
        Screen.Cursor := crSizeNWSE;
        frmPoint := ScreenToClient(Mouse.CursorPos);
        if frmPoint.X > minWidth then Width := frmPoint.X;
        if frmPoint.Y > minHeight then Height := frmPoint.Y;
      end
      else //move
      begin
        Screen.Cursor := crSize;
        Left := Left - oldPos.X + newPos.X;
        Top := Top - oldPos.Y + newPos.Y;
        oldPos := newPos;
      end;
    end;
  end;
end; (*ControlMouseMove*)


procedure Tfrm_NxToolsMain.ControlMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Const
  GirdClick = 0;
begin
  if inReposition then
  begin
//    with TWinControl(Sender) do  begin
//      Left := Left +(Left Mod GirdClick);
//      if left > TabSheet4.width then
//        Left := left - GirdClick;
//      Top := Top +(Top Mod GirdClick);
//      if Top > TabSheet4.Height then
//        Top := Top - GirdClick;
//
//    end;
    Screen.Cursor := crDefault;
    ReleaseCapture;
    inReposition := False;
  end;
end; (*ControlMouseUp*)

//==============================================================================


//=============================================================================

procedure Tfrm_NxToolsMain.FormActivate(Sender: TObject);
begin
  if pgc_DockedForms.ActivePageIndex > -1 then
    FindDockedByCaption(pgc_DockedForms.ActivePage.Caption);
end;


procedure Tfrm_NxToolsMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteControlPlacement;
end;

procedure Tfrm_NxToolsMain.FormCreate(Sender: TObject);
begin
  SetProgramPaths;
  jvpxmlflstrg_NxDbToolsPrefs.FileName := ControlsIniFilePath;

  spltvw_ToolsCommands.Opened := False;
  pgc_ToolsCommands.ActivePageIndex := 0;
  spltvw_ToolsCommands.Opened := true;
  pgc_ToolsCommandsChange(Sender);

  DockingFormsInfo.theForm := nil;
  DockingFormsInfo.ActiveIndex := -1;
  DockingFormsInfo.ActiveUnDocked := false;
  DockingFormsInfo.NumSqlForms  := -1;
  DockingFormsInfo.NumTblForms := -1;
  DockingFormsInfo.SqlformNumbering := 0;
  DockingFormsInfo.TblformNumbering := 0;

  frm_NxToolsMain.Caption := 'Nexus SQL and Table Delphi Workshop: ' + GetAppVersionStr;
end;

procedure Tfrm_NxToolsMain.FormShow(Sender: TObject);
begin
  ReadControlPlacement;
end;

//==============================================================================

function Tfrm_NxToolsMain.FindDockedByCaption(aCaption: string): integer;

  function SQLStuff: integer;
  var
    cnt: Integer;
  begin
    for cnt := Low(SQLArrayDockForm) to High(SQLArrayDockForm) do begin
      if SQLArrayDockForm[cnt].Caption = aCaption then begin
        DockingFormsInfo.theForm := SQLArrayDockForm[cnt];
        lbl_ActiveForm.Caption := 'Active Form: ' + SQLArrayDockForm[cnt].Caption;
        result := cnt;
      end;
    end;
  end;

  function TblStuff: Integer;
  var
    cnt: Integer;
  begin
    for cnt := Low(TblArrayDockForm) to High(TblArrayDockForm) do begin
      if TblArrayDockForm[cnt].Caption = aCaption then begin
        DockingFormsInfo.theForm := TblArrayDockForm[cnt];
        lbl_ActiveForm.Caption := 'Active Form: ' + TblArrayDockForm[cnt].Caption;
        result := cnt;
      end;
    end;
  end;

begin
  if not frm_NxToolsMain.Active then
    Exit;

  lbl_ActiveForm.Caption := 'Active Form: None';
  result := -1;
  if DockingFormsInfo.NumSqlForms > -1 then
    result := SQLStuff;

  if result = -1 then
    result := TblStuff;

  DockingFormsInfo.ActiveIndex := result;
  DockingFormsInfo.ActiveUnDocked := False;
end;

// =============================================================================
//========== pgc_DockedForms ===================================================
//==============================================================================

procedure Tfrm_NxToolsMain.pgc_DockedFormsChange(Sender: TObject);
begin
  FindDockedByCaption(pgc_DockedForms.ActivePage.Caption);
//  lbl_ActiveForm.Caption := 'A. Active Form: ' + 'sdfkjsdfk';//pc_DockFormSite.ActivePage.Caption;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
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

//  CanDock := DockingFormsInfo.TypeDockForm in[TSQLForm, TTblForm];
  lbl_ActiveForm.Caption := 'Active Form: ' + DockingFormsInfo.theForm.Caption;
  DockingFormsInfo.ActiveUndocked := false;
  DockingFormsInfo.ActiveIndex := DockingFormsInfo.theForm.Tag;
end;


procedure Tfrm_NxToolsMain.pgc_DockedFormsUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
//var
//  ARect: TRect;
begin
  if SetDockingFormType(Client) then begin
    lbl_ActiveForm.Caption := 'Active Form: ' + DockingFormsInfo.theForm.Caption;
    DockingFormsInfo. ActiveIndex := DockingFormsInfo.theForm.tag;
    DockingFormsInfo. ActiveUnDocked := true;
    //ShowMessage('in dock form site undock');
  end;
end;

procedure Tfrm_NxToolsMain.pgc_ToolsCommandsChange(Sender: TObject);
begin
  case pgc_ToolsCommands.activePageIndex of
    0: spltvw_ToolsCommands.Width := 255;
    1: spltvw_ToolsCommands.Width := 240;
    2: spltvw_ToolsCommands.Width := 200;
  end;
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


//==============================================================================


procedure Tfrm_NxToolsMain.btn__SplitViewOpenCloseClick(Sender: TObject);
begin
  if spltvw_ToolsCommands.Opened then
    spltvw_ToolsCommands.Close
  else begin
    pgc_ToolsCommandsChange(sender);
    spltvw_ToolsCommands.Open;
  end;
end;


procedure Tfrm_NxToolsMain.btn_SQLFormClick(Sender: TObject);
//var
//  i: Integer;
begin
  inc(DockingFormsInfo.NumSqlForms);
  SetLength(SQLArrayDockForm, DockingFormsInfo.NumSqlForms+1);
  SQLArrayDockForm[DockingFormsInfo.NumSqlForms] := Tfrm_SQLView.Create(Nil);
//  SQLArrayDockForm[DockingFormsInfo.NumSqlForms] := Tform_SQLViewer.Create(Application);
  SQLArrayDockForm[DockingFormsInfo.NumSqlForms].Caption := 'SQL-'+IntToStr(DockingFormsInfo.SqlformNumbering);
  SQLArrayDockForm[DockingFormsInfo.NumSqlForms].tag := DockingFormsInfo.NumSqlForms;
  SQLArrayDockForm[DockingFormsInfo.NumSqlForms].Show;
  inc(DockingFormsInfo.SqlformNumbering);
  if chk_ManualDock.Checked then begin
    lbl_ActiveForm.Caption := 'Active Form: ' + SQLArrayDockForm[DockingFormsInfo.NumSqlForms].Caption;
//    Label1.Caption := 'Create: ' + IntToStr(ArrayDockForm[NumForms].tag);
    SQLArrayDockForm[DockingFormsInfo.NumSqlForms].ManualDock(pgc_DockedForms);
    pgc_DockedForms.ActivePageIndex := pgc_DockedForms.PageCount - 1;
  end;
//  lbl_2.Caption := IntToStr(DockingFormsInfo.ActiveIndex);
end;



{ Floating Form stuff ====================================================}
{ Floating Form stuff ====================================================}
{ Floating Form stuff ====================================================}

// Db Tools ====================================================================
function Tfrm_NxToolsMain.GetDatabaseToolsFF: TFloatingForm;
begin
  if fDatabaseToolsFF = nil then begin
    fDatabaseToolsFF := TFloatingForm.Create(self, ts_DatabaseTools, img_DBToolsUnDock, img_DBToolsDock);

    fDatabaseToolsFF.Visible := False;
    fDatabaseToolsFF.OnShowFloat := DatabaseToolsFFOnShowFloat;
    fDatabaseToolsFF.OnDestroyFloat := DatabaseToolsFFOnDestroyFloat;
    fDatabaseToolsFF.Caption := 'Database Tools';
    result := fDatabaseToolsFF;
  end;
  result := fDatabaseToolsFF;
end;


procedure Tfrm_NxToolsMain.chkPositionRunTime2Click(Sender: TObject);
begin
  if chkPositionRunTime2.Checked or chkPositionRunTime.Checked then begin
    stsbrpr_StatusBar.Panels[3].Text := 'Move SQL buttons Enabled';
    stsbrpr_StatusBar.Panels[3].Color := clYellow;
  end
  else begin
    stsbrpr_StatusBar.Panels[3].Text := '';
    stsbrpr_StatusBar.Panels[3].Color := clBtnFace;
  end;
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
  GetDatabaseToolsFF.Float
end;

procedure Tfrm_NxToolsMain.img_DBToolsDockClick(Sender: TObject);
begin
  Close;
  pgc_ToolsCommandsChange(Sender);
end;


// SQL Statements and functions  ==============================================

function Tfrm_NxToolsMain.GetSQLCommandsFF: TFloatingForm;
begin
  if fSQLCommandsFF = nil then begin
    //ReadFloatLocNeedRoute := true;
    fSQLCommandsFF := TFloatingForm.Create(self, ts_SQLCommands, img_SQLTabUndockImage, img_SQLTabDockImage);

//    fSQLCommandsFF := TFloatingForm.Create(self, ts_SQLCommands);

    fSQLCommandsFF.Visible := False;
    fSQLCommandsFF.OnShowFloat := SQLCommandsFFOnShowFloat;
    fSQLCommandsFF.OnDestroyFloat := SQLCommandsFFOnDestroyFloat;
    fSQLCommandsFF.Caption := 'SQL Statements and Functions';
    result := fSQLCommandsFF;
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
  GetSQLCommandsFF.Float;
end;


procedure Tfrm_NxToolsMain.img_SQLTabDockImageClick(Sender: TObject);
begin
  Close;
  pgc_ToolsCommandsChange(Sender);
end;


// Table Field Tools  =========================================================

function Tfrm_NxToolsMain.GetTableFieldToolsFF: TFloatingForm;
begin
  if fTableFieldToolsFF = nil then begin
    fTableFieldToolsFF := TFloatingForm.Create(self, ts_TablesAndFieldsTools, img_TableFieldToolsUndocked, img_TableFieldToolsDocked);

    fTableFieldToolsFF.Visible := False;
    fTableFieldToolsFF.OnShowFloat := TableFieldToolsFFOnShowFloat;
    fTableFieldToolsFF.OnDestroyFloat := TableFieldToolsFFOnDestroyFloat;
    fTableFieldToolsFF.Caption := 'Table and Field Tools';
    result := fTableFieldToolsFF;
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


procedure Tfrm_NxToolsMain.img_TableFieldToolsUndockedClick(Sender: TObject);
begin
  GetTableFieldToolsFF.Float;
end;


procedure Tfrm_NxToolsMain.lst_TablesListBoxClick(Sender: TObject);
//var
//  i: Integer;
begin
  inc(DockingFormsInfo.NumTblForms);
  SetLength(TblArrayDockForm, DockingFormsInfo.NumTblForms+1);
  TblArrayDockForm[DockingFormsInfo.NumTblForms] := Tfrm_TableView.Create(Nil);
  TblArrayDockForm[DockingFormsInfo.NumTblForms].Caption := 'Table-'+IntToStr(DockingFormsInfo.TblformNumbering);
  TblArrayDockForm[DockingFormsInfo.NumTblForms].tag := DockingFormsInfo.NumTblForms;
  TblArrayDockForm[DockingFormsInfo.NumTblForms].Show;
  inc(DockingFormsInfo.TblformNumbering);
  if chk_ManualDock.Checked then begin
    lbl_ActiveForm.Caption := 'Active Form: ' + TblArrayDockForm[DockingFormsInfo.NumTblForms].Caption;
    TblArrayDockForm[DockingFormsInfo.NumTblForms].ManualDock(pgc_DockedForms);
    pgc_DockedForms.ActivePageIndex := pgc_DockedForms.PageCount - 1;
  end;
//  lbl_2.Caption := IntToStr(DockingFormsInfo.ActiveIndex);
end;

procedure Tfrm_NxToolsMain.img_TableFieldToolsDockedClick(Sender: TObject);
begin
  Close;
  pgc_ToolsCommandsChange(Sender);
end;


// General function ===========================================================
//  TDockingFormType = (TSQLForm, TTblForm, TNoForm);

procedure Tfrm_NxToolsMain.DeleteSQLX(const Index: Cardinal);
var
  ALength: Cardinal;
  i: Cardinal;
  WasItFloat: boolean;
begin
  WasItFloat := SQLArrayDockForm[DockingFormsInfo.ActiveIndex].Floating;

  ALength := Length(SQLArrayDockForm);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do begin
    SQLArrayDockForm[i].tag := SQLArrayDockForm[i].tag - 1;
//    ArrayDockForm[i].Caption := 'fred'+IntToStr(i - 1);
    SQLArrayDockForm[i - 1] := SQLArrayDockForm[i];
  end;
  SetLength(SQLArrayDockForm, ALength - 1);
  dec(DockingFormsInfo.NumSqlForms);

  SetActiveFormOnDelete(WasItFloat, TSQLForm);
end;


procedure Tfrm_NxToolsMain.DeleteTblX(const Index: Cardinal);
var
  ALength: Cardinal;
  i: Cardinal;
  WasItFloat: boolean;
begin
  WasItFloat := TblArrayDockForm[DockingFormsInfo.ActiveIndex].Floating;

  ALength := Length(TblArrayDockForm);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do begin
    TblArrayDockForm[i].tag := TblArrayDockForm[i].tag - 1;
//    ArrayDockForm[i].Caption := 'fred'+IntToStr(i - 1);
    TblArrayDockForm[i - 1] := TblArrayDockForm[i];
  end;
  SetLength(TblArrayDockForm, ALength - 1);
  dec(DockingFormsInfo.NumTblForms);

  SetActiveFormOnDelete(WasItFloat, TTblForm);
end;


procedure Tfrm_NxToolsMain.SetActiveFormOnDelete(aWasItFloat: Boolean; FormType: TDockingFormType);
//var
//  FormFloatIndexList: TList<integer>;
//  FormNonFloatIndexList: TList<integer>;

//  procedure ListFloaters;
//  var
//    cnt: integer;
//  begin
////    for cnt := Low(ArrayDockForm) to High(ArrayDockForm) do
////      if ArrayDockForm[cnt].Floating then
////        FormFloatIndexList.Add(cnt);
//  end;
//
//  procedure ListNonFloaters;
//  var
//    cnt: integer;
//  begin
////    for cnt := Low(ArrayDockForm) to High(ArrayDockForm) do
////      if not ArrayDockForm[cnt].Floating then
////        FormNonFloatIndexList.Add(cnt);
//  end;
//
//var
//  cnt: integer;
begin
//  case FormType of
//    TSQLForm:;
//
//    TTblForm:;
//  end;
//
//  if NumForms = -1 then
//    exit;
//
//  FormFloatIndexList := TList<integer>.Create;
//  FormNonFloatIndexList := TList<integer>.Create;
//
//  ListFloaters;
//  ListNonFloaters;
//
//  if (aWasItFloat) and (FormFloatIndexList.Count = 0) and (FormNonFloatIndexList.Count > 0)then begin
//    JvPageControl1.ActivePageIndex := 0;
//    fActiveForm := FormNonFloatIndexList.IndexOf(0);
//  end;
//
//  if (not aWasItFloat) and (FormFloatIndexList.Count > 0) and (FormNonFloatIndexList.Count = 0)then begin
//    ArrayDockForm[FormFloatIndexList.IndexOf(0)].BringToFront;
//    fActiveForm := FormFloatIndexList.IndexOf(0);
//  end;
//
// lbl_ActiveForm.Caption := 'Active Form: ' + ArrayDockForm[fActiveForm].Caption;
  lbl_ActiveForm.Caption := 'Active Form: None';
end;


{ Actions Form stuff ====================================================}
{ Actions Form stuff ====================================================}
{ Actions Form stuff ====================================================}

//============= Transports ====================================================

procedure Tfrm_NxToolsMain.setEnableTransportBtns(theEnabled: Boolean);
begin
  btn_WinSockTrans.Enabled := theEnabled;
  btn_NamedPipe.Enabled := theEnabled;
//  btn_SharedMem.Enabled := theEnabled;
end;


procedure Tfrm_NxToolsMain.act_NamePipeTransportExecute(Sender: TObject);
begin
begin
  lst_AliasListBox.Clear;
  lst_TablesListBox.Clear;
  lst_ServerListBox.Clear;
  btn_SQLForm.Enabled := False;
  setEnableTransportBtns(False);

  dm_DataMod.nxRemoteServerEngine.Close;
  dm_DataMod.nxRemoteServerEngine.Transport :=  dm_DataMod.nxNamedPipeTransport;
  dm_DataMod.nxNamedPipeTransport.GetServerNames(lst_ServerListBox.Items, 5000);
  setEnableTransportBtns(true);
end;



procedure Tfrm_NxToolsMain.act_TcpIpTransportExecute(Sender: TObject);
begin
  lst_AliasListBox.Clear;
  lst_TablesListBox.Clear;
  lst_ServerListBox.Clear;
  btn_SQLForm.Enabled := False;

  setEnableTransportBtns(False);

  dm_DataMod.nxRemoteServerEngine.Close;
  dm_DataMod.nxRemoteServerEngine.Transport :=  dm_DataMod.nxWinsockTransport;
  dm_DataMod.nxWinsockTransport.GetServerNames(lst_ServerListBox.Items, 5000);
  setEnableTransportBtns(true);
end;




end.
