unit EditAddDelSQL;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Rtti, System.Bindings.Outputs, System.Actions,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ActnList, Vcl.WinXPanels, Vcl.Imaging.pngimage, Vcl.CategoryButtons,
  Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.WinXCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Bind.DBEngExt, Vcl.Buttons,

  RzEdit, RzDBEdit,

  Data.Db,

  PngSpeedButton,

  JvComponentBase,  JvFormPlacement, JvExControls, JvLabel, JvDBControls;



type
  TEditAddDelSQLBtns = class(TForm)
    crdpnl1: TCardPanel;
    spltvw: TSplitView;
    ilIcons: TImageList;
    ctgrybtns1: TCategoryButtons;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    actlst1: TActionList;
    crd_Edit: TCard;
    crd_Add: TCard;
    crd_Delete: TCard;
    act_Edit: TAction;
    act_Add: TAction;
    act_Delete: TAction;
    dbedtCaption: TDBEdit;
    rg_ColsMoveBtnTo: TRadioGroup;
    rzdbnmrcdtLocationCode: TRzDBNumericEdit;
    rzdbnmrcdtBtnOrder: TRzDBNumericEdit;
    rzdbnmrcdtLocationCode1: TRzDBNumericEdit;
    dbedtCaption1: TDBEdit;
    dbedtExtraText: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbchkSpaceAfterCursor: TDBCheckBox;
    dbchkUseExtenedSQL: TDBCheckBox;
    dbmmoSQLCode: TDBMemo;
    lbl6: TLabel;
    btn_CutSQLCodeCloseOpenSV: TPngSpeedButton;
    act_CloseOpenSV: TAction;
    ctgrypnlgrp1: TCategoryPanelGroup;
    ctgrypnl1: TCategoryPanel;
    tglswtchChangeIcons: TToggleSwitch;
    tglswtchChangeSVCloseStyle: TToggleSwitch;
    jvfrmstrg_SQLBtns1: TJvFormStorage;
    act_ChangeIcons: TAction;
    act_ChangeSVCloseStyle: TAction;
    act_Exit: TAction;
    jvdbstslbl1: TJvDBStatusLabel;
    procedure act_EditExecute(Sender: TObject);
    procedure act_AddExecute(Sender: TObject);
    procedure act_DeleteExecute(Sender: TObject);
    procedure rzdbnmrcdtLocationCodeChange(Sender: TObject);
    procedure rg_ColsMoveBtnToClick(Sender: TObject);
    procedure crdpnl1CardChange(Sender: TObject; PrevCard, NextCard: TCard);
    procedure act_CloseOpenSVExecute(Sender: TObject);
    procedure ctgrypnlgrp1Click(Sender: TObject);
    procedure act_ChangeIconsExecute(Sender: TObject);
    procedure act_ChangeSVCloseStyleExecute(Sender: TObject);
    procedure act_ExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     function Execute: Boolean;
  end;

var
  EditAddDelSQLBtns: TEditAddDelSQLBtns;

implementation
uses
  DataMod, NxToolsMain;
{$R *.dfm}

{ TForm1 }

// ======================================
// Actions
// ======================================
procedure TEditAddDelSQLBtns.act_AddExecute(Sender: TObject);
begin
  if dm_DataMod.NxSqlButtonsDbT.State in[dsEdit] then
    dm_DataMod.NxSqlButtonsDbT.Post;

  crdpnl1.ActiveCard := crd_Add;
  dm_DataMod.NxSqlButtonsDbT.Insert;
end;


procedure TEditAddDelSQLBtns.act_DeleteExecute(Sender: TObject);
begin
  if dm_DataMod.NxSqlButtonsDbT.State in[dsEdit, dsInsert] then
    dm_DataMod.NxSqlButtonsDbT.Post;

  crdpnl1.ActiveCard := crd_Delete;
end;


procedure TEditAddDelSQLBtns.act_EditExecute(Sender: TObject);
begin
  crdpnl1.ActiveCard := crd_Edit;
end;


procedure TEditAddDelSQLBtns.act_ExitExecute(Sender: TObject);
begin
  Close;
end;


procedure TEditAddDelSQLBtns.crdpnl1CardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
  lblTitle.Caption := crdpnl1.ActiveCard.Caption;
end;


procedure TEditAddDelSQLBtns.ctgrypnlgrp1Click(Sender: TObject);
begin
  spltvw.open;
end;


procedure TEditAddDelSQLBtns.act_ChangeIconsExecute(Sender: TObject);
begin
  if tglswtchChangeIcons.State = tssON then begin
    act_Edit.ImageIndex := 8;
    act_Add.ImageIndex := 9;
    act_Delete.ImageIndex := 10;
    act_Exit.ImageIndex := 12;
  end
  else begin
    act_Edit.ImageIndex := 5;
    act_Add.ImageIndex := 6;
    act_Delete.ImageIndex := 7;
    act_Exit.ImageIndex := 11;
  end;
end;


procedure TEditAddDelSQLBtns.act_ChangeSVCloseStyleExecute(Sender: TObject);
begin
  if tglswtchChangeSVCloseStyle.state = tssOff then
    spltvw.CloseStyle := svcCompact
  else
    spltvw.CloseStyle := svcCollapse;
end;


procedure TEditAddDelSQLBtns.act_CloseOpenSVExecute(Sender: TObject);
begin
  if spltvw.Opened then
    spltvw.Close
  else
    spltvw.Open;
end;


procedure TEditAddDelSQLBtns.rg_ColsMoveBtnToClick(Sender: TObject);
begin
  dm_DataMod.NxSqlButtonsDbT.Edit;
//  dm_DataMod.NxSqlButtonsDbTLocationCode.AsInteger := rg_ColsMoveBtnTo.ItemIndex;
  dm_DataMod.NxSqlButtonsDbT.Post;
end;


procedure TEditAddDelSQLBtns.rzdbnmrcdtLocationCodeChange(Sender: TObject);
begin
//  if dm_DataMod.NxSqlButtonsDbT.active then
//    rg_ColsMoveBtnTo.ItemIndex := dm_DataMod.fdqry_BtnTableLocationCode.AsInteger - 1;
end;



function TEditAddDelSQLBtns.Execute: Boolean;
begin
  Result := (ShowModal = mrOK);
end;


procedure TEditAddDelSQLBtns.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  TDataSetState = [dsInactive, dsBrowse, dsEdit, dsInsert, dsSetKey,
//    dsCalcFields, dsFilter, dsNewValue, dsOldValue, dsCurValue, dsBlockRead,
//    dsInternalCalc, dsOpening];
//
  if dm_DataMod.NxSqlButtonsDbT.State in [dsEdit, dsInsert] then
    dm_DataMod.NxSqlButtonsDbT.Post;

  CanClose := True;
end;


procedure TEditAddDelSQLBtns.FormShow(Sender: TObject);
begin
  dm_DataMod.NxSqlButtonsDbT.Edit;
end;

end.
