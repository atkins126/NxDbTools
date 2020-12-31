(**********************************************************************************)
(* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  *)
(* 2020-12-31 16:36:38                                                            *)
(*                                                                                *)
(* Version: 4.5024                                                                *)
(*                                                                                *)
(**********************************************************************************)

unit NxDbToolsDbEvolution_1;

interface

uses
  nxdb,
  nxsdTypes,
  nxsdDataDictionary;

type
  TnxcgProgressCallback = 
    procedure(const aTableName : String;
      var aStatus : TnxTaskStatus;
      var aCancel : Boolean) of object;

type
  TnxcgGetPasswordCallback =
    procedure(const aTableName : String;
      var aPassword : string) of object;

  procedure BuildAndEvolveDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
    const aPassword : String = '');

  procedure RestructureDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
    const aPassword : String = '');

  procedure PackDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
    const aPassword : String = '');

  function TableCount: Integer;
  function DatabaseVersion: Cardinal;
  function DatabaseVersionStr: String;
  function GetTableDictionary(aDatabase : TnxDatabase; const aTableName : String): TnxDataDictionary;

implementation

uses
  {$IFDEF NXWINAPI}nxWinAPI{$ELSE}Windows{$ENDIF},
  Classes,
  Math,
  SysUtils,
  StrUtils,
  Variants,
  DBCommon,
  nxllTypes,
  nxllBde,
  nxllException,
  nxllWideString,
  nxsdConst,
  nxsdDataDictionaryStrings,
  nxsdDataDictionaryRefInt,
  nxsdDataDictionaryFulltext,
  nxsdDataDictionaryAudit,
  nxsdFilterEngineSimpleExpression,
  nxsdFilterEngineSql,
  nxsdServerEngine,
  nxsdFieldMapperDescriptor,
  nxsdTableMapperDescriptor;

type
  TnxcgCreateDictCallback = function(aDatabase : TnxDatabase): TnxDataDictionary;

// BuNxSqlButtonsDb
function __BuNxSqlButtonsDb(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('BtnId', '', nxtAutoInc, 10, 0, False);
        AddField('PanelNum', '', nxtByte, 1, 0, True);
        AddField('BtnTop', '', nxtInt32, 2, 0, True);
        AddField('BtnLeft', '', nxtInt32, 10, 0, True);
        AddField('BtnWidth', '', nxtInt32, 10, 0, True);
        AddField('Caption', '', nxtWideString, 25, 0, True);
        AddField('ExtraText', '', nxtWideString, 15, 0, False);
        AddField('CursorBeforeThisChar', '', nxtChar, 1, 0, False);
        with AddField('SpaceAfterCursor', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('UseExtendedSql', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('SqlCode', '', nxtBLOBMemo, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('BtnId', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('BtnId'));
        with AddIndex('PanelNum', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('PanelNum'));
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// NxDbSqlToolsPrjs
function __NxDbSqlToolsPrjs(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      with AddRecordDescriptor(TnxHeapRecordDescriptor) as TnxHeapRecordDescriptor do begin
        RecordEngine := 'Variable';
        AddRecordCompressionDescriptor;
      end;
      with FieldsDescriptor do begin
        AddField('PrjName', '', nxtWideString, 30, 0, True);
        AddField('PrjPath', '', nxtWideString, 255, 0, False);
        with AddField('TransportID', '0=tcip, 2=pipe, 3=local', nxtInt32, 10, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 4;
        AddField('Server', '', nxtWideString, 95, 0, False);
        AddField('Alias', '', nxtWideString, 95, 0, False);
        AddField('PassFileSaveLoc', '', nxtWideString, 255, 0, False);
        AddField('DbPassWord', '', nxtWideString, 255, 0, False);
        AddField('Memo', '', nxtBLOBMemo, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do
        with AddIndex('PrjName', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('PrjName'));
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// NxSqlButtonsDb
function __NxSqlButtonsDb(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('BtnId', '', nxtAutoInc, 10, 0, False);
        AddField('PanelNum', '', nxtByte, 1, 0, True);
        AddField('BtnTop', '', nxtInt32, 2, 0, True);
        AddField('BtnLeft', '', nxtInt32, 10, 0, True);
        AddField('BtnWidth', '', nxtInt32, 10, 0, True);
        AddField('Caption', '', nxtWideString, 25, 0, True);
        AddField('ExtraText', '', nxtWideString, 15, 0, False);
        AddField('CursorBeforeThisChar', '', nxtChar, 1, 0, False);
        with AddField('SpaceAfterCursor', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('UseExtendedSql', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('SqlCode', '', nxtBLOBMemo, 0, 0, False);
        AddField('Color', '', nxtInt64, 11, 0, False);
        AddField('Hints', '', nxtWideString, 255, 0, False);
        AddField('NexusDbHelpUrl', '', nxtWideString, 255, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('BtnId', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('BtnId'));
        with AddIndex('PanelNum', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('PanelNum'));
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// TransportLUT
function __TransportLUT(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('TransportID', '', nxtInt32, 10, 0, False);
        AddField('Name', '', nxtWideString, 10, 0, False);
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

type
  TnxcgTableInfo = record
    TableName : String;
    Callback : TnxcgCreateDictCallback;
  end;

const
  TableInfos : array[0..3] of TnxcgTableInfo =
    ((TableName : 'BuNxSqlButtonsDb'; Callback : __BuNxSqlButtonsDb),
     (TableName : 'NxDbSqlToolsPrjs'; Callback : __NxDbSqlToolsPrjs),
     (TableName : 'NxSqlButtonsDb'; Callback : __NxSqlButtonsDb),
     (TableName : 'TransportLUT'; Callback : __TransportLUT));

function TableCount: Integer;
begin
  Result := Length(TableInfos);
end;

function DatabaseVersion: Cardinal;
begin
  Result := Cardinal($01000000);
end;

function DatabaseVersionStr: String;
begin
  Result :=
    Format('%d.%d.%d.%d',
      [(DatabaseVersion and $ff000000) shr 24,
       (DatabaseVersion and $00ff0000) shr 16,
       (DatabaseVersion and $0000ff00) shr 8,
       (DatabaseVersion and $000000ff)]);
end;

function GetTableDictionary(aDatabase : TnxDatabase; const aTableName : String): TnxDataDictionary;
var
  I : Integer;
begin
  Result := nil;
  for I := Low(TableInfos) to High(TableInfos) do
    if SameText(aTableName, TableInfos[I].TableName) then begin
      Result := TableInfos[I].Callback(aDatabase);
      break;
    end;
end;

procedure RestructureTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aNewDict : TnxDataDictionary;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean;
  aFreeDict : Boolean = False);
var
  OldDict : TnxDataDictionary;
  Mapper : TnxTableMapperDescriptor;
  TaskInfo : TnxAbstractTaskInfo;
  Completed : Boolean;
  TaskStatus : TnxTaskStatus;
begin
  try
    OldDict := TnxDataDictionary.Create;
    try
      nxCheck(aDatabase.GetDataDictionaryEx(aTableName, aPassword, OldDict));
      if (aPassword <> '') and (aNewDict.EncryptionEngine = '') then
        aNewDict.EncryptionEngine := OldDict.EncryptionEngine;
      if OldDict.IsEqual(aNewDict) then
        Exit;
      Mapper := TnxTableMapperDescriptor.Create;
      try
        Mapper.MapAllTablesAndFieldsByName(OldDict, aNewDict, dlaFail);
        nxCheck(aDatabase.RestructureTableEx(aTableName, aPassword, aNewDict, Mapper, TaskInfo));
        if Assigned(TaskInfo) then
          try
            repeat
              if not aCancelTask then
                TaskInfo.GetStatus(Completed, TaskStatus);
              if not Completed then begin
                if Assigned(aProgressCallback) then
                  aProgressCallback(aTableName, TaskStatus, aCancelTask);
                if not aCancelTask then
                  Sleep(100)
                else
                  nxCheck(TaskInfo.Cancel);
              end;
            until Completed or aCancelTask;
            nxCheck(TaskStatus.tsErrorCode);
          finally
            TaskInfo.Free;
          end;
      finally
        Mapper.Free;
      end;
    finally
      OldDict.Free;
    end;
  finally
    if aFreeDict then
      aNewDict.Free;
  end;
end;

procedure PackTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean);
var
  TaskInfo : TnxAbstractTaskInfo;
  Completed : Boolean;
  TaskStatus : TnxTaskStatus;
begin
  nxCheck(aDatabase.PackTableEx(aTableName, aPassword, TaskInfo));
  if Assigned(TaskInfo) then
    try
      repeat
        if not aCancelTask then
          TaskInfo.GetStatus(Completed, TaskStatus);
        if not Completed then begin
          if Assigned(aProgressCallback) then
            aProgressCallback(aTableName, TaskStatus, aCancelTask);
          if not aCancelTask then
            Sleep(100)
          else
            nxCheck(TaskInfo.Cancel);
        end;
      until Completed or aCancelTask;
      nxCheck(TaskStatus.tsErrorCode);
    finally
      TaskInfo.Free;
    end;
end;

procedure BuildAndEvolveTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aCreateDictCallback : TnxcgCreateDictCallback;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean);
var
  Dict : TnxDataDictionary;
begin
  Dict := aCreateDictCallback(aDatabase);
  if Assigned(Dict) then
    try
      if not aDatabase.TableExists(aTableName, aPassword) then
        aDatabase.CreateTable(False, aTableName, aPassword, Dict)
      else
        RestructureTable(aDatabase, aTableName,
          aPassword, Dict, aProgressCallback, aCancelTask);
    finally
      Dict.Free;
    end;
end;

procedure BuildAndEvolveDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback = nil;
  aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
  const aPassword : String = '');
var
  I : Integer;
  CancelTask : Boolean;
  Password   : string;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    Password := aPassword;
    if Assigned(aGetPasswordCallback) then
      aGetPasswordCallback(TableInfos[I].TableName, Password);
    BuildAndEvolveTable(aDatabase,
      TableInfos[I].TableName, Password,
      TableInfos[I].Callback, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
  end;
end;

procedure RestructureDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback = nil;
  aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
  const aPassword : String = '');
var
  I : Integer;
  CancelTask : Boolean;
  Password   : string;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    Password := aPassword;
    if Assigned(aGetPasswordCallback) then
      aGetPasswordCallback(TableInfos[I].TableName, Password);
    RestructureTable(aDatabase,
      TableInfos[I].TableName, Password,
      TableInfos[I].Callback(aDatabase), aProgressCallback, CancelTask, True);
    if CancelTask then
      Exit;
  end;
end;

procedure PackDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback = nil;
  aGetPasswordCallback : TnxcgGetPasswordCallback = nil;
  const aPassword : String = '');
var
  I : Integer;
  CancelTask : Boolean;
  Password   : string;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    Password := aPassword;
    if Assigned(aGetPasswordCallback) then
      aGetPasswordCallback(TableInfos[I].TableName, Password);
    PackTable(aDatabase, TableInfos[I].TableName,
      Password, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
  end;
end;

end.
