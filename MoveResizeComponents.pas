unit MoveResizeComponents;

interface
{.$DEFINE USE_CODESITE}
uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,

  System.SysUtils, System.Variants, System.Classes, System.Types,
  System.Actions, System.UITypes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ActnList,

  SBPro, GEMUseFullRoutines, gemCustomButton, Global,

  {$IFDEF USE_CODESITE}CodeSiteLogging,{$ENDIF}

  RzPanel,

  SynMemo,  SynEdit, SynDBEdit,

  Data.DB,

  JvExMask, JvSpin,  JvExExtCtrls, JvShape, JvExtComponent, JvPanel, JvDBGrid,
  JvExDBGrids, JvDBUltimGrid, JvDBControls, RzLabel, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, Vcl.WinXCtrls, JvExStdCtrls, JvRichEdit, JvDBRichEdit,
  JvComponentBase, JvFormPlacement, JvEdit, JvDBSearchEdit;

type
  TBtnStuff = record
    fCaption: string[50];
    fExtraText: string[50];
    fCusorBeforeLastChar: string[50];
    fSpaceAfterCursor: Boolean;
    fUseExtendedSQL: Boolean;
    fSQLExtended: tStrings;
    Top,
    Left,
    Panel: integer;
  end;


  Tfrm_MoveResizeComponents = class(TForm)
    chkPositionRunTime      : TCheckBox;
    StatusBarPro1           : TStatusBarPro;
    RzPanel1                : TRzPanel;
    Label1                  : TLabel;
    Label2                  : TLabel;
    btn_GetButtonsOldDb     : TButton;
    grp_DefSQLBtns          : TGroupBox;
    Label5                  : TLabel;
    synm_SQLBtnTest         : TSynMemo;
    RzPanel2                : TRzPanel;
    btn_SaveSqlButtons      : TButton;
    dbmmo1                  : TDBMemo;
    jvdbltmgrd_1            : TJvDBUltimGrid;
    jvdbnvgtr_1             : TJvDBNavigator;
    gmshpbtn                : TgemShapeBtn;
    lbl2                    : TLabel;
    actlst1                 : TActionList;
    act_MoveBtnLtR          : TAction;
    act_EditAndPostion      : TAction;
    rzrlbl_UrlHelp          : TRzURLLabel;
    gmshpbtnMoveBtn         : TgemShapeBtn;
    SplitView1              : TSplitView;
    JvPageControl2          : TJvPageControl;
    TabSheet1               : TTabSheet;
    TabSheet2               : TTabSheet;
    JvPageControl1          : TJvPageControl;
    TabSheet3               : TTabSheet;
    TabSheet4               : TTabSheet;
    BtnJVPanel              : TJvPanel;
    Label6                  : TLabel;
    JvDBSearchEdit1         : TJvDBSearchEdit;
    Label7                  : TLabel;
    Memo1                   : TMemo;
    JvFormStorage1          : TJvFormStorage;
    RelativePanel1          : TRelativePanel;
    btn__SplitViewOpenClose : TButton;
    act_MoveBtnRtL          : TAction;
    RzURLLabel1             : TRzURLLabel;
    procedure FormShow(Sender: TObject);
    procedure RzPanel1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btn_SQLFunctionStatementsClick(Sender: TObject);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift:
                                TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState;
                               X, Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton; Shift:
                             TShiftState; X, Y: Integer);
    procedure btn_GetButtonsOldDbClick(Sender: TObject);
    procedure btn_SaveSqlButtonsClick(Sender: TObject);
    procedure act_MoveBtnLtRExecute(Sender: TObject);
    procedure act_MoveBtnLtRUpdate(Sender: TObject);
    procedure act_EditAndPostionUpdate(Sender: TObject);
    procedure chkPositionRunTimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure btn__SplitViewOpenCloseClick(Sender: TObject);
    procedure act_MoveBtnRtLExecute(Sender: TObject);
    procedure jvdbltmgrd_1CellClick(Column: TColumn);
  Private
    { Private declarations }
    inReposition: boolean;
    oldPos      : TPoint;
    isReleased  : boolean;
//    SQLBtnsArray: array of TJvPanel;
    fActBtnIndex: integer;

    function FindBtnIndex(aBtnId: integer): integer;
    function CheckIntersectPanels(aPanel: integer): Boolean;
    procedure MoveToMargin(Sender: TObject);
    procedure DrawBtnLocationOnPanel;
    procedure FreeBtns;
    procedure AddTextToRichEdit(aEditorStr: string; aPlaceCursorBeforeChar: string;
                                aSpacesAfterCursor, aUseExtendedSQL: boolean;
                                aExtendedText: TStrings);
    procedure EditBtn(aIndex: integer; aIsInsertBtn: boolean);

  public
    { Public declarations }
    procedure btn_CreateBtns;
    procedure AddEditsToBtn(aBtnId: integer);
    procedure InsertBtn;
  end;

var
  frm_MoveResizeComponents: Tfrm_MoveResizeComponents;



implementation
uses
  DataMod, NxToolsMain;
{$R *.dfm}

const
  cBtnColor = $00FF8080;
  cClickColor = clSilver;
  cBtnIntersectColor = clRed;
  cFontColor = clYellow;
  cPanelBtnLocations = clRed;
  cBtnBevelWidthClicked = 1;
  cBtnBevelWidthNorm  = 1;
  cDarkerTextPercent = 80;

  LeftC = 10;
  RightC = 115;
  BtnSpacing = 5;
  TopMargin = 10;
  BtnH = 20;
  BtnW = 95;

{

You can do it all in one shot with text fields:

    Dataset.FieldByName('myblob').AsString := Memo1.Lines.Text;
and
    Memo1.Lines.Text := Dataset.FieldByName('myblob').AsString;

}


procedure Tfrm_MoveResizeComponents.btn_SaveSqlButtonsClick(Sender: TObject);
var
  index : integer;

  procedure SaveBtnToDb;
  begin
    dm_DataMod.NxSqlButtonsDbT.Edit;
      with dm_DataMod do begin
        NxSqlButtonsDbTPanelNum.AsInteger := SQLBtnsArray[Index].Panel;
        NxSqlButtonsDbTHints.AsString    := SQLBtnsArray[Index].Hint;

        NxSqlButtonsDbTBtnTop.AsInteger   := TwinControl(SQLBtnsArray[Index]).Top;
        NxSqlButtonsDbTBtnLeft.AsInteger  := TwinControl(SQLBtnsArray[Index]).Left;
        NxSqlButtonsDbTBtnWidth.AsInteger := SQLBtnsArray[Index].Width;
        NxSqlButtonsDbTCaption.AsString   := SQLBtnsArray[Index].Caption;
        NxSqlButtonsDbTExtraText.AsString := SQLBtnsArray[Index].ExtraText;

        NxSqlButtonsDbTCursorBeforeThisChar.AsString := SQLBtnsArray[Index].CusorBeforeLastChar;
        NxSqlButtonsDbTSpaceAfterCursor.AsBoolean    := SQLBtnsArray[Index].SpaceAfterCursor;
        NxSqlButtonsDbTUseExtendedSql.AsBoolean      := SQLBtnsArray[Index].UseExtendedSQL;
        NxSqlButtonsDbTSqlCode.Assign(SQLBtnsArray[Index].SQLExtended);
//        NxSqlButtonsDbTNexusDbHelpUrl.AsString := SQLBtnsArray[Index].UrlHelp;

      end;
{$IFDEF USE_CODESITE}CodeSite.sendmsg('btn_SaveSqlButtonsClick-- Index = '+
                                      SQLBtnsArray[Index].Caption+
                                       inttostr((Sender as Global.tJvPanel).tag)+
                                       '  Left= '+ IntToStr(TWinControl(sender).Left)+
                                       '  Top= '+ IntToStr(TWinControl(sender).Top));{$ENDIF}
  end;

begin
  if not dm_DataMod.NxSqlButtonsDbT.Active then begin
    dm_DataMod.NxSqlButtonsDbT.open;
    if not dm_DataMod.NxSqlButtonsDbT.Active then begin
      showmessage('Db NOT Opened');
      exit;
    end;
  end;

//  dm_DataMod.NxSqlButtonsDbT.EmptyTable;

  for index := Low(SQLBtnsArray) to High(SQLBtnsArray) do begin  //High(SQLBtnsArray) do begin
    if SQLBtnsArray[Index].ChangedBtn then
      if dm_DataMod.NxSqlButtonsDbT.locate('BtnId', IntToStr(SQLBtnsArray[Index].BtnId), []) then begin
        dm_DataMod.NxSqlButtonsDbT.Edit;
        SaveBtnToDb;
        dm_DataMod.NxSqlButtonsDbT.Post;
      end;
  end;
end;


function Tfrm_MoveResizeComponents.FindBtnIndex(aBtnId: integer): integer;
var
  index: integer;
begin
  result := -1;
  for index := Low(SQLBtnsArray) to High(SQLBtnsArray) do begin
    if SQLBtnsArray[index].BtnId = aBtnId then begin
      result := index;
      exit;
    end;
  end;
end;


procedure Tfrm_MoveResizeComponents.EditBtn(aIndex: integer; aIsInsertBtn: boolean);
begin
  if dm_DataMod.NxSqlButtonsDbTPanelNum.AsInteger = 1 then  begin
    SQLBtnsArray[aIndex].parent := RzPanel1;
  end
  else
    SQLBtnsArray[aIndex].parent := RzPanel2;

  SQLBtnsArray[aIndex].Tag         := aIndex;
  SQLBtnsArray[aIndex].Transparent := false;
//  if aIsInsertBtn then
  SQLBtnsArray[aIndex].Color := cBtnColor;
//  else
  SQLBtnsArray[aIndex].Hint := dm_DataMod.NxSqlButtonsDbTHints.AsString;
  SQLBtnsArray[aIndex].ShowHint := true;
  SQLBtnsArray[aIndex].UrlHelp := dm_DataMod.NxSqlButtonsDbTNexusDbHelpUrl.AsString;

  SQLBtnsArray[aIndex].Font.Color  := cFontColor;
  SQLBtnsArray[aIndex].BevelOuter := bvRaised;

  SQLBtnsArray[aIndex].BtnId := dm_DataMod.NxSqlButtonsDbTBtnId.AsInteger;
  SQLBtnsArray[aIndex].Panel := dm_DataMod.NxSqlButtonsDbTPanelNum.AsInteger;
  SQLBtnsArray[aIndex].Width := dm_DataMod.NxSqlButtonsDbTBtnWidth.AsInteger;

  SQLBtnsArray[aIndex].Height            := frm_NxToolsMain.BtnHeight;
  TwinControl(SQLBtnsArray[aIndex]).Top  := dm_DataMod.NxSqlButtonsDbTBtnTop.AsInteger;
  TwinControl(SQLBtnsArray[aIndex]).Left := dm_DataMod.NxSqlButtonsDbTBtnLeft.AsInteger;
  SQLBtnsArray[aIndex].Top               := dm_DataMod.NxSqlButtonsDbTBtnTop.AsInteger;
  SQLBtnsArray[aIndex].Left              := dm_DataMod.NxSqlButtonsDbTBtnLeft.AsInteger;
{$IFDEF USE_CODESITE}CodeSite.sendmsg('EditBtn-- Index = '+ inttostr(aIndex)+'  Left= '+ IntToStr(SQLBtnsArray[aIndex].Left)+
                                            '  Top: '+ IntToStr(SQLBtnsArray[aIndex].Top));{$ENDIF}

  SQLBtnsArray[aIndex].PanelRect := Rect(SQLBtnsArray[aIndex].Left, SQLBtnsArray[aIndex].Top,
                                        SQLBtnsArray[aIndex].Left + SQLBtnsArray[aIndex].Width,
                                        SQLBtnsArray[aIndex].Top + SQLBtnsArray[aIndex].Height);

  SQLBtnsArray[aIndex].Caption := dm_DataMod.NxSqlButtonsDbTCaption.AsString;
  SQLBtnsArray[aIndex].ExtraText := dm_DataMod.NxSqlButtonsDbTExtraText.AsString;
  SQLBtnsArray[aIndex].CusorBeforeLastChar := dm_DataMod.NxSqlButtonsDbTCursorBeforeThisChar.AsString;
  SQLBtnsArray[aIndex].SpaceAfterCursor := dm_DataMod.NxSqlButtonsDbTSpaceAfterCursor.AsBoolean;
  SQLBtnsArray[aIndex].UseExtendedSQL :=  dm_DataMod.NxSqlButtonsDbTUseExtendedSql.AsBoolean;
  if SQLBtnsArray[aIndex].UseExtendedSQL then begin
    SQLBtnsArray[aIndex].SQLExtended.Assign(dm_DataMod.NxSqlButtonsDbTSqlCode);
  end;
  SQLBtnsArray[aIndex].OnClick     := btn_SQLFunctionStatementsClick;
  SQLBtnsArray[aIndex].OnMouseDown := ControlMouseDown;
  SQLBtnsArray[aIndex].OnMouseMove := ControlMouseMove;
  SQLBtnsArray[aIndex].OnMouseUp   := ControlMouseUp;
end;


procedure Tfrm_MoveResizeComponents.InsertBtn;
var
  fSize: integer;
begin
  fSize := Length(SQLBtnsArray);
  SetLength(SQLBtnsArray, fSize + 1);
  SQLBtnsArray[fSize] := Global.TJvPanel.Create(nil);
  EditBtn(fSize, true);

  SQLBtnsArray[fSize].ChangedBtn := true;

  TwinControl(SQLBtnsArray[fSize]).Top  := frm_NxToolsMain.BtnTopMargin;  ;//StrToInt(jvspndt_TopMargin.Text);
  TwinControl(SQLBtnsArray[fSize]).Left := frm_NxToolsMain.BtnLeftColStart;//StrToInt(jvspndt_BtnHeight.Text);
  SQLBtnsArray[fSize].Top               := frm_NxToolsMain.BtnTopMargin   ;//StrToInt(jvspndt_TopMargin.Text);
  SQLBtnsArray[fSize].Left              := frm_NxToolsMain.BtnHeight   ;//StrToInt(jvspndt_BtnHeight.Text);

  CheckIntersectPanels(SQLBtnsArray[fSize].Panel);
end;


procedure Tfrm_MoveResizeComponents.jvdbltmgrd_1CellClick(Column: TColumn);
var
  Buf : array[0..1023] of Char;
  Url: string;
begin
  if Column.FieldName = 'NexusDbHelpUrl' then begin
    Url := Column.Field.AsString;
    if URL > '' then begin
      StrPLCopy(Buf, URL, Length(Buf)-1);
      if ShellExecute(0, 'open', Buf, '', '', SW_SHOWNORMAL) <= 32 then
        MessageBeep(0);

    end;
  end;
end;


procedure Tfrm_MoveResizeComponents.act_EditAndPostionUpdate(Sender: TObject);
begin
  act_EditAndPostion.Enabled := Length(SQLBtnsArray) > 0;

end;


procedure Tfrm_MoveResizeComponents.act_MoveBtnLtRExecute(Sender: TObject);
begin
  if fActBtnIndex > 0 then begin
    SQLBtnsArray[fActBtnIndex].Panel := 2;
    btn_SaveSqlButtonsClick(Sender);
    btn_GetButtonsOldDbClick(Sender);
//    SQLBtnsArray[fActBtnIndex].ChangedBtn := true;
  end;
//  showmessage('In shape button');
end;


procedure Tfrm_MoveResizeComponents.act_MoveBtnRtLExecute(Sender: TObject);
begin
  if fActBtnIndex > 0 then begin
    SQLBtnsArray[fActBtnIndex].Panel := 1;
    btn_SaveSqlButtonsClick(Sender);
    btn_GetButtonsOldDbClick(Sender);
  end;
end;


procedure Tfrm_MoveResizeComponents.act_MoveBtnLtRUpdate(Sender: TObject);
begin
  if fActBtnIndex < 0 then
    exit;

   (Sender as TAction).Enabled
  {act_MoveBtn.Enabled} := (chkPositionRunTime.Checked) and
                         (SQLBtnsArray[fActBtnIndex].BevelWidth = cBtnBevelWidthClicked);
end;


procedure Tfrm_MoveResizeComponents.AddEditsToBtn(aBtnId: integer);
var
  fBtnId: integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'AddEditsToBtn' );{$ENDIF}
  fBtnId := FindBtnIndex(aBtnId);
  EditBtn(fBtnId, false);
  SQLBtnsArray[fBtnId].ChangedBtn := true;
  CheckIntersectPanels(SQLBtnsArray[fBtnId].Panel);
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'AddEditsToBtn' );{$ENDIF}
end;


procedure Tfrm_MoveResizeComponents.btn_CreateBtns;
var
  Index: Integer;


  function OpenSqlBtnsTable: Boolean;
  begin
    result := True;
    with dm_DataMod do begin
      if not NxSqlButtonsDbT.active then
        NxSqlButtonsDbT.Open;
    end;
  end;

  procedure PlaceButton;
  begin
    dm_DataMod.NxSqlButtonsDbT.First;
    while not dm_DataMod.NxSqlButtonsDbT.Eof do begin
      SQLBtnsArray[Index] := Global.TJvPanel.Create(nil);

      EditBtn(Index, false);
      SQLBtnsArray[Index].ChangedBtn := false;
//      CheckIntersectPanels(Index);

      dm_DataMod.NxSqlButtonsDbT.Next;
      {$IFDEF USE_CODESITE}CodeSite.sendmsg('btn_CreateBtns -- Left= '+ IntToStr(SQLBtnsArray[Index].Left)+
                                            '  Top: '+ IntToStr(SQLBtnsArray[Index].Top));{$ENDIF}
      Inc(Index);
    end;

  end;

begin
  FreeBtns;
  if OpenSqlBtnsTable then begin
    dm_DataMod.NxSqlButtonsDbT.Open;
    SetLength(SQLBtnsArray, dm_DataMod.NxSqlButtonsDbT.RecordCount);
    Index := 0;
    // set to first col of buttons
    PlaceButton;

    CheckIntersectPanels(1);
    CheckIntersectPanels(2);
  end;
end;


procedure Tfrm_MoveResizeComponents.AddTextToRichEdit(aEditorStr: string;
                                                      aPlaceCursorBeforeChar: string;
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

    synm_SQLBtnTest.SelText := aEditorStr;
    synm_SQLBtnTest.CaretX := synm_SQLBtnTest.CaretX - Index;
  end;

  //==============================

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'AddTextToRichEdit' );{$ENDIF}
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
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'AddTextToRichEdit' );{$ENDIF}
end;


procedure Tfrm_MoveResizeComponents.btn_SQLFunctionStatementsClick(Sender: TObject);
var
  s, se, ss: string;
begin
  if chkPositionRunTime.Checked then begin
     dm_DataMod.NxSqlButtonsDbT.Locate('BtnID', (Sender as Global.TJvPanel).BtnId, []);
     fActBtnIndex := (Sender as Global.TJvPanel).tag;
  end
  else begin
    synm_SQLBtnTest.Lines.Clear;
    s :=  (Sender as Global.TJvPanel).Caption;
    ss := s;
    se := (Sender as Global.TJvPanel).ExtraText;
    s := s + se;
    AddTextToRichEdit(s, (Sender as Global.TJvPanel).CusorBeforeLastChar,
                         (Sender as Global.TJvPanel).SpaceAfterCursor,
                         (Sender as Global.TJvPanel).UseExtendedSQL,
                         (Sender as Global.TJvPanel).SQLExtended);
    rzrlbl_UrlHelp.Caption := (Sender as Global.TJvPanel).Caption;
    rzrlbl_UrlHelp.Url := (Sender as Global.TJvPanel).UrlHelp;

    dm_DataMod.NxSqlButtonsDbT.Locate('Caption', ss, []);
  end;
end;


procedure Tfrm_MoveResizeComponents.btn__SplitViewOpenCloseClick(
  Sender: TObject);
begin
  Close;
end;


procedure Tfrm_MoveResizeComponents.btn_GetButtonsOldDbClick(Sender: TObject);
begin
  btn_CreateBtns;
end;


procedure Tfrm_MoveResizeComponents.FreeBtns;
var
  index, Count1: Integer;
begin
{$REGION 'Doc'}
  {
    When you remove a control the number of controls is also reduced. So get the
    control count before you start freeing the controls.  Then when you free them
    only free controls[0]
  }

{$ENDREGION}
  Count1 := RzPanel1.ControlCount;
  for index := 0 to Count1 - 1 do
    RzPanel1.Controls[0].Free;

  Count1 := RzPanel2.ControlCount;
  for index := 0 to Count1 - 1 do
    RzPanel2.Controls[0].Free;

  SetLength(SQLBtnsArray, 0);
end;


procedure Tfrm_MoveResizeComponents.ControlMouseDown(Sender: TObject;
                                                     Button: TMouseButton;
                                                     Shift: TShiftState;
                                                     X, Y: Integer);
begin
  (Sender as Global.tJvPanel).BeforeClickBtnColor := (Sender as Global.tJvPanel).color;
  (Sender as Global.tJvPanel).color := cClickColor;
  if (chkPositionRunTime.Checked) AND (Sender is TWinControl) then begin
    inReposition := True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
  end;
end; (*ControlMouseDown*)


procedure Tfrm_MoveResizeComponents.ControlMouseMove(Sender: TObject;
                                                     Shift: TShiftState;
                                                     X, Y: Integer);

const
  minWidth = 20;
  minHeight = 20;

var
  newPos   : TPoint;
  frmPoint : TPoint;
  xLocationOk: boolean;
  xLocLeftSide,
  xLocRightSide: boolean;
  yLocTopSide,
  yLocBottomSide: boolean;
  yLocationOk: boolean;
  staticPos  : tPoint;


  procedure TestXYsOfWinControl(var axLocationOk, ayLocationOk);
  // This stops moving a wincontrol off the form of hide it under another
  //component.
  begin
    xLocLeftSide  := TWinControl(Sender).Left >= 0;
    xLocRightSide := TWinControl(Sender).Left +
                     (TWinControl(Sender).width) <= RzPanel1.Width;
    xLocationOk   := xLocLeftSide and xLocRightSide;

    yLocTopSide  := TWinControl(Sender).Top >= 0;
    yLocBottomSide := TWinControl(Sender).Top +
                     (TWinControl(Sender).Height) <= RzPanel1.Height;
    yLocationOk   := yLocTopSide and yLocBottomSide;
  end;

begin
  if not (chkPositionRunTime.Checked) then
    exit;
  StatusBarPro1.Panels[1].text := 'Component  X: ' + IntToStr(X) + '   Y: '+
                                   IntToStr(Y);
  if inReposition then begin
    GetCursorPos(newPos);
    frmPoint := ScreenToClient(Mouse.CursorPos);
    if ssShift in Shift then begin //resize
      Screen.Cursor := crSizeNWSE;
      frmPoint := ScreenToClient(Mouse.CursorPos);
      if frmPoint.X > minWidth then
        TWinControl(sender).Width := frmPoint.X;
      if frmPoint.Y > minHeight then
        TWinControl(sender).Height := frmPoint.Y;
    end
    else begin //move
      Screen.Cursor := crDrag;

      TestXYsOfWinControl(xLocationOk, yLocationOk);

      if  xLocationOk and yLocationOk then begin
        if TwinControl(sender).Name = 'Button1' then
          StatusBarPro1.Panels[2].text := 'MM-InR: '+GetTextFromBoolean('True', 'False', InReposition)
        else
          StatusBarPro1.Panels[3].text := 'MM-InR: '+GetTextFromBoolean('True', 'False', InReposition);

        TWinControl(sender).Left := TWinControl(sender).Left - oldPos.X + newPos.X;
        TWinControl(sender).Top := TWinControl(sender).Top - oldPos.Y + newPos.Y;
        oldPos := newPos;
        StaticPos := newPos;
        TWinControl(sender).BringToFront;
      end
      else begin
        Screen.Cursor := crDefault;
        inReposition := true;
        if not xLocLeftSide then
          TWinControl(Sender).Left := TWinControl(Sender).Left + 1;
        if not xLocRightSide then
          TWinControl(Sender).Left := TWinControl(Sender).Left - 1;

        if not yLocTopSide then
          TWinControl(Sender).Top := TWinControl(Sender).Top + 1;
        if not yLocBottomSide then
          TWinControl(Sender).Top := TWinControl(Sender).Top - 1;

        TWinControl(sender).BringToFront;
      end;
    end;
  end;
end; (*ControlMouseMove*)


procedure Tfrm_MoveResizeComponents.MoveToMargin(Sender: TObject);
var
  fSpacing: integer;
  Move: integer;
begin
  if not (chkPositionRunTime.Checked) then
    exit;

  if TWinControl(sender).Left >= RightC then
    TWinControl(sender).Left := RightC;
  if TWinControl(sender).Left < RightC then
    TWinControl(sender).Left := LeftC;

  if TWinControl(Sender).Top < 0 then
    TWinControl(Sender).Top := 0;

  if TWinControl(Sender).Top > RzPanel1.Height then
    TWinControl(Sender).Top := RzPanel1.Height - 1;

  fSpacing := TWinControl(Sender).Height + BtnSpacing;
  Move :=  TWinControl(Sender).Top mod fSpacing;
  TWinControl(Sender).Top := TWinControl(Sender).Top - Move + TopMargin;
end;


function Tfrm_MoveResizeComponents.CheckIntersectPanels(aPanel: integer): Boolean;

  function CheckIntersectRect(aRect, bRect: TRect): Boolean;
  begin
    {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckIntersectPanels/CheckIntersectRect' );{$ENDIF}
    result := False;
    try
      if (not IsRectEmpty(aRect)) and (not IsRectEmpty(bRect))  then
        Result := IntersectRect(aRect, bRect)
      else
        Result := False;

    except on E: Exception do
      ShowMessage('Code: 584- '+e.ClassName+#13+#10+E.Message);
    end;
    {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckIntersectPanels/CheckIntersectRect' );{$ENDIF}
  end;


  procedure SetBtnsToNoOverLapColor;
  var
    fIndex: integer;
  begin
    for fIndex := Low(SQLBtnsArray) to High(SQLBtnsArray) do
      if SQLBtnsArray[fIndex].Panel = aPanel then
        SQLBtnsArray[fIndex].Color := cBtnColor;
  end;


var
  fIndex, j: integer;

//  fPanel: integer;

begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'CheckIntersectPanels' );{$ENDIF}
  SetBtnsToNoOverLapColor;
//  RecusiveCheckIntersectRect(aPanel, Length(SQLBtnsArray)-1);

  result := false;
//  fPanel := SQLBtnsArray[aIndex].Panel;
  for fIndex := Low(SQLBtnsArray) to High(SQLBtnsArray)-1  do
    for j := fIndex+1 to High(SQLBtnsArray) do
      if (SQLBtnsArray[j].Panel = aPanel) and (SQLBtnsArray[fIndex].Panel = aPanel) then
        if CheckIntersectRect(SQLBtnsArray[j].PanelRect, SQLBtnsArray[fIndex].PanelRect) then begin
          SQLBtnsArray[j].Color := cBtnIntersectColor;
          SQLBtnsArray[fIndex].Color := cBtnIntersectColor;
          result := true;
        end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'CheckIntersectPanels' );{$ENDIF}
end;


procedure Tfrm_MoveResizeComponents.chkPositionRunTimeClick(Sender: TObject);
begin
  if (not chkPositionRunTime.Checked) and (fActBtnIndex > -1) then begin
    SQLBtnsArray[fActBtnIndex].BevelWidth  := cBtnBevelWidthNorm;
    SQLBtnsArray[fActBtnIndex].BorderStyle := bsNone;
    SQLBtnsArray[fActBtnIndex].Color       := cBtnColor
  end;

end;


//===============================

procedure Tfrm_MoveResizeComponents.ControlMouseUp(Sender: TObject;
                                                   Button: TMouseButton;
                                                   Shift: TShiftState;
                                                   X, Y: Integer);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'ControlMouseUp' );{$ENDIF}
  (Sender as Global.tJvPanel).color := (Sender as Global.tJvPanel).BeforeClickBtnColor;

  if not (chkPositionRunTime.Checked) then
    exit;

  if inReposition then begin
    Screen.Cursor := crDefault;
    isReleased := ReleaseCapture;
    inReposition := False;
    MoveToMargin(Sender);

    (Sender as Global.tJvPanel).Left := TWinControl(sender).Left;
    (Sender as Global.tJvPanel).Top := TWinControl(sender).Top;

    (Sender as Global.tJvPanel).PanelRect := Rect((Sender as Global.tJvPanel).Left, (Sender as Global.tJvPanel).Top,
                                           (Sender as Global.tJvPanel).Left + (Sender as Global.tJvPanel).Width,
                                           (Sender as Global.tJvPanel).Top  + (Sender as Global.tJvPanel).Height);
{$IFDEF USE_CODESITE}CodeSite.sendmsg('ControlMouseUp-- Index = '+
                                       inttostr((Sender as Global.tJvPanel).tag)+
                                       '  Left= '+ IntToStr(TWinControl(sender).Left)+
                                       '  Top= '+ IntToStr(TWinControl(sender).Top));{$ENDIF}
    (Sender as Global.tJvPanel).ChangedBtn := true;

    CheckIntersectPanels((Sender as Global.tJvPanel).Panel);
    if fActBtnIndex > -1 then begin
      SQLBtnsArray[fActBtnIndex].BevelWidth := cBtnBevelWidthNorm;
      SQLBtnsArray[fActBtnIndex].BorderStyle := bsNone;
      SQLBtnsArray[fActBtnIndex].Color := cBtnColor;
    end;

    fActBtnIndex := (Sender as Global.tJvPanel).tag;
//    fColor := (Sender as Global.tJvPanel).Color;
    (Sender as Global.tJvPanel).Color := DarkerColor((Sender as Global.tJvPanel).Color, cDarkerTextPercent);
    (Sender as Global.tJvPanel).BevelWidth := cBtnBevelWidthClicked;
    (Sender as Global.tJvPanel).BorderStyle := bsSingle;
//    (Sender as Global.tJvPanel).refresh;
//    showmessage('Before: '+ IntTostr(fColor)+'  After: '+ IntToStr((Sender as Global.tJvPanel).Color));

  end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'ControlMouseUp' );{$ENDIF}
end; (*ControlMouseUp*)


procedure Tfrm_MoveResizeComponents.DrawBtnLocationOnPanel;
var
  AddToHeigth: integer;
  BtnLoc: integer;
begin
  RzPanel1.Canvas.Pen.Color := cPanelBtnLocations;
  AddToHeigth := BtnSpacing + BtnH;
  BtnLoc := TopMargin;
  Repeat
    RzPanel1.Canvas.MoveTo(LeftC, BtnLoc);
    RzPanel1.Canvas.LineTo(LeftC + BtnH, BtnLoc);
    RzPanel1.Canvas.MoveTo(LeftC, BtnLoc);
    RzPanel1.Canvas.LineTo(LeftC, BtnLoc + BtnH);

    RzPanel1.Canvas.MoveTo(RightC, BtnLoc);
    RzPanel1.Canvas.LineTo(RightC + BtnH, BtnLoc);
    RzPanel1.Canvas.MoveTo(RightC, BtnLoc);
    RzPanel1.Canvas.LineTo(RightC, BtnLoc + BtnH);


    RzPanel2.Canvas.MoveTo(LeftC, BtnLoc);
    RzPanel2.Canvas.LineTo(LeftC + BtnH, BtnLoc);
    RzPanel2.Canvas.MoveTo(LeftC, BtnLoc);
    RzPanel2.Canvas.LineTo(LeftC, BtnLoc + BtnH);

    RzPanel2.Canvas.MoveTo(RightC, BtnLoc);
    RzPanel2.Canvas.LineTo(RightC + BtnH, BtnLoc);
    RzPanel2.Canvas.MoveTo(RightC, BtnLoc);
    RzPanel2.Canvas.LineTo(RightC, BtnLoc + BtnH);

    BtnLoc := BtnLoc + AddToHeigth;
  Until (BtnLoc) >= RzPanel1.Height;
end;


procedure Tfrm_MoveResizeComponents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormClose' );{$ENDIF}
  FreeBtns;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormClose' );{$ENDIF}
end;


procedure Tfrm_MoveResizeComponents.FormCreate(Sender: TObject);
begin
  fActBtnIndex := -1;
end;

procedure Tfrm_MoveResizeComponents.FormShow(Sender: TObject);
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'FormShow' );{$ENDIF}
//  DrawBtnLocationOnPanel;
//  AllreadyDrawBtnLoc := true;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'FormShow' );{$ENDIF}
end;


procedure Tfrm_MoveResizeComponents.RzPanel1Paint(Sender: TObject);
begin
  DrawBtnLocationOnPanel;
end;


procedure Tfrm_MoveResizeComponents.TabControl1Change(Sender: TObject);
begin

end;

//{Begin TJvPanel }
//constructor TJvPanel.Create(AOwner: TComponent);
//begin
//  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'Create' );{$ENDIF}
//  inherited;
//  SQLExtended := TStringList.Create;
//  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'Create' );{$ENDIF}
//end;
//
//
//destructor TJvPanel.Destroy;
//begin
//  {$IFDEF USE_CODESITE}CodeSite.EnterMethod( Self, 'Destroy' );{$ENDIF}
//  SQLExtended.Free;
//  inherited;
//  {$IFDEF USE_CODESITE}CodeSite.ExitMethod( Self, 'Destroy' );{$ENDIF}
//end;
//{End TJvPanel }

end.






