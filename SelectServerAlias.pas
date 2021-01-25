unit SelectServerAlias;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.StrUtils,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,

  Data.DB, Global, GlobalVars,

  JvExComCtrls, JvListView,

  nxtwWinsockTransport, nxtmSharedMemoryTransport, nxllTransport,
  nxptBasePooledTransport, nxtnNamedPipeTransport, nxsdServerEngine,
  nxreRemoteServerEngine, nxllComponent, nxdb, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.WinXCtrls, JvExStdCtrls, JvListBox, Vcl.Imaging.pngimage, JvXPCore,
  JvXPButtons, JvTabBar, JvPageList, JvExControls, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvBaseDlg, JvSelectDirectory;

type
  TGetServersAlias = class(TForm)
    jvpnl_TopPanel: TJvPanel;
    ts_LocalOrNetworked: TToggleSwitch;
    jvtbr_DbBar: TJvTabBar;
    pglst_LocalNetworkPages: TJvPageList;
    jvsp_LocalDb: TJvStandardPage;
    jvsp_NetworkDb: TJvStandardPage;
    lbl_Servers: TLabel;
    lst_Servers: TJvListBox;
    lst_Alias: TJvListBox;
    lbl_Alias: TLabel;
    lbl_Issues: TLabel;
    mmo_IssuesMemo: TMemo;
    jvpnl_FooterPanel: TJvPanel;
    lbl_SelectedItems: TLabel;
    bbt_OK: TBitBtn;
    bbt_Cancel: TBitBtn;
    jvmdrntbrpntr__1: TJvModernTabBarPainter;
    edt_LocalAlias: TEdit;
    lbl_Alias1: TLabel;
    lbl_DatabasePath: TLabel;
    edt_DbPath: TEdit;
    btn__GetPrjPath: TJvXPButton;
    lbl_SelectServerType: TLabel;
    JvSelectDirectory1: TJvSelectDirectory;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ts_LocalOrNetworkedClick(Sender: TObject);
    procedure btn__GetPrjPathClick(Sender: TObject);
    procedure pglst_LocalNetworkPagesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_OKClick(Sender: TObject);
    procedure lst_ServersClick(Sender: TObject);
    procedure lst_AliasClick(Sender: TObject);
  private
    { Private declarations }
    Session        : TnxSession;
    ServerWinSock  : TnxWinsockTransport;
    ServerNamedPipe: TnxNamedPipeTransport;
    SharedMemory   : TnxSharedMemoryTransport;
    ServerEngine   : TnxRemoteServerEngine;
    fServerName    : string;
    fAliasName     : string;
    fTransport     : TTransportUsed;
    fLocalDbPath   : string;
    function GetServers: Boolean;
  public
    { Public declarations }
    function Execute: boolean;

    property ServerName: string read fServerName write fServerName;
    property AliasName: string read fAliasName write fAliasName;
    property Transport: TTransportUsed read fTransport write fTransport default tranNone;
    property LocalDbPath: string read fLocalDbPath write fLocalDbPath;
  end;

var
  GetServersAlias: TGetServersAlias;

implementation
Uses
  DataMod;

{$R *.dfm}

{ TForm2 }

procedure TGetServersAlias.bbt_OKClick(Sender: TObject);
begin
  if ts_LocalOrNetworked.State = tssOff then
  begin
    fAliasName   := edt_LocalAlias.Text;
    fLocalDbPath := edt_DbPath.Text;
  end
  else begin
//    fServerName := lst_Servers.Items[lst_Servers.ItemIndex];
//    fAliasName :=  lst_Alias.Items[lst_Alias.ItemIndex];
//    fTransport :=
  end;
end;

procedure TGetServersAlias.btn__GetPrjPathClick(Sender: TObject);
begin
  if JvSelectDirectory1.Execute then begin
//    if not (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.state in [dsEdit, dsInsert]) then
//       dm_DataMod.nxtbl_NxDbSqlToolsPrjs.edit
//    else
//      if (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Eof) or  (dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Bof) then
//        exit
//      else
//       dm_DataMod.nxtbl_NxDbSqlToolsPrjs.edit;
    edt_DbPath.tEXT := ExpandUNCFileName(JvSelectDirectory1.Directory);
//    dm_DataMod.nxtbl_NxDbSqlToolsPrjs.Post;
  end;
end;


function TGetServersAlias.Execute: boolean;
begin
  Result := (ShowModal = mrOK);
end;



procedure TGetServersAlias.FormActivate(Sender: TObject);
begin
  var OldCursor: tCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    GetServers;
  finally
    Screen.Cursor := OldCursor;
  end;
end;


procedure TGetServersAlias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Session.Close;
  ServerEngine.Close;
  ServerWinSock.close;
  ServerNamedPipe.Close;

  FreeAndNil(ServerWinSock);
  FreeAndNil(ServerNamedPipe);
  FreeAndNil(ServerEngine);
  FreeAndNil(Session);
end;


procedure TGetServersAlias.FormCreate(Sender: TObject);
begin
  ServerWinSock := TnxWinsockTransport.Create(nil);
  ServerNamedPipe := TnxNamedPipeTransport.Create(nil);
  ServerEngine := TnxRemoteServerEngine.Create(nil);
  Session := TnxSession.Create(nil);

  fServerName := 'None';
  fAliasName := 'None';
  pglst_LocalNetworkPages.ActivePage := jvsp_LocalDb;
  jvtbr_DbBar.Tabs.Items[0];
  Height := 298;
  Width := 544;
end;


procedure TGetServersAlias.FormShow(Sender: TObject);
begin
  if ts_LocalOrNetworked.State = tssOff then
    jvtbr_DbBar.Tabs[0].Selected := true
  else
    jvtbr_DbBar.Tabs[1].Selected := true;
end;


function TGetServersAlias.GetServers: Boolean;
var
  sl: TStringList;
  index: integer;

  function getWinSock: Boolean;
  begin
    result := true;
    try
      ServerWinSock.GetServerNames(sl, 5000);
      for var index: integer := 0 to sl.count - 1 do
        lst_Servers.Items.Add('TCP|'+sl[index]);
    except
      on e: EDatabaseError do
        begin
          mmo_IssuesMemo.Lines.Add('===== EDatabaseError Exception. Openning and getting servers: WinSock transport');
          mmo_IssuesMemo.Lines.Add('Error Msg: ' + E.Message);
          Result := False;
        end;
    end;
  end;

  function getNamedPipe: Boolean;
  begin
    Result := True;
    try
      ServerNamedPipe.GetServerNames(sl, 5000);
      for var index: integer := 0 to sl.count - 1 do
        lst_Servers.Items.Add('NP|'+sl[index]);
    except
      on e: EDatabaseError do
        begin
          mmo_IssuesMemo.Lines.Add('===== EDatabaseError Exception. Openning and getting servers: Named Pipe transport');
          mmo_IssuesMemo.Lines.Add('Error Msg: ' + E.Message);
          Result := False;
        end;
    end;
  end;

begin
  lst_Servers.Items.Clear;
  lst_Alias.Items.Clear;
  mmo_IssuesMemo.Lines.Clear;
  sl := TStringList.Create;
  try
    Result := getWinSock;
    if Result then
      Result := getNamedPipe;
  finally
    FreeAndNil(sl);
  end;
  mmo_IssuesMemo.Lines.Add('No server selected');
end;


procedure TGetServersAlias.lst_AliasClick(Sender: TObject);
begin
  if lst_Alias.ItemIndex > -1 then
  begin
    mmo_IssuesMemo.Lines.Clear;
    lbl_SelectedItems.Caption := lst_Servers.Items[lst_Servers.ItemIndex] + '/'+
                                 lst_Alias.Items[lst_Alias.ItemIndex];
    fAliasName := lst_Alias.Items[lst_Alias.ItemIndex];
  end;
end;


procedure TGetServersAlias.lst_ServersClick(Sender: TObject);
begin
  if lst_Servers.ItemIndex > -1 then
  begin
    mmo_IssuesMemo.Lines.Clear;
    ServerWinSock.Close;
    ServerNamedPipe.Close;
    lbl_SelectedItems.Caption := lst_Servers.Items[lst_Servers.ItemIndex];
    var indexLeft  : integer :=  Pos('|', lst_Servers.Items[lst_Servers.ItemIndex]);
    var indexRight : integer := Length(lst_Servers.Items[lst_Servers.ItemIndex]) - indexLeft;

    var TransStr: string := AnsiLeftStr(lst_Servers.Items[lst_Servers.ItemIndex],  indexLeft - 1);
    var ServerStr: string := AnsiRightStr(lst_Servers.Items[lst_Servers.ItemIndex], indexRight );

    if TransStr = 'TCP' then
    begin
      ServerWinSock.ServerName := ServerStr;
      ServerEngine.Transport := ServerWinSock;
      ServerWinSock.Open;
      fTransport := tranWinSock;
    end
    else
    begin
      if TransStr = 'NP' then
      begin
        ServerNamedPipe.ServerName := ServerStr;
        ServerEngine.Transport := ServerNamedPipe;
        ServerNamedPipe.Open;
        fTransport := tranNamePipe;
      end
      else
      begin
        ShowMessage('Error Not Server: ' + ServerStr);
        Exit;
      end;
    end;

    fServerName := ServerStr;
    Session.ServerEngine := ServerEngine;
    Session.Open;
    Session.GetAliasNames(lst_Alias.Items);
    mmo_IssuesMemo.Lines.Add('No Alias selected');
  end;
end;


procedure TGetServersAlias.pglst_LocalNetworkPagesChange(Sender: TObject);
begin
  if pglst_LocalNetworkPages.ActivePage = jvsp_LocalDb then
    Height := 298
  else
    Height := 566;
end;


procedure TGetServersAlias.ts_LocalOrNetworkedClick(Sender: TObject);
begin
  if ts_LocalOrNetworked.state = tssOff then
  begin
    fServerName := '';
    fAliasName := '';
    fTransport := tranNone;
    lst_Servers.Enabled := False;
    lst_Alias.Enabled := False;
    lbl_SelectedItems.Caption := 'Local Database';
  end
  else
  begin
    lst_Servers.Enabled := true;
    lst_Alias.Enabled := true;
    lbl_SelectedItems.Caption := '';
    lst_Servers.ItemIndex := -1;
    lst_Alias.ItemIndex := -1;
  end;
end;

end.
