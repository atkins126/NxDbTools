unit GetPrjList;

interface
{.$DEFINE USE_CODESITE}

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  System.Actions, System.UITypes, System.ImageList,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ActnList, Vcl.FileCtrl, Vcl.WinXPanels, Vcl.Mask,
  Vcl.DBCGrids, Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.Menus, Vcl.ImgList,
  Vcl.WinXCtrls, Vcl.CategoryButtons,

  GemMruList, PngImageList, Global, SBPro, GEMDBLabel, SaveComponentsToIni,

  nxdb, Data.DB,

  RzEdit, RzDBEdit, RzPanel, RzDBNav,

  JvBaseDlg, JvSelectDirectory, JvComponentBase, JvFormPlacement, JvExStdCtrls,
  JvRadioButton, JvRollOut, JvLabel, JvDBControls, JvButton, JvPanel, JvCombobox,
  JvTransparentButton, JvExControls, JvLED, JvExExtCtrls, JvExtComponent,
  JvDBSearchComboBox, JvExMask, JvToolEdit, JvMaskEdit, JvDBFindEdit, JvListBox,
  JvXPCore, JvXPButtons, JvImage, JvImageList, JvSpeedButton, JvBehaviorLabel,
  JvComboListBox, JvBalloonHint, JvRadioGroup,

  PngSpeedButton

  {$IFDEF  USE_CODESITE}, CodeSiteLogging {$ENDIF};



type
  tPrjOpenType = (pot_MRU, pot_PrjGrid, pot_Default);


  tIniComponent = (icTJVRadioGrp, icTEditLocalDbPath, icTEditServer, icTEditAlias,
                   icToggleAliasToUse);



  Tfrm_SelectProject = class(TForm)
    ActionList1                  : TActionList;
    act_DefaultPrj               : TAction;
    act_OpenPrj                  : TAction;
    act_CreatePrj                : TAction;
    act_DeletePrj                : TAction;
    act_SetPrjPath               : TAction;
//    act_ClickLabel             : TAction;
    act_SetNetwodkDbType         : TAction;
    cardpnl_Dialogs              : TCardPanel;
    Card_CreateSelectPrjDb       : TCard;
    Card_MostRecentlyUsedPrj     : TCard;
    lstGemMruList1               : tGemMruList;
    btn_actCnPrefixWizard        : TJvXPButton;
    btn_actCnPrefixWizard1       : TJvXPButton;
    btn_actCnPrefixWizard2       : TJvXPButton;
    btn_actCnPrefixWizard3       : TJvXPButton;
    btn__Close                   : TJvXPButton;
    xpbtn_GetPrjPath             : TJvXPButton;
    jvxpbtn_HaltProgram          : TJvXPButton;
    JvXPButton4                  : TJvXPButton;
    JvFormStorage1               : TJvFormStorage;
    JvPanel1                     : TJvPanel;
    JvLED1                       : TJvLED;
    DBCtrlGrid1                  : TDBCtrlGrid;
    rzdbed_PrjName               : TRzDBEdit;
    RzDBEdit1                    : TRzDBEdit;
    RzDBEdit2                    : TRzDBEdit;
    RzDBEdit3                    : TRzDBEdit;
    RzDBEdit4                    : TRzDBEdit;
    RzDBEdit5                    : TRzDBEdit;
    RzDBMemo1                    : TRzDBMemo;
    RzDBNavigator1               : TRzDBNavigator;
    NxDelphiSqlTools_Status      : TJvDBStatusLabel;
    JvSelectDirectory1           : TJvSelectDirectory;
    WinSock2                     : TMenuItem;
    NamePipe2                    : TMenuItem;
    LocalServer2                 : TMenuItem;
    SharedMem2                   : TMenuItem;
    None2                        : TMenuItem;
    StatusBarPro                 : TStatusBarPro;
    sv_MenuItems                 : TSplitView;
    Shape1                       : TShape;
    Label11                      : TLabel;
    Label10                      : TLabel;
    Label9                       : TLabel;
    Label8                       : TLabel;
    Label7                       : TLabel;
    Label6                       : TLabel;
    Label1                       : TLabel;
    Label3                       : TLabel;
    lbl4                         : TLabel;
    Label2                       : TLabel;
    GEMDBLabel1                  : TGEMDBLabel;
    btn_GridMruSelection         : TButton;
    JvDBSearchComboBox1          : TJvDBSearchComboBox;
    JvDBFindEdit1                : TJvDBFindEdit;
    timer_SearchTimerBlank       : TTimer;
    popm_Transport               : TPopupMenu;
    popm_Server                  : TPopupMenu;
    popm_Database                : TPopupMenu;
    jvblnhnt_1                   : TJvBalloonHint;
    act_ConnectBtn               : TAction;
//    XmlDoc                     : TXMLDocument;
    act_PrjEdit                  : TAction;
    crd_SetDbServer              : TCard;
    crd_CreateNewDbTables        : TCard;
    Label13                      : TLabel;
    Shape2                       : TShape;
    Label14                      : TLabel;
    lbl_CaptionForLocalDbPath    : TLabel;
    bl_1                         : TJvBehaviorLabel;
    btn_ResetLocalDbPath         : TJvXPButton;
    jvxpbtn_GetLocalPath         : TJvXPButton;
    edit_LocalDbPath             : TEdit;
    lbl_CaptionForServerLb       : TLabel;
    lb_ServerNames               : TJvListBox;
    lbl_CaptionNetServerSelected : TLabel;
    edt_NetWorkServer            : TEdit;
    ts_DefaultAliasBtnDb         : TToggleSwitch;
    lbl_CaptionForDBAlais        : TLabel;
    edt_Alias                    : TEdit;
    Shape3                       : TShape;
    Label15                      : TLabel;
    btn_ConnectDb                : TButton;
    Label16                      : TLabel;
    btn_CopyDbTables             : TButton;
    ctgrybtns_Menu               : TCategoryButtons;
    il1                          : TImageList;
    act_RecentPrjs               : TAction;
    act_CreateEditPrjs           : TAction;
    act_ChangeDbServers          : TAction;
    act_CreateUpdateDb           : TAction;
    act_PackRestDb               : TAction;
    crd_PackRestructureDb        : TCard;
    btn_OpenCloseSv              : TPngSpeedButton;
    shp4                         : TShape;
    lbl_Caption4                 : TLabel;
    jvrdgrp_ServerType           : TJvRadioGroup;
    lstbox_Issues                : TListBox;
    jvlstbx_AlaisNames           : TJvListBox;
    lbl_CaptionAliasLB           : TLabel;
    btn_1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure act_OpenPrjUpdate(Sender: TObject);
    procedure act_DeletePrjUpdate(Sender: TObject);
    procedure act_OpenPrjExecute(Sender: TObject);
    procedure act_DeletePrjExecute(Sender: TObject);
    procedure act_DefaultPrjExecute(Sender: TObject);
    procedure act_CreatePrjExecute(Sender: TObject);
//    procedure act_ClickLabelExecute(Sender: TObject);
//    procedure act_ClickLabelUpdate(Sender: TObject);
    procedure act_SetPrjPathExecute(Sender: TObject);
    procedure btn__CloseClick(Sender: TObject);
    procedure btn_CopyDbTablesClick(Sender: TObject);
    procedure act_SetNetwodkDbTypeExecute(Sender: TObject);
    procedure cardpnl_DialogsCardChange(Sender: TObject; PrevCard, NextCard: TCard);
    procedure TransPortClick(Sender: TObject);
    procedure SharedMem2Click(Sender: TObject);
//    procedure sv_MenuItemsClosing(Sender: TObject);
    procedure sv_MenuItemsOpening(Sender: TObject);
    procedure btn__SplitViewOpenCloseClick(Sender: TObject);
    procedure SetDialogServerType;
    procedure timer_SearchTimerBlankTimer(Sender: TObject);
    procedure JvDBFindEdit1Change(Sender: TObject);
    procedure lb_ServerNames1Click(Sender: TObject);
    procedure ts_DefaultAliasBtnDbClick(Sender: TObject);
    procedure jvxpbtn_HaltProgramClick(Sender: TObject);
    procedure lstGemMruList1Click(Sender: TObject; aIndexItem: Integer; aName,
      aValue: string);
    procedure act_ConnectBtnExecute(Sender: TObject);
    procedure act_ConnectBtnUpdate(Sender: TObject);
    procedure act_PrjEditUpdate(Sender: TObject);
    procedure act_PrjEditExecute(Sender: TObject);
    procedure jvxpbtn_GetLocalPathClick(Sender: TObject);
    procedure btn_ResetLocalDbPathClick(Sender: TObject);
    procedure act_RecentPrjsExecute(Sender: TObject);
    procedure act_CreateEditPrjsExecute(Sender: TObject);
    procedure act_CreateUpdateDbExecute(Sender: TObject);
    procedure act_ChangeDbServersExecute(Sender: TObject);
    procedure act_PackRestDbExecute(Sender: TObject);
    procedure sv_MenuItemsClosed(Sender: TObject);
    procedure sv_MenuItemsOpened(Sender: TObject);
    procedure jvlstbx_AlaisNamesClick(Sender: TObject);
    procedure jvrdgrp_ServerTypeClick(Sender: TObject);
    procedure btn_1Click(Sender: TObject);

  private
    { Private declarations }
    fPrjInfo     : TProjectInfo;
    fComponentIni: array[0..4] of TObject; //array[tIniComponent] of TObject;

    procedure OpenPrjFrom(Sender: TObject; PrjOpenType: tPrjOpenType);
    procedure OpenProject(sender: TObject);
    procedure RemoveFolder(const Dir: string);
    function SetPrjDbServerType(aLocalServer: Boolean; var Status: string): Boolean;
    procedure SetStatusBar(aMsg: string; aPanel: Byte; aColor: TColor);
    function CloseDelphiSqlToolsDb(var Status: string): boolean;
    procedure SetConnectBtn(aConnected: Boolean);
    procedure SetFormSize;
    procedure CheckUserServerSelection;
    function ReadConfigXmlFile(aChildern: tStrings): string;
  public
    { Public declarations }
    procedure OpenDefaultPrj;
    Function SavePrjDb(afPrjInfo: TProjectInfo; var fStatus: string): boolean;
    property PrjInfo: TProjectInfo read fPrjInfo write fPrjInfo;
  end;

  tCardList = (cl_CardCreatePrjDb, cl_CardMostRecnt, cl_Server, cl_NewDb, cl_Pack);
  tFwd = (fwd_Width, fwd_Height);

resourcestring
  NoServer     = '1. There is no Server Selected!';
  DbPath       = '2. ''Local Database Path'' is not Valid!';
  ServerLb     = '2. There are No Network Servers listed!';
  SelectServer = '2. The ''Selected Server'' box is blank!';
  SelectSerNotInLb = '2. The ''Selected Server'' not in List of Servers!';
  AliasList    = '2. The Alias list is empty';
  AliasBlank   = '2. ''Network Database Alias'' box is blank';
  AliasNotFound= '2. Alias not found in Db';

  ButTable     = 'BuNxSqlButtonsDb.nx1';
  ToolsPrj     = 'NxDbSqlToolsPrjs.nx1';
  NxSqlBtn     = 'NxSqlButtonsDb.nx1';
  Trans        = 'TransportLUT.nx1';


var
  frm_SelectProject: Tfrm_SelectProject;

implementation
uses
  NxToolsMain, nxllTransport, GEMUseFullRoutines, DataMod, XMLDoc, XMLIntf;
{$R *.dfm}
{.$R Moreimages.res}

const
  cCompactMenuOffset = 160; // opened width - compact width
  cUsePrjMan = '(Create, Edit, Remove Projects)';
  cUseRecent = '(Select Recently Use Project)';

  cPrjForm: array[cl_CardCreatePrjDb..cl_Pack, fwd_Width..fwd_Height] of integer =
                                               (( 965, 580), (683, 565),
                                                ( 730, 575), (479, 565),
                                                ( 965, 565));

  cBtnHintMRU  = 'Select project from a MRU Listing';
  cBtnHintGrid = 'Select project from Db Project Grid Listing';
  cBtnSelectCaption = 'Create, Edit, Select Projects';
  cBtnMRUCaption = 'Recently Use Projects';



function Tfrm_SelectProject. ReadConfigXmlFile(aChildern: tStrings): string;
var
  XmlFile : TXMLDocument;
  MainNode, ChildNode : IXMLNode;
  i : Integer;
  XMLPath : string;
  fCild: string;
begin
//LB_FINDSTRING
//  XMLPath := PathAndFileAtFormLocSize;
//  XmlFile := TXMLDocument.Create(Application);
//  try
//    XmlFile.LoadFromFile(XMLPath);
//    XmlFile.Active := True;
//    MainNode := XmlFile.DocumentElement;
//    fCild := aChildern;
//
//    for i:=0 to MainNode.ChildNodes[aChildern.Strings[0]].ChildNodes.Count-1 do
//    begin
//      CustomerNode := MainNode.ChildNodes['Customers'].ChildNodes[i];
//      MainNode.ChildNodes['Customers'].ChildNodes[i].ChildNodes
//      //Here you can get any imformation
//      ShowMessage(CustomerNode.ChildNodes['address_name'].Text);
//      ShowMessage(CustomerNode.ChildNodes['address_line_1'].Text);
//    end;
//  finally
//    FreeAndNil(XmlFile);
//  end;
end;

procedure Tfrm_SelectProject.SetStatusBar(aMsg: string; aPanel: Byte; aColor: TColor);
begin
  StatusBarPro.Panels[aPanel].Color := aColor;
  StatusBarPro.Panels[aPanel].Font.Color := GetFontColorFromBackGroundColor(aColor);
  StatusBarPro.Panels[aPanel].Text := aMsg;
end;


//procedure Tfrm_SelectProject.act_ClickLabelExecute(Sender: TObject);
//begin
//  case act_ClickLabel.Tag of
//    0: begin
//      act_ClickLabel.Tag := 1;
//      btn_GridMruSelection.Hint :=  cBtnHintGrid;
//      btn_GridMruSelection.Caption := cBtnSelectCaption;
//    end;
//
//    1: begin
//      act_ClickLabel.Tag := 0;
//      btn_GridMruSelection.Hint := cBtnHintMRU;
//      btn_GridMruSelection.Caption := cBtnMRUCaption;
//    end
//
//    else
//    begin
//      act_ClickLabel.Tag := 0;
//      btn_GridMruSelection.Hint := cBtnHintMRU;
//      btn_GridMruSelection.Caption := cBtnMRUCaption;
//    end;
//  end;
//end;
//
//
//procedure Tfrm_SelectProject.act_ClickLabelUpdate(Sender: TObject);
//begin
//  act_ClickLabel.Enabled := not sv_MenuItems.Opened;
//  case act_ClickLabel.Tag of
//    0: begin
//      cardpnl_Dialogs.ActiveCard := Card_CreateSelectPrjDb;
//      act_ClickLabel.Caption := cUseRecent;
//      act_ClickLabel.ImageIndex := 10;
//    end;
//
//    1: begin
//      cardpnl_Dialogs.ActiveCard := Card_MostRecentlyUsedPrj;
//      act_ClickLabel.Caption := cUsePrjMan;
//      act_ClickLabel.ImageIndex := 9;
//    end;
//
//    else begin
//      cardpnl_Dialogs.ActiveCard := Card_CreateSelectPrjDb;
//      act_ClickLabel.Caption := cUsePrjMan;
//      act_ClickLabel.ImageIndex := 10;
//    end;
//  end;
//end;



procedure Tfrm_SelectProject.lstGemMruList1Click(Sender: TObject;
  aIndexItem: Integer; aName, aValue: string);
begin
  OpenPrjFrom(Sender, pot_MRU);
end;


procedure Tfrm_SelectProject.act_CreatePrjExecute(Sender: TObject);
{$ENDREGION}
begin
  dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Insert;
end;


procedure Tfrm_SelectProject.OpenDefaultPrj;
begin
  act_DefaultPrj.Execute;
end;


procedure Tfrm_SelectProject.RemoveFolder(const Dir: string);
var
  Result: TSearchRec;
begin
  if FindFirst(Dir + '\*', faAnyFile, Result) = 0 then begin
    Try
      repeat
        if (Result.Attr and faDirectory) = faDirectory then
        begin
          if (Result.Name <> '.') and (Result.Name <> '..') then
            RemoveFolder(Dir + '\' + Result.Name)
        end
        else if not DeleteFile(Dir + '\' + Result.Name) then
          RaiseLastOSError;
      until FindNext(Result) <> 0;
    Finally
      FindClose(Result);
    End;
  end;
  if not RemoveDir(Dir) then
    RaiseLastOSError;
end;


procedure Tfrm_SelectProject.act_DeletePrjExecute(Sender: TObject);
begin
  if MessageDlg('Delete ' + QuotedStr(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjName.AsString) + ' project?',
    mtWarning, [mbOk, mbCancel],0) = mrOk then begin
    fPrjInfo.BeginUpdate;
    fPrjInfo.PrjName := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjName.AsString);
    fPrjInfo.PrjPath := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString);
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Delete;
    lstGemMruList1.DeleteItem(string(fPrjInfo.PrjName));
    fPrjInfo.EndUpdate;
    GetProjectList;
  end;
end;


procedure Tfrm_SelectProject.act_DeletePrjUpdate(Sender: TObject);
begin
  act_DeletePrj.Enabled := (JvLED1.Status) and (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.RecordCount > 0);
end;


procedure Tfrm_SelectProject.SharedMem2Click(Sender: TObject);
begin
  dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := SharedMem2.tag;
  dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
end;


procedure Tfrm_SelectProject.sv_MenuItemsClosed(Sender: TObject);
begin
  SetFormSize;
end;


//procedure Tfrm_SelectProject.sv_MenuItemsClosing(Sender: TObject);
//begin
////  if cardpnl_Dialogs.ActiveCard = Card_CreateSelectPrjDb then begin
////    frm_SelectProject.Width := cCard_CreateSelectPrjDb_FormW;
////    frm_SelectProject.Height := cCard_CreateSelectPrjDb_FormH;
////  end;
////  if cardpnl_Dialogs.ActiveCard = Card_MostRecentlyUsedPrj then begin
////    frm_SelectProject.Width := cCard_MostRecentlyUsedPrj_FormW;
////    frm_SelectProject.Height := cCard_MostRecentlyUsedPrj_FormW;
////  end;
//end;


procedure Tfrm_SelectProject.act_PrjEditExecute(Sender: TObject);
var
  Status: string;
begin
  CloseDelphiSqlToolsDb(Status);
  SetDialogServerType;
  SetConnectBtn(false);
end;


procedure Tfrm_SelectProject.CheckUserServerSelection;

  //==================

  function DoFilesExist: Boolean;
  begin
    result := true;
    if not FileExists(GetCorrectedSlashes(DbPath, ButTable, st_Win)) then begin
      lstbox_Issues.Items.Add('Table not found: '+ButTable);
      Result := False;
    end;

    if not FileExists(GetCorrectedSlashes(DbPath, ToolsPrj, st_Win)) then begin
      lstbox_Issues.Items.Add('Table not found: '+ToolsPrj);
      Result := False;
    end;

    if not FileExists(GetCorrectedSlashes(DbPath, NxSqlBtn, st_Win)) then begin
      lstbox_Issues.Items.Add('Table not found: '+NxSqlBtn);
      Result := False;
    end;

    if not FileExists(GetCorrectedSlashes(DbPath, Trans, st_Win)) then begin
      lstbox_Issues.Items.Add('Table not found: '+Trans);
      Result := False;
    end;
  end;

  //==================

  function LocalReady: Boolean;
  begin
    result := false;
    if not DirectoryExists(edit_LocalDbPath.Text) then
    begin
      lstbox_Issues.Items.Add(DbPath);
      Result := False;
    end
    else
    begin
      dm_DataMod.nxdb_SQLBtns.AliasPath := edit_LocalDbPath.Text;
      Result := DoFilesExist;
    end;
  end;

  //==================

  function NetworkReady(aTrans: TnxBaseTransport): Boolean;

    //==================
    function CheckServerLB: Boolean;
    begin

      Result := True;
      if lb_ServerNames.Count < 1 then begin
        lstbox_Issues.Items.Add(ServerLb);
        result := False;
      end
    end;

    //==================

    function CheckSelectedServer: Boolean;
    var
      index: Integer;
    begin
      Result := True;
      if edt_NetWorkServer.Text = '' then
      begin
        lstbox_Issues.Items.Add(SelectServer);
        result := False;
      end
      else
      begin
        index := lb_ServerNames.Items.IndexOf(edt_NetWorkServer.Text);
        if index = -1 then
          lstbox_Issues.Items.Add(SelectSerNotInLb)
        else
          lb_ServerNames.ItemIndex := index;

      end;

    end;

    //==================
    function CheckAliasLB: Boolean;
    var
      s: string;
    begin
      Result := True;
      try
        s:= aTrans.Name;
        aTrans.Open;
        s := 'Server Open';
        dm_DataMod.nxrse_SqlTools.Open;
        s := 'Session Open';
        dm_DataMod.nxsn_SqlTools.Open;
        s := 'Get Alias List';
        dm_DataMod.nxsn_SqlTools.GetAliasNames(jvlstbx_AlaisNames.Items);
        if jvlstbx_AlaisNames.Items.Count <1 then
        begin
          lstbox_Issues.Items.Add(AliasList);
          result := False;
        end;
      except
        on e: EDatabaseError do
          begin
            lstbox_Issues.Items.Add('Database Error Last Action: Open - ' + s);
            lstbox_Issues.Items.Add('Error Msg: ' + E.Message);
            result := False;
          end;

        on E: Exception do
          begin
            lstbox_Issues.Items.Add('General Exception Error Msg: ' + E.Message);
            result := False;
          end;

      end;
    end;

    //==================
    function CheckSelectedAlias: Boolean;

      //==================
      function TestSelectedAliasInLB(aAlias: string): boolean;
      begin
        Result := jvlstbx_AlaisNames.items.IndexOf(aAlias) <> -1;
      end;

     //==================

    begin
      Result := True;
      if edt_Alias.Text <> '' then
      begin
        lstbox_Issues.Items.Add(AliasBlank);
        Result := False;
      end
      else
        if not TestSelectedAliasInLB(edt_Alias.Text) then
        begin
          lstbox_Issues.Items.Add(AliasNotFound);
          Result := False;
        end;
    end;

  //==================

  begin
    Result := false;
    if CheckServerLB then
      if CheckSelectedServer then
        if CheckAliasLB then
          if CheckSelectedAlias then
            result := True;
  end;

begin
  case jvrdgrp_ServerType.ItemIndex of
    0: begin
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxsrvrngn_Local;
      btn_ConnectDb.Enabled := LocalReady;
    end;

    1: begin
      dm_DataMod.nxrse_SqlTools.Transport := dm_DataMod. nxnmdp_trnsprt;
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
      dm_DataMod. nxnmdp_trnsprt.GetServerNames(lb_ServerNames.Items, cNxDbTimeOut);
      btn_ConnectDb.Enabled := NetworkReady(dm_DataMod. nxnmdp_trnsprt);
    end;

    2: begin
      dm_DataMod.nxrse_SqlTools.Transport := dm_DataMod. nxwint_SqlToolsTrans;
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
      dm_DataMod. nxwint_SqlToolsTrans.GetServerNames(lb_ServerNames.Items, cNxDbTimeOut);
      btn_ConnectDb.Enabled := NetworkReady(dm_DataMod. nxwint_SqlToolsTrans);
    end;

  end;

//  edit_LocalDbPath.Enabled     := jvrdgrp_ServerType.ItemIndex = 0;
//  ts_DefaultAliasBtnDb.Enabled := jvrdgrp_ServerType.ItemIndex = 0;
//
//  edt_Alias.Enabled            := jvrdgrp_ServerType.ItemIndex = 1;
//  jvxpbtn_GetLocalPath.Enabled := jvrdgrp_ServerType.ItemIndex = 1;
//  btn_ResetLocalDbPath.Enabled := jvrdgrp_ServerType.ItemIndex = 1;
//
end;


procedure Tfrm_SelectProject.SetDialogServerType;
begin
  lstbox_Issues.Items.Clear;
  lb_ServerNames.Items.Clear;
  jvlstbx_AlaisNames.Items.Clear;

  dm_DataMod.nxwint_SqlToolsTrans.close;
  dm_DataMod.nxsrvrngn_Local.close;

  btn_ConnectDb.Enabled                := False;
  btn_ConnectDb.ImageIndex             := 8;

  lbl_CaptionForDBAlais.Enabled        :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  edt_Alias.enabled                    :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  lbl_CaptionForServerLb.Enabled       :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  lb_ServerNames.Enabled               :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  lbl_CaptionNetServerSelected.Enabled :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  edt_NetWorkServer.Enabled            :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;
  ts_DefaultAliasBtnDb.Enabled         :=  jvrdgrp_ServerType.ItemIndex = 1 or 2;

  btn_ResetLocalDbPath.Enabled         :=  jvrdgrp_ServerType.ItemIndex = 0;
  lbl_CaptionForLocalDbPath.Enabled    :=  jvrdgrp_ServerType.ItemIndex = 0;
  edit_LocalDbPath.Enabled             :=  jvrdgrp_ServerType.ItemIndex = 0;
  jvxpbtn_GetLocalPath.Enabled         :=  jvrdgrp_ServerType.ItemIndex = 0;
end;


procedure Tfrm_SelectProject.SetFormSize;
var
  fOffSet: Integer;
begin
  if sv_MenuItems.Opened then
    fOffSet := 0
  else
    fOffSet := cCompactMenuOffset;
  frm_SelectProject.Width  := cPrjForm[tCardList(cardpnl_Dialogs.ActiveCardIndex), fwd_Width] - fOffSet;
  frm_SelectProject.Height := cPrjForm[tCardList(cardpnl_Dialogs.ActiveCardIndex), fwd_Height];
end;


procedure Tfrm_SelectProject.sv_MenuItemsOpened(Sender: TObject);
begin
  SetFormSize;
end;

procedure Tfrm_SelectProject.sv_MenuItemsOpening(Sender: TObject);
begin
//  frm_SelectProject.Height := cSplitVFormH;
//  frm_SelectProject.Width  := cSplitVFormW;
  if not ((dm_DataMod.nxtbl_NxDbSqlToolsPrjs.EOF) or (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.BOF)) then
    edit_LocalDbPath.Text := dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString;
end;


procedure Tfrm_SelectProject.timer_SearchTimerBlankTimer(Sender: TObject);
begin
  JvDBFindEdit1.Text := '';
  JvDBSearchComboBox1.Text := '';
  timer_SearchTimerBlank.Enabled := False;
end;


procedure Tfrm_SelectProject.TransPortClick(Sender: TObject);

  procedure WinSock;
  begin
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := WinSock2.tag;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;

  procedure NamePipe;
  begin
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := NamePipe2.tag;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;

  procedure LocalServer;
  begin
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := LocalServer2.tag;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;

  procedure None;
  begin
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := None2.tag;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;

begin
  case (Sender as TMenuItem).tag of
    0: WinSock;

    1: NamePipe;

    2: LocalServer;

    3: ;

    4: None;
  end;
end;


function Tfrm_SelectProject.SavePrjDb(afPrjInfo: TProjectInfo; var fStatus: string): boolean;
begin
  result := True;
  fStatus := '';
  fPrjInfo.BeginUpdate;
  if Not ((string(fPrjInfo.PrjName) = AnsiRightStr(cthe_DefaultPrjPath, Length(cthe_DefaultPrjPath) - 1)) or
     (fPrjInfo.PrjName = '')) then begin
    try
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjName').AsString := string(afPrjInfo.PrjName);
{$IFDEF DEBUG}
showmessage('msg 464-act_ConnectBtnExecute: '+ string(afPrjInfo.PrjPath));
{$ENDIF}

        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjPath').AsString := string(afPrjInfo.PrjPath);
        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('TransportID').AsInteger := Ord(afPrjInfo.Transport);
        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString := string(afPrjInfo.Server);
        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString := string(afPrjInfo.Alias);
        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('DbPassWord').AsString := string(afPrjInfo.DBPassWord);
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
    except
      on E: Exception do begin
        Result := false;
        fStatus := 'msg 470-Exception class name = '+E.ClassName + #13 + #10 + 'Exception message = '+E.Message;
      end;
    end;
  end;
  fPrjInfo.EndUpdate;
end;


//============= ways to open a project

procedure Tfrm_SelectProject.OpenProject(sender: TObject);  //fix
var
  fTransport: TTransportUsed;
begin
  try
    if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.RecordCount > 0 then
      fTransport := TTransPortUsed(dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger)
    else
      fTransport := tranNone;
  except
    MessageDlg('msg 490-Could NOT open project due to Db table error.', mtError, [mbOK], 0);
    Exit;
  end;
  Close;
end;


procedure Tfrm_SelectProject.OpenPrjFrom(Sender: TObject; PrjOpenType: tPrjOpenType);
// open project from click on mru project list

  function SetPrjInfo: boolean;
  begin
    Result := True;
    try
      fPrjInfo.BeginUpdate;

      fPrjInfo.PrjName := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjName').AsString);
      fPrjInfo.PrjPath := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjPath').AsString);
      fPrjInfo.Transport := TTransportUsed(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('TransportID').AsInteger);
      fPrjInfo.Server := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString);
      fPrjInfo.Alias := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString);
      fPrjInfo.ActiveTrans := fPrjInfo.Transport;
      fPrjInfo.ActiveServer := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString);
      fPrjInfo.ActiveDb := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString);
      fPrjInfo.DBPassWord := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('DbPassWord').AsString);
    except
      result := False;
    end;
    fPrjInfo.EndUpdate;
  end;

var
  fError  : Boolean;
begin
  fError := false;
  fPrjInfo.ClearPrj;
  fPrjInfo.BeginUpdate;

  case PrjOpenType of
    pot_MRU: begin
      if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Locate('PrjName', lstGemMruList1.GetName(lstGemMruList1.ItemIndex), []) then  begin
        if not SetPrjInfo then begin
          MessageDlg('msg 542-Error Opening Db Projects Db Table.',
                                                    mtError, [mbYes, mbNo], 0);
          fError := True;
        end;
      end
      else begin
        MessageDlg('msg 548-Could not find project from MRU listing. Select '+#13+#10+
                   'another project from then MRU list or use the'+#13+#10+
                   'Db grid to select/create a project.', mtError, [mbOK], 0);
        if (MessageDlg('Remove item from MRU list?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
          lstGemMruList1.Items.Delete(lstGemMruList1.ItemIndex);
        fError:= True;
      end;
    end;

    pot_PrjGrid: if not SetPrjInfo then begin
                    MessageDlg('msg 558-Could not find project from MRU listing. Used the'+#13+#10+
                               'Db grid to select a project.', mtError, [mbOK], 0);
                    fError:= True;
                 end;

    pot_Default: begin
      fPrjInfo.PrjName := ShortString(AnsiRightStr(cthe_DefaultPrjPath, Length(cthe_DefaultPrjPath) - 1));
      fPrjInfo.PrjPath := ShortString(DefaultPathForPrjsFolder);
    end;
  end;

  if not FError then begin
    if (fPrjInfo.PrjPath<> '') and (not System.SysUtils.DirectoryExists(string(fPrjInfo.PrjPath))) then
      if (MessageDlg('msg 571-Prj. Path does not Exist. Create?', mtWarning, [mbYes, mbNo], 0) in [mrYes, mrNone]) then begin
        if not System.SysUtils.ForceDirectories(String(fPrjInfo.PrjPath)) then begin
           fPrjInfo.PrjPath := '';
        end;
      end;
    lstGemMruList1.Add(string(fPrjInfo.PrjName), string(fPrjInfo.PrjPath));
    fPrjInfo.EndUpdate;
    frm_NxToolsMain.ProjectInfo := fPrjInfo;
    OpenProject(Sender);
  end
  else begin
    fPrjInfo.EndUpdate;
    frm_NxToolsMain.ProjectInfo := fPrjInfo;
  end;
end;


procedure Tfrm_SelectProject.act_OpenPrjExecute(Sender: TObject);
begin
  OpenPrjFrom(Sender, pot_PrjGrid);
end;


procedure Tfrm_SelectProject.act_DefaultPrjExecute(Sender: TObject);
begin
  OpenPrjFrom(Sender, pot_Default);
end;


//=====================================================


procedure Tfrm_SelectProject.act_OpenPrjUpdate(Sender: TObject);
begin
  if (JvLED1.Status) then
    act_OpenPrj.Enabled := (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.RecordCount > 0) // lb_ProjectList.ItemIndex <> -1;
  else
    act_OpenPrj.Enabled := JvLED1.Status;
end;


procedure Tfrm_SelectProject.act_PrjEditUpdate(Sender: TObject);
begin
  if System.SysUtils.DirectoryExists(edit_LocalDbPath.text) then begin
    bl_1.Caption := 'Folder does NOT exist!';
    bl_1.Behavior := 'Blinking';
  end
  else begin
    bl_1.Caption := 'Folder exist!';
    bl_1.Behavior := 'Appearing';
  end;
end;


procedure Tfrm_SelectProject.act_RecentPrjsExecute(Sender: TObject);
begin
  cardpnl_Dialogs.ActiveCard := Card_MostRecentlyUsedPrj;
  SetFormSize;
end;


procedure Tfrm_SelectProject.act_CreateEditPrjsExecute(Sender: TObject);
begin
  cardpnl_Dialogs.ActiveCard := Card_CreateSelectPrjDb;
  SetFormSize;
end;


procedure Tfrm_SelectProject.act_CreateUpdateDbExecute(Sender: TObject);
begin
  cardpnl_Dialogs.ActiveCard := crd_CreateNewDbTables;
  SetFormSize;
end;


procedure Tfrm_SelectProject.act_ChangeDbServersExecute(Sender: TObject);
begin
  cardpnl_Dialogs.ActiveCard := crd_SetDbServer;
  SetFormSize;
end;


procedure Tfrm_SelectProject.act_PackRestDbExecute(Sender: TObject);
begin
  cardpnl_Dialogs.ActiveCard := crd_PackRestructureDb;
  SetFormSize;
end;


procedure Tfrm_SelectProject.act_SetNetwodkDbTypeExecute(Sender: TObject);
var
  fStatus: string;
begin
  SetDialogServerType;



//  if not SetPrjDbServerType(false, fStatus) then
//    MessageDlg('msg 627-Error in Setup of Networked Database.', mtError, [mbOK], 0);
end;


procedure Tfrm_SelectProject.act_SetPrjPathExecute(Sender: TObject);
begin
  if JvSelectDirectory1.Execute then begin
    if not (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.state in [dsEdit, dsInsert]) then
       dm_DataMod.nxtbl_NxDbSqlToolsPrjs.edit
    else
      if (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Eof) or  (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Bof) then
        exit
      else
       dm_DataMod.nxtbl_NxDbSqlToolsPrjs.edit;
{$IFDEF DEBUG}
showmessage('msg 641-'+ExpandUNCFileName(JvSelectDirectory1.Directory));
{$ENDIF}
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString := ExpandUNCFileName(JvSelectDirectory1.Directory);
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;
end;


procedure Tfrm_SelectProject.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not System.SysUtils.DirectoryExists(string(fPrjInfo.PrjPath)) then
    OpenDefaultPrj;

  JvFormStorage1.SaveFormPlacement;


  CanClose := JvLED1.Status;
  IniSaveComponents(PrjSetupCompomentsIni, fComponentIni);//, Ext_Section:String='', false);
end;


procedure Tfrm_SelectProject.FormCreate(Sender: TObject);
var
  Index: Integer;
begin
  lstGemMruList1.MruListFile := MRUFile;
  fprjInfo.ClearPrj;
  JvFormStorage1.RestoreFormPlacement;

  fComponentIni[Ord(icTJVRadioGrp)]      := jvrdgrp_ServerType;
  fComponentIni[Ord(icTEditLocalDbPath)] := edit_LocalDbPath;
  fComponentIni[Ord(icTEditServer)]      := edt_NetWorkServer;
  fComponentIni[Ord(icTEditAlias)]       := edt_Alias;
  fComponentIni[Ord(icToggleAliasToUse)] := ts_DefaultAliasBtnDb;
end;


function Tfrm_SelectProject.CloseDelphiSqlToolsDb(var Status: string): boolean;
begin
  JvLED1.Status := false;
  SetConnectBtn(false);
//  btn_ConnectDb.ImageIndex := 6;

  try
    Result := True;
    Status := 'nxsrvrngn_Local.close';
    dm_DataMod.nxsrvrngn_Local.close;

    Status := 'nxsqlngn_Local.close';
    dm_DataMod.nxsqlngn_Local.close;

    Status := 'nxwint_SqlToolsTrans.close';
    dm_DataMod.nxwint_SqlToolsTrans.close;

    Status := 'nxrse_SqlTools.close';
    dm_DataMod.nxrse_SqlTools.close;

    Status := 'nxdb_SQLBtns.close';
    dm_DataMod.nxdb_SQLBtns.close;

    Status := 'NxSqlButtonsDbT.close';
    dm_DataMod.NxSqlButtonsDbT.close;

    Status := 'nxtbl_NxDbSqlToolsPrjs.close';
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.close;
  except
    SetStatusBar('Could NOT close the Database', 1, clRed);
    result := False;
  end;
end;


procedure Tfrm_SelectProject.SetConnectBtn(aConnected: Boolean);
begin
  JvLED1.Status := aConnected;
  if aConnected then
    act_ConnectBtn.ImageIndex := 6
  else
    act_ConnectBtn.ImageIndex := 7;

  if cardpnl_Dialogs.ActiveCard = Card_MostRecentlyUsedPrj then begin
    lstGemMruList1.Enabled := JvLED1.Status;
    if JvLED1.Status then begin
      lstGemMruList1.Color := clWindow;
      lbl4.Caption := 'Click a Project Name to Open';
    end
    else begin
      lstGemMruList1.Color := clGray;
      lbl4.Caption := 'Prj Db is NOT open. Click the hamburger btn to set a new Db or Click the ''Select, Cr...'' Btn.';
    end;
  end;
end;


function Tfrm_SelectProject.SetPrjDbServerType(aLocalServer: Boolean; var Status: string): Boolean;

  function SetEmbedded: Boolean;
  begin
    try
      Result := True;

      Status := 'connect local server to nxsn_SqlTools(session).';
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxsrvrngn_Local;

      Status := 'nxsqlngn_Local.open(sql engine)';
      dm_DataMod.nxsqlngn_Local.Open;

      Status := 'nxsrvrngn_Local.open(remote server)';
      dm_DataMod.nxsrvrngn_Local.Open;

      Status := 'nxdb_SQLBtns Set Path';
      dm_DataMod.nxdb_SQLBtns.AliasPath := edit_LocalDbPath.text;//  DelphiSQLToolsDbPath;
    {$IFDEF DEBUG}
      ShowMessage('msg 751-'+edit_LocalDbPath.text);
    {$ENDIF}
    except
      Result := False;
      SetStatusBar('msg 755-Could not Setup Embedded Db.' +#13+#10+'ERROR: '+'Status', 1, clRed);
//      MessageDlg('Could not Setup Embedded Db. ERROR: '+#13+#10+Status, mtError, [mbOK], 0);
    end;
  end;

  function SetNetwork: Boolean;
  begin
    result := True;
    try
      Status := 'nxwint_SqlToolsTrans.open(transport)';
      dm_DataMod.nxwint_SqlToolsTrans.ServerName := edt_NetWorkServer.text;
      dm_DataMod.nxwint_SqlToolsTrans.Open;

      Status := 'connect to remote server to nxsn_SqlTools(Session).';
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;

      Status := 'nxrse_SqlTools.open(Remote Server)';
      dm_DataMod.nxrse_SqlTools.Open;

      Status := 'nxsn_SqlTools.open(session)';
      dm_DataMod.nxsn_SqlTools.ServerEngine.Open;

      Status := 'nxdb_SQLBtns Set Alias';
      if ts_DefaultAliasBtnDb.State = tssOff then
        dm_DataMod.nxdb_SQLBtns.AliasName := cSqlBtnsDbAlias
      else
        dm_DataMod.nxdb_SQLBtns.AliasName := edt_Alias.Text;

    except
      Result := False;
      MessageDlg('msg 787785-Could not Setup Networked Db.'+#13+#10+ 'ERROR: '+Status, mtError, [mbOK], 0);
      SetStatusBar('Could not Setup Networked Db.' +#13+#10+'ERROR: '+'Status', 1, clRed);
    end;
  end;

begin
  Status := 'Not Set';
  CloseDelphiSqlToolsDb(status);
  if aLocalServer then
    result := SetEmbedded
  else
    result := SetNetwork;

  if result then
    try
      Status := 'nxdb_SQLBtns.open';
      dm_DataMod.nxdb_SQLBtns.Open;

      Status := 'nxtbl_NxDbSqlToolsPrjs.open';
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Open;

      Status := 'nxtbl_TransportLUT.open';
      dm_DataMod.nxtbl_TransportLUT.Open;
    except
      MessageDlg('msg 901 - Error openning: '+ Status , mtError, [mbOK], 0);
      Result := False;
    end;
  SetConnectBtn(result);
end;


procedure Tfrm_SelectProject.FormShow(Sender: TObject);
begin
  IniLoadComponents(PrjSetupCompomentsIni, fComponentIni, false);
  SetDialogServerType;
  CheckUserServerSelection;

//  if (rb_LocalDb.Checked or rb_NetworkedDb.checked) then begin
//    act_ConnectBtn.Execute;
//  end
//  else begin
//    sv_MenuItems.Open;
////    btn__SplitViewOpenClose.Enabled := False;
//    SetStatusBar('msg 932-Projects/SQLBtns Db NOT found. Use this dialog to setup your db.',1, clRed);
//  end;
end;


procedure Tfrm_SelectProject.JvDBFindEdit1Change(Sender: TObject);
begin
  timer_SearchTimerBlank.Enabled := true;
end;


procedure Tfrm_SelectProject.jvxpbtn_HaltProgramClick(Sender: TObject);
begin
  if (MessageDlg('mmsg 945-Do want to Halt the program?', mtWarning, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
    Halt(9);
end;


procedure Tfrm_SelectProject.jvlstbx_AlaisNamesClick(Sender: TObject);
begin
  if (jvlstbx_AlaisNames.Count < 1) or (jvlstbx_AlaisNames.ItemIndex < 0) then
    MessageDlg('mag 948-Either there are no items in the list or a selection was'+#13+#10+
               'made not on an item in the list.', mtError, [mbOK], 0)
  else begin
    SetConnectBtn(false);
    dm_DataMod.nxdb_SQLBtns.Close;
    edt_Alias.Text := jvlstbx_AlaisNames.Items[jvlstbx_AlaisNames.ItemIndex];
    dm_DataMod.nxdb_SQLBtns.AliasName  := edt_NetWorkServer.Text;
  end;
end;


procedure Tfrm_SelectProject.jvrdgrp_ServerTypeClick(Sender: TObject);

//  function getParsedString: string;
//  begin
//    ExtractValueInXMLFile(PathAndFileAtFormLocSize, '');
//  end;

begin
//  getParsedString;
  case jvrdgrp_ServerType.ItemIndex of
    0: begin
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxsrvrngn_Local;
//      edit_LocalDbPath.Text := frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs.ReadString('frm_SelectProject', 'edit_DbPath', 'none');
    end;

    1: begin
      dm_DataMod.nxrse_SqlTools.Transport :=  dm_DataMod.nxnmdp_trnsprt;
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
//      edt_NetWorkServer.Text := frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs.ReadString('frm_SelectProject' ,'edt_NetWorkServer_Text', 'none');

//      edt_Alias.Text := frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs.ReadString('frm_SelectProject' ,'edt_Alias_Text', 'none');
    end;

    2: begin
      dm_DataMod.nxrse_SqlTools.Transport :=  dm_DataMod.nxwint_SqlToolsTrans;
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
//      edt_NetWorkServer.Text := frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs.ReadString('frm_SelectProject' ,'edt_NetWorkServer_Text', 'none');

//      edt_Alias.Text := frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs.ReadString('frm_SelectProject' ,'edt_Alias_Text', 'none');
    end;

    3: begin
    end;
  end;
  SetDialogServerType;
end;


procedure Tfrm_SelectProject.jvxpbtn_GetLocalPathClick(Sender: TObject);
begin
  if JvSelectDirectory1.Execute then
    edit_LocalDbPath.Text := ExpandUNCFileName(JvSelectDirectory1.Directory);
end;


procedure Tfrm_SelectProject.act_ConnectBtnExecute(Sender: TObject);
var
  fStatus: string;
begin
//    if  SetPrjDbServerType(rb_LocalDb.Checked, fStatus) then begin
//      try
//        NxDelphiSqlTools_Status.DataSource := dm_DataMod.ds_NxDbSqlToolsPrjs;
//        JvDBFindEdit1.DataSource := dm_DataMod.ds_NxDbSqlToolsPrjs;
//        JvDBSearchComboBox1.DataSource := dm_DataMod.ds_NxDbSqlToolsPrjs;
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//{$IFDEF DEBUG}
//showmessage('msg 868-act_ConnectBtnExecute: '+ ExpandUNCFileName(JvSelectDirectory1.Directory));
//{$ENDIF}
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjPath').AsString := ExpandUNCFileName(edit_LocalDbPath.Text);
////                                 ExpandUNCFileName(JvSelectDirectory1.Directory);
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//        sv_MenuItems.Opened := False;
//      except
//        MessageDlg('msg 876-Could NOT open Prjs/SQLBtns database!', mtError, [mbOK], 0);
//      end;
//    end
//    else begin
//      JvDBFindEdit1.DataSource := nil;
//      JvDBSearchComboBox1.DataSource := nil;
//      NxDelphiSqlTools_Status.DataSource := nil;
//      sv_MenuItems.Opened := true;
//      if rb_LocalDb.Checked then
//        MessageDlg('msg 885- Prjs/SQLBtns Db.' +#13+#10+ 'ERROR: ' + fStatus+#13+#10+
//                   'Try selecting different Folder.', mtError, [mbOK], 0)
//      else
//        MessageDlg('msg 888- Prjs/SQLBtns Db.' +#13+#10+ 'ERROR: ' + fStatus+#13+#10+
//                   'Check or select different sever.', mtError, [mbOK], 0);
//    end;
end;


procedure Tfrm_SelectProject.act_ConnectBtnUpdate(Sender: TObject);
var
  aResult: boolean;
begin
//  if rb_NoServerSelected.Checked then
//  begin
//    aResult := false
//  end
//  else
//    if rb_LocalDb.checked then
//    begin
//      aResult := {(lb_ServerNames.Count > 0) and}
//               (System.SysUtils.DirectoryExists(edit_LocalDbPath.text));
//    end
//    else
//    begin
//      aResult := lb_ServerNames.Count > 0;
//    end;
//  act_ConnectBtn.enabled := aResult;
end;


procedure Tfrm_SelectProject.btn_1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_SelectProject.btn_CopyDbTablesClick(Sender: TObject);
begin
  if (MessageDlg('msg 1295-Continue with closing program?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
    Halt(9);
end;


procedure Tfrm_SelectProject.btn_ResetLocalDbPathClick(Sender: TObject);
begin
  edit_LocalDbPath.Text := DelphiDbDefaultPath;
end;


procedure Tfrm_SelectProject.btn__CloseClick(Sender: TObject);
begin
  fPrjInfo.ClearPrj;
  act_DefaultPrj.Execute;
  Close;
end;


procedure Tfrm_SelectProject.btn__SplitViewOpenCloseClick(Sender: TObject);
begin
  if sv_MenuItems.Opened then
    sv_MenuItems.Close
  else
    sv_MenuItems.Open;
//  sv_MenuItems.Opened := not sv_MenuItems.Opened;
end;


procedure Tfrm_SelectProject.cardpnl_DialogsCardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
//  sv_MenuItems(sender);
end;


procedure Tfrm_SelectProject.ts_DefaultAliasBtnDbClick(Sender: TObject);
begin
  edt_Alias.ReadOnly := ts_DefaultAliasBtnDb.State = tssOff;
  if ts_DefaultAliasBtnDb.State = tssOff then begin
    edt_Alias.Text     := cSqlBtnsDbAlias;
    edt_Alias.Color    := clCream;
    edt_Alias.readOnly := true;

    lbl_CaptionForDBAlais.Caption := 'Default Database Alias:';
  end
  else begin
    edt_Alias.readOnly := false;
    edt_Alias.Color    := clWindow;

    lbl_CaptionForDBAlais.Caption := 'User Database Alias:';
  end;
end;


procedure Tfrm_SelectProject.lb_ServerNames1Click(Sender: TObject);
begin
  if (lb_ServerNames.Count < 1) or (lb_ServerNames.ItemIndex < 0) then
    MessageDlg('mag 948-Either there are no items in the list or a selection was'+#13+#10+
               'made not on an item in the list.', mtError, [mbOK], 0)
  else begin
    SetConnectBtn(false);
    dm_DataMod.nxwint_SqlToolsTrans.Close;
    edt_NetWorkServer.Text := lb_ServerNames.Items[lb_ServerNames.ItemIndex];

    dm_DataMod.nxwint_SqlToolsTrans.ServerNameRuntime := edt_NetWorkServer.Text;
    dm_DataMod.nxwint_SqlToolsTrans.ServerName := edt_NetWorkServer.Text;


    dm_DataMod.nxwint_SqlToolsTrans.Open;
    dm_DataMod.nxrse_SqlTools.Open;
    dm_DataMod.nxsn_SqlTools.Open;
    dm_DataMod.nxsn_SqlTools.GetAliasNames(jvlstbx_AlaisNames.Items);

  end;
end;


end.



