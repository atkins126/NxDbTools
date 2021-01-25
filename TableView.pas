unit TableView;

interface
{.$DEFINE DBUG}

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.UITypes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Menus,

  amSplitter, GEMDBLabel, adpMRU,

  Data.DB,

  JvDataSource, JvExControls, JvXPCore, JvXPButtons, JvDBControls,  JvExMask,
  JvToolEdit, JvMaskEdit, JvDBFindEdit,  JvExStdCtrls, JvEdit, JvDBSearchEdit,

  ovccmbx, ovcdbfcb, ovcbase,

  nxdb, nxsdServerEngine, nxsdTypes,

  RzListVw, RzDBGrid, RzDBNav, RzCommon, RzEdit, RzPanel,

  EsBase, EsMnuBtn;

type
  TDockintRect = record
    Ud_Top: integer;
    Ud_Left: integer;
    Ud_Width: integer;
    Ud_Height: integer;
  end;

  Tfrm_TableView = class(TForm)
    pnl_1: TPanel;
    lbl_FieldTypelabel: TGEMDBLabel;
    lbl_1: TLabel;
    lbl_12: TLabel;
    cbb_IndexComboBox: TComboBox;
    btn_EmptyTableBtn: TJvXPButton;
    btn_PackTableBtn: TJvXPButton;
    nxTable: TnxTable;
    ds_TableDS: TJvDataSource;
    OvcDbFieldComboBox: TOvcDbFieldComboBox;
    lab_Size: TLabel;
    OvcDbFieldComboBoxLabel1: TOvcAttachedLabel;
    JvDBFindEdit: TJvDBFindEdit;
    lbl1: TLabel;
    pgc_TableInfo: TPageControl;
    ts_Grid: TTabSheet;
    ts_FieldDescriptors: TTabSheet;
    ts_IndexDescriptors: TTabSheet;
    lv_FieldDescrip: TRzListView;
    lv_IndexDescrips: TRzListView;
    lbl2: TLabel;
    chk_SetFilter: TCheckBox;
    rzdbgrd_1: TRzDBGrid;
    rzdbnvgtr_1: TRzDBNavigator;
    adpmr_TableFilters: TadpMRU;
    pm_TableFilters: TPopupMenu;
    btn_TableFilters: TEsMenuButton;
    mni_RecentFilters: TMenuItem;
    mni_Close1: TMenuItem;
    edt_MasterTableFilter: TRzEdit;
    procedure pnl_1GetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure cbb_IndexComboBoxChange(Sender: TObject);
    procedure OvcDbFieldComboBoxChange(Sender: TObject);
    procedure btn_PackTableBtnClick(Sender: TObject);
    procedure btn_EmptyTableBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbRecent_FiltersChange(Sender: TObject);
    procedure chk_SetFilterClick(Sender: TObject);
    procedure cbbRecent_FiltersSelect(Sender: TObject);
    procedure adpmr_TableFiltersClick(Sender: TObject; const FileName: string);
  private
    { Private declarations }
    fUndockedLeft: Integer;
    fUndockedTop: Integer;
    fPrjPath    : string;
  public
    { Public declarations }
    fDockingRect: TDockintRect;
    procedure WMNCLButtonDown(Var aMEssage: TMessage); message WM_NCLBUTTONDOWN;
    procedure WMSysCommand(var MSG: TWMSysCommand); message WM_SYSCOMMAND;

    property DockingRect: TDockintRect read fDockingRect;
    property PrjPath: string read fPrjPath write fPrjPath;
  end;

var
  frm_TableView: Tfrm_TableView;

implementation
uses
  NxToolsMain,
  Global,
  DockDemo.Utilities,
  DataMod,
  GlobalVars;

const
  TableFilterSectionPrefix = 'Tbl';

{$R *.dfm}


procedure Tfrm_TableView.adpmr_TableFiltersClick(Sender: TObject;
  const FileName: string);
begin
  edt_MasterTableFilter.Text := FileName;
  chk_SetFilter.Checked := False;
end;


procedure Tfrm_TableView.btn_EmptyTableBtnClick(Sender: TObject);
begin
  if MessageDlg('Empty Table?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    nxTable.EmptyTable;
end;


procedure Tfrm_TableView.btn_PackTableBtnClick(Sender: TObject);
var
//  nPosDep: LongInt;
  Status: TnxTaskStatus;
  TaskInfo: TnxAbstractTaskInfo;
  Completed: Boolean;
begin
  btn_PackTableBtn.Caption := 'Packing';
  btn_PackTableBtn.Refresh;
  nxTable.Close;
  TaskInfo := nxTable.PackTable;
  if Assigned(TaskInfo) then begin
    repeat
      TaskInfo.GetStatus(Completed, Status);
      Application.ProcessMessages;
      if not Completed then begin
      end;
    until Completed;
  end;
  btn_PackTableBtn.Caption := 'Pack Complete';
  btn_PackTableBtn.Refresh;
  nxTable.Open;
  Sleep(500);
  btn_PackTableBtn.Caption := 'Pack Table';
end;


procedure Tfrm_TableView.cbbRecent_FiltersChange(Sender: TObject);
begin
  chk_SetFilter.Checked := False;
  nxTable.Filtered := False;
end;


procedure Tfrm_TableView.cbbRecent_FiltersSelect(Sender: TObject);
begin
  chk_SetFilter.Checked := True;
  chk_SetFilterClick(Sender);
end;


procedure Tfrm_TableView.cbb_IndexComboBoxChange(Sender: TObject);
begin
  nxTable.IndexName := cbb_IndexComboBox.Items[cbb_IndexComboBox.ItemIndex];
end;


procedure Tfrm_TableView.chk_SetFilterClick(Sender: TObject);
begin
  if chk_SetFilter.Checked then begin
    try
      nxTable.Filter := edt_MasterTableFilter.Text;
      nxTable.Filtered := True;
      adpmr_TableFilters.AddItem(TableFilterSectionPrefix + nxTable.TableName, edt_MasterTableFilter.Text, true);
    except
      on E: Exception do begin
        MessageDlg('Can not Set Filter: '+#13+ E.Message, mtError, [mbOk],0);
        nxTable.Filtered := False;
        chk_SetFilter.Checked := False;
      end;
    end;
  end
  else
    nxTable.Filtered := False;

  nxTable.Refresh;
end;


procedure Tfrm_TableView.FormActivate(Sender: TObject);
begin
{$IFDEF DBUG}
ShowMessage('Tfrm_TableView item Clk');
{$ENDIF}
  frm_NxToolsMain.DockingFormsInfo.ActiveIndex := tag;
  frm_NxToolsMain.DockingFormsInfo.TypeDockForm := TTblForm;
  frm_NxToolsMain.lbl_ActiveForm.Caption := 'Active Form: ' + Caption;
  frm_NxToolsMain.TurnOffSQLStuff;
end;


procedure Tfrm_TableView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;


procedure Tfrm_TableView.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := true;
end;


procedure Tfrm_TableView.FormCreate(Sender: TObject);
begin
  fDockingRect.Ud_Top := Top;
  fDockingRect.Ud_Left := Left;
  fDockingRect.Ud_Width := Width;
  fDockingRect.Ud_Height := Height;
  pgc_TableInfo.ActivePageIndex := 0;

  adpmr_TableFilters.IniFilePath := string(fPrjPath + cFilterIniFiles);
  adpmr_TableFilters.UseIniFile := True;
  adpmr_TableFilters.MaxItems := 7;
end;


procedure Tfrm_TableView.FormGetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  fDockingRect.Ud_Top := Top;
  fDockingRect.Ud_Left := Left;
  fDockingRect.Ud_Width := Width;
  fDockingRect.Ud_Height := Height;
end;


procedure Tfrm_TableView.FormShow(Sender: TObject);
var
  index: Integer;
  Itm: TListItem;
  Itm1: TListItem;
begin
  adpmr_TableFilters.StartingSection := TableFilterSectionPrefix + nxTable.TableName; ;

  lv_FieldDescrip.Clear;
  for index := 0 to ds_TableDS.FieldCount - 1 do begin
    Itm := lv_FieldDescrip.Items.Add;
    Itm.Caption := IntToStr(nxTable.FieldDefs.Items[index].FieldNo);
    Itm.SubItems.Add(nxTable.FieldDefs.Items[index].Name);
    Itm.SubItems.Add(DbDataTypes[nxTable.FieldDefs.Items[index].DataType]);
    Itm.SubItems.Add(IntToStr(nxTable.FieldDefs.Items[index].Size));
    Itm.SubItems.Add(BoolToStr(nxTable.FieldDefs.Items[index].Required));
  end;

  lv_IndexDescrips.Clear;
  for index := 0 to nxTable.IndexDefs.Count - 1 do begin
    Itm1 := lv_IndexDescrips.Items.Add;
    Itm1.Caption := nxTable.IndexDefs.Items[index].Name;
    Itm1.SubItems.Add(nxTable.IndexDefs.Items[index].Fields);
    Itm1.SubItems.Add(nxTable.IndexDefs.Items[index].DescFields);
  end;

end;


procedure Tfrm_TableView.FormStartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
  DragObject:= TTransparentDragDockObject.Create(Self);
end;


procedure Tfrm_TableView.OvcDbFieldComboBoxChange(Sender: TObject);
var
  theFieldDef: TFieldDef;
begin
  theFieldDef := nxTable.FieldDefs.Find(OvcDbFieldComboBox.Items[OvcDbFieldComboBox.ItemIndex]);
  lbl_FieldTypelabel.Caption := 'Data type: '+ DbDataTypes[theFieldDef.DataType];
  lab_Size.Caption := 'Size: '+IntToStr(theFieldDef.Size);
  JvDBFindEdit.DataField :=  OvcDbFieldComboBox.Text;
  JvDBFindEdit.Text := '';
end;


procedure Tfrm_TableView.pnl_1GetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  CanDock := false;
end;


procedure Tfrm_TableView.WMNCLButtonDown(var aMEssage: TMessage);
begin
  inherited;
  fUndockedLeft := Left;
  fUndockedTop := Top;
end;


procedure Tfrm_TableView.WMSysCommand(var MSG: TWMSysCommand);
begin
  if MSG.CmdType = SC_CLOSE then
    frm_NxToolsMain.DeleteTblX(Tag);
  inherited;
end;

end.
