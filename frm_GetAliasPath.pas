unit frm_GetAliasPath;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvBaseDlg,
  JvSelectDirectory, Vcl.Buttons, JvComponentBase, JvFormPlacement;

type
  TAliasPath = class(TForm)
    lbl_Alias: TLabel;
    lbl_theAlias: TLabel;
    lbl_thePath: TLabel;
    edt_Alias: TEdit;
    edt_Path: TEdit;
    jvslctdrctry_Folder: TJvSelectDirectory;
    btn_BrowseFolder: TButton;
    btn_Ok: TBitBtn;
    btn_Cancel: TBitBtn;
    procedure btn_BrowseFolderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DbFolderAlias: string;
    function Execute: Boolean;
  end;

var
  AliasPath: TAliasPath;

implementation
uses
  NxToolsMain, MSspecialFolders;

{$R *.dfm}


procedure TAliasPath.btn_BrowseFolderClick(Sender: TObject);
begin
  DbFolderAlias := '';
  edt_Alias.Text := StringReplace(edt_Alias.Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  if jvslctdrctry_Folder.Execute then begin
    edt_Path.Text := jvslctdrctry_Folder.Directory;
    DbFolderAlias := edt_Alias.Text + ' ('+ jvslctdrctry_Folder.Directory+')';
  end;
end;


function TAliasPath.Execute: Boolean;
begin
  Result := (ShowModal = mrOK);
end;


procedure TAliasPath.FormCreate(Sender: TObject);
begin
  DbFolderAlias := '';
  jvslctdrctry_Folder.InitialDir := getWinSpecialFolder(CSIDL_PERSONAL, false);
end;


end.
