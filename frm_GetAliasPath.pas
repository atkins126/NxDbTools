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
    fAlias: string;
    fAliasPath: string;
    function IsNx1FileInFolder(aAliasFolder: string): Boolean;
  public
    { Public declarations }
    DbFolderAliasMsg: string;
    function Execute: Boolean;
    property Alias: string read fAlias;
    property AliasPath: string read fAliasPath;

  end;

var
  AliasPath: TAliasPath;

implementation
uses
  NxToolsMain, MSspecialFolders, GEMUseFullRoutines;

{$R *.dfm}


procedure TAliasPath.btn_BrowseFolderClick(Sender: TObject);
begin
  DbFolderAliasMsg := '';
  edt_Alias.Text := StringReplace(edt_Alias.Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  if jvslctdrctry_Folder.Execute then begin
    edt_Path.Text := jvslctdrctry_Folder.Directory;
    if IsNx1FileInFolder(edt_Path.Text) then
    begin
      fAlias := edt_Alias.Text;
      fAliasPath := jvslctdrctry_Folder.Directory;
//      DbFolderAlias := edt_Alias.Text + '|'+ jvslctdrctry_Folder.Directory
    end
    else
      DbFolderAliasMsg := 'Error: No ''nx1'' files in folder';
  end;
end;


function TAliasPath.Execute: Boolean;
begin
  Result := (ShowModal = mrOK);
end;


procedure TAliasPath.FormCreate(Sender: TObject);
begin
  DbFolderAliasMsg := '';
  jvslctdrctry_Folder.InitialDir := getWinSpecialFolder(CSIDL_PERSONAL, false);
end;


function TAliasPath.IsNx1FileInFolder(aAliasFolder: string): Boolean;
begin
  result := False;
  if DirectoryExists(aAliasFolder) then
  begin
    if CountFilesInFolder( ExtractFilePath(aAliasFolder), 'nx1' ) < 1 then
    begin
      if (MessageDlg('There are not files ending in ''nx1'' '+#10+#13+
                     ' in the folder. Use the folder anyway?',
             mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrCancel, mrNone]) then
      begin
        result := true;
      end;
    end
    else
      Result := true;
  end;
end;

end.
