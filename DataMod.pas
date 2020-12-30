unit DataMod;

interface

uses
  System.SysUtils, System.Classes,

  Vcl.Dialogs,

  Data.DB,

  nxdb, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent, nxllTransport,
  nxtnNamedPipeTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxseAutoComponent, nxlgEventLog, nxdbBatchMove, nxllPluginBase, nxmrClient,
  nxConfigSettingsDB, nxsrSqlEngineBase, nxsqlEngine, nxrpBase, nxrpClient,

  JvDataSource,

  ModListnxTable, nxsrServerEngine, nxtsBaseSecuredTransport,
  nxtsBlowfishRC4SecuredTransport, nxscrBaseScriptingEngine;

type

  Tdm_DataMod = class(TDataModule)
    nxseAllEngines                        : TnxseAllEngines;
    nxWinsockTransport                    : TnxWinsockTransport;
    nxNamedPipeTransport                  : TnxNamedPipeTransport;
    nxRemoteServerEngine                  : TnxRemoteServerEngine;
    nxSession                             : TnxSession;
    nxDatabase                            : TnxDatabase;
    nxTable                               : TnxTable;
    nxSqlUpdateObject                     : TnxSqlUpdateObject;
    nxsrvrngn_Local                       : TnxServerEngine;
    nxsqlngn_Local                        : TnxSqlEngine;
    nxdb_SQLBtns                          : TnxDatabase;
    ds_NSqlBtnsT                          : TJvDataSource;
    ds_NxDbSqlToolsPrjs                   : TJvDataSource;
    nxwint_SqlToolsTrans                  : TnxWinsockTransport;
    nxrse_SqlTools                        : TnxRemoteServerEngine;
    ds_nxtbl_TransportLUT                 : TDataSource;
    nxtbl_NxDbSqlToolsPrjs                : TnxTable;
    nxtbl_NxDbSqlToolsPrjsPrjName         : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsTransportID     : TIntegerField;
    nxtbl_NxDbSqlToolsPrjsServer          : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsAlias           : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsPassFileSaveLoc : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsDbPassWord      : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsMemo            : TnxMemoField;
    nxtbl_TransportLUT                    : TnxTable;
    nxtbl_TransportLUTTransportID         : TIntegerField;
    nxtbl_TransportLUTName                : TWideStringField;
    nxtbl_NxDbSqlToolsPrjsTransport       : TStringField;
    nxStoredProc1                         : TnxStoredProc;
    NxSqlButtonsDbT                       : TGEMNxTable;
    NxSqlButtonsDbTBtnId                  : TUnsignedAutoIncField;
    NxSqlButtonsDbTPanelNum               : TByteField;
    NxSqlButtonsDbTBtnTop                 : TIntegerField;
    NxSqlButtonsDbTBtnLeft                : TIntegerField;
    NxSqlButtonsDbTBtnWidth               : TIntegerField;
    NxSqlButtonsDbTCaption                : TWideStringField;
    NxSqlButtonsDbTExtraText              : TWideStringField;
    NxSqlButtonsDbTSpaceAfterCursor       : TBooleanField;
    NxSqlButtonsDbTUseExtendedSql         : TBooleanField;
    NxSqlButtonsDbTSqlCode                : TnxMemoField;
    NxSqlButtonsDbTHints                  : TWideStringField;
    NxSqlButtonsDbTNexusDbHelpUrl         : TWideStringField;
    NxSqlButtonsDbTAddToEditorFunctionList: TBooleanField;
    NxSqlButtonsDbTCursorBeforeThisChar: TnxStringField;
    NxSqlButtonsDbTColor: TnxLargeintField;
    nxPascalScriptEngine1: TnxPascalScriptEngine;
    nxBlowfishRC4SecuredTransport1: TnxBlowfishRC4SecuredTransport;
    nxsn_SqlTools: TnxSession;
    nxtbl_NxDbSqlToolsPrjsPrjPath: TWideStringField;
    procedure NxSqlButtonsDbTAfterDelete(DataSet: TDataSet);
    procedure nxtbl_NxDbSqlToolsPrjsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure nxtbl_NxDbSqlToolsPrjsEditError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_DataMod: Tdm_DataMod;

implementation

uses
  Global, System.UITypes,  {$IFDEF BACKUPIDE}frm_BackupPrjs;  {$ELSE} NxToolsMain; {$ENDIF}

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_DataMod.nxtbl_NxDbSqlToolsPrjsEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg('Database Edit Error: '+ E.Message, mtError, [mbOK], 0);
end;


procedure Tdm_DataMod.nxtbl_NxDbSqlToolsPrjsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg('Database Post Error: '+ E.Message, mtError, [mbOK], 0);
end;


procedure Tdm_DataMod.NxSqlButtonsDbTAfterDelete(DataSet: TDataSet);
begin
{$IFDEF NXSQLTOOLS}
  frm_NxToolsMain.btn_CreateBtns;
{$ENDIF}
end;


end.

