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

  PngSpeedButton, JvAnimatedImage, gemCapPanelBtn

  {$IFDEF  USE_CODESITE}, CodeSiteLogging {$ENDIF};



type
  tPrjOpenType = (pot_MRU, pot_PrjGrid, pot_Default);


  tIniComponent = (icTJVRadioGrp, icTEditLocalDbPath, icTEditServer, icTEditAlias,
                   icToggleAliasToUse);

  tServerOperation = (soSetSelectServer, soFirstAndCheck, soOpenDb);

  Tfrm_SelectProject = class(TForm)
    ActionList1                  : TActionList;
    act_DefaultPrj               : TAction;
    act_OpenPrj                  : TAction;
    act_CreatePrj                : TAction;
    act_DeletePrj                : TAction;
    act_SetPrjPath               : TAction;
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
    RzDBEdit4                    : TRzDBEdit;
    RzDBEdit5                    : TRzDBEdit;
    RzDBMemo1                    : TRzDBMemo;
    RzDBNavigator1               : TRzDBNavigator;
    NxDelphiSqlTools_Status      : TJvDBStatusLabel;
    JvSelectDirectory1           : TJvSelectDirectory;
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
    jvblnhnt_1                   : TJvBalloonHint;
    act_ConnectBtn               : TAction;
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
    lbl_CaptionNetServerSelected : TLabel;
    edt_NetWorkServer            : TEdit;
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
    jvlstbx_AlaisNames           : TJvListBox;
    lbl_CaptionAliasLB           : TLabel;
    lb_ServerNames: TListBox;
    jvpnl_PleaseWait: TJvPanel;
    img_1: TImage;
    lbl_1: TLabel;
    mmo_IssuesMemo: TMemo;
    RzDBEdit3: TRzDBEdit;
    gmcpnlbtn_HelpBtn_1: TgemCapPanelBtn;
    lbl_DbLocalDbPath: TLabel;
    edt_LocalServerDb_1: TJvDBMaskEdit;
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
    procedure edit_LocalDbPathChange(Sender: TObject);
    procedure RzDBEdit4Click(Sender: TObject);

  private
    { Private declarations }
//    fPrjInfo     : TProjectInfo;
    fComponentIni: array[0..3] of TObject; //array[tIniComponent] of TObject;

    procedure OpenPrjFrom(Sender: TObject; PrjOpenType: tPrjOpenType);
    procedure OpenProject(sender: TObject);
    procedure RemoveFolder(const Dir: string);
    function SetPrjDbServerType(aLocalServer: Boolean; var Status: string): Boolean;
    procedure SetStatusBar(aMsg: string; aPanel: Byte; aColor: TColor);
    function CloseDelphiSqlToolsDb(var Status: string): boolean;
    procedure SetConnectBtn(aConnected: Boolean);
    procedure SetFormSize;
    procedure CheckUserServerSelection(FullNetWorkServerTest: Boolean = false);
    function ReadConfigXmlFile(aChildern: tStrings): string;
    procedure PleaseWait(aToDo: boolean);
  public
    { Public declarations }
    procedure OpenDefaultPrj;
//    Function SavePrjDb(afPrjInfo: TProjectInfo; var fStatus: string): boolean;
//    property PrjInfo: TProjectInfo read fPrjInfo write fPrjInfo;
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

  ButTable     = 'BuNxSqlButtonsDb';
  ToolsPrj     = 'NxDbSqlToolsPrjs';
  NxSqlBtn     = 'NxSqlButtonsDb';
  Trans        = 'TransportLUT';


var
  frm_SelectProject: Tfrm_SelectProject;

implementation
uses
  NxToolsMain, nxllTransport, GEMUseFullRoutines, DataMod, SelectServerAlias;
{$R *.dfm}
{.$R Moreimages.res}

const
  cCompactMenuOffset = 160; // opened width - compact width
  cUsePrjMan = '(Create, Edit, Remove Projects)';
  cUseRecent = '(Select Recently Use Project)';

  cPrjForm: array[cl_CardCreatePrjDb..cl_Pack, fwd_Width..fwd_Height] of integer =
                                               (( 1171, 580), (683, 565),
                                                ( 730, 575), (479, 565),
                                                ( 965, 565));

  cBtnHintMRU  = 'Select project from a MRU Listing';
  cBtnHintGrid = 'Select project from Db Project Grid Listing';
  cBtnSelectCaption = 'Create, Edit, Select Projects';
  cBtnMRUCaption = 'Recently Use Projects';



function Tfrm_SelectProject. ReadConfigXmlFile(aChildern: tStrings): string;
var
//  XmlFile : TXMLDocument;
  i : Integer;
  XMLPath : string;
  fCild: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'ReadConfigXmlFile' );{$ENDIF}

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

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'ReadConfigXmlFile' );{$ENDIF}
end;

procedure Tfrm_SelectProject.SetStatusBar(aMsg: string; aPanel: Byte; aColor: TColor);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetStatusBar' );{$ENDIF}

  StatusBarPro.Panels[aPanel].Color := aColor;
  StatusBarPro.Panels[aPanel].Font.Color := GetFontColorFromBackGroundColor(aColor);
  StatusBarPro.Panels[aPanel].Text := aMsg;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetStatusBar' );{$ENDIF}
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
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'lstGemMruList1Click' );{$ENDIF}

  OpenPrjFrom(Sender, pot_MRU);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'lstGemMruList1Click' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_CreatePrjExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_CreatePrjExecute' );{$ENDIF}

  if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Active then
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Insert
  else
    MessageDlg('Poject Table was CLOSED!', mtError, [mbOK], 0);

//  if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Active then
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Insert
//  else
//    MessageDlg('Poject Database was CLOSED!', mtError, [mbOK], 0);
//           dm_DataMod.nxtbl_NxDbSqlToolsPrjs.close

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_CreatePrjExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.OpenDefaultPrj;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'OpenDefaultPrj' );{$ENDIF}

  act_DefaultPrj.Execute;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'OpenDefaultPrj' );{$ENDIF}
end;


procedure Tfrm_SelectProject.RemoveFolder(const Dir: string);
var
  Result: TSearchRec;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'RemoveFolder' );{$ENDIF}

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

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'RemoveFolder' );{$ENDIF}
end;


procedure Tfrm_SelectProject.RzDBEdit4Click(Sender: TObject);
begin
  if GetServersAlias.Execute then
  begin
    if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.State in [dsBrowse] then
      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsServer.AsString := GetServersAlias.ServerName;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsAlias.AsString := GetServersAlias.AliasName;
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := ord(GetServersAlias.Transport);
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;
end;


procedure Tfrm_SelectProject.act_DeletePrjExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_DeletePrjExecute' );{$ENDIF}

  if MessageDlg('Delete ' + QuotedStr(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjName.AsString) + ' project?',
    mtWarning, [mbOk, mbCancel],0) = mrOk then begin
    gProjectInfo.BeginUpdate;
    gProjectInfo.PrjName := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjName.AsString);
    gProjectInfo.PrjPath := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString);
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Delete;
    lstGemMruList1.DeleteItem(string(gProjectInfo.PrjName));
    gProjectInfo.EndUpdate;
    GetProjectList;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_DeletePrjExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_DeletePrjUpdate(Sender: TObject);
begin
  act_DeletePrj.Enabled := (JvLED1.Status) and (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.RecordCount > 0);
end;


procedure Tfrm_SelectProject.SharedMem2Click(Sender: TObject);
begin
//  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SharedMem2Click' );{$ENDIF}
//
//  dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := SharedMem2.tag;
//  dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SharedMem2Click' );{$ENDIF}
end;


procedure Tfrm_SelectProject.sv_MenuItemsClosed(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'sv_MenuItemsClosed' );{$ENDIF}

  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'sv_MenuItemsClosed' );{$ENDIF}
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
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_PrjEditExecute' );{$ENDIF}

  CloseDelphiSqlToolsDb(Status);
  SetDialogServerType;
  SetConnectBtn(false);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_PrjEditExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.CheckUserServerSelection(FullNetWorkServerTest: Boolean = false);

  //==================

  function DoFilesExist: Boolean;
  var
    fStringList: tStringList;
    index: Integer;
  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/DoFilesExist' );{$ENDIF}

    result := false;
    try
      dm_DataMod.nxdb_SQLBtns.Open;
      fStringList := TStringList.Create;
      try
        result := true;
        dm_DataMod.nxdb_SQLBtns.GetTableNames(fStringList);

        if fStringList.IndexOf(ExtractFileName(ButTable))= -1 then begin
          mmo_IssuesMemo.Lines.Add('Table not found: '+ ButTable);
          result := false;
        end;

        if fStringList.IndexOf(ExtractFileName(NxSqlBtn))= -1 then begin
          mmo_IssuesMemo.Lines.Add('Table not found: '+ NxSqlBtn);
          result := false;
        end;

        if fStringList.IndexOf(ExtractFileName(ToolsPrj))= -1 then begin
          mmo_IssuesMemo.Lines.Add('Table not found: '+ ToolsPrj);
          result := false;
        end;

        if fStringList.IndexOf(ExtractFileName(Trans))= -1 then begin
          mmo_IssuesMemo.Lines.Add('Table not found: '+ Trans);
          result := false;
        end;
      finally
        FreeAndNil(fStringList);
        dm_DataMod.nxdb_SQLBtns.close;
      end;
    except
      on e: EDatabaseError do
        begin
          mmo_IssuesMemo.Lines.Add('Database Error Last Action: Open - ' + 'nxdb_SQLBtns');
          mmo_IssuesMemo.Lines.Add('Error Msg: ' + E.Message);
          result := False;
        end;

      on E: Exception do
        begin
          mmo_IssuesMemo.Lines.Add('General Exception Error Msg: ' + E.Message);
          result := False;
        end;
    end;

    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/DoFilesExist' );{$ENDIF}
  end;

  //==================

  function LocalReady: Boolean;
  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/LocalReady' );{$ENDIF}

    result := false;
    if not DirectoryExists(edit_LocalDbPath.Text) then
    begin
      mmo_IssuesMemo.Lines.Add(DbPath);
      Result := False;
    end
    else
    begin
      dm_DataMod.nxdb_SQLBtns.AliasPath := edit_LocalDbPath.Text;
      Result := DoFilesExist;
    end;

    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/LocalReady' );{$ENDIF}
  end;

  //==================

  function NetworkReady(aTrans: TnxBaseTransport): Boolean;

    //==================
    function CheckServerLB: Boolean;
    begin
      {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckServerLB' );{$ENDIF}

      Result := True;
      if lb_ServerNames.Count < 1 then begin
        mmo_IssuesMemo.Lines.Add(ServerLb);
        result := False;
      end;

      {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckServerLB' );{$ENDIF}
    end;

    //==================

    function CheckSelectedServer: Boolean;
    var
      index: Integer;
    begin
      {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckSelectedServer' );{$ENDIF}

      Result := True;
      if edt_NetWorkServer.Text = '' then
      begin
        mmo_IssuesMemo.Lines.Add(SelectServer);
        jvlstbx_AlaisNames.Items.Clear;
        edt_Alias.Text := '';
        result := False;
      end
      else
      begin
        index := lb_ServerNames.Items.IndexOf(edt_NetWorkServer.Text);
        if index = -1 then begin
          mmo_IssuesMemo.Lines.Add(SelectSerNotInLb);

          edt_NetWorkServer.Text := '';
          jvlstbx_AlaisNames.Items.Clear;
          edt_Alias.Text := '';
        end
        else
        begin
          lb_ServerNames.ItemIndex := index;
          if jvrdgrp_ServerType.ItemIndex = 1 then
          begin
            dm_DataMod.nxnmdp_trnsprt.Close;
            dm_DataMod.nxnmdp_trnsprt.ServerName := edt_NetWorkServer.Text;
            dm_DataMod.nxrse_SqlTools.TransPort := dm_DataMod.nxnmdp_trnsprt;
          end
          else
          begin
            dm_DataMod.nxwint_SqlToolsTrans.Close;
            dm_DataMod.nxwint_SqlToolsTrans.ServerName := edt_NetWorkServer.Text;
            dm_DataMod.nxrse_SqlTools.TransPort := dm_DataMod.nxwint_SqlToolsTrans;
          end;
        end;
      end;

      {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckSelectedServer' );{$ENDIF}
    end;

    //==================
    function CheckAliasLB: Boolean;
    var
      s: string;
    begin
      {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckAliasLB' );{$ENDIF}

      if edt_NetWorkServer.Text = '' then
      begin
        Result := false;
        jvlstbx_AlaisNames.Items.Clear;
        edt_Alias.Text := '';
        Exit;
      end;

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
          mmo_IssuesMemo.Lines.Add(AliasList);
          result := False;
        end;
      except
        on e: EDatabaseError do
          begin
            mmo_IssuesMemo.Lines.Add('Database Error Last Action: Open - ' + s);
            mmo_IssuesMemo.Lines.Add('Error Msg: ' + E.Message);
            result := False;
          end;

        on E: Exception do
          begin
            mmo_IssuesMemo.Lines.Add('General Exception Error Msg: ' + E.Message);
            result := False;
          end;

      end;

      {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckAliasLB' );{$ENDIF}
    end;

    //==================
    function CheckSelectedAlias: Boolean;
    var
      index: integer;
    begin
      {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckSelectedAlias' );{$ENDIF}

      Result := True;
      if edt_Alias.Text = '' then
      begin
        mmo_IssuesMemo.Lines.Add(AliasBlank);
        Result := False;
      end
      else begin
        index := jvlstbx_AlaisNames.items.IndexOf(edt_Alias.Text);
        if index <> -1 then
        begin
          jvlstbx_AlaisNames.ItemIndex := index;
          dm_DataMod.nxdb_SQLBtns.AliasName := edt_Alias.Text;
        end
        else
        begin
          mmo_IssuesMemo.Lines.Add(AliasNotFound);
          Result := False;
        end;
      end;

      {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/NetworkReady/CheckSelectedAlias' );{$ENDIF}
    end;

  //==================

  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection/NetworkReady' );{$ENDIF}

    Result := false;

    if FullNetWorkServerTest then
    begin
      Result := CheckServerLB;
      if Result then
        Result := CheckSelectedServer;
      if Result then
        Result  := CheckAliasLB;
      if Result then
        Result := CheckSelectedAlias;
    end
    else
    begin
      Result  := CheckAliasLB;
      if Result then
        Result := CheckSelectedAlias;
      if Result then
        Result := DoFilesExist;
    end;

    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection/NetworkReady' );{$ENDIF}
  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckUserServerSelection' );{$ENDIF}

  PleaseWait(true);
  mmo_IssuesMemo.Lines.Clear;
  case jvrdgrp_ServerType.ItemIndex of
    0: begin
      dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxsrvrngn_Local;
      act_ConnectBtn.Enabled := LocalReady;
    end;

    1: begin
      if FullNetWorkServerTest then
      begin
        dm_DataMod.nxrse_SqlTools.Transport := dm_DataMod. nxnmdp_trnsprt;
        dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
        dm_DataMod. nxnmdp_trnsprt.GetServerNames(lb_ServerNames.Items, cNxDbTimeOut);
      end;
      act_ConnectBtn.Enabled := NetworkReady(dm_DataMod. nxnmdp_trnsprt);
    end;

    2: begin
      if FullNetWorkServerTest then
      begin
        dm_DataMod.nxrse_SqlTools.Transport := dm_DataMod. nxwint_SqlToolsTrans;
        dm_DataMod.nxsn_SqlTools.ServerEngine := dm_DataMod.nxrse_SqlTools;
        dm_DataMod. nxwint_SqlToolsTrans.GetServerNames(lb_ServerNames.Items, cNxDbTimeOut);
      end;
      act_ConnectBtn.Enabled := NetworkReady(dm_DataMod. nxwint_SqlToolsTrans);
    end;
  end;
  PleaseWait(false);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckUserServerSelection' );{$ENDIF}
end;


procedure Tfrm_SelectProject.SetDialogServerType;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetDialogServerType' );{$ENDIF}

  mmo_IssuesMemo.Lines.Clear;
  lb_ServerNames.Items.Clear;
  jvlstbx_AlaisNames.Items.Clear;

  with dm_DataMod do
  begin
    nxwint_SqlToolsTrans.close;
    nxsrvrngn_Local.close;
    nxnmdp_trnsprt.Close;
    nxrse_SqlTools.Close;
  end;

  act_ConnectBtn.Enabled                := False;
  act_ConnectBtn.ImageIndex             := 8;

  lbl_CaptionForDBAlais.Enabled        :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  edt_Alias.enabled                    :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  lbl_CaptionForServerLb.Enabled       :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  lb_ServerNames.Enabled               :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  lbl_CaptionNetServerSelected.Enabled :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  edt_NetWorkServer.Enabled            :=  jvrdgrp_ServerType.ItemIndex in [1, 2];
  case jvrdgrp_ServerType.ItemIndex of
    1: lbl_CaptionForServerLb.Caption := 'Select Named Pipe Server:';
    2: lbl_CaptionForServerLb.Caption := 'Select Tcpip Server:';
  end;




  btn_ResetLocalDbPath.Enabled         :=  jvrdgrp_ServerType.ItemIndex = 0;
  lbl_CaptionForLocalDbPath.Enabled    :=  jvrdgrp_ServerType.ItemIndex = 0;
  edit_LocalDbPath.Enabled             :=  jvrdgrp_ServerType.ItemIndex = 0;
  jvxpbtn_GetLocalPath.Enabled         :=  jvrdgrp_ServerType.ItemIndex = 0;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetDialogServerType' );{$ENDIF}
end;


procedure Tfrm_SelectProject.SetFormSize;
var
  fOffSet: Integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetFormSize' );{$ENDIF}

  if sv_MenuItems.Opened then
    fOffSet := 0
  else
    fOffSet := cCompactMenuOffset;
  frm_SelectProject.Width  := cPrjForm[tCardList(cardpnl_Dialogs.ActiveCardIndex), fwd_Width] - fOffSet;
  frm_SelectProject.Height := cPrjForm[tCardList(cardpnl_Dialogs.ActiveCardIndex), fwd_Height];

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetFormSize' );{$ENDIF}
end;


procedure Tfrm_SelectProject.sv_MenuItemsOpened(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'sv_MenuItemsOpened' );{$ENDIF}

  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'sv_MenuItemsOpened' );{$ENDIF}
end;

procedure Tfrm_SelectProject.sv_MenuItemsOpening(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'sv_MenuItemsOpening' );{$ENDIF}

//  frm_SelectProject.Height := cSplitVFormH;
//  frm_SelectProject.Width  := cSplitVFormW;
  if not ((dm_DataMod.nxtbl_NxDbSqlToolsPrjs.EOF) or (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.BOF)) then
    edit_LocalDbPath.Text := dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'sv_MenuItemsOpening' );{$ENDIF}
end;


procedure Tfrm_SelectProject.timer_SearchTimerBlankTimer(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'timer_SearchTimerBlankTimer' );{$ENDIF}

  JvDBFindEdit1.Text := '';
  JvDBSearchComboBox1.Text := '';
  timer_SearchTimerBlank.Enabled := False;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'timer_SearchTimerBlankTimer' );{$ENDIF}
end;


procedure Tfrm_SelectProject.TransPortClick(Sender: TObject);

  procedure WinSock;
  begin
//    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TransPortClick/WinSock' );{$ENDIF}
//
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := WinSock2.tag;
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//    dm_DataMod.nxRemoteServerEngine.Transport := dm_DataMod.nxWinsockTransport;
//
//    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TransPortClick/WinSock' );{$ENDIF}
  end;

  procedure NamePipe;
  begin
//    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TransPortClick/NamePipe' );{$ENDIF}
//
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := NamePipe2.tag;
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TransPortClick/NamePipe' );{$ENDIF}
  end;

  procedure LocalServer;
  begin
//    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TransPortClick/LocalServer' );{$ENDIF}
//
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := LocalServer2.tag;
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TransPortClick/LocalServer' );{$ENDIF}
  end;

  procedure None;
  begin
//    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TransPortClick/None' );{$ENDIF}
//
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger := None2.tag;
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//
//    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TransPortClick/None' );{$ENDIF}
  end;

begin
//  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'TransPortClick' );{$ENDIF}
//
//  case (Sender as TMenuItem).tag of
//    0: WinSock;
//
//    1: NamePipe;
//
//    2: LocalServer;
//
//    3: ;
//
//    4: None;
//  end;
//
//  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'TransPortClick' );{$ENDIF}
end;


//function Tfrm_SelectProject.SavePrjDb(afPrjInfo: TProjectInfo; var fStatus: string): boolean;
//begin
//  result := True;
//  fStatus := '';
//  gProjectInfo.BeginUpdate;
//  if Not ((string(gProjectInfo.PrjName) = AnsiRightStr(cthe_DefaultPrjPath, Length(cthe_DefaultPrjPath) - 1)) or
//     (gProjectInfo.PrjName = '')) then begin
//    try
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Edit;
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjName').AsString := string(afPrjInfo.PrjName);
//{$IFDEF DEBUG}
//showmessage('msg 464-act_ConnectBtnExecute: '+ string(afPrjInfo.PrjPath));
//{$ENDIF}
//
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjPath').AsString := string(afPrjInfo.PrjPath);
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('TransportID').AsInteger := Ord(afPrjInfo.Transport);
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString := string(afPrjInfo.Server);
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString := string(afPrjInfo.Alias);
//        dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('DbPassWord').AsString := string(afPrjInfo.DBPassWord);
//      dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
//    except
//      on E: Exception do begin
//        Result := false;
//        fStatus := 'msg 470-Exception class name = '+E.ClassName + #13 + #10 + 'Exception message = '+E.Message;
//      end;
//    end;
//  end;
//  gProjectInfo.EndUpdate;
//end;


//============= ways to open a project

procedure Tfrm_SelectProject.OpenProject(sender: TObject);  //fix
var
  fTransport: TTransportUsed;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'OpenProject' );{$ENDIF}

  try
    if dm_DataMod.nxtbl_NxDbSqlToolsPrjs.RecordCount > 0 then
      fTransport := TTransPortUsed(dm_DataMod.nxtbl_NxDbSqlToolsPrjsTransportID.AsInteger)
    else
      fTransport := tranNone;
  except
    MessageDlg('msg 882-Could NOT open project due to Db table error.', mtError, [mbOK], 0);
    Exit;
  end;
  Close;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'OpenProject' );{$ENDIF}
end;



procedure Tfrm_SelectProject.PleaseWait(aToDo: Boolean);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'PleaseWait' );{$ENDIF}

  jvpnl_PleaseWait.Visible := aToDo;
  if aToDo then
  begin
    Screen.Cursor := crHourGlass;
    jvpnl_PleaseWait.Refresh;
  end
  else
    Screen.Cursor := crDefault;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'PleaseWait' );{$ENDIF}
end;


procedure Tfrm_SelectProject.OpenPrjFrom(Sender: TObject; PrjOpenType: tPrjOpenType);
// open project from click on mru project list

//  function SetPrjInfo: boolean;
//  begin
//    Result := True;
//    try
//      gProjectInfo.BeginUpdate;
//
//      gProjectInfo.PrjName := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjName').AsString);
//      gProjectInfo.PrjPath := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('PrjPath').AsString);
//      gProjectInfo.Transport := TTransportUsed(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('TransportID').AsInteger);
//      gProjectInfo.Server := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString);
//      gProjectInfo.Alias := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString);
//      gProjectInfo.ActiveTrans := gProjectInfo.Transport;
//      gProjectInfo.ActiveServer := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Server').AsString);
//      gProjectInfo.ActiveDb := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('Alias').AsString);
//      gProjectInfo.DBPassWord := ShortString(dm_DataMod.nxtbl_NxDbSqlToolsPrjs.FieldByName('DbPassWord').AsString);
//    except
//      result := False;
//    end;
//    gProjectInfo.EndUpdate;
//  end;

var
  fError  : Boolean;
  fMsg: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'OpenPrjFrom' );{$ENDIF}

  fError := false;
  if gProjectInfo <> nil then
    FreeAndNil(gProjectInfo);
  gProjectInfo := TProjectInfo.create('Default Project', dm_DataMod.nxtbl_NxDbSqlToolsPrjs);
  gProjectInfo.ClearPrj;
  gProjectInfo.BeginUpdate;
  case PrjOpenType of
    pot_MRU: begin
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'before' );{$ENDIF}
      if not gProjectInfo.LoadPropertiesFromTable(fMsg, lstGemMruList1.GetName(lstGemMruList1.ItemIndex)) then
      begin
        MessageDlg('msg 1065-Could not find project from MRU listing. Select '+#13+#10+
                   'another project from then MRU list or use the'+#13+#10+
                   'Db grid to select/create a project.', mtError, [mbOK], 0);
        if (MessageDlg('Remove item from MRU list?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
          lstGemMruList1.Items.Delete(lstGemMruList1.ItemIndex);
        fError:= True;
      end;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'after' );{$ENDIF}
    end;

    pot_PrjGrid:
       if Not gProjectInfo.LoadPropertiesFromTable(fMsg) then
       begin
        MessageDlg('msg 1078-Could not find project from MRU listing. Used the'+#13+#10+
                   'Db grid to select a project.', mtError, [mbOK], 0);
        fError:= True;
       end;

    pot_Default: begin
      gProjectInfo.PrjName := ShortString(AnsiRightStr(cthe_DefaultPrjPath, Length(cthe_DefaultPrjPath) - 1));
      gProjectInfo.PrjPath := ShortString(DefaultPathForPrjsFolder);
    end;
  end;

  if not FError then begin
    if (gProjectInfo.PrjPath<> '') and (not System.SysUtils.DirectoryExists(string(gProjectInfo.PrjPath))) then
      if (MessageDlg('msg 571-Prj. Path does not Exist. Create?', mtWarning, [mbYes, mbNo], 0) in [mrYes, mrNone]) then begin
        if not System.SysUtils.ForceDirectories(String(gProjectInfo.PrjPath)) then begin
           gProjectInfo.PrjPath := '';
        end;
      end;
    lstGemMruList1.Add(string(gProjectInfo.PrjName), string(gProjectInfo.PrjPath));
    gProjectInfo.EndUpdate;
    OpenProject(Sender);
  end
  else begin
    gProjectInfo.EndUpdate;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'OpenPrjFrom' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_OpenPrjExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_OpenPrjExecute' );{$ENDIF}

  OpenPrjFrom(Sender, pot_PrjGrid);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_OpenPrjExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_DefaultPrjExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_DefaultPrjExecute' );{$ENDIF}

  OpenPrjFrom(Sender, pot_Default);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_DefaultPrjExecute' );{$ENDIF}
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
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_RecentPrjsExecute' );{$ENDIF}

  cardpnl_Dialogs.ActiveCard := Card_MostRecentlyUsedPrj;
  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_RecentPrjsExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_CreateEditPrjsExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_CreateEditPrjsExecute' );{$ENDIF}

  cardpnl_Dialogs.ActiveCard := Card_CreateSelectPrjDb;
  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_CreateEditPrjsExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_CreateUpdateDbExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_CreateUpdateDbExecute' );{$ENDIF}

  cardpnl_Dialogs.ActiveCard := crd_CreateNewDbTables;
  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_CreateUpdateDbExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_ChangeDbServersExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_ChangeDbServersExecute' );{$ENDIF}

  cardpnl_Dialogs.ActiveCard := crd_SetDbServer;
  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_ChangeDbServersExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_PackRestDbExecute(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_PackRestDbExecute' );{$ENDIF}

  cardpnl_Dialogs.ActiveCard := crd_PackRestructureDb;
  SetFormSize;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_PackRestDbExecute' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_SetNetwodkDbTypeExecute(Sender: TObject);
var
  fStatus: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_SetNetwodkDbTypeExecute' );{$ENDIF}

  SetDialogServerType;



//  if not SetPrjDbServerType(false, fStatus) then
//    MessageDlg('msg 627-Error in Setup of Networked Database.', mtError, [mbOK], 0);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_SetNetwodkDbTypeExecute' );{$ENDIF}
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
    dm_DataMod.nxtbl_NxDbSqlToolsPrjsPrjPath.AsString := ExpandUNCFileName(JvSelectDirectory1.Directory);
    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;
end;


procedure Tfrm_SelectProject.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormCloseQuery' );{$ENDIF}

  if not System.SysUtils.DirectoryExists(string(gProjectInfo.PrjPath)) then
    OpenDefaultPrj;

  JvFormStorage1.SaveFormPlacement;


  CanClose := JvLED1.Status;
  IniSaveComponents(PrjSetupCompomentsIni, fComponentIni);//, Ext_Section:String='', false);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormCloseQuery' );{$ENDIF}
end;


procedure Tfrm_SelectProject.FormCreate(Sender: TObject);
var
  Index: Integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormCreate' );{$ENDIF}

  lstGemMruList1.MruListFile := MRUFile;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'FormCreate A' );{$ENDIF}
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'FormCreate B' );{$ENDIF}
  JvFormStorage1.RestoreFormPlacement;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'FormCreate C' );{$ENDIF}

  fComponentIni[Ord(icTJVRadioGrp)]      := jvrdgrp_ServerType;
  fComponentIni[Ord(icTEditLocalDbPath)] := edit_LocalDbPath;
  fComponentIni[Ord(icTEditServer)]      := edt_NetWorkServer;
  fComponentIni[Ord(icTEditAlias)]       := edt_Alias;
  {$IFDEF USE_CODESITE}CodeSite.SendMsg( 'FormCreate D' );{$ENDIF}

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormCreate' );{$ENDIF}
end;


function Tfrm_SelectProject.CloseDelphiSqlToolsDb(var Status: string): boolean;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CloseDelphiSqlToolsDb' );{$ENDIF}

  JvLED1.Status := false;
  SetConnectBtn(false);

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

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CloseDelphiSqlToolsDb' );{$ENDIF}
end;


//procedure TForm1.ListBox1MouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer) ;
//var lstIndex : Integer ;
//begin
//  with ListBox1 do
//  begin
//   lstIndex:=SendMessage(Handle, LB_ITEMFROMPOINT, 0, MakeLParam(x,y)) ;
//
//   // this should do the trick..
//   if fOldIndex <> lstIndex then
//     Application.CancelHint;
//   fOldIndex := lstIndex;
//
//   if (lstIndex >= 0) and (lstIndex <= Items.Count) then
//     Hint := Items[lstIndex]
//   else
//     Hint := ''
//   end;
//end;


procedure Tfrm_SelectProject.edit_LocalDbPathChange(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'edit_LocalDbPathChange' );{$ENDIF}

//  SetDialogServerType;
  CheckUserServerSelection(True);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'edit_LocalDbPathChange' );{$ENDIF}
end;


procedure Tfrm_SelectProject.SetConnectBtn(aConnected: Boolean);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetConnectBtn' );{$ENDIF}

  JvLED1.Status := aConnected;
  if aConnected then
    act_ConnectBtn.ImageIndex := 9
  else
    act_ConnectBtn.ImageIndex := 8;

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

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetConnectBtn' );{$ENDIF}
end;


function Tfrm_SelectProject.SetPrjDbServerType(aLocalServer: Boolean; var Status: string): Boolean;

  function SetEmbedded: Boolean;
  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetPrjDbServerType/SetEmbedded' );{$ENDIF}

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

    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetPrjDbServerType/SetEmbedded' );{$ENDIF}
  end;

  function SetNetwork: Boolean;
  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetPrjDbServerType/SetNetwork' );{$ENDIF}

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

    except
      Result := False;
      MessageDlg('msg 787785-Could not Setup Networked Db.'+#13+#10+ 'ERROR: '+Status, mtError, [mbOK], 0);
      SetStatusBar('Could not Setup Networked Db.' +#13+#10+'ERROR: '+'Status', 1, clRed);
    end;

    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetPrjDbServerType/SetNetwork' );{$ENDIF}
  end;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'SetPrjDbServerType' );{$ENDIF}

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

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'SetPrjDbServerType' );{$ENDIF}
end;


procedure Tfrm_SelectProject.FormShow(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormShow' );{$ENDIF}

  IniLoadComponents(PrjSetupCompomentsIni, fComponentIni, false);
  SetDialogServerType;
  CheckUserServerSelection(True);
  act_ConnectBtn.Execute;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormShow' );{$ENDIF}
end;


procedure Tfrm_SelectProject.JvDBFindEdit1Change(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'JvDBFindEdit1Change' );{$ENDIF}

  timer_SearchTimerBlank.Enabled := true;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'JvDBFindEdit1Change' );{$ENDIF}
end;


procedure Tfrm_SelectProject.jvxpbtn_HaltProgramClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'jvxpbtn_HaltProgramClick' );{$ENDIF}

  if (MessageDlg('mmsg 945-Do want to Halt the program?', mtWarning, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
    Halt(9);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'jvxpbtn_HaltProgramClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.jvlstbx_AlaisNamesClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'jvlstbx_AlaisNamesClick' );{$ENDIF}

  if (jvlstbx_AlaisNames.Count < 1) or (jvlstbx_AlaisNames.ItemIndex < 0) then
    MessageDlg('mag 948-Either there are no items in the list or a selection was'+#13+#10+
               'made not on an item in the list.', mtError, [mbOK], 0)
  else begin
    SetConnectBtn(false);
    dm_DataMod.nxdb_SQLBtns.Close;
    edt_Alias.Text := jvlstbx_AlaisNames.Items[jvlstbx_AlaisNames.ItemIndex];
    dm_DataMod.nxdb_SQLBtns.AliasName  := edt_NetWorkServer.Text;
    CheckUserServerSelection;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'jvlstbx_AlaisNamesClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.jvrdgrp_ServerTypeClick(Sender: TObject);
var
  s: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'jvrdgrp_ServerTypeClick' );{$ENDIF}

  CloseDelphiSqlToolsDb(s);
  case jvrdgrp_ServerType.ItemIndex of
    0: begin
      SetDialogServerType;
      CheckUserServerSelection;
    end;

    1..2: begin
      SetDialogServerType;
      CheckUserServerSelection(True);
    end;

    3:
    begin
    end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'jvrdgrp_ServerTypeClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.jvxpbtn_GetLocalPathClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'jvxpbtn_GetLocalPathClick' );{$ENDIF}

  if JvSelectDirectory1.Execute then
    edit_LocalDbPath.Text := ExpandUNCFileName(JvSelectDirectory1.Directory);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'jvxpbtn_GetLocalPathClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.act_ConnectBtnExecute(Sender: TObject);
var
  s: string;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'act_ConnectBtnExecute' );{$ENDIF}

  if mmo_IssuesMemo.Lines.count > 0  then  begin
    cardpnl_Dialogs.ActiveCard := crd_SetDbServer;
    act_ConnectBtn.ImageIndex := 8;
    JvLED1.Status := False;
    exit;
  end;

  try
    with dm_DataMod do
    begin
      s := 'Database - nxdb_SQLBtns';
      nxdb_SQLBtns.Open;

      s := 'Table - NxSqlButtonsDbT';
      NxSqlButtonsDbT.Open;

      s := 'Table - nxtbl_NxDbSqlToolsPrjs';
      nxtbl_NxDbSqlToolsPrjs.Open;

      s := 'Table - nxtbl_TransportLUT';
      nxtbl_TransportLUT.Open;
    end;

    act_ConnectBtn.ImageIndex := 9;
    if not dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Active then
      MessageDlg('act_ConnectBtnExecute -- Poject Tabel was CLOSED!', mtError, [mbOK], 0);

    if lstGemMruList1.Count <1 then
      cardpnl_Dialogs.ActiveCard := Card_CreateSelectPrjDb
    else
      cardpnl_Dialogs.ActiveCard := Card_MostRecentlyUsedPrj;

    JvLED1.Status := true;

  except
    on e: EDatabaseError do
      begin
        mmo_IssuesMemo.Lines.Add('===== EDatabaseError Exception. Openning Projects and SQL Btn Database');
        mmo_IssuesMemo.Lines.Add('Database Error Last Action before Error: Open - ' + s);
        mmo_IssuesMemo.Lines.Add('Error Msg: ' + E.Message);
        act_ConnectBtn.ImageIndex := 8;
        act_ConnectBtn.Enabled := False;
        cardpnl_Dialogs.ActiveCard := crd_SetDbServer;
      end;

    on E: Exception do
      begin
        mmo_IssuesMemo.Lines.Add('===== General Exception. Openning Projects and SQL Btn Database');
        mmo_IssuesMemo.Lines.Add('Database Error Last Action before Error: Open - ' + s);
        mmo_IssuesMemo.Lines.Add('General Exception Error Msg: ' + E.Message);
        act_ConnectBtn.Enabled := False;
        cardpnl_Dialogs.ActiveCard := crd_SetDbServer;
      end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'act_ConnectBtnExecute' );{$ENDIF}
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


procedure Tfrm_SelectProject.btn_CopyDbTablesClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn_CopyDbTablesClick' );{$ENDIF}

  if (MessageDlg('msg 1295-Continue with closing program?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
    Halt(9);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'btn_CopyDbTablesClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.btn_ResetLocalDbPathClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn_ResetLocalDbPathClick' );{$ENDIF}

  edit_LocalDbPath.Text := DelphiDbDefaultPath;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'btn_ResetLocalDbPathClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.btn__CloseClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn__CloseClick' );{$ENDIF}

  gProjectInfo.ClearPrj;
  act_DefaultPrj.Execute;
  Close;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'btn__CloseClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.btn__SplitViewOpenCloseClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'btn__SplitViewOpenCloseClick' );{$ENDIF}

  if sv_MenuItems.Opened then
    sv_MenuItems.Close
  else
    sv_MenuItems.Open;
//  sv_MenuItems.Opened := not sv_MenuItems.Opened;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'btn__SplitViewOpenCloseClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.cardpnl_DialogsCardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'cardpnl_DialogsCardChange' );{$ENDIF}

//  sv_MenuItems(sender);

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'cardpnl_DialogsCardChange' );{$ENDIF}
end;


procedure Tfrm_SelectProject.ts_DefaultAliasBtnDbClick(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'ts_DefaultAliasBtnDbClick' );{$ENDIF}

//  edt_Alias.ReadOnly := ts_DefaultAliasBtnDb.State = tssOff;
//  if ts_DefaultAliasBtnDb.State = tssOff then begin
//    edt_Alias.Text     := cSqlBtnsDbAlias;
//    edt_Alias.Color    := clCream;
//    edt_Alias.readOnly := true;
//
//    lbl_CaptionForDBAlais.Caption := 'Default Database Alias:';
//  end
//  else begin
//    edt_Alias.readOnly := false;
//    edt_Alias.Color    := clWindow;
//
//    lbl_CaptionForDBAlais.Caption := 'User Database Alias:';
//  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'ts_DefaultAliasBtnDbClick' );{$ENDIF}
end;


procedure Tfrm_SelectProject.lb_ServerNames1Click(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'lb_ServerNames1Click' );{$ENDIF}

  if (lb_ServerNames.Count < 1) or (lb_ServerNames.ItemIndex < 0) then
    MessageDlg('mag 948-Either there are no items in the list or a selection was'+#13+#10+
               'made not on an item in the list.', mtError, [mbOK], 0)
  else begin
    SetConnectBtn(false);
    case jvrdgrp_ServerType.ItemIndex of
      1: begin
        dm_DataMod.nxnmdp_trnsprt.Close;
        edt_NetWorkServer.Text := lb_ServerNames.Items[lb_ServerNames.ItemIndex];
        dm_DataMod.nxnmdp_trnsprt.ServerNameRuntime := edt_NetWorkServer.Text;
        dm_DataMod.nxnmdp_trnsprt.ServerName := edt_NetWorkServer.Text;

        CheckUserServerSelection(True);
      end;

      2: begin
        dm_DataMod.nxwint_SqlToolsTrans.Close;
        edt_NetWorkServer.Text := lb_ServerNames.Items[lb_ServerNames.ItemIndex];
        dm_DataMod.nxwint_SqlToolsTrans.ServerNameRuntime := edt_NetWorkServer.Text;
        dm_DataMod.nxwint_SqlToolsTrans.ServerName := edt_NetWorkServer.Text;

        CheckUserServerSelection(True);
      end;
    end;
  end;

  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'lb_ServerNames1Click' );{$ENDIF}
end;


end.





