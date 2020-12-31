unit PassForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.WinXCtrls;

type
  Tfrm_Password = class(TForm)
    RelativePanel1: TRelativePanel;
    edit_Password: TEdit;
    bbt_OK: TBitBtn;
    bbt_Cancel: TBitBtn;
    Label1: TLabel;
    cb_ShowHidePassword: TCheckBox;
    procedure cb_ShowHidePasswordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fHidePass: Boolean;
    fPW      : string;
  public
    { Public declarations }
    function Execute: boolean;
    property HidePass: boolean read fHidePass write fHidePass;
    property PW: string read fPW write fPW;
  end;

var
  frm_Password: Tfrm_Password;

implementation

{$R *.dfm}


procedure Tfrm_Password.cb_ShowHidePasswordClick(Sender: TObject);
begin
  if cb_ShowHidePassword.checked then
    edit_Password.PasswordChar := '*'
  else
    edit_Password.PasswordChar := #0;
end;

function Tfrm_Password.Execute: boolean;
begin
  Result := (ShowModal = mrOK);
//  PW := edit_Password.Text;
end;

procedure Tfrm_Password.FormShow(Sender: TObject);
begin
  cb_ShowHidePassword.Checked := HidePass;
  cb_ShowHidePasswordClick(Sender);
end;

end.
