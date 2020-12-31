unit FontStuffTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SBPro, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StatusBarPro1: TStatusBarPro;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fForeColor: TColor;
    fBackColor: TColor;
    ffFontStyles: TFontStyles;
  public
    { Public declarations }
    property fFontStyles: TFontStyles read ffFontStyles write ffFontStyles;
    property ForeColor: TColor read fForeColor write fForeColor;
    property BackColor: TColor read fBackColor write fBackColor;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  StatusBarPro1.Panels[0].Color := fBackColor;
  StatusBarPro1.Panels[0].Font.Style := ffFontStyles;
  StatusBarPro1.Panels[0].Font.Color := fForeColor;

  StatusBarPro1.Panels[0].Text := 'Back Color';


  StatusBarPro1.Panels[1].Color := fBackColor;
  StatusBarPro1.Panels[1].Font.Color := fForeColor;
  StatusBarPro1.Panels[1].Font.Style := ffFontStyles;

  StatusBarPro1.Panels[1].Text := 'Fore Color';

end;

end.
