object dm_DataMod: Tdm_DataMod
  OldCreateOrder = False
  Height = 492
  Width = 958
  object nxseAllEngines: TnxseAllEngines
    Left = 384
    Top = 8
  end
  object nxWinsockTransport: TnxWinsockTransport
    DisplayCategory = 'Transports'
    Left = 46
    Top = 72
  end
  object nxNamedPipeTransport: TnxNamedPipeTransport
    DisplayCategory = 'Transports'
    Left = 182
    Top = 72
  end
  object nxRemoteServerEngine: TnxRemoteServerEngine
    Transport = nxWinsockTransport
    Left = 94
    Top = 128
  end
  object nxSession: TnxSession
    ServerEngine = nxsrvrngn_Local
    Left = 142
    Top = 192
  end
  object nxDatabase: TnxDatabase
    Session = nxSession
    AliasPath = 'H:\MOWDb_10-08-2018'
    Left = 134
    Top = 248
  end
  object nxTable: TnxTable
    Database = nxDatabase
    Left = 86
    Top = 312
  end
  object nxSqlUpdateObject: TnxSqlUpdateObject
    Left = 176
    Top = 312
  end
  object nxsrvrngn_Local: TnxServerEngine
    OnSettingsLoaded = nxsrvrngn_LocalSettingsLoaded
    SqlEngine = nxsqlngn_Local
    ServerName = ''
    Options = [seoCloseAllWhenInactive]
    TableExtension = 'nx1'
    Left = 544
    Top = 136
  end
  object nxsqlngn_Local: TnxSqlEngine
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
    Left = 384
    Top = 153
  end
  object nxsn_SqlTools: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxrse_SqlTools
    Left = 608
    Top = 184
  end
  object nxdb_SQLBtns: TnxDatabase
    ActiveDesigntime = True
    Session = nxsn_SqlTools
    AliasName = 'NxDelphiSqlTools'
    Left = 608
    Top = 240
  end
  object ds_NSqlBtnsT: TJvDataSource
    DataSet = NxSqlButtonsDbT
    Left = 472
    Top = 408
  end
  object ds_NxDbSqlToolsPrjs: TJvDataSource
    DataSet = nxtbl_NxDbSqlToolsPrjs
    Left = 600
    Top = 368
  end
  object nxwint_SqlToolsTrans: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameDesigntime = 'SRSDServer@10.0.0.62'
    Left = 760
    Top = 64
  end
  object nxrse_SqlTools: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxwint_SqlToolsTrans
    Left = 696
    Top = 136
  end
  object ds_nxtbl_TransportLUT: TDataSource
    DataSet = nxtbl_TransportLUT
    Left = 696
    Top = 400
  end
  object nxtbl_NxDbSqlToolsPrjs: TnxTable
    ActiveDesigntime = True
    Database = nxdb_SQLBtns
    AfterPost = nxtbl_NxDbSqlToolsPrjsAfterPost
    OnEditError = nxtbl_NxDbSqlToolsPrjsEditError
    OnPostError = nxtbl_NxDbSqlToolsPrjsPostError
    TableName = 'NxDbSqlToolsPrjs'
    Left = 600
    Top = 304
    object nxtbl_NxDbSqlToolsPrjsPrjName: TWideStringField
      FieldName = 'PrjName'
      Required = True
      Size = 30
    end
    object nxtbl_NxDbSqlToolsPrjsPrjPath: TWideStringField
      FieldName = 'PrjPath'
      Size = 255
    end
    object nxtbl_NxDbSqlToolsPrjsTransportID: TIntegerField
      FieldName = 'TransportID'
    end
    object nxtbl_NxDbSqlToolsPrjsServer: TWideStringField
      FieldName = 'Server'
      Size = 95
    end
    object nxtbl_NxDbSqlToolsPrjsAlias: TWideStringField
      FieldName = 'Alias'
      Size = 95
    end
    object nxtbl_NxDbSqlToolsPrjsPassFileSaveLoc: TWideStringField
      FieldName = 'PassFileSaveLoc'
      Size = 255
    end
    object nxtbl_NxDbSqlToolsPrjsDbPassWord: TWideStringField
      FieldName = 'DbPassWord'
      Size = 255
    end
    object nxtbl_NxDbSqlToolsPrjsMemo: TnxMemoField
      FieldName = 'Memo'
      BlobType = ftMemo
    end
    object nxtbl_NxDbSqlToolsPrjsTransport: TStringField
      FieldKind = fkLookup
      FieldName = 'Transport'
      LookupDataSet = nxtbl_TransportLUT
      LookupKeyFields = 'TransportID'
      LookupResultField = 'Name'
      KeyFields = 'TransportID'
      Size = 15
      Lookup = True
    end
    object nxtbl_NxDbSqlToolsPrjsLocalServerDbPath: TWideStringField
      FieldName = 'LocalServerDbPath'
      Size = 255
    end
  end
  object nxtbl_TransportLUT: TnxTable
    ActiveDesigntime = True
    Database = nxdb_SQLBtns
    TableName = 'TransportLUT'
    Left = 696
    Top = 352
    object nxtbl_TransportLUTTransportID: TIntegerField
      FieldName = 'TransportID'
    end
    object nxtbl_TransportLUTName: TWideStringField
      FieldName = 'Name'
      Size = 10
    end
  end
  object nxStoredProc1: TnxStoredProc
    Database = nxDatabase
    Left = 200
    Top = 216
  end
  object NxSqlButtonsDbT: TGEMNxTable
    Database = nxdb_SQLBtns
    AfterDelete = NxSqlButtonsDbTAfterDelete
    TableName = 'NxSqlButtonsDb'
    Left = 480
    Top = 344
    object NxSqlButtonsDbTBtnId: TUnsignedAutoIncField
      FieldName = 'BtnId'
    end
    object NxSqlButtonsDbTPanelNum: TByteField
      FieldName = 'PanelNum'
      Required = True
    end
    object NxSqlButtonsDbTBtnTop: TIntegerField
      FieldName = 'BtnTop'
      Required = True
    end
    object NxSqlButtonsDbTBtnLeft: TIntegerField
      FieldName = 'BtnLeft'
      Required = True
    end
    object NxSqlButtonsDbTBtnWidth: TIntegerField
      FieldName = 'BtnWidth'
      Required = True
    end
    object NxSqlButtonsDbTCaption: TWideStringField
      FieldName = 'Caption'
      Required = True
      Size = 25
    end
    object NxSqlButtonsDbTExtraText: TWideStringField
      FieldName = 'ExtraText'
      Size = 15
    end
    object NxSqlButtonsDbTSpaceAfterCursor: TBooleanField
      FieldName = 'SpaceAfterCursor'
    end
    object NxSqlButtonsDbTUseExtendedSql: TBooleanField
      FieldName = 'UseExtendedSql'
    end
    object NxSqlButtonsDbTSqlCode: TnxMemoField
      FieldName = 'SqlCode'
      BlobType = ftMemo
    end
    object NxSqlButtonsDbTHints: TWideStringField
      FieldName = 'Hints'
      Size = 255
    end
    object NxSqlButtonsDbTNexusDbHelpUrl: TWideStringField
      FieldName = 'NexusDbHelpUrl'
      Size = 255
    end
    object NxSqlButtonsDbTCursorBeforeThisChar: TnxStringField
      FieldName = 'CursorBeforeThisChar'
      Size = 1
    end
    object NxSqlButtonsDbTColor: TnxLargeintField
      FieldName = 'Color'
    end
    object NxSqlButtonsDbTAddToEditorFunctionList: TBooleanField
      FieldName = 'AddToEditorFunctionList'
    end
  end
  object nxPascalScriptEngine1: TnxPascalScriptEngine
    Left = 400
    Top = 424
  end
  object nxBlowfishRC4SecuredTransport1: TnxBlowfishRC4SecuredTransport
    DisplayCategory = 'Transports,Secured'
    Left = 384
    Top = 56
  end
  object nxnmdp_trnsprt: TnxNamedPipeTransport
    DisplayCategory = 'Transports'
    Left = 616
    Top = 64
  end
  object nxdtbsmpr_1: TnxDatabaseMapper
    Mappings = <>
    Left = 864
    Top = 248
  end
  object nxsrvrnfplgn_1: TnxServerInfoPlugin
    DisplayCategory = 'Plugins'
    Left = 872
    Top = 320
  end
  object nxsrvrngn_LocalDb: TnxServerEngine
    SqlEngine = nxsqlngn_Local
    ServerName = ''
    Options = []
    TableExtension = 'nx1'
    Left = 224
    Top = 128
  end
end
