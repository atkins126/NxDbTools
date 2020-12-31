object AliasPath: TAliasPath
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Get Alias and Path'
  ClientHeight = 166
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Alias: TLabel
    Left = 8
    Top = 8
    Width = 345
    Height = 39
    Caption = 
      'The Path below is relative to the machine that the nxServer exec' +
      'utable runs on.  If nxServer is on a different machine, then add' +
      'ing alias and path will not work.'
    WordWrap = True
  end
  object lbl_theAlias: TLabel
    Left = 8
    Top = 80
    Width = 26
    Height = 13
    Caption = 'Alias:'
  end
  object lbl_thePath: TLabel
    Left = 8
    Top = 107
    Width = 26
    Height = 13
    Caption = 'Path:'
  end
  object edt_Alias: TEdit
    Left = 40
    Top = 77
    Width = 321
    Height = 21
    TabOrder = 0
  end
  object edt_Path: TEdit
    Left = 40
    Top = 104
    Width = 321
    Height = 21
    TabOrder = 1
  end
  object btn_BrowseFolder: TButton
    Left = 376
    Top = 105
    Width = 75
    Height = 25
    Caption = 'Browse...'
    TabOrder = 2
    OnClick = btn_BrowseFolderClick
  end
  object btn_Ok: TBitBtn
    Left = 295
    Top = 136
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object btn_Cancel: TBitBtn
    Left = 376
    Top = 136
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object jvslctdrctry_Folder: TJvSelectDirectory
    Left = 400
    Top = 16
  end
end
