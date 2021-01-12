object dm_DataMod: Tdm_DataMod
  OldCreateOrder = False
  Height = 492
  Width = 645
  object nxseAllEngines: TnxseAllEngines
    Left = 96
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
    Left = 86
    Top = 184
  end
  object nxDatabase: TnxDatabase
    Session = nxSession
    AliasPath = 'H:\MOWDb_10-08-2018'
    Left = 86
    Top = 240
  end
  object nxTable: TnxTable
    Database = nxDatabase
    Left = 30
    Top = 296
  end
  object nxSqlUpdateObject: TnxSqlUpdateObject
    Left = 120
    Top = 296
  end
  object nxsrvrngn_Local: TnxServerEngine
    SqlEngine = nxsqlngn_Local
    ServerName = ''
    Options = []
    TableExtension = 'nx1'
    Left = 296
    Top = 136
  end
  object nxsqlngn_Local: TnxSqlEngine
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
    Left = 288
    Top = 192
  end
  object nxsn_SqlTools: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxrse_SqlTools
    Left = 400
    Top = 192
  end
  object nxdb_SQLBtns: TnxDatabase
    ActiveDesigntime = True
    Session = nxsn_SqlTools
    AliasName = 'NxDelphiSqlTools'
    Left = 400
    Top = 248
  end
  object ds_NSqlBtnsT: TJvDataSource
    DataSet = NxSqlButtonsDbT
    Left = 272
    Top = 392
  end
  object ds_NxDbSqlToolsPrjs: TJvDataSource
    DataSet = nxtbl_NxDbSqlToolsPrjs
    Left = 392
    Top = 384
  end
  object nxwint_SqlToolsTrans: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameDesigntime = 'SRSDServer@10.0.0.62'
    Left = 552
    Top = 72
  end
  object nxrse_SqlTools: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxwint_SqlToolsTrans
    Left = 488
    Top = 144
  end
  object ds_nxtbl_TransportLUT: TDataSource
    DataSet = nxtbl_TransportLUT
    Left = 488
    Top = 408
  end
  object nxtbl_NxDbSqlToolsPrjs: TnxTable
    ActiveDesigntime = True
    Database = nxdb_SQLBtns
    OnEditError = nxtbl_NxDbSqlToolsPrjsEditError
    OnPostError = nxtbl_NxDbSqlToolsPrjsPostError
    TableName = 'NxDbSqlToolsPrjs'
    Left = 392
    Top = 312
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
  end
  object nxtbl_TransportLUT: TnxTable
    ActiveDesigntime = True
    Database = nxdb_SQLBtns
    TableName = 'TransportLUT'
    Left = 488
    Top = 360
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
    Left = 192
    Top = 232
  end
  object NxSqlButtonsDbT: TGEMNxTable
    Database = nxdb_SQLBtns
    AfterDelete = NxSqlButtonsDbTAfterDelete
    TableName = 'NxSqlButtonsDb'
    Left = 272
    Top = 336
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
    Left = 88
    Top = 368
  end
  object nxBlowfishRC4SecuredTransport1: TnxBlowfishRC4SecuredTransport
    DisplayCategory = 'Transports,Secured'
    Left = 288
    Top = 8
  end
  object nxnmdp_trnsprt: TnxNamedPipeTransport
    DisplayCategory = 'Transports'
    Left = 408
    Top = 72
  end
end
