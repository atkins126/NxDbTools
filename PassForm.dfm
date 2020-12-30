object frm_Password: Tfrm_Password
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Password'
  ClientHeight = 97
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 474
    Height = 97
    ControlCollection = <
      item
        Control = edit_Password
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = Label1
        AlignVerticalCenterWithPanel = False
        RightOf = Label1
      end
      item
        Control = bbt_OK
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = bbt_Cancel
        AlignVerticalCenterWithPanel = False
        LeftOf = bbt_Cancel
      end
      item
        Control = bbt_Cancel
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWith = edit_Password
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = edit_Password
      end
      item
        Control = Label1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = cb_ShowHidePassword
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWith = edit_Password
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = edit_Password
      end>
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitHeight = 156
    DesignSize = (
      474
      97)
    object edit_Password: TEdit
      AlignWithMargins = True
      Left = 41
      Top = 30
      Width = 424
      Height = 21
      Anchors = []
      HideSelection = False
      TabOrder = 0
      Text = 'fgdfdsg'
    end
    object bbt_OK: TBitBtn
      AlignWithMargins = True
      Left = 309
      Top = 57
      Width = 75
      Height = 25
      Anchors = []
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
    end
    object bbt_Cancel: TBitBtn
      AlignWithMargins = True
      Left = 390
      Top = 57
      Width = 75
      Height = 25
      Anchors = []
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 31
      Height = 13
      Anchors = []
      Caption = 'Label1'
    end
    object cb_ShowHidePassword: TCheckBox
      Left = 41
      Top = 54
      Width = 97
      Height = 17
      Anchors = []
      Caption = 'Show Password'
      TabOrder = 3
      OnClick = cb_ShowHidePasswordClick
    end
  end
end
