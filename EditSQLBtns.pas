unit EditSQLBtns;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.UITypes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, Vcl.Grids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  Data.DB,

  SynEdit,

  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvAppStorage, JvAppXMLStorage,
  JvComponentBase, JvFormPlacement, JvDataSource, JvExExtCtrls,
  JvExtComponent, JvPanel, JvExMask, JvSpin, SynMemo, JvDBCheckBox, gemArrow,
  JvExControls, JvSpeedButton, SynEditHighlighter, SynHighlighterSQL,
  gemCustomButton, JvXPCore, JvXPButtons, gemResistor, RzPanel,

  Global;

type
  tParentType = (ptCommand, ptFunctions);

  Tfrm_EditSQLBtns = class(TForm)
    jvfrmstrg_SQLBtns: TJvFormStorage;
    grp_DefSQLBtns: TGroupBox;
    jvspndt_TopMargin: TJvSpinEdit;
    jvspndt_SpaceBtween: TJvSpinEdit;
    jvspndt_BtnHeight: TJvSpinEdit;
    lbl_Height: TLabel;
    lbl_Spacing: TLabel;
    lbl_TopMargin: TLabel;
    grp_BtnLayout: TGroupBox;
    lbl_Panel1: TLabel;
    lb_location: TLabel;
    lbl_Panel2: TLabel;
    jvpnl2: TJvPanel;
    jvpnl11: TJvPanel;
    grp_DataBase: TGroupBox;
    dbnvgr_SQLBtns: TDBNavigator;
    jvdbltmgrd_SQLBtnDataGrd: TJvDBUltimGrid;
    dbmmo_SQLtext: TDBMemo;
    lbl_SQLText: TLabel;
    rg_SelectBtnColumnToDisplay: TRadioGroup;
    cb_SpaceAfterCursor: TJvDBCheckBox;
    cb_UseExtendedSQL: TJvDBCheckBox;
    Label1: TLabel;
    jvspndt_DefCol1: TJvSpinEdit;
    jvspndt_DefCol2: TJvSpinEdit;
    Label2: TLabel;
    jvspdbtn_CloseProgram: TJvSpeedButton;
    SynSQLSyn: TSynSQLSyn;
    gmshpbtn_SelectedUp: TgemShapeBtn;
    gmshpbtn_SelectedDown: TgemShapeBtn;
    rg_ColsMoveBtnTo: TRadioGroup;
    gmshpbtn_SelectedMove: TgemShapeBtn;
    shp1: TShape;
    grp1: TGroupBox;
    btn_DeleteFunctionName: TJvXPButton;
    btn_EditFunctionNames: TJvXPButton;
    lbl2: TLabel;
    lst_Functions: TListBox;
    btn_AddFunctionName: TJvXPButton;
    shp_1: TShape;
    jvxpbtn_btn_GetFunctionNamesFromCaptions: TJvXPButton;
    synm_SQLBtnTest: TSynMemo;
    lbl1: TLabel;
    btn_CreateTestBtns: TButton;
    btn_EditDelAddBtn: TJvXPButton;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    jvpnl1: TRzPanel;
    RzPanel2: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rg_SelectBtnColumnToDisplayClick(Sender: TObject);
    procedure fdqry_BtnTableAfterInsert(DataSet: TDataSet);
    procedure btn_CreateTestBtnsClick(Sender: TObject);
    procedure jvspdbtn_CloseProgramClick(Sender: TObject);
    procedure gmshpbtn_SelectedUpClick(Sender: TObject);
    procedure gmshpbtn_SelectedDownClick(Sender: TObject);
    procedure gmshpbtn_SelectedMoveClick(Sender: TObject);
    procedure btn_AddFunctionNameClick(Sender: TObject);
    procedure btn_EditFunctionNamesClick(Sender: TObject);
    procedure btn_DeleteFunctionNameClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure jvdbltmgrd_SQLBtnDataGrdCellClick(Column: TColumn);
    procedure jvxpbtn_btn_GetFunctionNamesFromCaptionsClick(Sender: TObject);
    procedure btn_EditDelAddBtnClick(Sender: TObject);
    procedure btn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure AddTextToRichEdit(aEditorStr: string; aPlaceCursorBeforeChar: string;
                                aSpacesAfterCursor,
                                aUseExtendedSQL: boolean;
                                aExtendedText: TStrings);
    procedure btn_SQLFunctionStatementsClick(Sender: TObject);
    procedure SetBtnSQL(aLocId: Integer);
    procedure ReOrderBtnDefBtnOrderNum(aCol: Integer);
    procedure FreeBtns;
  public
    { Public declarations }
    function GetNumBtns: Byte;
//    procedure ResetBtnYStart;
  end;

var
  frm_EditSQLBtns: Tfrm_EditSQLBtns;

implementation
uses
  DataMod, NxToolsMain, EditAddDelSQL;
{$R *.dfm}

procedure Tfrm_EditSQLBtns.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lst_Functions.Items.SaveToFile(FunctionNamesPath);

  DefaultSettingsSQLBtns.TopMargin := StrToInt(jvspndt_TopMargin.Text);
  DefaultSettingsSQLBtns.Spacing := StrToInt(jvspndt_SpaceBtween.Text);
  DefaultSettingsSQLBtns.Height := StrToInt(jvspndt_BtnHeight.Text);
  DefaultSettingsSQLBtns.Col1Left := StrToInt(jvspndt_DefCol1.Text);
  DefaultSettingsSQLBtns.Col2Left := StrToInt(jvspndt_DefCol2.Text);
  AssignFile(BtnDefaultSettingsRec, BtnDefaultSettingsPathFile);
  Rewrite(BtnDefaultSettingsRec);
  Write(BtnDefaultSettingsRec, DefaultSettingsSQLBtns);
  CloseFile(BtnDefaultSettingsRec);
  FreeBtns;
end;

procedure Tfrm_EditSQLBtns.FormCreate(Sender: TObject);
begin
//  try
//    dm_DataMod.con_SQLBtns.Params.Clear;
//    dm_DataMod.con_SQLBtns.Params.Add('DriverID=SQLite');
//    dm_DataMod.con_SQLBtns.Params.Add('Database=' + SQLDbPathAndFile);
//    dm_DataMod.con_SQLBtns.Open;
//
//    dm_DataMod.fdqry_BtnTable.ConnectionName := 'SQLBtns';
//    dm_DataMod.fdqry_BtnTable.Connection     := dm_DataMod.con_SQLBtns;
//  except
//    MessageDlg('Could Not Open SQL Btns Table', mtError, [mbOk], 0);
//  end;
//
//  SetBtnSQL(1);
end;


procedure Tfrm_EditSQLBtns.FormShow(Sender: TObject);
begin
  jvspndt_TopMargin.Text :=  IntToStr(DefaultSettingsSQLBtns.TopMargin);
  jvspndt_SpaceBtween.Text :=  IntToStr(DefaultSettingsSQLBtns.Spacing);
  jvspndt_BtnHeight.Text := IntToStr(DefaultSettingsSQLBtns.Height);
  jvspndt_DefCol1.Text := IntToStr(DefaultSettingsSQLBtns.Col1Left);
  jvspndt_DefCol2.Text := IntToStr(DefaultSettingsSQLBtns.Col2Left);

//  ResetBtnYStart;
  SynSQLSyn.FunctionNames.LoadFromFile(FunctionNamesPath);
  lst_Functions.Items.LoadFromFile(FunctionNamesPath);

  btn_CreateTestBtnsClick(Sender);
end;


procedure Tfrm_EditSQLBtns.ReOrderBtnDefBtnOrderNum(aCol: Integer);
var
  Index: Integer;
begin
  SetBtnSQL(aCol);
  Index := 1;
//  dm_DataMod.fdqry_BtnTable.First;
//  while not dm_DataMod.fdqry_BtnTable.Eof do begin
//    dm_DataMod.fdqry_BtnTable.Edit;
//      dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := Index;
//    dm_DataMod.fdqry_BtnTable.Post;
//    inc(Index);
//    dm_DataMod.fdqry_BtnTable.Next;
//  end;


end;


//procedure Tfrm_EditSQLBtns.ResetBtnYStart;
//var
//  index: Byte;
//begin
//  for index := 0 to 3 do
//    SQLBtnsEndingY[index] := StrToInt(jvspndt_TopMargin.Text);
//end;


procedure Tfrm_EditSQLBtns.FreeBtns;
var
  index, Count1,Count2: Integer;
begin
{$REGION 'Doc'}
  {
    When you remove a control the number of controls is also reduced. So get the
    control count before you start freeing the controls.  Then when you free them
    only free controls[0]
  }

{$ENDREGION}
  Count1 := jvpnl1.ControlCount;
  Count2 := jvpnl2.ControlCount;

  for index := 0 to Count1 - 1 do
    jvpnl1.Controls[0].Free;

  for index := 0 to Count2 -1 do
    jvpnl2.Controls[0].Free;

  SetLength(SQLBtnsArray, 0);
end;


function Tfrm_EditSQLBtns.GetNumBtns: Byte;
//var
//  index: Byte;
//  i: Integer;
begin
//  result := 0;
//  for i := 0 to 3 do begin
//    rg_SelectBtnColumnToDisplay.ItemIndex := i;
//    Result := result + dm_DataMod.fdqry_BtnTable.RecordCount;
//  end;
end;


procedure Tfrm_EditSQLBtns.gmshpbtn_SelectedUpClick(Sender: TObject);
var
  TobeMoved: integer;
  SavePlace: TBookmark;
begin
//  if dm_DataMod.fdqry_BtnTable.State in[dsInsert, dsEdit] then
//    dm_DataMod.fdqry_BtnTable.Post;
//  {$REGION 'DOC'}
//  // first are there any records to move. set > 1 because can't move up if you have
//  // select the first record
//  {$ENDREGION}
//  if (dm_DataMod.fdqry_BtnTable.RecordCount > 1) and (not dm_DataMod.fdqry_BtnTable.bof) then begin
//    TobeMoved := dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger;
//    Dec(ToBeMoved);
//    dm_DataMod.fdqry_BtnTable.Edit;
//      dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := ToBeMoved;
//    dm_DataMod.fdqry_BtnTable.Post;
//
//    dm_DataMod.fdqry_BtnTable.Prior;
//    TobeMoved := dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger;
//    Inc(ToBeMoved);
//    dm_DataMod.fdqry_BtnTable.Edit;
//      dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := ToBeMoved;
//    dm_DataMod.fdqry_BtnTable.Post;
//
//    SavePlace := dm_DataMod.fdqry_BtnTable.GetBookmark;
//    dm_DataMod.fdqry_BtnTable.Refresh;
//    dm_DataMod.fdqry_BtnTable.GotoBookmark(SavePlace);
//
//    btn_CreateTestBtns.Caption := 'Buttons Need Refreshing!';
//  end
//  else
//    Beep;
end;


procedure Tfrm_EditSQLBtns.gmshpbtn_SelectedDownClick(Sender: TObject);
var
  TobeMoved: integer;
  SavePlace: TBookmark;
begin
//  if dm_DataMod.fdqry_BtnTable.State in[dsInsert, dsEdit] then
//    dm_DataMod.fdqry_BtnTable.Post;
//
//  if (dm_DataMod.fdqry_BtnTable.RecordCount > 1) and (not dm_DataMod.fdqry_BtnTable.eof) then begin
//    TobeMoved := dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger;
//    inc(ToBeMoved);
//    dm_DataMod.fdqry_BtnTable.Edit;
//      dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := ToBeMoved;
//    dm_DataMod.fdqry_BtnTable.Post;
//
//    dm_DataMod.fdqry_BtnTable.next;
//    TobeMoved := dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger;
//    dec(ToBeMoved);
//    dm_DataMod.fdqry_BtnTable.Edit;
//      dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := ToBeMoved;
//    dm_DataMod.fdqry_BtnTable.Post;
//
//    SavePlace := dm_DataMod.fdqry_BtnTable.GetBookmark;
//    dm_DataMod.fdqry_BtnTable.refresh;
//    dm_DataMod.fdqry_BtnTable.GotoBookmark(SavePlace);
//
//    btn_CreateTestBtns.Caption := 'Buttons Need Refreshing!';
//  end
//  else
//    Beep;
end;


procedure Tfrm_EditSQLBtns.gmshpbtn_SelectedMoveClick(Sender: TObject);
var
  CurrentCol: Integer;
  LastBtnOrder: Integer;
//  SavePlace: TBookmark;
//  MoveRecNum: Integer;
  OrgCaption: string;
begin
//  // test if the col of the selected btn is same as the col use wish to move btn to
//  if rg_ColsMoveBtnTo.ItemIndex = rg_SelectBtnColumnToDisplay.ItemIndex then begin
//    Beep;
//    MessageDlg('Selected Btn Def is already in col: '+IntToStr(rg_ColsMoveBtnTo.ItemIndex + 1)+
//               #13+ 'Select a different Col.',mtError, [mbok], 0);
//  end
//  else begin
//    CurrentCol := rg_SelectBtnColumnToDisplay.ItemIndex+1;
//    OrgCaption := dm_DataMod.fdqry_BtnTableCaption.AsString;
//    SetBtnSQL(rg_ColsMoveBtnTo.ItemIndex+1);
//    dm_DataMod.fdqry_BtnTable.Last;
//    LastBtnOrder := dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger + 1;
//    SetBtnSQL(CurrentCol);
//    if dm_DataMod.fdqry_BtnTable.Locate('Caption', OrgCaption, []) then begin
//      dm_DataMod.fdqry_BtnTable.Edit;
//        dm_DataMod.fdqry_BtnTableBtnOrder.AsInteger := LastBtnOrder;
//        dm_DataMod.fdqry_BtnTableLocationCode.AsInteger := rg_ColsMoveBtnTo.ItemIndex+1;
//      dm_DataMod.fdqry_BtnTable.Post;
//      ReOrderBtnDefBtnOrderNum(CurrentCol);
//    end;
//
//    btn_CreateTestBtns.Click;//(Sender: TObject);
//  end;
end;


procedure Tfrm_EditSQLBtns.jvdbltmgrd_SQLBtnDataGrdCellClick(Column: TColumn);
var
  s, se: string;
begin
//  if dm_DataMod.fdqry_BtnTable.RecordCount < 1 then
//    Exit;
//
//  s :=  dm_DataMod.fdqry_BtnTableCaption.AsString;
//  se := dm_DataMod.fdqry_BtnTableExtraText.AsString;
//  s := s + se;
//
//  synm_SQLBtnTest.Lines.Clear;
//
//  AddTextToRichEdit(s, dm_DataMod.fdqry_BtnTableCursorBeforeLastChar.AsString,
//                       dm_DataMod.fdqry_BtnTableSpaceAfterCursor.AsBoolean,
//                       dm_DataMod.fdqry_BtnTableUseExtenedSQL.AsBoolean,
//                       dbmmo_SQLtext.Lines);
end;


procedure Tfrm_EditSQLBtns.jvspdbtn_CloseProgramClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_EditSQLBtns.jvxpbtn_btn_GetFunctionNamesFromCaptionsClick(
  Sender: TObject);
var
  Index: Integer;
begin
//  lst_Functions.Items.Clear;
//  for Index := 3 to 4 do begin
//    SetBtnSQL(Index);
//    dm_DataMod.fdqry_BtnTable.First;
//    while not dm_DataMod.fdqry_BtnTable.eof do begin
//      lst_Functions.Items.Add(dm_DataMod.fdqry_BtnTable.FieldByName('Caption').AsString);
//      dm_DataMod.fdqry_BtnTable.Next;
//    end;
//  end;
end;


procedure Tfrm_EditSQLBtns.SetBtnSQL(aLocId: Integer);
begin
//  dm_DataMod.fdqry_BtnTable.Close;
//  try
//    dm_DataMod.fdqry_BtnTable.SQL.Clear;
//    dm_DataMod.fdqry_BtnTable.SQL.Add('SELECT * FROM SqlBtnsT');
//    dm_DataMod.fdqry_BtnTable.SQL.Add('WHERE LocationCode = ' +  IntToStr(aLocId));
//    dm_DataMod.fdqry_BtnTable.SQL.Add('ORDER BY BtnOrder');
//
//    dm_DataMod.fdqry_BtnTable.Open();
//  except
//    MessageDlg('Error Setting SQL for Buttons', mtError, [mbOK],0);
//  end;
end;


procedure Tfrm_EditSQLBtns.rg_SelectBtnColumnToDisplayClick(Sender: TObject);
begin
  SetBtnSQL(rg_SelectBtnColumnToDisplay.ItemIndex + 1);
end;


procedure Tfrm_EditSQLBtns.AddTextToRichEdit(aEditorStr: string; aPlaceCursorBeforeChar: string;
                                             aSpacesAfterCursor,
                                             aUseExtendedSQL: boolean;
                                             aExtendedText: TStrings);
var
  Index: integer;
  memoText: string;
  yCaret, xCaret, tmpX, tmpY: Integer;
  //========================
  function GetLocationInStr(var aEditorStr: string; aSubStr: String): integer;
  var
    i: Integer;
  begin
     i := LastDelimiter(aSubStr, aEditorStr);
     if aSpacesAfterCursor then
       Insert(' ', aEditorStr, i);

     Result := Length(aEditorStr) - i +1;
  end;
  //========================
  procedure UseExtendedSQL;
  var
    bLines: Integer;
  begin
    tmpY := synm_SQLBtnTest.CaretY;
    tmpX := synm_SQLBtnTest.CaretX;
    for bLines :=0 to aExtendedText.Count-1 do begin
      memoText := aExtendedText[bLines];
      inc(tmpY);
      if Pos('^', memoText)> 0 then begin
        xCaret := Pos('^', memoText) + tmpX;
        yCaret := tmpY - 1;
      end;

      synm_SQLBtnTest.CaretX := tmpX;
      synm_SQLBtnTest.SelText := memoText+#13;
    end;

    synm_SQLBtnTest.CaretX := xCaret;
    synm_SQLBtnTest.CaretY := yCaret;
  end;
  //==============================
  procedure NoUseExtendedSQL;
  begin
    if (aPlaceCursorBeforeChar = '') and  aSpacesAfterCursor then  begin
      index := 0;
      aEditorStr := aEditorStr + ' ';
    end;

    if (aPlaceCursorBeforeChar <> '') and  aSpacesAfterCursor then  begin
      Index := GetLocationInStr(aEditorStr, aPlaceCursorBeforeChar);
    end;

    if (aPlaceCursorBeforeChar <> '') and  not aSpacesAfterCursor then  begin
      Index := GetLocationInStr(aEditorStr, aPlaceCursorBeforeChar);
    end;

    if (aPlaceCursorBeforeChar = '') and  not aSpacesAfterCursor then  begin
      Index := 1;
    end;

//    synm_SQLBtnTest.Clear;
    synm_SQLBtnTest.SelText := aEditorStr;
    synm_SQLBtnTest.CaretX := synm_SQLBtnTest.CaretX - Index;
  end;
  //==============================
begin
  if Length(aEditorStr) < 0 then
    Exit;

  index := 1;
  xCaret := 0;
  yCaret := 0;

  if aUseExtendedSQL then begin
    UseExtendedSQL;
  end
  else begin
    NoUseExtendedSQL;
  end;
  synm_SQLBtnTest.SetFocus;
end;


procedure Tfrm_EditSQLBtns.btn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  ReleaseCapture;
  TControl(Sender).Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;


procedure Tfrm_EditSQLBtns.btn_AddFunctionNameClick(Sender: TObject);
var
  s: string;
begin
  if InputQuery('Enter Function Name', 'Name:',s) then
    lst_Functions.Items.Add(s);
end;


procedure Tfrm_EditSQLBtns.btn_EditDelAddBtnClick(Sender: TObject);
begin
  if EditAddDelSQLBtns.Execute then begin
  end;

end;


procedure Tfrm_EditSQLBtns.btn_EditFunctionNamesClick(Sender: TObject);
var
  s: string;
begin
  if lst_Functions.ItemIndex > -1 then begin
    s  := lst_Functions.Items[lst_Functions.ItemIndex];
    if InputQuery('Edit Function Name', 'Name:',s) then
      lst_Functions.Items[lst_Functions.ItemIndex] := s;
  end;
end;


procedure Tfrm_EditSQLBtns.btn_DeleteFunctionNameClick(Sender: TObject);
begin
  if lst_Functions.ItemIndex > -1 then
    if MessageDlg('Delete Selected: ', mtWarning, [mbYes, mbNo, mbCancel], 0) = mrYes then begin
      lst_Functions.Items.Delete(lst_Functions.ItemIndex);
    end;
end;


procedure Tfrm_EditSQLBtns.btn_CreateTestBtnsClick(Sender: TObject);
var
  i: Integer;
  NumBtn: Integer;

  procedure PlaceButton;
  begin
//    dm_DataMod.fdqry_BtnTable.First;
//    while not dm_DataMod.fdqry_BtnTable.Eof do begin
//      SQLBtnsArray[i] := TButton.Create(nil);
//      if i in[0,1] then
//        SQLBtnsArray[i].parent := jvpnl1
//      else
//        SQLBtnsArray[i].parent := jvpnl2;
//
//      if i in[0,2] then
//        SQLBtnsArray[i].Left := StrToInt(jvspndt_DefCol1.Text)
//      else
//        SQLBtnsArray[i].Left := StrToInt(jvspndt_DefCol2.Text);
//
//      SQLBtnsArray[i].Width := dm_DataMod.fdqry_BtnTableBtnWidth.AsInteger;
//
//      SQLBtnsArray[i].Height := StrToInt(jvspndt_BtnHeight.Text);
//      SQLBtnsArray[i].Top  := SQLBtnsEndingY[i];
//      SQLBtnsEndingY[i] := SQLBtnsEndingY[i] + StrToInt(jvspndt_SpaceBtween.text) + StrToInt(jvspndt_BtnHeight.Text);;
//
//      SQLBtnsArray[i].Caption := dm_DataMod.fdqry_BtnTableCaption.AsString;
//      SQLBtnsArray[i].ExtraText := dm_DataMod.fdqry_BtnTableExtraText.AsString;
//      SQLBtnsArray[i].CusorBeforeLastChar := dm_DataMod.fdqry_BtnTableCursorBeforeLastChar.AsString;
//      SQLBtnsArray[i].SpaceAfterCursor := dm_DataMod.fdqry_BtnTableSpaceAfterCursor.AsBoolean;
//      SQLBtnsArray[i].UseExtendedSQL :=  dm_DataMod.fdqry_BtnTableUseExtenedSQL.AsBoolean;
//      SQLBtnsArray[i].Tag :=  dm_DataMod.fdqry_BtnTableLocationCode.AsInteger;
//      if SQLBtnsArray[i].UseExtendedSQL then begin
//        SQLBtnsArray[i].SQLExtended.Assign(dm_DataMod.fdqry_BtnTableSQLCode);
////        showmessage('Num Lines: '+IntToStr(SQLBtnsArray[i].SQLExtended.count));
//      end;
//      SQLBtnsArray[i].OnClick := btn_SQLFunctionStatementsClick;
//      dm_DataMod.fdqry_BtnTable.Next;
//    end;
  end;

begin
  FreeBtns;
//  ResetBtnYStart;
//  ShowMessage('Num Btns: '+IntToStr(Length(SQLBtnsArray)));
  NumBtn := GetNumBtns;
  SetLength(SQLBtnsArray, NumBtn);

  // set to first col of buttons
  for i := 0 to 3 do begin
    rg_SelectBtnColumnToDisplay.ItemIndex := i;
    PlaceButton;
  end;

  btn_CreateTestBtns.Caption := 'Show/Refresh Test Btns Locations';
end;


procedure Tfrm_EditSQLBtns.btn_SQLFunctionStatementsClick(Sender: TObject);
{$REGION 'DOC'}{
 the tags of 1,2,3 means the buttons caption if click will be printed in a
 SQL editor.  The tag tells the program to either add a space or a "("
 after the caption is printed. The tag tells the program which char to print after the button
 caption. Buttons with a tag of '1' are on index 0 of SQLCommandsTab page
 control. Buttons with either a '2' or a '3' are on index 1 SQLCommandsTab
 page control.
}{$ENDREGION}
var
  s, se: string;
begin
  synm_SQLBtnTest.Lines.Clear;
{$REGION 'DOC'}


{$ENDREGION}
  s :=  (Sender as tJvPanel).Caption;
  se := (Sender as tJvPanel).ExtraText;
  s := s + se;
  AddTextToRichEdit(s, (Sender as tJvPanel).CusorBeforeLastChar,
                       (Sender as tJvPanel).SpaceAfterCursor,
                       (Sender as tJvPanel).UseExtendedSQL,
                       (Sender as tJvPanel).SQLExtended);
end;


procedure Tfrm_EditSQLBtns.fdqry_BtnTableAfterInsert(DataSet: TDataSet);
begin
//  dm_DataMod.fdqry_BtnTableLocationCode.AsInteger := rg_SelectBtnColumnToDisplay.ItemIndex + 1;
end;

end.
