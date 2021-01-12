unit Dimmer;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TDimmerForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Display(const dimForm : TForm);
  end;

var
  DimmerForm: TDimmerForm;

implementation

{$R *.dfm}

procedure TDimmerForm.Display(const dimForm: TForm);
begin
  with Self do
  begin
    Left := dimForm.Left;
    Top := dimForm.Top;
    Width := dimForm.Width;
    Height := dimForm.Height;

    Show;
  end;end;

procedure TDimmerForm.FormCreate(Sender: TObject);
begin
  AlphaBlend := true;
  AlphaBlendValue := 128;
  BorderStyle := bsNone;
end;

end.
