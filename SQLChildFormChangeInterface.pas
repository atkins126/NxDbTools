unit SQLChildFormChangeInterface;

interface

uses
  Global, VCL.Graphics;
{$REGION 'REFRENCE'}{
Gajic, Zarko. "Interfaces in Delphi
Programming 101." ThoughtCo, Jan. 29, 2020,
 thoughtco.com/interfaces-in-delphi-programming-101-1058278.
}{$ENDREGION}
type
  IConfigChanged = interface['{C601D750-8346-477A-99BB-4A1C0B0F2506}']
    procedure ApplyConfigChange(aFontStuff: TFontStuff);
  end;

implementation

end.
