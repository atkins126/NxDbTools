unit SaveComponentsToIni;
       // Emmanuel PASQUIER -- Experts Exchange

interface

Uses Forms,classes,IniFiles,StdCtrls,ExtCtrls,Buttons,Grids,Controls,Dialogs,Graphics,ComCtrls,Menus
{$ifdef USE_SPIN_EDT}, Spin{$endif}
;

Type
 TStringListOption=(slUpperCase);
 TStringListOptions=set of TStringListOption;

procedure IniOpenFile(FileName:String='';FilePath:String='');
procedure IniCloseFile;

procedure IniSaveQuotedCaption(Section,Param,Default:String);
function IniLoadQuotedCaption(Section,Param,Default:String):String;

function IniLoadSaveDefaultString(Section,Param,Default:String):String;
function IniLoadSaveDefault(Section,Param,Default:String):String; overload;
function IniLoadSaveDefault(Section,Param:String;Default:Integer):Integer; overload;
function IniLoadSaveDefault(Section,Param:String;Default:Boolean):Boolean; overload;
procedure IniLoadSaveDefaultStringList(Section,Param:String;List:TStringList;Opt:TStringListOptions=[]);

procedure IniLoadMenu(M:TMenu);
procedure IniSaveMenu(M:TMenu);
procedure IniLoadListView(L:TListView);
procedure IniSaveListView(L:TListView);
procedure IniLoadFormPosAndSize(frm:TCustomForm);
procedure IniSaveFormPosAndSize(frm:TCustomForm);
procedure IniLoadCheckBox(chk:TCheckBox);
procedure IniSaveCheckBox(chk:TCheckBox);
procedure IniLoadRadioButton(rb:TRadioButton);
procedure IniSaveRadioButton(rb:TRadioButton);
procedure IniLoadCaption(lbl:TLabel);
procedure IniSaveCaption(lbl:TLabel);
procedure IniLoadText(edt:TCustomEdit);
procedure IniSaveText(edt:TCustomEdit);
procedure IniLoadRadioGroup(rg:TRadioGroup);
procedure IniSaveRadioGroup(rg:TRadioGroup);
procedure IniLoadGroupBox(gb:TGroupBox);
procedure IniSaveGroupBox(gb:TGroupBox);
procedure IniLoadComboBox(cb:TComboBox);
procedure IniSaveComboBox(cb:TComboBox);
{
procedure IniLoadSpinEdit(edt:TSpinEdit);
procedure IniSaveSpinEdit(edt:TSpinEdit);
}
procedure IniLoadButton(btn:TButton);
procedure IniSaveButton(btn:TButton);
procedure IniLoadSpeedButton(btn:TSpeedButton);
procedure IniSaveSpeedButton(btn:TSpeedButton);
procedure IniLoadFormCaption(frm:TForm);
procedure IniSaveFormCaption(frm:TForm);
procedure IniSavePanel(pnl:TPanel);
procedure IniLoadPanel(pnl:TPanel);
procedure IniSaveFrame(pnl:TFrame);
procedure IniLoadFrame(pnl:TFrame);
procedure IniLoadStringGrid(grid:TStringGrid);
procedure IniSaveStringGrid(grid:TStringGrid);
procedure IniLoadShape(shp:TShape);
procedure IniLoadImage(img:TImage);
procedure IniSaveShape(shp:TShape);
procedure IniSaveImage(img:TImage);
procedure IniSaveControl(c:TControl);
procedure IniLoadControl(c:TControl);
procedure IniLoadOpenDialog(dlg:TOpenDialog);
procedure IniSaveOpenDialog(dlg:TOpenDialog);

procedure SetExtendedSection(S:String);
function  GetExtendedSection:String;
function  GetTextOnly:Boolean;
procedure SetTextOnly(b:Boolean);
function TranslateFormat2Text(S:String):String;
function TranslateText2Format(S:String):String;

procedure IniSaveComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
procedure IniLoadComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);

Var
 IniFile:TIniFile;

implementation

Uses SysUtils,untUtils;

Var
 _ExtSection:String='';
 _TextOnly:Boolean=False;

procedure SetExtendedSection(S:String);
begin
 _ExtSection:=S;
end;

function  GetExtendedSection:String;
begin
 Result:=_ExtSection;
end;

function  GetTextOnly:Boolean;
begin
 Result:=_TextOnly;
end;

procedure SetTextOnly(b:Boolean);
begin
 _TextOnly:=b;
end;

function TranslateFormat2Text(S:String):String;
begin
 Result:=StringReplace(S,'%\',#13#10,[rfReplaceAll]);
end;

function TranslateText2Format(S:String):String;
begin
 Result:=StringReplace(S,#13#10,'%\',[rfReplaceAll]);
end;

procedure IniOpenFile(FileName:String='';FilePath:String='');
begin
 IniCloseFile;
 if FileName='' Then FileName:=ChangeFileExt(GetModuleName(hInstance),'.INI');// ChangeFileExt(ParamStr(0),'.INI');
 if (FilePath<>'') Then
  begin
   FilePath:=IncludeTrailingBackslash(FilePath);
   if FileExists(FilePath+FileName) Then FileName:=FilePath+FileName;
  end;
 IniFile:=TIniFile.Create(FileName);
end;

procedure IniCloseFile;
begin
 FreeAndNil(IniFile);
end;

function IniLoadSaveDefaultString(Section,Param,Default:String):String;
begin
 Result:=IniLoadSaveDefault(Section,Param,Default);
end;

procedure IniLoadSaveDefaultStringList(Section,Param:String;List:TStringList;Opt:TStringListOptions=[]);
Var
 i:integer;
begin
 Section:=_ExtSection+Section;
 List.CommaText:=IniFile.ReadString(Section,Param,List.CommaText);
 if slUpperCase In Opt Then
  begin
   List.Sorted:=False;
   for i:=0 to List.Count-1 do List[i]:=UpperCase(List[i]);
   List.Sorted:=True;
  end;
 IniFile.WriteString(Section,Param,List.CommaText);
end;

function IniLoadSaveDefault(Section,Param,Default:String):String; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadString(Section,Param,Default);
 IniFile.WriteString(Section,Param,Result);
end;

function IniLoadSaveDefault(Section,Param:String;Default:Integer):Integer; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadInteger(Section,Param,Default);
 IniFile.WriteInteger(Section,Param,Result);
end;

function IniLoadSaveDefault(Section,Param:String;Default:Boolean):Boolean; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadBool(Section,Param,Default);
 IniFile.WriteBool(Section,Param,Result);
end;

procedure IniSaveQuotedCaption(Section,Param,Default:String);
begin
 if Trim(Default)<>Default Then Default:=AnsiQuotedStr(Default,'"');
 IniFile.WriteString(_ExtSection+Section,Param,Default);
end;

function IniLoadQuotedCaption(Section,Param,Default:String):String;
Var
 P:PChar;
begin
 Result:=IniFile.ReadString(_ExtSection+Section,Param,Default);
 if (Length(Result)>=2) And (Result[1]='"') Then
  begin
   P:=PChar(Result);
   Result:=AnsiExtractQuotedStr(P,'"');
  end;
end;

procedure IniLoadFormPosAndSize(frm:TCustomForm);
Var
 Section:String;
begin
 Section:=_ExtSection+frm.Name;
 frm.Caption:=IniFile.ReadString(Section,'CAPTION',frm.Caption);
 if Not _TextOnly Then
  begin
   if frm Is TForm Then TForm(frm).Position:=poDesigned;
   frm.Width:=IniFile.ReadInteger(Section,'WIDTH',frm.Width);
   frm.Height:=IniFile.ReadInteger(Section,'HEIGHT',frm.Height);
   frm.Top:=IniFile.ReadInteger(Section,'TOP',frm.Top);
   frm.Left:=IniFile.ReadInteger(Section,'LEFT',frm.Left);
   frm.WindowState:=TWindowState(IniFile.ReadInteger(Section,'STATE',Integer(frm.WindowState)));
  end;
end;

procedure IniSaveFormPosAndSize(frm:TCustomForm);
Var
 Section:String;
begin
 Section:=_ExtSection+frm.Name;
 IniFile.WriteString(Section,'CAPTION',frm.Caption);
 if Not _TextOnly Then
  begin
   IniFile.WriteInteger(Section,'STATE',Integer(frm.WindowState));
   IniFile.WriteInteger(Section,'WIDTH',frm.Width);
   IniFile.WriteInteger(Section,'HEIGHT',frm.Height);
   IniFile.WriteInteger(Section,'TOP',frm.Top);
   IniFile.WriteInteger(Section,'LEFT',frm.Left);
  end;
end;

procedure IniLoadCheckBox(chk:TCheckBox);
begin
 chk.Caption:=IniLoadQuotedCaption(chk.Name,'CAPTION',chk.Caption);
 if Not _TextOnly Then chk.Checked:=IniFile.ReadBool(_ExtSection+chk.Name,'CHECKED',chk.Checked);
end;

procedure IniSaveCheckBox(chk:TCheckBox);
begin
 IniSaveQuotedCaption(chk.Name,'CAPTION',chk.Caption);
 if Not _TextOnly Then IniFile.WriteBool(_ExtSection+chk.Name,'CHECKED',chk.Checked);
end;

procedure IniLoadShape(shp:TShape);
Var
 Section:String;
begin
 with shp do
  begin
   Section:=_ExtSection+Name;
   Visible:=IniFile.ReadBool(Section,'VISIBLE',Visible);
   Pen.Color:=StringToColor(IniFile.ReadString(Section,'PEN_COLOR',ColorToString(Pen.Color)));
   Brush.Color:=StringToColor(IniFile.ReadString(Section,'BRUSH_COLOR',ColorToString(Brush.Color)));
  end;
end;

procedure IniLoadImage(img:TImage);
Var
 F:String;
 Section:String;
begin
 With img do
  try
   Section:=_ExtSection+Name;
   Visible:=IniFile.ReadBool(Section,'VISIBLE',Visible);
   Transparent:=IniFile.ReadBool(Section,'TRANSPARENT',Transparent);
   Stretch:=IniFile.ReadBool(Section,'STRETCH',Stretch);
   F:=IniFile.ReadString(Section,'FILE','');
   if FileExists(F) Then Picture.LoadFromFile(F);
  except
  end;
end;

procedure IniSaveShape(shp:TShape);
Var
 Section:String;
begin
 with shp do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteBool(Section,'VISIBLE',Visible);
   IniFile.WriteString(Section,'PEN_COLOR',ColorToString(Pen.Color));
   IniFile.WriteString(Section,'BRUSH_COLOR',ColorToString(Brush.Color));
  end;
end;

procedure IniSaveImage(img:TImage);
Var
 Section:String;
begin
 With img do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteBool(Section,'VISIBLE',Visible);
   IniFile.WriteBool(Section,'TRANSPARENT',Transparent);
   IniFile.WriteBool(Section,'STRETCH',Stretch);
  end;
end;

procedure IniLoadRadioButton(rb:TRadioButton);
begin
 rb.Caption:=IniLoadQuotedCaption(rb.Name,'CAPTION',rb.Caption);
 if Not _TextOnly Then rb.Checked:=IniFile.ReadBool(_ExtSection+rb.Name,'CHECKED',rb.Checked);
end;

procedure IniSaveRadioButton(rb:TRadioButton);
begin
 IniSaveQuotedCaption(rb.Name,'CAPTION',rb.Caption);
 if Not _TextOnly Then IniFile.WriteBool(_ExtSection+rb.Name,'CHECKED',rb.Checked);
end;

procedure IniLoadText(edt:TCustomEdit);
begin
 edt.Text:=IniLoadQuotedCaption(edt.Name,'TEXT',edt.Text);
end;

procedure IniSaveText(edt:TCustomEdit);
begin
 IniSaveQuotedCaption(edt.Name,'TEXT',edt.Text);
end;

procedure IniLoadCaption(lbl:TLabel);
begin
 lbl.Caption:=IniLoadQuotedCaption(lbl.Name,'CAPTION',lbl.Caption);
end;

procedure IniSaveCaption(lbl:TLabel);
begin
 IniSaveQuotedCaption(lbl.Name,'CAPTION',lbl.Caption);
end;

procedure IniLoadFormCaption(frm:TForm);
begin
 frm.Caption:=IniLoadQuotedCaption(frm.Name,'CAPTION',frm.Caption);
end;

procedure IniSaveFormCaption(frm:TForm);
begin
 IniSaveQuotedCaption(frm.Name,'CAPTION',frm.Caption);
end;

procedure IniLoadButton(btn:TButton);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveButton(btn:TButton);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadBitButton(btn:TBitBtn);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveBitButton(btn:TBitBtn);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadSpeedButton(btn:TSpeedButton);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveSpeedButton(btn:TSpeedButton);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadRadioGroup(rg:TRadioGroup);
begin
 rg.Caption:=IniLoadQuotedCaption(rg.Name,'CAPTION',rg.Caption);
 if Not _TextOnly Then rg.ItemIndex:=IniFile.ReadInteger(_ExtSection+rg.Name,'INDEX',rg.ItemIndex);
end;

procedure IniSaveRadioGroup(rg:TRadioGroup);
begin
 IniSaveQuotedCaption(rg.Name,'CAPTION',rg.Caption);
 if Not _TextOnly Then IniFile.WriteInteger(_ExtSection+rg.Name,'INDEX',rg.ItemIndex);
end;

procedure IniLoadGroupBox(gb:TGroupBox);
begin
 gb.Caption:=IniLoadQuotedCaption(gb.Name,'CAPTION',gb.Caption);
 if Not _TextOnly Then IniLoadControl(gb);
end;

procedure IniSaveGroupBox(gb:TGroupBox);
begin
 IniSaveQuotedCaption(gb.Name,'CAPTION',gb.Caption);
 if Not _TextOnly Then IniSaveControl(gb);
end;

procedure IniLoadComboBox(cb:TComboBox);
Var
 Str:String;
begin
 Str:=IniLoadQuotedCaption(cb.Name,'TEXT',cb.Text);
 if cb.Style=csDropDownList Then
  begin
   if Str<>'' Then cb.ItemIndex:=cb.Items.IndexOf(Str) Else cb.ItemIndex:=IniFile.ReadInteger(_ExtSection+cb.Name,'INDEX',cb.ItemIndex);
  end Else cb.Text:=Str;
end;

procedure IniSaveComboBox(cb:TComboBox);
begin
 IniSaveQuotedCaption(cb.Name,'TEXT',cb.Text);
 IniFile.WriteInteger(_ExtSection+cb.Name,'INDEX',cb.ItemIndex);
end;

{$ifdef USE_SPIN_EDT}
procedure IniLoadSpinEdit(edt:TSpinEdit);
begin
 edt.Value:=IniFile.ReadInteger(_ExtSection+edt.Name,'VALUE',edt.Value);
end;

procedure IniSaveSpinEdit(edt:TSpinEdit);
begin
 IniFile.WriteInteger(_ExtSection+edt.Name,'VALUE',edt.Value);
end;
{$endif}

procedure IniSavePanel(pnl:TPanel);
begin
 IniFile.WriteInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 IniFile.WriteInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadPanel(pnl:TPanel);
begin
 pnl.Width:=IniFile.ReadInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 pnl.Height:=IniFile.ReadInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniSaveFrame(pnl:TFrame);
begin
 IniFile.WriteInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 IniFile.WriteInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadFrame(pnl:TFrame);
begin
 pnl.Width:=IniFile.ReadInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 pnl.Height:=IniFile.ReadInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadStringGrid(grid:TStringGrid);
Var
 i:integer;
 Section:String;
begin
 With grid do
  begin
   Section:=_ExtSection+Name;
   grid.ColCount:=IniFile.ReadInteger(Section,'COL_COUNT',grid.ColCount);
   for i:=0 to grid.ColCount-1 do
    begin
     grid.ColWidths[i]:=IniFile.ReadInteger(Section,Format('COL_%d_WIDTH',[i]),grid.ColWidths[i]);
     grid.Cells[i,0]:=IniFile.ReadString(Section,Format('COL_%d_TEXT',[i]),grid.Cells[i,0]);
    end;
  end;
end;

procedure IniSaveStringGrid(grid:TStringGrid);
Var
 i:integer;
 Section:String;
begin
 With grid do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteInteger(Section,'COL_COUNT',grid.ColCount);
   for i:=0 to grid.ColCount-1 do
    begin
     IniFile.WriteInteger(Section,Format('COL_%d_WIDTH',[i]),grid.ColWidths[i]);
     IniFile.WriteString(Section,Format('COL_%d_TEXT',[i]),grid.Cells[i,0]);
    end;
  end;
end;

procedure IniLoadOpenDialog(dlg:TOpenDialog);
begin
 dlg.InitialDir:=IniLoadQuotedCaption(dlg.Name,'INITIAL_DIR',dlg.InitialDir);
end;

procedure IniSaveOpenDialog(dlg:TOpenDialog);
begin
 IniSaveQuotedCaption(dlg.Name,'INITIAL_DIR',dlg.InitialDir);
end;

procedure IniSaveControl(c:TControl);
begin
 IniFile.WriteInteger(_ExtSection+c.Name,'WIDTH',c.Width);
 IniFile.WriteInteger(_ExtSection+c.Name,'HEIGHT',c.Height);
end;

procedure IniLoadControl(c:TControl);
begin
 c.Width:=IniFile.ReadInteger(_ExtSection+c.Name,'WIDTH',c.Width);
 c.Height:=IniFile.ReadInteger(_ExtSection+c.Name,'HEIGHT',c.Height);
end;

procedure IniLoadListView(L:TListView);
Var
 Section:String;
 i:integer;
begin
 With L do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to Columns.Count - 1 do Columns[i].Caption:=IniFile.ReadString(Section,Format('COLUMN_%d',[i]),Columns[i].Caption);
  end;
end;

procedure IniSaveListView(L:TListView);
Var
 Section:String;
 i:integer;
begin
 With L do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to Columns.Count - 1 do IniFile.WriteString(Section,Format('COLUMN_%d',[i]),Columns[i].Caption);
  end;
end;

procedure IniLoadMenu(M:TMenu);
Var
 Section:String;
 i:integer;

 procedure IniLoadMenuItem(M:TMenuItem;Sect:String);
 Var
  i:integer;
 begin
  Sect:=Sect+'.'+M.Name;
  for i := 0 to M.Count - 1 do if M.Items[i].Caption<>'-' Then
   begin
    M.Items[i].Caption:=IniFile.ReadString(Sect,M.Items[i].Name,M.Items[i].Caption);
    if M.Items[i].Count>0 then IniLoadMenuItem(M.Items[i],Sect);
   end;
 end;
begin
 With M do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to M.Items.Count - 1 do if Items[i].Caption<>'-' Then
    begin
     Items[i].Caption:=IniFile.ReadString(Section,Items[i].Name,Items[i].Caption);
    end;
  end;
end;

procedure IniSaveMenu(M:TMenu);
Var
 Section:String;
 i:integer;
 procedure IniSaveMenuItem(M:TMenuItem;Sect:String);
 Var
  i:integer;
 begin
  Sect:=Sect+'.'+M.Name;
  for i := 0 to M.Count - 1 do if M.Items[i].Caption<>'-' Then
   begin
    IniFile.WriteString(Sect,M.Items[i].Name,M.Items[i].Caption);
    if M.Items[i].Count>0 then IniSaveMenuItem(M.Items[i],Sect);
   end;
 end;
begin
 With M do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to M.Items.Count - 1 do if Items[i].Caption<>'-' Then
    begin
     IniFile.WriteString(Section,Items[i].Name,Items[i].Caption);
     if Items[i].Count>0 then IniSaveMenuItem(Items[i],_ExtSection);
    end;
  end;
end;

procedure IniSaveComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
var
 i:integer;
 SaveExtSect:String;
 SaveTextOnly:Boolean;
begin
 SaveExtSect:=_ExtSection;
 _ExtSection:=Ext_Section;
 SaveTextOnly:=_TextOnly;
 _TextOnly:=TextOnly;
 for i:=Low(List) to High(List) do if Assigned(List[i]) Then
  try
   if List[i] Is TListView    then IniSaveListView      (TListView    (List[i])) Else
   if List[i] Is TMenu        then IniSaveMenu          (TMenu        (List[i])) Else
   if List[i] Is TCustomForm  Then IniSaveFormPosAndSize(TCustomForm  (List[i])) Else
   if List[i] Is TRadioGroup  Then IniSaveRadioGroup    (TRadioGroup  (List[i])) Else
   if List[i] Is TRadioButton Then IniSaveRadioButton   (TRadioButton (List[i])) Else
   if List[i] Is TEdit        Then IniSaveText          (TEdit        (List[i])) Else
   if List[i] Is TCheckBox    Then IniSaveCheckBox      (TCheckBox    (List[i])) Else
   if List[i] Is TComboBox    Then IniSaveComboBox      (TComboBox    (List[i])) Else
{$ifdef USE_SPIN_EDT}
   if List[i] Is TSpinEdit    Then IniSaveSpinEdit  	(TSpinEdit    (List[i])) Else
{$endif}
   if List[i] Is TLabel       Then IniSaveCaption  	(TLabel       (List[i])) Else
   if List[i] Is TBitBtn      Then IniSaveBitButton  	(TBitBtn      (List[i])) Else
   if List[i] Is TButton      Then IniSaveButton  	(TButton      (List[i])) Else
   if List[i] Is TSpeedButton Then IniSaveSpeedButton  	(TSpeedButton (List[i])) Else
   if List[i] Is TPanel       Then IniSavePanel 	(TPanel       (List[i])) Else
   if List[i] Is TFrame       Then IniSaveFrame 	(TFrame       (List[i])) Else
   if List[i] Is TStringGrid  Then IniSaveStringGrid    (TStringGrid  (List[i])) Else
   if List[i] Is TOpenDialog  Then IniSaveOpenDialog    (TOpenDialog  (List[i])) Else
   if List[i] Is TShape       Then IniSaveShape         (TShape       (List[i])) Else
   if List[i] Is TImage       Then IniSaveImage         (TImage       (List[i])) Else
   if List[i] Is TGroupBox    Then IniSaveGroupBox      (TGroupBox    (List[i])) Else
   if List[i] Is TControl     Then IniSaveControl       (TControl     (List[i])) Else
   if List[i] Is TComponent   Then ShowMessage('Erreur Save '+TComponent(List[i]).Name+':'+List[i].ClassName)
    Else ShowMessage('Erreur Save '+List[i].ClassName);
  except
   on E:Exception do ShowMessage(Format('Error Saving %s : %s'#13'%s',[TComponent(List[i]).Name,E.ClassName,E.Message]));
  end;
 _ExtSection:=SaveExtSect;
 _TextOnly:=SaveTextOnly;
end;

procedure IniLoadComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
var
 i:integer;
 SaveExtSect:String;
 SaveTextOnly:Boolean;
begin
 SaveExtSect:=_ExtSection;
 _ExtSection:=Ext_Section;
 SaveTextOnly:=_TextOnly;
 _TextOnly:=TextOnly;
 for i:=Low(List) to High(List) do if Assigned(List[i]) Then
  try
   if List[i] Is TListView    then IniLoadListView      (TListView    (List[i])) Else
   if List[i] Is TMenu        then IniLoadMenu          (TMenu        (List[i])) Else
   if List[i] Is TCustomForm  Then IniLoadFormPosAndSize(TCustomForm  (List[i])) Else
   if List[i] Is TRadioGroup  Then IniLoadRadioGroup    (TRadioGroup  (List[i])) Else
   if List[i] Is TRadioButton Then IniLoadRadioButton   (TRadioButton (List[i])) Else
   if List[i] Is TEdit        Then IniLoadText          (TEdit        (List[i])) Else
   if List[i] Is TCheckBox    Then IniLoadCheckBox      (TCheckBox    (List[i])) Else
   if List[i] Is TComboBox    Then IniLoadComboBox      (TComboBox    (List[i])) Else
{$ifdef USE_SPIN_EDT}
   if List[i] Is TSpinEdit    Then IniLoadSpinEdit  	(TSpinEdit    (List[i])) Else
{$endif}
   if List[i] Is TLabel       Then IniLoadCaption  	(TLabel       (List[i])) Else
   if List[i] Is TBitBtn      Then IniLoadBitButton  	(TBitBtn      (List[i])) Else
   if List[i] Is TButton      Then IniLoadButton  	(TButton      (List[i])) Else
   if List[i] Is TSpeedButton Then IniLoadSpeedButton  	(TSpeedButton (List[i])) Else
   if List[i] Is TPanel       Then IniLoadPanel 	(TPanel       (List[i])) Else
   if List[i] Is TFrame       Then IniLoadFrame 	(TFrame       (List[i])) Else
   if List[i] Is TStringGrid  Then IniLoadStringGrid    (TStringGrid  (List[i])) Else
   if List[i] Is TOpenDialog  Then IniLoadOpenDialog    (TOpenDialog  (List[i])) Else
   if List[i] Is TShape       Then IniLoadShape         (TShape       (List[i])) Else
   if List[i] Is TImage       Then IniLoadImage         (TImage       (List[i])) Else
   if List[i] Is TGroupBox    Then IniLoadGroupBox      (TGroupBox    (List[i])) Else
   if List[i] Is TControl     Then IniLoadControl       (TControl     (List[i])) Else
   if List[i] Is TComponent   Then ShowMessage('Erreur Load '+TComponent(List[i]).Name+':'+List[i].ClassName) Else
    ShowMessage('Erreur Load '+List[i].ClassName);
  except
   on E:Exception do ShowMessage(Format('Error Loading %s : %s'#13'%s',[TComponent(List[i]).Name,E.ClassName,E.Message]));
  end;
 _ExtSection:=SaveExtSect;
 _TextOnly:=SaveTextOnly;
end;

initialization
 IniFile:=nil;
 IniOpenFile;
finalization
 IniCloseFile;
end.

interface

Uses Forms,classes,IniFiles,StdCtrls,ExtCtrls,Buttons,Grids,Controls,Dialogs,Graphics,ComCtrls,Menus
{$ifdef USE_SPIN_EDT}, Spin{$endif}
;

Type
 TStringListOption=(slUpperCase);
 TStringListOptions=set of TStringListOption;

procedure IniOpenFile(FileName:String='';FilePath:String='');
procedure IniCloseFile;

procedure IniSaveQuotedCaption(Section,Param,Default:String);
function IniLoadQuotedCaption(Section,Param,Default:String):String;

function IniLoadSaveDefaultString(Section,Param,Default:String):String;
function IniLoadSaveDefault(Section,Param,Default:String):String; overload;
function IniLoadSaveDefault(Section,Param:String;Default:Integer):Integer; overload;
function IniLoadSaveDefault(Section,Param:String;Default:Boolean):Boolean; overload;
procedure IniLoadSaveDefaultStringList(Section,Param:String;List:TStringList;Opt:TStringListOptions=[]);

procedure IniLoadMenu(M:TMenu);
procedure IniSaveMenu(M:TMenu);
procedure IniLoadListView(L:TListView);
procedure IniSaveListView(L:TListView);
procedure IniLoadFormPosAndSize(frm:TCustomForm);
procedure IniSaveFormPosAndSize(frm:TCustomForm);
procedure IniLoadCheckBox(chk:TCheckBox);
procedure IniSaveCheckBox(chk:TCheckBox);
procedure IniLoadRadioButton(rb:TRadioButton);
procedure IniSaveRadioButton(rb:TRadioButton);
procedure IniLoadCaption(lbl:TLabel);
procedure IniSaveCaption(lbl:TLabel);
procedure IniLoadText(edt:TCustomEdit);
procedure IniSaveText(edt:TCustomEdit);
procedure IniLoadRadioGroup(rg:TRadioGroup);
procedure IniSaveRadioGroup(rg:TRadioGroup);
procedure IniLoadGroupBox(gb:TGroupBox);
procedure IniSaveGroupBox(gb:TGroupBox);
procedure IniLoadComboBox(cb:TComboBox);
procedure IniSaveComboBox(cb:TComboBox);
{
procedure IniLoadSpinEdit(edt:TSpinEdit);
procedure IniSaveSpinEdit(edt:TSpinEdit);
}
procedure IniLoadButton(btn:TButton);
procedure IniSaveButton(btn:TButton);
procedure IniLoadSpeedButton(btn:TSpeedButton);
procedure IniSaveSpeedButton(btn:TSpeedButton);
procedure IniLoadFormCaption(frm:TForm);
procedure IniSaveFormCaption(frm:TForm);
procedure IniSavePanel(pnl:TPanel);
procedure IniLoadPanel(pnl:TPanel);
procedure IniSaveFrame(pnl:TFrame);
procedure IniLoadFrame(pnl:TFrame);
procedure IniLoadStringGrid(grid:TStringGrid);
procedure IniSaveStringGrid(grid:TStringGrid);
procedure IniLoadShape(shp:TShape);
procedure IniLoadImage(img:TImage);
procedure IniSaveShape(shp:TShape);
procedure IniSaveImage(img:TImage);
procedure IniSaveControl(c:TControl);
procedure IniLoadControl(c:TControl);
procedure IniLoadOpenDialog(dlg:TOpenDialog);
procedure IniSaveOpenDialog(dlg:TOpenDialog);

procedure SetExtendedSection(S:String);
function  GetExtendedSection:String;
function  GetTextOnly:Boolean;
procedure SetTextOnly(b:Boolean);
function TranslateFormat2Text(S:String):String;
function TranslateText2Format(S:String):String;

procedure IniSaveComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
procedure IniLoadComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);

Var
 IniFile:TIniFile;

implementation

Uses SysUtils,untUtils;

Var
 _ExtSection:String='';
 _TextOnly:Boolean=False;

procedure SetExtendedSection(S:String);
begin
 _ExtSection:=S;
end;

function  GetExtendedSection:String;
begin
 Result:=_ExtSection;
end;

function  GetTextOnly:Boolean;
begin
 Result:=_TextOnly;
end;

procedure SetTextOnly(b:Boolean);
begin
 _TextOnly:=b;
end;

function TranslateFormat2Text(S:String):String;
begin
 Result:=StringReplace(S,'%\',#13#10,[rfReplaceAll]);
end;

function TranslateText2Format(S:String):String;
begin
 Result:=StringReplace(S,#13#10,'%\',[rfReplaceAll]);
end;

procedure IniOpenFile(FileName:String='';FilePath:String='');
begin
 IniCloseFile;
 if FileName='' Then FileName:=ChangeFileExt(GetModuleName(hInstance),'.INI');// ChangeFileExt(ParamStr(0),'.INI');
 if (FilePath<>'') Then
  begin
   FilePath:=IncludeTrailingBackslash(FilePath);
   if FileExists(FilePath+FileName) Then FileName:=FilePath+FileName;
  end;
 IniFile:=TIniFile.Create(FileName);
end;

procedure IniCloseFile;
begin
 FreeAndNil(IniFile);
end;

function IniLoadSaveDefaultString(Section,Param,Default:String):String;
begin
 Result:=IniLoadSaveDefault(Section,Param,Default);
end;

procedure IniLoadSaveDefaultStringList(Section,Param:String;List:TStringList;Opt:TStringListOptions=[]);
Var
 i:integer;
begin
 Section:=_ExtSection+Section;
 List.CommaText:=IniFile.ReadString(Section,Param,List.CommaText);
 if slUpperCase In Opt Then
  begin
   List.Sorted:=False;
   for i:=0 to List.Count-1 do List[i]:=UpperCase(List[i]);
   List.Sorted:=True;
  end;
 IniFile.WriteString(Section,Param,List.CommaText);
end;

function IniLoadSaveDefault(Section,Param,Default:String):String; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadString(Section,Param,Default);
 IniFile.WriteString(Section,Param,Result);
end;

function IniLoadSaveDefault(Section,Param:String;Default:Integer):Integer; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadInteger(Section,Param,Default);
 IniFile.WriteInteger(Section,Param,Result);
end;

function IniLoadSaveDefault(Section,Param:String;Default:Boolean):Boolean; overload;
begin
 Section:=_ExtSection+Section;
 Result:=IniFile.ReadBool(Section,Param,Default);
 IniFile.WriteBool(Section,Param,Result);
end;

procedure IniSaveQuotedCaption(Section,Param,Default:String);
begin
 if Trim(Default)<>Default Then Default:=AnsiQuotedStr(Default,'"');
 IniFile.WriteString(_ExtSection+Section,Param,Default);
end;

function IniLoadQuotedCaption(Section,Param,Default:String):String;
Var
 P:PChar;
begin
 Result:=IniFile.ReadString(_ExtSection+Section,Param,Default);
 if (Length(Result)>=2) And (Result[1]='"') Then
  begin
   P:=PChar(Result);
   Result:=AnsiExtractQuotedStr(P,'"');
  end;
end;

procedure IniLoadFormPosAndSize(frm:TCustomForm);
Var
 Section:String;
begin
 Section:=_ExtSection+frm.Name;
 frm.Caption:=IniFile.ReadString(Section,'CAPTION',frm.Caption);
 if Not _TextOnly Then
  begin
   if frm Is TForm Then TForm(frm).Position:=poDesigned;
   frm.Width:=IniFile.ReadInteger(Section,'WIDTH',frm.Width);
   frm.Height:=IniFile.ReadInteger(Section,'HEIGHT',frm.Height);
   frm.Top:=IniFile.ReadInteger(Section,'TOP',frm.Top);
   frm.Left:=IniFile.ReadInteger(Section,'LEFT',frm.Left);
   frm.WindowState:=TWindowState(IniFile.ReadInteger(Section,'STATE',Integer(frm.WindowState)));
  end;
end;

procedure IniSaveFormPosAndSize(frm:TCustomForm);
Var
 Section:String;
begin
 Section:=_ExtSection+frm.Name;
 IniFile.WriteString(Section,'CAPTION',frm.Caption);
 if Not _TextOnly Then
  begin
   IniFile.WriteInteger(Section,'STATE',Integer(frm.WindowState));
   IniFile.WriteInteger(Section,'WIDTH',frm.Width);
   IniFile.WriteInteger(Section,'HEIGHT',frm.Height);
   IniFile.WriteInteger(Section,'TOP',frm.Top);
   IniFile.WriteInteger(Section,'LEFT',frm.Left);
  end;
end;

procedure IniLoadCheckBox(chk:TCheckBox);
begin
 chk.Caption:=IniLoadQuotedCaption(chk.Name,'CAPTION',chk.Caption);
 if Not _TextOnly Then chk.Checked:=IniFile.ReadBool(_ExtSection+chk.Name,'CHECKED',chk.Checked);
end;

procedure IniSaveCheckBox(chk:TCheckBox);
begin
 IniSaveQuotedCaption(chk.Name,'CAPTION',chk.Caption);
 if Not _TextOnly Then IniFile.WriteBool(_ExtSection+chk.Name,'CHECKED',chk.Checked);
end;

procedure IniLoadShape(shp:TShape);
Var
 Section:String;
begin
 with shp do
  begin
   Section:=_ExtSection+Name;
   Visible:=IniFile.ReadBool(Section,'VISIBLE',Visible);
   Pen.Color:=StringToColor(IniFile.ReadString(Section,'PEN_COLOR',ColorToString(Pen.Color)));
   Brush.Color:=StringToColor(IniFile.ReadString(Section,'BRUSH_COLOR',ColorToString(Brush.Color)));
  end;
end;

procedure IniLoadImage(img:TImage);
Var
 F:String;
 Section:String;
begin
 With img do
  try
   Section:=_ExtSection+Name;
   Visible:=IniFile.ReadBool(Section,'VISIBLE',Visible);
   Transparent:=IniFile.ReadBool(Section,'TRANSPARENT',Transparent);
   Stretch:=IniFile.ReadBool(Section,'STRETCH',Stretch);
   F:=IniFile.ReadString(Section,'FILE','');
   if FileExists(F) Then Picture.LoadFromFile(F);
  except
  end;
end;

procedure IniSaveShape(shp:TShape);
Var
 Section:String;
begin
 with shp do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteBool(Section,'VISIBLE',Visible);
   IniFile.WriteString(Section,'PEN_COLOR',ColorToString(Pen.Color));
   IniFile.WriteString(Section,'BRUSH_COLOR',ColorToString(Brush.Color));
  end;
end;

procedure IniSaveImage(img:TImage);
Var
 Section:String;
begin
 With img do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteBool(Section,'VISIBLE',Visible);
   IniFile.WriteBool(Section,'TRANSPARENT',Transparent);
   IniFile.WriteBool(Section,'STRETCH',Stretch);
  end;
end;

procedure IniLoadRadioButton(rb:TRadioButton);
begin
 rb.Caption:=IniLoadQuotedCaption(rb.Name,'CAPTION',rb.Caption);
 if Not _TextOnly Then rb.Checked:=IniFile.ReadBool(_ExtSection+rb.Name,'CHECKED',rb.Checked);
end;

procedure IniSaveRadioButton(rb:TRadioButton);
begin
 IniSaveQuotedCaption(rb.Name,'CAPTION',rb.Caption);
 if Not _TextOnly Then IniFile.WriteBool(_ExtSection+rb.Name,'CHECKED',rb.Checked);
end;

procedure IniLoadText(edt:TCustomEdit);
begin
 edt.Text:=IniLoadQuotedCaption(edt.Name,'TEXT',edt.Text);
end;

procedure IniSaveText(edt:TCustomEdit);
begin
 IniSaveQuotedCaption(edt.Name,'TEXT',edt.Text);
end;

procedure IniLoadCaption(lbl:TLabel);
begin
 lbl.Caption:=IniLoadQuotedCaption(lbl.Name,'CAPTION',lbl.Caption);
end;

procedure IniSaveCaption(lbl:TLabel);
begin
 IniSaveQuotedCaption(lbl.Name,'CAPTION',lbl.Caption);
end;

procedure IniLoadFormCaption(frm:TForm);
begin
 frm.Caption:=IniLoadQuotedCaption(frm.Name,'CAPTION',frm.Caption);
end;

procedure IniSaveFormCaption(frm:TForm);
begin
 IniSaveQuotedCaption(frm.Name,'CAPTION',frm.Caption);
end;

procedure IniLoadButton(btn:TButton);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveButton(btn:TButton);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadBitButton(btn:TBitBtn);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveBitButton(btn:TBitBtn);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadSpeedButton(btn:TSpeedButton);
begin
 btn.Caption:=IniLoadQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniSaveSpeedButton(btn:TSpeedButton);
begin
 IniSaveQuotedCaption(btn.Name,'CAPTION',btn.Caption);
end;

procedure IniLoadRadioGroup(rg:TRadioGroup);
begin
 rg.Caption:=IniLoadQuotedCaption(rg.Name,'CAPTION',rg.Caption);
 if Not _TextOnly Then rg.ItemIndex:=IniFile.ReadInteger(_ExtSection+rg.Name,'INDEX',rg.ItemIndex);
end;

procedure IniSaveRadioGroup(rg:TRadioGroup);
begin
 IniSaveQuotedCaption(rg.Name,'CAPTION',rg.Caption);
 if Not _TextOnly Then IniFile.WriteInteger(_ExtSection+rg.Name,'INDEX',rg.ItemIndex);
end;

procedure IniLoadGroupBox(gb:TGroupBox);
begin
 gb.Caption:=IniLoadQuotedCaption(gb.Name,'CAPTION',gb.Caption);
 if Not _TextOnly Then IniLoadControl(gb);
end;

procedure IniSaveGroupBox(gb:TGroupBox);
begin
 IniSaveQuotedCaption(gb.Name,'CAPTION',gb.Caption);
 if Not _TextOnly Then IniSaveControl(gb);
end;

procedure IniLoadComboBox(cb:TComboBox);
Var
 Str:String;
begin
 Str:=IniLoadQuotedCaption(cb.Name,'TEXT',cb.Text);
 if cb.Style=csDropDownList Then
  begin
   if Str<>'' Then cb.ItemIndex:=cb.Items.IndexOf(Str) Else cb.ItemIndex:=IniFile.ReadInteger(_ExtSection+cb.Name,'INDEX',cb.ItemIndex);
  end Else cb.Text:=Str;
end;

procedure IniSaveComboBox(cb:TComboBox);
begin
 IniSaveQuotedCaption(cb.Name,'TEXT',cb.Text);
 IniFile.WriteInteger(_ExtSection+cb.Name,'INDEX',cb.ItemIndex);
end;

{$ifdef USE_SPIN_EDT}
procedure IniLoadSpinEdit(edt:TSpinEdit);
begin
 edt.Value:=IniFile.ReadInteger(_ExtSection+edt.Name,'VALUE',edt.Value);
end;

procedure IniSaveSpinEdit(edt:TSpinEdit);
begin
 IniFile.WriteInteger(_ExtSection+edt.Name,'VALUE',edt.Value);
end;
{$endif}

procedure IniSavePanel(pnl:TPanel);
begin
 IniFile.WriteInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 IniFile.WriteInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadPanel(pnl:TPanel);
begin
 pnl.Width:=IniFile.ReadInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 pnl.Height:=IniFile.ReadInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniSaveFrame(pnl:TFrame);
begin
 IniFile.WriteInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 IniFile.WriteInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadFrame(pnl:TFrame);
begin
 pnl.Width:=IniFile.ReadInteger(_ExtSection+pnl.Name,'WIDTH',pnl.Width);
 pnl.Height:=IniFile.ReadInteger(_ExtSection+pnl.Name,'HEIGHT',pnl.Height);
end;

procedure IniLoadStringGrid(grid:TStringGrid);
Var
 i:integer;
 Section:String;
begin
 With grid do
  begin
   Section:=_ExtSection+Name;
   grid.ColCount:=IniFile.ReadInteger(Section,'COL_COUNT',grid.ColCount);
   for i:=0 to grid.ColCount-1 do
    begin
     grid.ColWidths[i]:=IniFile.ReadInteger(Section,Format('COL_%d_WIDTH',[i]),grid.ColWidths[i]);
     grid.Cells[i,0]:=IniFile.ReadString(Section,Format('COL_%d_TEXT',[i]),grid.Cells[i,0]);
    end;
  end;
end;

procedure IniSaveStringGrid(grid:TStringGrid);
Var
 i:integer;
 Section:String;
begin
 With grid do
  begin
   Section:=_ExtSection+Name;
   IniFile.WriteInteger(Section,'COL_COUNT',grid.ColCount);
   for i:=0 to grid.ColCount-1 do
    begin
     IniFile.WriteInteger(Section,Format('COL_%d_WIDTH',[i]),grid.ColWidths[i]);
     IniFile.WriteString(Section,Format('COL_%d_TEXT',[i]),grid.Cells[i,0]);
    end;
  end;
end;

procedure IniLoadOpenDialog(dlg:TOpenDialog);
begin
 dlg.InitialDir:=IniLoadQuotedCaption(dlg.Name,'INITIAL_DIR',dlg.InitialDir);
end;

procedure IniSaveOpenDialog(dlg:TOpenDialog);
begin
 IniSaveQuotedCaption(dlg.Name,'INITIAL_DIR',dlg.InitialDir);
end;

procedure IniSaveControl(c:TControl);
begin
 IniFile.WriteInteger(_ExtSection+c.Name,'WIDTH',c.Width);
 IniFile.WriteInteger(_ExtSection+c.Name,'HEIGHT',c.Height);
end;

procedure IniLoadControl(c:TControl);
begin
 c.Width:=IniFile.ReadInteger(_ExtSection+c.Name,'WIDTH',c.Width);
 c.Height:=IniFile.ReadInteger(_ExtSection+c.Name,'HEIGHT',c.Height);
end;

procedure IniLoadListView(L:TListView);
Var
 Section:String;
 i:integer;
begin
 With L do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to Columns.Count - 1 do Columns[i].Caption:=IniFile.ReadString(Section,Format('COLUMN_%d',[i]),Columns[i].Caption);
  end;
end;

procedure IniSaveListView(L:TListView);
Var
 Section:String;
 i:integer;
begin
 With L do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to Columns.Count - 1 do IniFile.WriteString(Section,Format('COLUMN_%d',[i]),Columns[i].Caption);
  end;
end;

procedure IniLoadMenu(M:TMenu);
Var
 Section:String;
 i:integer;

 procedure IniLoadMenuItem(M:TMenuItem;Sect:String);
 Var
  i:integer;
 begin
  Sect:=Sect+'.'+M.Name;
  for i := 0 to M.Count - 1 do if M.Items[i].Caption<>'-' Then
   begin
    M.Items[i].Caption:=IniFile.ReadString(Sect,M.Items[i].Name,M.Items[i].Caption);
    if M.Items[i].Count>0 then IniLoadMenuItem(M.Items[i],Sect);
   end;
 end;
begin
 With M do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to M.Items.Count - 1 do if Items[i].Caption<>'-' Then
    begin
     Items[i].Caption:=IniFile.ReadString(Section,Items[i].Name,Items[i].Caption);
    end;
  end;
end;

procedure IniSaveMenu(M:TMenu);
Var
 Section:String;
 i:integer;
 procedure IniSaveMenuItem(M:TMenuItem;Sect:String);
 Var
  i:integer;
 begin
  Sect:=Sect+'.'+M.Name;
  for i := 0 to M.Count - 1 do if M.Items[i].Caption<>'-' Then
   begin
    IniFile.WriteString(Sect,M.Items[i].Name,M.Items[i].Caption);
    if M.Items[i].Count>0 then IniSaveMenuItem(M.Items[i],Sect);
   end;
 end;
begin
 With M do
  begin
   Section:=_ExtSection+Name;
   for i := 0 to M.Items.Count - 1 do if Items[i].Caption<>'-' Then
    begin
     IniFile.WriteString(Section,Items[i].Name,Items[i].Caption);
     if Items[i].Count>0 then IniSaveMenuItem(Items[i],_ExtSection);
    end;
  end;
end;

procedure IniSaveComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
var
 i:integer;
 SaveExtSect:String;
 SaveTextOnly:Boolean;
begin
 SaveExtSect:=_ExtSection;
 _ExtSection:=Ext_Section;
 SaveTextOnly:=_TextOnly;
 _TextOnly:=TextOnly;
 for i:=Low(List) to High(List) do if Assigned(List[i]) Then
  try
   if List[i] Is TListView    then IniSaveListView      (TListView    (List[i])) Else
   if List[i] Is TMenu        then IniSaveMenu          (TMenu        (List[i])) Else
   if List[i] Is TCustomForm  Then IniSaveFormPosAndSize(TCustomForm  (List[i])) Else
   if List[i] Is TRadioGroup  Then IniSaveRadioGroup    (TRadioGroup  (List[i])) Else
   if List[i] Is TRadioButton Then IniSaveRadioButton   (TRadioButton (List[i])) Else
   if List[i] Is TEdit        Then IniSaveText          (TEdit        (List[i])) Else
   if List[i] Is TCheckBox    Then IniSaveCheckBox      (TCheckBox    (List[i])) Else
   if List[i] Is TComboBox    Then IniSaveComboBox      (TComboBox    (List[i])) Else
{$ifdef USE_SPIN_EDT}
   if List[i] Is TSpinEdit    Then IniSaveSpinEdit  	(TSpinEdit    (List[i])) Else
{$endif}
   if List[i] Is TLabel       Then IniSaveCaption  	(TLabel       (List[i])) Else
   if List[i] Is TBitBtn      Then IniSaveBitButton  	(TBitBtn      (List[i])) Else
   if List[i] Is TButton      Then IniSaveButton  	(TButton      (List[i])) Else
   if List[i] Is TSpeedButton Then IniSaveSpeedButton  	(TSpeedButton (List[i])) Else
   if List[i] Is TPanel       Then IniSavePanel 	(TPanel       (List[i])) Else
   if List[i] Is TFrame       Then IniSaveFrame 	(TFrame       (List[i])) Else
   if List[i] Is TStringGrid  Then IniSaveStringGrid    (TStringGrid  (List[i])) Else
   if List[i] Is TOpenDialog  Then IniSaveOpenDialog    (TOpenDialog  (List[i])) Else
   if List[i] Is TShape       Then IniSaveShape         (TShape       (List[i])) Else
   if List[i] Is TImage       Then IniSaveImage         (TImage       (List[i])) Else
   if List[i] Is TGroupBox    Then IniSaveGroupBox      (TGroupBox    (List[i])) Else
   if List[i] Is TControl     Then IniSaveControl       (TControl     (List[i])) Else
   if List[i] Is TComponent   Then ShowMessage('Erreur Save '+TComponent(List[i]).Name+':'+List[i].ClassName)
    Else ShowMessage('Erreur Save '+List[i].ClassName);
  except
   on E:Exception do ShowMessage(Format('Error Saving %s : %s'#13'%s',[TComponent(List[i]).Name,E.ClassName,E.Message]));
  end;
 _ExtSection:=SaveExtSect;
 _TextOnly:=SaveTextOnly;
end;

procedure IniLoadComponnents(List:Array of TObject;Ext_Section:String='';TextOnly:Boolean=False);
var
 i:integer;
 SaveExtSect:String;
 SaveTextOnly:Boolean;
begin
 SaveExtSect:=_ExtSection;
 _ExtSection:=Ext_Section;
 SaveTextOnly:=_TextOnly;
 _TextOnly:=TextOnly;
 for i:=Low(List) to High(List) do if Assigned(List[i]) Then
  try
   if List[i] Is TListView    then IniLoadListView      (TListView    (List[i])) Else
   if List[i] Is TMenu        then IniLoadMenu          (TMenu        (List[i])) Else
   if List[i] Is TCustomForm  Then IniLoadFormPosAndSize(TCustomForm  (List[i])) Else
   if List[i] Is TRadioGroup  Then IniLoadRadioGroup    (TRadioGroup  (List[i])) Else
   if List[i] Is TRadioButton Then IniLoadRadioButton   (TRadioButton (List[i])) Else
   if List[i] Is TEdit        Then IniLoadText          (TEdit        (List[i])) Else
   if List[i] Is TCheckBox    Then IniLoadCheckBox      (TCheckBox    (List[i])) Else
   if List[i] Is TComboBox    Then IniLoadComboBox      (TComboBox    (List[i])) Else
{$ifdef USE_SPIN_EDT}
   if List[i] Is TSpinEdit    Then IniLoadSpinEdit  	(TSpinEdit    (List[i])) Else
{$endif}
   if List[i] Is TLabel       Then IniLoadCaption  	(TLabel       (List[i])) Else
   if List[i] Is TBitBtn      Then IniLoadBitButton  	(TBitBtn      (List[i])) Else
   if List[i] Is TButton      Then IniLoadButton  	(TButton      (List[i])) Else
   if List[i] Is TSpeedButton Then IniLoadSpeedButton  	(TSpeedButton (List[i])) Else
   if List[i] Is TPanel       Then IniLoadPanel 	(TPanel       (List[i])) Else
   if List[i] Is TFrame       Then IniLoadFrame 	(TFrame       (List[i])) Else
   if List[i] Is TStringGrid  Then IniLoadStringGrid    (TStringGrid  (List[i])) Else
   if List[i] Is TOpenDialog  Then IniLoadOpenDialog    (TOpenDialog  (List[i])) Else
   if List[i] Is TShape       Then IniLoadShape         (TShape       (List[i])) Else
   if List[i] Is TImage       Then IniLoadImage         (TImage       (List[i])) Else
   if List[i] Is TGroupBox    Then IniLoadGroupBox      (TGroupBox    (List[i])) Else
   if List[i] Is TControl     Then IniLoadControl       (TControl     (List[i])) Else
   if List[i] Is TComponent   Then ShowMessage('Erreur Load '+TComponent(List[i]).Name+':'+List[i].ClassName) Else
    ShowMessage('Erreur Load '+List[i].ClassName);
  except
   on E:Exception do ShowMessage(Format('Error Loading %s : %s'#13'%s',[TComponent(List[i]).Name,E.ClassName,E.Message]));
  end;
 _ExtSection:=SaveExtSect;
 _TextOnly:=SaveTextOnly;
end;

initialization
 IniFile:=nil;
 IniOpenFile;
finalization
 IniCloseFile;
end.

