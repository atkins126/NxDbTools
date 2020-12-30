unit floating;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes,

  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, Vcl.ExtCtrls,

  ovcbase, ovcsplit;

type
  TFloatingForm = class(TForm)
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClickImage(Sender: TObject);
  private
    fNoFloatParent   : TWinControl;
    fSetFloatControl : TControl;
    fExitControl     : TImage;

    fOnBeforeDock    : TNotifyEvent;
    fOnAfterDock     : TNotifyEvent;
    fOnBeforeFloat   : TNotifyEvent;
    fOnAfterFloat    : TNotifyEvent;
    fOnDestroyFloat  : TNotifyEvent;
    fOnShowFloat     : TNotifyEvent;

    fSplitterWidth   : integer;
  public
    procedure CreateParams (var Params: TCreateParams); override;

    constructor Create(AOwner : TComponent; const noFloatParent : TWinControl;
                       const SetFloatControl: TControl; ExitControl: TImage); reintroduce;
    //destructor FormDestroy(Sender: TObject);

    procedure Float;

    property OnBeforeDock   : TNotifyEvent read fOnBeforeDock write fOnBeforeDock;
    property OnAfterDock    : TNotifyEvent read fOnAfterDock write fOnAfterDock;
    property OnBeforeFloat  : TNotifyEvent read fOnBeforeFloat write fOnBeforeFloat;
    property OnAfterFloat   : TNotifyEvent read fOnAfterFloat write fOnAfterFloat;
    property OnDestroyFloat : TNotifyEvent read fOnDestroyFloat write fOnDestroyFloat;
    property OnShowFloat    : TNotifyEvent read fOnShowFloat write fOnShowFloat;
    property SplitterPos    : Integer read fSplitterWidth write fSplitterWidth;
  end;

implementation
{$R *.dfm}

procedure TFloatingForm.ClickImage(Sender: TObject);
begin
  Close;
end;

constructor TFloatingForm.Create(AOwner: TComponent; const noFloatParent : TWinControl;
                                 const setFloatControl: TControl; ExitControl: TImage);
//constructor TFloatingForm.Create(AOwner: TComponent; const noFloatParent : TWinControl);
begin
  fNoFloatParent       := noFloatParent;
  fSetFloatControl     := setFloatControl;
  fExitControl         := ExitControl;
  fExitControl.OnClick := ClickImage;

  //Self.Visible := False;
  inherited Create(AOwner);
end;



procedure TFloatingForm.FormDeactivate(Sender: TObject);
begin
  if Assigned(fOnDestroyFloat) then
    fOnDestroyFloat(self);
  //inherited;
end;


procedure TFloatingForm.FormDestroy(Sender: TObject);
begin
  if Assigned(fOnDestroyFloat) then
    fOnDestroyFloat(self);
end;


procedure TFloatingForm.FormShow(Sender: TObject);
begin
  if Assigned(fOnShowFloat) then begin
    fOnShowFloat(self);
  end;
end;


procedure TFloatingForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  //desktop button
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;


procedure TFloatingForm.Float;
var
  cnt : integer;
begin
  if Visible then
    Exit; //already floating
  //fSetFloatControl.
  fSetFloatControl.Visible := false;

  if Assigned(fOnBeforeFloat) then
    fOnBeforeFloat(self);

  for cnt := -1 + fNoFloatParent.ControlCount downto 0 do begin
    fNoFloatParent.Controls[cnt].Parent := self;

  end;

  Visible := true;

  if Assigned(fOnAfterFloat) then
    fOnAfterFloat(self);
end;


procedure TFloatingForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  cnt : integer;
begin
  if Assigned(fOnBeforeDock) then
    fOnBeforeDock(self);

  for cnt:= -1 + ControlCount downto 0 do begin
    Controls[cnt].Parent := fNoFloatParent;
  end;

  fSetFloatControl.Visible := true;

  if Assigned(fOnAfterDock) then
    fOnAfterDock(self);

  //form is hidden by default (Action = caHide on OnClose)
end;

end.
