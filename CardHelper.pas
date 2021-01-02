unit CardHelper;

interface
uses
  Winapi.Windows,

 Vcl.WinXPanels;

type
  TCard = class(Vcl.WinXPanels.TCard)
  private
    fFormWidth: integer;
    fFormHeight: Integer;
  public
    property FormWidth: Integer read fFormWidth write fFormWidth;
    property FormHeight: Integer read fFormHeight write fFormHeight;
  end;

implementation

end.
