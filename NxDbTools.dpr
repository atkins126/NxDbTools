// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
program NxDbTools;

uses
  Vcl.Forms,
  TableView in 'TableView.pas' {frm_TableView},
  SQLView in 'SQLView.pas' {frm_SQLView},
  floating in 'floating.pas' {FloatingForm},
  about in 'about.pas' {AboutBox},
  amSplitter in 'amSplitter.pas',
  Global in 'Global.pas',
  Vcl.Themes,
  Vcl.Styles,
  DockDemo.Utilities in 'DockDemo.Utilities.pas',
  DataMod in 'DataMod.pas' {dm_DataMod: TDataModule},
  frm_GetAliasPath in 'frm_GetAliasPath.pas' {AliasPath},
  GetPrjList in 'GetPrjList.pas' {frm_SelectProject},
  NxToolsMain in 'NxToolsMain.pas' {frm_NxToolsMain},
  EditAddDelSQL in 'EditAddDelSQL.pas' {EditAddDelSQLBtns},
  Dimmer in 'Dimmer.pas' {DimmerForm},
  PassForm in 'PassForm.pas' {frm_Password},
  MoveResizeComponents in 'MoveResizeComponents.pas' {frm_MoveResizeComponents},
  SQLChildFormChangeInterface in 'SQLChildFormChangeInterface.pas',
  FontStuffTest in 'FontStuffTest.pas' {Form1},
  NxDbToolsDbEvolution_1 in 'NxDbToolsDbEvolution_1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_NxToolsMain, frm_NxToolsMain);
  Application.CreateForm(Tdm_DataMod, dm_DataMod);
  Application.CreateForm(TAliasPath, AliasPath);
  Application.CreateForm(Tfrm_SelectProject, frm_SelectProject);
  Application.CreateForm(TEditAddDelSQLBtns, EditAddDelSQLBtns);
  Application.CreateForm(TDimmerForm, DimmerForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(Tfrm_MoveResizeComponents, frm_MoveResizeComponents);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.



