unit SQLView;

interface
{.$DEFINE DBUG}

uses
  Winapi.Windows, Winapi.Messages,

  System.Classes, System.Actions, System.StrUtils, System.UITypes,
  System.SysUtils,

  Vcl.ActnList, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Forms,
  Vcl.Graphics, Vcl.Menus, Vcl.ComCtrls,

  amSplitter, SBPro, GEMProcessTimer, adpMRU, Global, MSspecialFolders,
  GlobalVars,


  Data.DB, nxdb,

  PngSpeedButton,

  EsBase, EsMnuBtn,

  JvDataSource, JvExCheckLst, JvCheckListBox, JvExMask, JvToolEdit, JvMaskEdit,
  JvDBFindEdit, JvComponentBase, JvMRUList, JvExStdCtrls, JvCombobox,

  SynEditOptionsDialog, SynEditMiscClasses, SynEditSearch, SynEditPrint,
  SynCompletionProposal, SynHighlighterPas, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, SynEditKeyCmds,

  {RzCmboBx,} RzCommon, RzButton,  RzEdit, LbCipher, LbClass,

  SQLChildFormChangeInterface, SynEditCodeFolding;


type
  TSearchOption = (soIgnoreCase, soFromStart, soWrap);
  TSearchOptions = set of TSearchOption;

  TDockintRect = record
    Ud_Top: integer;
    Ud_Left: integer;
    Ud_Width: integer;
    Ud_Height: integer;
  end;

  TPrintHighLighter = (phSQL, phDelphi);

  TEditorUsed = (edtSQL, edtDelphi);


  Tfrm_SQLView = class(TForm, IConfigChanged)
    spl_1: TSplitter;
    spl_11: TSplitter;
    spl_12: TSplitter;
    dbgrd_SQLDBGrid: TDBGrid;
    stsbrpr_StatusBar: TStatusBarPro;
    pnl_1: TPanel;
    pnl_11: TPanel;
    lbl_1: TLabel;
    lbl_FieldTypelabel: TLabel;
    lbl_11: TLabel;
    cbb_DatabaseTableNamesCB: TComboBox;
    edt_FindFields: TJvDBFindEdit;
    nxtbl_MasterTable: TnxTable;
    nxQuery: TnxQuery;
    ds_QueryDS: TJvDataSource;
    ds_MasterTableDS: TJvDataSource;
    SynSQLSyn: TSynSQLSyn;
    SynPasSyn: TSynPasSyn;
    syntcmplt_SQLEditor: TSynAutoComplete;
    syndtprnt_Print: TSynEditPrint;
    dlgPntSet_PrintMemos: TPrinterSetupDialog;
    dlgSave_Memos: TSaveDialog;
    dlgOpen_MemoFiles: TOpenDialog;
    actlst_SQLForm: TActionList;
    act_SQLCut: TAction;
    act_SQLCopy: TAction;
    act_SQLPaste: TAction;
    act_SQLOpen: TAction;
    act_SQLSave: TAction;
    pnl_MenuBar: TPanel;
    dbnvgr_SQL: TDBNavigator;
    btn_SQLNewDoc: TSpeedButton;
    btn_SQLSaveDoc: TPngSpeedButton;
    btn_SQLSaveAsDoc: TPngSpeedButton;
    btn_SQLOpenDoc: TPngSpeedButton;
    act_SQLSaveAs: TAction;
    btn_SQLPrintDoc: TSpeedButton;
    btn_SQLRunDoc: TSpeedButton;
    btn_SQLCopyDoc: TSpeedButton;
    btn_SQLPasteDoc: TSpeedButton;
    shp_MenuBar1: TShape;
    shp_SQLDividerBar: TShape;
    shp_CenterDivider: TShape;
    shp_SQLNavDivider: TShape;
    btn_PascalNewDoc: TSpeedButton;
    btn_PascalOpenDoc: TPngSpeedButton;
    btn_PascalSaveDoc: TPngSpeedButton;
    btn_PascalSaveAsDoc: TPngSpeedButton;
    shp_1: TShape;
    btn_PascalCopyDoc: TSpeedButton;
    btn_PascalPasteDoc: TSpeedButton;
    shp_11: TShape;
    btn_PascalPrintDoc: TSpeedButton;
    shp_12: TShape;
    dbnvgr_1: TDBNavigator;
    act_SQLNewDoc: TAction;
    act_PascalNewDoc: TAction;
    act_PascalOpenDoc: TAction;
    act_PascalSaveDoc: TAction;
    act_PascalSaveAsDoc: TAction;
    act_DelphiCut: TAction;
    act_DelphiPaste: TAction;
    act_DelphiCopy: TAction;
    act_RunSQLCode: TAction;
    cbb_MasterFields: TComboBox;
    lbl_FieldNames: TLabel;
    act_CreateDelphiCode: TAction;
    btn_CreateDelphiCode: TPngSpeedButton;
    btn_1: TButton;
    syndtsrch_SQLEdt: TSynEditSearch;
    gmprcstmr_SQLTimer: TGEMProcessTimer;
    Shape1: TShape;
    lbl_SQLTimer: TLabel;
    lbl_Time: TLabel;
    btn_CutSQLCodeSQLCut: TPngSpeedButton;
    btn_CutSQLCode_CutDelphiCode: TPngSpeedButton;
    syndt_DelphiCodeMemo: TSynEdit;
    syndtptnsdlg1: TSynEditOptionsDialog;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    cbb_IndexComboBox: TComboBox;
    lbl2: TLabel;
    chk_SetFilter: TCheckBox;
    adpmr_FilterMRU: TadpMRU;
    btnMen_FiltersMRU: TEsMenuButton;
    edt_MasterTableFilter: TRzEdit;
    pm_FilterMRU: TPopupMenu;
    mniRecentFIlters1: TMenuItem;
    mniCloseMenu1: TMenuItem;
    lblwfsh1: TLbBlowfish;
    synm_SQLEditor: TSynEdit;
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
    procedure synm_SQLEditorChange(Sender: TObject);
    procedure synm_SQLEditorStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure syndt_DelphiCodeMemoChange(Sender: TObject);
    procedure syndt_DelphiCodeMemoStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure btn_PrintSQLClick(Sender: TObject);
    procedure act_SQLCutExecute(Sender: TObject);
    procedure act_SQLCutUpdate(Sender: TObject);
    procedure act_SQLCopyExecute(Sender: TObject);
    procedure act_SQLPasteExecute(Sender: TObject);
    procedure act_SQLSaveExecute(Sender: TObject);
    procedure act_SQLOpenExecute(Sender: TObject);
    procedure act_SQLSaveAsExecute(Sender: TObject);
    procedure stsbrpr_StatusBarPanels3Click(Sender: TObject);
    procedure act_SQLNewDocExecute(Sender: TObject);
    procedure act_PascalNewDocExecute(Sender: TObject);
    procedure act_PascalOpenDocExecute(Sender: TObject);
    procedure act_PascalSaveDocExecute(Sender: TObject);
    procedure act_PascalSaveAsDocExecute(Sender: TObject);
    procedure stsbrpr_StatusBarPanels9Click(Sender: TObject);
    procedure act_DelphiCutExecute(Sender: TObject);
    procedure act_DelphiPasteExecute(Sender: TObject);
    procedure act_DelphiCopyExecute(Sender: TObject);
    procedure btn_PascalPrintDocClick(Sender: TObject);
    procedure act_DelphiCopyUpdate(Sender: TObject);
    procedure act_RunSQLCodeExecute(Sender: TObject);
    procedure act_RunSQLCodeUpdate(Sender: TObject);
    procedure cbb_DatabaseTableNamesCBChange(Sender: TObject);
    procedure cbb_MasterFieldsChange(Sender: TObject);
    procedure act_CreateDelphiCodeExecute(Sender: TObject);
    procedure act_CreateDelphiCodeUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gmprcstmr_SQLTimerStop(Sender: TObject);
    procedure cbb_IndexComboBoxChange(Sender: TObject);
    procedure chk_SetFilterClick(Sender: TObject);
    procedure cbbRecent_FiltersChange(Sender: TObject);
    procedure cbbRecent_FiltersSelect(Sender: TObject);
    procedure mniRecentFIlters1Click(Sender: TObject);
    procedure adpmr_FilterMRUClick(Sender: TObject; const FileName: string);
    procedure synm_SQLEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure synm_SQLEditorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    fUndockedLeft: Integer;
    fUndockedTop: Integer;
    fChangeNum: Byte;
    fChangeNumD: Byte;

    fSQLSaved: Boolean;
    fSQLFileName: string;

    fDelphiSaved      : Boolean;
    fDelphiFileName   : string;
    fPrjPath          : string;
    fPasFileSaveLoc   : string;
    fNodeDbIndex      : integer;
    fDbTreeNode       : tTreeNode;
    GetSpecialFolders : TGEMSystemFolders;

    procedure PrintMemo(aHighlighter: TPrintHighLighter; Lines: TStrings);
    procedure SetEditorsChangesStatus;
    procedure SaveEditorFile(EditorType: TEditorUsed);
    procedure OpenEditorFile(EditorType: TEditorUsed);
    function ParamFieldType(const theFieldName: string) : TFieldType;
    procedure ApplyConfigChange(aFontStuff: TFontStuff);

  public
    { Public declarations }
    fDockingRect: TDockintRect;
    procedure SaveEditorFileAs(EditorType: TEditorUsed);
    procedure WMNCLButtonDown(Var aMEssage: TMessage); message WM_NCLBUTTONDOWN;
    procedure WMSysCommand(var MSG: TWMSysCommand); message WM_SYSCOMMAND;

    property DockingRect: TDockintRect read fDockingRect;
    property DelphiSaved: Boolean read fDelphiSaved write fDelphiSaved;
    property SQLSaved: Boolean read fSQLSaved write fSQLSaved;
    property PrjPath: string read fPrjPath write fPrjPath;
    property PasFileSaveLoc: string read fPasFileSaveLoc write fPasFileSaveLoc;
    property NodeDbIndex: integer read fNodeDbIndex write fNodeDbIndex;
  end;

var
  frm_SQLView: Tfrm_SQLView;

implementation
uses
  NxToolsMain,
  DockDemo.Utilities,
  DataMod,
  Winapi.SHFolder,

  GEMUseFullRoutines;

{$R *.dfm}

const
  SQLFilterSectionPrefix = 'SQL';

function SearchText(Control: TSynEdit; Search: string; SearchOptions: TSearchOptions): Boolean;
var
  Text: string;
  Index: Integer;
begin
  if soIgnoreCase in SearchOptions then begin
    Search := UpperCase(Search);
    Text := UpperCase(Control.Text);
  end
  else
    Text := Control.Text;

  Index := 0;
  if not (soFromStart in SearchOptions) then
    Index := PosEx(Search, Text,
         Control.SelStart + Control.SelLength + 1);

  if (Index = 0) and ((soFromStart in SearchOptions) or (soWrap in SearchOptions)) then
    Index := PosEx(Search, Text, 1);

  Result := Index > 0;
  if Result then begin
    Control.SelStart := Index - 1;
    Control.SelLength := Length(Search);
  end;
end;


//==============================================================================
//========= Editor save load files =============================================
//==============================================================================

procedure Tfrm_SQLView.OpenEditorFile(EditorType: TEditorUsed);
var
  MessageText: PWideChar;
  DisplayWarning: Boolean;

  procedure SetUpOpenDialog;
  begin
    DisplayWarning := False;
    case EditorType of
      edtSQL: begin
        dlgOpen_MemoFiles.FileName := stsbrpr_StatusBar.Panels[3].Text;
        dlgOpen_MemoFiles.DefaultExt := 'sql';
        dlgOpen_MemoFiles.Filter := 'SQL|*.SQL';
        dlgOpen_MemoFiles.InitialDir := string(fPrjPath);
        MessageText := 'SQL Text not Saved. Save?';
        if not fSQLSaved then
          DisplayWarning := True;
      end;

      edtDelphi: begin
        dlgOpen_MemoFiles.FileName := stsbrpr_StatusBar.Panels[9].Text;
        dlgOpen_MemoFiles.DefaultExt := 'pas';
        dlgOpen_MemoFiles.Filter := 'pas|*.pas';
        dlgOpen_MemoFiles.InitialDir := string(fPasFileSaveLoc);
        MessageText := 'Delphi Text not Saved. Save?';
        if not fDelphiSaved then
          DisplayWarning := True;
      end;
    end;
  end;

  procedure SetAfterOpenExe;
  begin
    case EditorType of
      edtSQL: begin
        synm_SQLEditor.Clear;
        fSQLFileName := dlgOpen_MemoFiles.FileName;
        synm_SQLEditor.Lines.LoadFromFile(fSQLFileName);
        fSQLSaved := true;
        stsbrpr_StatusBar.Panels[3].Text := fSQLFileName;
      end;

      edtDelphi: begin
        syndt_DelphiCodeMemo.Clear;
        fDelphiFileName := dlgOpen_MemoFiles.FileName;
        syndt_DelphiCodeMemo.Lines.LoadFromFile(fDelphiFileName);
        fDelphiSaved := true;
        gProjectInfo.PasSqlFileSaveLoc := ShortString(ExtractFileDir(fDelphiFileName));
        stsbrpr_StatusBar.Panels[9].Text := fDelphiFileName;
      end;
    end;
  end;

  procedure CheckForMasterTable;
  var
    table_str: string;
    index: Integer;
  begin
    try
      table_str := ExtractTextInsideGivenTagEx('</', '/>', synm_SQLEditor.Text);
      index := cbb_DatabaseTableNamesCB.Items.IndexOf(table_str);
      if index > -1 then
        cbb_DatabaseTableNamesCB.ItemIndex := index;
        nxtbl_MasterTable.TableName := table_str;
        nxtbl_MasterTable.Open;
        nxtbl_MasterTable.GetFieldNames(cbb_MasterFields.Items);
    except
      table_str := 'Not Found';
    end;
  end;

begin
  SetUpOpenDialog;
  if DisplayWarning then
    if MessageBox(Handle, MessageText, 'Warning', MB_YESNO
      + MB_ICONWARNING) = IDYES then
      SaveEditorFileAs(EditorType);

  if dlgOpen_MemoFiles.Execute then  begin
    SetAfterOpenExe;
    CheckForMasterTable;
  end;
  SetEditorsChangesStatus;
end;


procedure Tfrm_SQLView.SaveEditorFile(EditorType: TEditorUsed);
begin
  case EditorType of
    edtSQL: begin
      if DirectoryExists(ExtractFileDir(stsbrpr_StatusBar.Panels[3].Text)) then begin
        synm_SQLEditor.Lines.SaveToFile(stsbrpr_StatusBar.Panels[3].Text);
        fSQLSaved := True;
//        ProjectPath := ExtractFileDir(stsbrpr_StatusBar.Panels[3].Text);;
      end
      else
        SaveEditorFileAs(EditorType);
    end;

    edtDelphi: begin
      if DirectoryExists(ExtractFileDir(stsbrpr_StatusBar.Panels[9].Text)) then begin
        syndt_DelphiCodeMemo.Lines.SaveToFile(stsbrpr_StatusBar.Panels[9].Text);
        fDelphiSaved := True;
        gProjectInfo.PasSqlFileSaveLoc := ShortString(ExtractFileDir(stsbrpr_StatusBar.Panels[9].Text));
      end
      else
        SaveEditorFileAs(EditorType);
    end;
  end;
  SetEditorsChangesStatus;
end;


procedure Tfrm_SQLView.SaveEditorFileAs(EditorType: TEditorUsed);

  procedure SetUpOpenDialog;
  begin
    case EditorType of
      edtSQL: begin
        dlgSave_Memos.FileName := stsbrpr_StatusBar.Panels[3].Text;
        dlgSave_Memos.DefaultExt := 'sql';
        dlgSave_Memos.Filter := 'SQL|*.SQL';
        dlgSave_Memos.InitialDir := String(fPrjPath);
      end;

      edtDelphi: begin
        dlgSave_Memos.FileName := stsbrpr_StatusBar.Panels[9].Text;
        dlgSave_Memos.DefaultExt := 'pas';
        dlgSave_Memos.Filter := 'pas|*.pas';
        if DirectoryExists(String(fPasFileSaveLoc)) then begin
//        if (fProjectInfo.PasFileSaveLoc = '') or (fProjectInfo.PasFileSaveLoc = 'None') then
          GetSpecialFolders := TGEMSystemFolders.Create;
          dlgSave_Memos.InitialDir := GetSpecialFolders.PERSONAL;
          FreeAndNil(GetSpecialFolders);
        end
        else
          dlgSave_Memos.InitialDir := string(fPasFileSaveLoc);
      end;
    end;
  end;

  procedure SetAfterOpenExe;
  begin
    case EditorType of
      edtSQL: begin
        fSQLFileName := dlgSave_Memos.FileName;
        synm_SQLEditor.Lines.SaveToFile(fSQLFileName);
        fSQLSaved := true;
        stsbrpr_StatusBar.Panels[3].Text := fSQLFileName;
      end;

      edtDelphi: begin
        fDelphiFileName := dlgSave_Memos.FileName;
        syndt_DelphiCodeMemo.Lines.SaveToFile(fDelphiFileName);
        fDelphiSaved := true;
        stsbrpr_StatusBar.Panels[9].Text := fDelphiFileName;
        gProjectInfo.PasSqlFileSaveLoc := ShortString(dlgSave_Memos.InitialDir);
        end;
    end;
  end;

begin
  SetUpOpenDialog;
  if dlgSave_Memos.Execute then begin
    SetAfterOpenExe;
  end;
  SetEditorsChangesStatus;
end;


//======= Delphi Editor
procedure Tfrm_SQLView.act_PascalOpenDocExecute(Sender: TObject);
begin
  OpenEditorFile(edtDelphi);
end;


procedure Tfrm_SQLView.act_PascalSaveAsDocExecute(Sender: TObject);
begin
  SaveEditorFileAs(edtDelphi);
end;


procedure Tfrm_SQLView.act_PascalSaveDocExecute(Sender: TObject);
begin
  SaveEditorFile(edtDelphi);
end;


procedure Tfrm_SQLView.act_RunSQLCodeExecute(Sender: TObject);
//------------------ ActionExecute SQL Actions --------------------------------

  procedure LoadSQL(theDataSet: TnxQuery; SQLEditor: TSynEdit);
  begin
    nxtbl_MasterTable.Close;
    theDataSet.Close;
    theDataSet.DataSource := nil;
    theDataSet.SQL.Clear;
    theDataSet.SQL.Assign(SQLEditor.Lines);
  end;

  procedure SetNumQueryRecords;
  begin
    stsbrpr_StatusBar.Panels[4].Text := 'Records: '+ IntToStr(nxQuery.RecordCount);
  end;

  procedure SetNoParams;
  begin
    nxQuery.DataSource := nil;
    nxtbl_MasterTable.close;
    nxQuery.Open;
  end;

  procedure SetTableAndQuery;
  begin
    nxtbl_MasterTable.TableName :=
        cbb_DatabaseTableNamesCB.Items[cbb_DatabaseTableNamesCB.ItemIndex];
    nxQuery.DataSource := ds_MasterTableDS;
  end;

  procedure AddDataTypes;
  var
    i: integer;
  begin
    for i := 0 to nxQuery.ParamCount - 1 do begin
       nxQuery.Params[i].DataType := ParamFieldType(nxQuery.Params[i].Name);
    end;
  end;

begin
  Screen.Cursor := crHourGlass;
  try
    LoadSQL(nxQuery, synm_SQLEditor);
    // need to check if there are any params
    if nxQuery.ParamCount > 0 then begin
      if cbb_DatabaseTableNamesCB.ItemIndex < 0 then begin
        MessageDlg('Master Table has NOT been Selected!', mtError, [mbOK], 0);
        Exit;
      end;

      SetTableAndQuery;
      // add the param types /
      AddDataTypes;
      try
        gmprcstmr_SQLTimer.Start;
        nxtbl_MasterTable.open;
      except
        MessageDlg('Master Table could NOT be Openned!', mtError, [mbOK], 0);
        Exit;
      end;

      nxQuery.Open;
    end
    else begin
      gmprcstmr_SQLTimer.Start;
      SetNoParams;
    end;

    cbb_DatabaseTableNamesCBChange(Sender);
    SetNumQueryRecords;

    gmprcstmr_SQLTimer.Stop;

  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure Tfrm_SQLView.act_PascalNewDocExecute(Sender: TObject);
begin
  if not fDelphiSaved then
    if MessageBox(Handle, 'Delphi Text not Saved. Save?', 'Warning', MB_YESNO
      + MB_ICONWARNING) = IDYES then
      SaveEditorFileAs(edtDelphi);
  stsbrpr_StatusBar.Panels[9].Text := '';
  syndt_DelphiCodeMemo.Clear;
  fDelphiSaved := true;
  SetEditorsChangesStatus;
end;

//====== SQL Editor

procedure Tfrm_SQLView.act_SQLSaveAsExecute(Sender: TObject);
begin
  SaveEditorFileAs(edtSQL);
end;


procedure Tfrm_SQLView.act_SQLSaveExecute(Sender: TObject);
begin
  SaveEditorFile(edtSQL);
end;


procedure Tfrm_SQLView.adpmr_FilterMRUClick(Sender: TObject; const FileName: string);
begin
  edt_MasterTableFilter.Text := FileName;
  chk_SetFilter.Checked := False;
end;


procedure Tfrm_SQLView.ApplyConfigChange(aFontStuff: TFontStuff);
//   tSqlFontType = (sftStatements, sftComments, sftNumeric, sftEditor, sftTables, sftFunctions);

begin
  case aFontStuff.TypeFontItem of
    sftStatements:   begin
       SynSQLSyn.KeyAttri.Foreground := aFontStuff.Color;
       SynSQLSyn.KeyAttri.Background := aFontStuff.BackColor;
       SynSQLSyn.KeyAttri.Style := aFontStuff.Style;
    end;

    sftComments:   begin
       SynSQLSyn.CommentAttri.Foreground :=  aFontStuff.Color;
       SynSQLSyn.CommentAttri.Background := aFontStuff.BackColor;
       SynSQLSyn.CommentAttri.Style := aFontStuff.Style;
    end;

    sftNumeric:   begin
       SynSQLSyn.NumberAttri.Foreground :=  aFontStuff.Color;
       SynSQLSyn.NumberAttri.Background := aFontStuff.BackColor;
       SynSQLSyn.NumberAttri.Style := aFontStuff.Style;
    end;

    sftEditor:   begin
       synm_SQLEditor.Font.Color :=  aFontStuff.Color;
       synm_SQLEditor.Font.Style := aFontStuff.Style;
    end;

    sftTables:   begin
       SynSQLSyn.TableNameAttri.Foreground :=  aFontStuff.Color;
       SynSQLSyn.TableNameAttri.Background := aFontStuff.BackColor;
       SynSQLSyn.TableNameAttri.Style := aFontStuff.Style;
    end;

    sftFunctions:   begin
       SynSQLSyn.FunctionAttri.Foreground :=  aFontStuff.Color;
       SynSQLSyn.FunctionAttri.Background := aFontStuff.BackColor;
       SynSQLSyn.FunctionAttri.Style := aFontStuff.Style;
    end;
  end;

  synm_SQLEditor.Refresh;
{$IFDEF DEBUG}
  ShowmessageInt('SQLView.ApplyConfigChange Font num: ', ord(aFontStuff.TypeFontItem));
{$ENDIF}

end;


procedure Tfrm_SQLView.act_SQLOpenExecute(Sender: TObject);
begin
  OpenEditorFile(edtSQL);
end;


procedure Tfrm_SQLView.act_SQLNewDocExecute(Sender: TObject);
begin
  if not fSQLSaved then
    if MessageBox(Handle, 'SQL Text not Saved. Save?', 'Warning', MB_YESNO
      + MB_ICONWARNING) = IDYES then
      SaveEditorFileAs(edtSQL);
  stsbrpr_StatusBar.Panels[3].Text := '';
  synm_SQLEditor.Clear;
  fSQLSaved := true;
  SetEditorsChangesStatus;
end;


//==============================================================================
//========= Editor Cuts, Paste, Copy, Print ====================================
//==============================================================================

procedure Tfrm_SQLView.PrintMemo(aHighlighter: TPrintHighLighter;
                                 Lines: TStrings);
begin
  if dlgPntSet_PrintMemos.Execute then begin
    case aHighlighter of
      phSQL   : syndtprnt_Print.Highlighter := SynSQLSyn;
      phDelphi: syndtprnt_Print.Highlighter := SynPasSyn;
    end;
    syndtprnt_Print.Lines := Lines;
    syndtprnt_Print.Print;
  end;
end;


//========SQL Editor

procedure Tfrm_SQLView.act_SQLCutExecute(Sender: TObject);
begin
  synm_SQLEditor.CutToClipboard;
end;


procedure Tfrm_SQLView.act_SQLCutUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=  synm_SQLEditor.SelAvail;
end;


procedure Tfrm_SQLView.act_SQLCopyExecute(Sender: TObject);
begin
  synm_SQLEditor.CopyToClipboard;
end;


procedure Tfrm_SQLView.act_SQLPasteExecute(Sender: TObject);
begin
  synm_SQLEditor.PasteFromClipboard;
end;


procedure Tfrm_SQLView.btn_PrintSQLClick(Sender: TObject);
begin
  PrintMemo(phSQL, synm_SQLEditor.Lines);
end;


procedure Tfrm_SQLView.act_RunSQLCodeUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := synm_SQLEditor.Lines.Count > 0;
end;


//========Delphi editor

procedure Tfrm_SQLView.act_CreateDelphiCodeExecute(Sender: TObject);

  //=====================================
  procedure AddSQLLines;
  var
    i: Integer;
  begin
    for i := 0 to synm_SQLEditor.Lines.Count - 1 do
      syndt_DelphiCodeMemo.Lines.Add('  theDataSet.Sql.Add('+
           QuotedStr(synm_SQLEditor.Lines[i]) + ');');
  end;
  //=====================================
var
  j: Byte;
begin
  act_RunSQLCode.Execute;

  syndt_DelphiCodeMemo.Lines.Clear;

  if nxQuery.ParamCount > 0 then
    syndt_DelphiCodeMemo.Lines.Add('Function SQLFunction(theDataSet: TnxQuery; aDataSource: TDataSource): boolean;')
  else
    syndt_DelphiCodeMemo.Lines.Add('Function SQLFunction(theDataSet: TnxQuery): boolean;');
  syndt_DelphiCodeMemo.Lines.Add('Begin');
  syndt_DelphiCodeMemo.Lines.Add('  result := true;');

  syndt_DelphiCodeMemo.Lines.Add('  theDataSet.close;');

  syndt_DelphiCodeMemo.Lines.Add('  theDataSet.SQL.Clear;');
  syndt_DelphiCodeMemo.Lines.Add('  ');
  if nxQuery.ParamCount > 0 then
    syndt_DelphiCodeMemo.Lines.Add('  theDataSet.DataSource := aDataSource;');

  AddSQLLines;

  if nxQuery.ParamCount > 0 then begin
    for j := 0 to  nxQuery.ParamCount -1 do //begin
      syndt_DelphiCodeMemo.Lines.Add('  theDataSet.Params.ParamByName('+QuotedStr(nxQuery.Params[j].Name)+').DataType := ' +
                                 DbDataTypes[nxtbl_MasterTable.FieldDefs.Find(cbb_MasterFields.Items[j]).DataType]+';');    //end;
  end;

  syndt_DelphiCodeMemo.Lines.Add('  try');
  syndt_DelphiCodeMemo.Lines.Add('    theDataSet.open;');
  syndt_DelphiCodeMemo.Lines.Add('  except');
  syndt_DelphiCodeMemo.Lines.Add('    on E : Exception do');
  syndt_DelphiCodeMemo.Lines.Add('    begin');
  syndt_DelphiCodeMemo.Lines.Add('      Result := False;');
  syndt_DelphiCodeMemo.Lines.Add('      MessageDlg('+QuotedStr('Exception class name = ')+'+ E.ClassName'+ ' + #13 +');
  syndt_DelphiCodeMemo.Lines.Add('                 '+QuotedStr('Exception message = ') + '+ ' +
                                                   'E.Message, mtError, [mbOK], 0);');
  syndt_DelphiCodeMemo.Lines.Add('    end; ');
  syndt_DelphiCodeMemo.Lines.Add('  end; ');

//  try
//    {$IFNDEF INIDE} theDataSet.SQL.SaveToFile('NoDeliveryForDate.sql'); {$ENDIF}
//    theDataSet.open;
//  except
//    on E : Exception do
//      begin
//        Result := False;
//        MessageDlg('Exception class name = ' + E.ClassName +#13+ 'Exception message = ' +
//                   E.Message+  '.  "FindClientsNoDeliveryForDate"', mtError, [mbOK], 0);
//      end;
//  end;


//  syndt_DelphiCodeMemo.Lines.Add('    MessageDlg(''Error openning SQL statement.'', mtError, [mbOK], 0);');
//  syndt_DelphiCodeMemo.Lines.Add('    result := false;');
//  syndt_DelphiCodeMemo.Lines.Add('  end;');
  syndt_DelphiCodeMemo.Lines.Add('end;');
  fDelphiSaved := False;
  SetEditorsChangesStatus;
end;


procedure Tfrm_SQLView.act_DelphiPasteExecute(Sender: TObject);
begin
  syndt_DelphiCodeMemo.PasteFromClipboard;
end;


procedure Tfrm_SQLView.act_CreateDelphiCodeUpdate(Sender: TObject);
begin
  act_CreateDelphiCode.Enabled := synm_SQLEditor.Lines.Count > 0;
end;


procedure Tfrm_SQLView.act_DelphiCopyExecute(Sender: TObject);
begin
  syndt_DelphiCodeMemo.CopyToClipboard;
end;


procedure Tfrm_SQLView.act_DelphiCopyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=  syndt_DelphiCodeMemo.SelAvail;
end;


procedure Tfrm_SQLView.act_DelphiCutExecute(Sender: TObject);
begin
  syndt_DelphiCodeMemo.CutToClipboard;
end;


procedure Tfrm_SQLView.btn_PascalPrintDocClick(Sender: TObject);
begin
  PrintMemo(phDelphi, syndt_DelphiCodeMemo.Lines);
end;


//==============================================================================
//========= Form Stuff =========================================================
//==============================================================================

procedure Tfrm_SQLView.WMNCLButtonDown(var aMEssage: TMessage);
begin
  inherited;
  fUndockedLeft := Left;
  fUndockedTop := Top;
end;


procedure Tfrm_SQLView.WMSysCommand(var MSG: TWMSysCommand);
begin
//showmessage('in  Tfrm_SQLView.WMSysCommand');
//  if MSG.CmdType = SC_CLOSE then
//    frm_NxToolsMain.DeleteSQLX(Tag);
  inherited;
end;


procedure Tfrm_SQLView.FormActivate(Sender: TObject);
begin
  frm_NxToolsMain.DockingFormsInfo.ActiveIndex := tag;
  frm_NxToolsMain.lbl_ActiveForm.Caption := 'Active Form: ' + Caption;
  frm_NxToolsMain.DockingFormsInfo.TypeDockForm := TSQLForm;
//  synm_SQLEditor.CaretX := fCaretSQL.X;
//  synm_SQLEditor.CaretY := fCaretSQL.Y;
end;


procedure Tfrm_SQLView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not fSQLSaved) then
    if MessageDlg('Save SQL code to File?', mtWarning, [mbYes, mbNo],0)  = mrYes then
      SaveEditorFileAs(edtSQL);

  if not fDelphiSaved then
    if MessageDlg('Save Delphi code to File?', mtWarning, [mbYes, mbNo],0)  = mrYes then
      SaveEditorFileAs(edtDelphi);
  frm_NxToolsMain.DeleteSQLX(Tag);
  action := caFree;
end;


procedure Tfrm_SQLView.FormCreate(Sender: TObject);
begin
  fDockingRect.Ud_Top := Top;
  fDockingRect.Ud_Left := Left;
  fDockingRect.Ud_Width := Width;
  fDockingRect.Ud_Height := Height;

  adpmr_FilterMRU.IniFilePath := gProjectInfo.IniFilterPathFile;
  adpmr_FilterMRU.UseIniFile := True;

  fChangeNum := 0;
  fChangeNumD := 0;
  fSQLSaved := True;
  fDelphiSaved := True;
  SetEditorsChangesStatus;
end;


procedure Tfrm_SQLView.FormGetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  CanDock := false;
end;


procedure Tfrm_SQLView.FormShow(Sender: TObject);
begin
  fDbTreeNode := frm_NxToolsMain.tv_AliasAndTables.Items[fNodeDbIndex];
  tRootNodeDb(fDbTreeNode.Data^).DataBase.GetTableNames(cbb_DatabaseTableNamesCB.Items);
//  dm_DataMod.nxDatabase.GetTableNames(cbb_DatabaseTableNamesCB.Items);
  nxQuery.SQL.Clear;
  nxQuery.Params.Clear;
  if cbb_DatabaseTableNamesCB.Items.Count > 0 then begin
    cbb_DatabaseTableNamesCB.ItemIndex := 0;
//    ShowMessage('cbb DataTable name: '+cbb_DatabaseTableNamesCB.Text);
    nxtbl_MasterTable.TableName := cbb_DatabaseTableNamesCB.Text;
    adpmr_FilterMRU.StartingSection := SQLFilterSectionPrefix + nxtbl_MasterTable.TableName;
    cbb_MasterFields.Clear;
//    nxtbl_MasterTable.GetFieldNames(cbb_MasterFields.Items);
  end;
end;


procedure Tfrm_SQLView.FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
begin
  DragObject:= TTransparentDragDockObject.Create(Self);
end;


procedure Tfrm_SQLView.gmprcstmr_SQLTimerStop(Sender: TObject);
begin
  lbl_Time.Caption := gmprcstmr_SQLTimer.ElapsedTime;
end;


procedure Tfrm_SQLView.mniRecentFIlters1Click(Sender: TObject);
begin

end;


//==============================================================================
//========= Editor Change, status ==============================================
//==============================================================================


procedure Tfrm_SQLView.stsbrpr_StatusBarPanels3Click(Sender: TObject);
begin
  MessageBox(0, PWideChar(fSQLFileName), 'Filename:', MB_ICONINFORMATION or MB_OK);
end;


procedure Tfrm_SQLView.stsbrpr_StatusBarPanels9Click(Sender: TObject);
begin
  MessageBox(0, PWideChar(fDelphiFileName), 'Filename:', MB_ICONINFORMATION or MB_OK);
end;


procedure Tfrm_SQLView.syndt_DelphiCodeMemoChange(Sender: TObject);
begin
  fDelphiSaved := False;
  SetEditorsChangesStatus;
  stsbrpr_StatusBar.Panels[8].Text :=  'Modified';
  stsbrpr_StatusBar.Panels[8].Color :=  clYellow;
  Inc(fChangeNumD);
  stsbrpr_StatusBar.Panels[7].Text :=  'Column: '+IntToStr(syndt_DelphiCodeMemo.CaretX + 1)+'  Line: '+
                               IntToStr(syndt_DelphiCodeMemo.CaretY +1);
end;


procedure Tfrm_SQLView.syndt_DelphiCodeMemoStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  if (scCaretX in Changes) or (scCaretY in Changes) then
    stsbrpr_StatusBar.Panels[7].Text :=  'Column: '+IntToStr(syndt_DelphiCodeMemo.CaretX ) + '  Line: ' +
                               IntToStr(syndt_DelphiCodeMemo.CaretY );

  if scInsertMode in (Changes) then
      syndt_DelphiCodeMemoChange(Sender);
end;


procedure Tfrm_SQLView.SetEditorsChangesStatus;
begin
  if fSQLSaved then begin
    stsbrpr_StatusBar.Panels[2].Text :=  'Not Modified';
    stsbrpr_StatusBar.Panels[2].Color :=  clLime;
  end
  else begin
    stsbrpr_StatusBar.Panels[2].Text :=  'Modified';
    stsbrpr_StatusBar.Panels[2].Color :=  clYellow;
  end;

  if fDelphiSaved then begin
    stsbrpr_StatusBar.Panels[8].Text :=  'Not Modified';
    stsbrpr_StatusBar.Panels[8].Color :=  clLime;
  end
  else begin
    stsbrpr_StatusBar.Panels[8].Text :=  'Modified';
    stsbrpr_StatusBar.Panels[8].Color :=  clYellow;
  end;
end;


procedure Tfrm_SQLView.synm_SQLEditorChange(Sender: TObject);
begin
  fSQLSaved := False;
  SetEditorsChangesStatus;
  Inc(fChangeNum);

  stsbrpr_StatusBar.Panels[1].Text :=  'Column: '+IntToStr(synm_SQLEditor.CaretX + 1)+'  Line: '+
                               IntToStr(synm_SQLEditor.CaretY +1);
end;


(*
procedure TForm12.synm_1DragDrop(Sender, Source: TObject; X, Y: Integer);
Var
  LMemo: TSynEdit;
  InsertText: String;
Begin
  InsertText := (Source as TEdit).Text;

  LMemo := TSynEdit(Sender);
  // "When the text is dropped, it should replace any text that is currently highlighted." : OK
  If LMemo.SelAvail Then
    LMemo.ExecuteCommand( ecDeleteChar , #0, Nil );
  // Paste, same comment as previously, here it's just an example...
  LMemo.ExecuteCommand(ecImeStr, #0, PWideChar(InsertText));
end;


procedure TForm12.synm_1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var
  LCoord: TBufferCoord;
  LMemo: TSynEdit;
Begin
  Accept := (Source is TEdit) and ((Source as TEdit).Text <> '');

  LMemo := TSynEdit(Sender);
  // In your case you would rather test something with your tree...
//  Accept := Clipboard.AsText <> '';
  // "As you drag over the TSynEdit, the caret should mark the current drop position": OK
  If LMemo.GetPositionOfMouse(LCoord) Then
    LMemo.CaretXY := LCoord;
end;

*)

procedure Tfrm_SQLView.synm_SQLEditorDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
  LMemo: TSynEdit;
  InsertText: String;
Begin
//  if (Source as TListBox).Name = 'lst_TablesLB' then
//    InsertText := (Source as TListBox).Items[(Source as TListBox).ItemIndex]
//  else
//    if (Source as TListBox).Name = 'lst_FieldsLB' then
//      InsertText := frm_NxToolsMain.lst_TablesLB.Items[frm_NxToolsMain.lst_TablesLB.ItemIndex] +
//                    '.'+
//                    (Source as TListBox).Items[(Source as TListBox).ItemIndex];

  if (Source as TTreeView).Name = 'tv_TablesAndFields' then
    InsertText := (Source as TTreeView).DragValue;


  LMemo := TSynEdit(Sender);
  // "When the text is dropped, it should replace any text that is currently highlighted." : OK
  If LMemo.SelAvail Then
    LMemo.ExecuteCommand( ecDeleteChar , #0, Nil );
  // Paste, same comment as previously, here it's just an example...
  LMemo.ExecuteCommand(ecImeStr, #0, PWideChar(InsertText));
end;


procedure Tfrm_SQLView.synm_SQLEditorDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
Var
  LCoord: TBufferCoord;
  LMemo: TSynEdit;
Begin
  Accept := //((Source is TlistBox) and ((Source as TListBox).ItemIndex <> -1))  or
            ((Source is tTreeView) and ((Source as tTreeView).DragValue <> ''));

  LMemo := TSynEdit(Sender);
  If LMemo.GetPositionOfMouse(LCoord) Then
    LMemo.CaretXY := LCoord;
end;



procedure Tfrm_SQLView.synm_SQLEditorStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  if (scCaretX in Changes) or (scCaretY in Changes) then
    stsbrpr_StatusBar.Panels[1].Text :=  'Column: '+IntToStr(synm_SQLEditor.CaretX )+'  Line: '+
                               IntToStr(synm_SQLEditor.CaretY );

  if scInsertMode in (Changes) then
      synm_SQLEditorChange(Sender);
end;


function Tfrm_SQLView.ParamFieldType(const theFieldName: string)   : TFieldType;
begin
  Result := ftUnknown;
  if cbb_DatabaseTableNamesCB.ItemIndex < 0 then
    MessageDlg('A master table has not been selected! Returning'+#13+#10+'ftUnknown type.', mtError, [mbOK], 0)
  else begin
    Result := nxtbl_MasterTable.FieldDefs.Find(theFieldName).DataType;
  end;
end;


procedure Tfrm_SQLView.cbb_DatabaseTableNamesCBChange(Sender: TObject);
var
  s: string;
begin
  try
    chk_SetFilter.Checked := False;
    cbbRecent_FiltersChange(Sender);

    s:= 'TableName';
    nxtbl_MasterTable.Close;
    nxtbl_MasterTable.TableName := cbb_DatabaseTableNamesCB.Text;
    nxtbl_MasterTable.Filter := '';
    nxtbl_MasterTable.Filtered := False;
    nxtbl_MasterTable.IndexName := '';
    cbb_IndexComboBox.Text := '';
    cbb_MasterFields.Text := '';

// ShowMessage('Table Name: '+quotedstr(cbb_DatabaseTableNamesCB.Text));
    s:= 'Open ' + quotedstr(nxtbl_MasterTable.TableName);
    nxtbl_MasterTable.Open;

    s:= 'Clear cbb_MasterFields';
    cbb_MasterFields.Clear;

    s:= 'GetFieldNames '+ quotedstr(nxtbl_MasterTable.TableName);
    nxtbl_MasterTable.GetFieldNames(cbb_MasterFields.Items);

    nxtbl_MasterTable.GetIndexNames(cbb_IndexComboBox.Items);
    adpmr_FilterMRU.StartingSection := SQLFilterSectionPrefix + nxtbl_MasterTable.TableName;
  except
    ShowMessage('cbchange ERROR: ' + s);
  end;
end;


procedure Tfrm_SQLView.cbb_IndexComboBoxChange(Sender: TObject);
begin
  nxtbl_MasterTable.IndexName := cbb_IndexComboBox.Items[cbb_IndexComboBox.ItemIndex];
end;


procedure Tfrm_SQLView.cbb_MasterFieldsChange(Sender: TObject);
begin
  lbl_FieldTypelabel.Caption := DbDataTypes[nxtbl_MasterTable.FieldDefs.Find(cbb_MasterFields.Items[cbb_MasterFields.ItemIndex]).DataType];
  edt_FindFields.Text := '';
  edt_FindFields.DataField := cbb_MasterFields.Text;
  edt_FindFields.Enabled := True;
end;


procedure Tfrm_SQLView.chk_SetFilterClick(Sender: TObject);
begin
  if chk_SetFilter.Checked then begin
    try
      nxtbl_MasterTable.Filter := edt_MasterTableFilter.Text;
      nxtbl_MasterTable.Filtered := True;
      adpmr_FilterMRU.UseIniFile := True;
      adpmr_FilterMRU.AddItem(SQLFilterSectionPrefix + nxtbl_MasterTable.TableName, edt_MasterTableFilter.Text, true);
    except
      on E: Exception do begin
        MessageDlg('Can not Set Filter: '+#13+ E.Message, mtError, [mbOk],0);
        nxtbl_MasterTable.Filtered := False;
        chk_SetFilter.Checked := False;
      end;
    end;
  end
  else
    nxtbl_MasterTable.Filtered := False;

  nxtbl_MasterTable.Refresh;
end;


procedure Tfrm_SQLView.cbbRecent_FiltersChange(Sender: TObject);
begin
  chk_SetFilter.Checked := False;
  nxtbl_MasterTable.Filtered := False;
end;


procedure Tfrm_SQLView.cbbRecent_FiltersSelect(Sender: TObject);
begin
  chk_SetFilter.Checked := True;
  chk_SetFilterClick(Sender);
end;

end.
