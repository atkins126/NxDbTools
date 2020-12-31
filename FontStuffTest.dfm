object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 336
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBarPro1: TStatusBarPro
    Left = 0
    Top = 296
    Width = 278
    Height = 40
    Panels = <
      item
        Text = 'Font text'
        Width = 150
      end
      item
        Text = 'Font text'
        Width = 50
      end>
    SimplePanel = False
    WordWrap = False
  end
  object Button1: TButton
    Left = 72
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
