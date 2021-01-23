object GetServersAlias: TGetServersAlias
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Local Alias and Paths'
  ClientHeight = 590
  ClientWidth = 544
  Color = clAppWorkSpace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object jvpnl_TopPanel: TJvPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl_SelectServerType: TLabel
      Left = 17
      Top = 12
      Width = 123
      Height = 20
      Caption = 'Select Server Type:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ts_LocalOrNetworked: TToggleSwitch
      Left = 153
      Top = 12
      Width = 185
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StateCaptions.CaptionOn = 'Networked Project Db'
      StateCaptions.CaptionOff = 'Local Project Db'
      TabOrder = 0
      OnClick = ts_LocalOrNetworkedClick
    end
  end
  object jvtbr_DbBar: TJvTabBar
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 538
    Height = 29
    Cursor = crHandPoint
    Hint = ''
    CloseButton = False
    RightClickSelect = False
    FlatScrollButtons = False
    PageListTabLink = True
    PageList = pglst_LocalNetworkPages
    Painter = jvmdrntbrpntr__1
    Tabs = <
      item
        Caption = 'Local Project Database'
        Selected = True
      end
      item
        Caption = 'Networked Project Database'
      end>
    ExplicitWidth = 532
  end
  object pglst_LocalNetworkPages: TJvPageList
    Left = 0
    Top = 76
    Width = 544
    Height = 443
    ActivePage = jvsp_NetworkDb
    PropagateEnable = True
    Align = alClient
    OnChange = pglst_LocalNetworkPagesChange
    ExplicitWidth = 538
    ExplicitHeight = 390
    object jvsp_LocalDb: TJvStandardPage
      Left = 0
      Top = 0
      Width = 544
      Height = 443
      Caption = 'jvsp_LocalDb'
      ExplicitWidth = 538
      ExplicitHeight = 390
      object lbl_Alias1: TLabel
        Left = 17
        Top = 24
        Width = 35
        Height = 20
        Caption = 'Alias:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbl_DatabasePath: TLabel
        Left = 17
        Top = 64
        Width = 98
        Height = 20
        Caption = 'Database Path:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edt_LocalAlias: TEdit
        Left = 55
        Top = 21
        Width = 121
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edt_DbPath: TEdit
        Left = 8
        Top = 90
        Width = 472
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btn__GetPrjPath: TJvXPButton
        Left = 486
        Top = 84
        Width = 55
        Height = 34
        TabOrder = 2
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000001
          BA4944415478DAED963D48425114C7FFE7F950D15430D33E30FB149A531B92A0
          252868AB68EA6B120A9A9A9A5A9AA2ADC1A182B66C0D6A2B32A2A531D2B19686
          8602A9C1A2DB7981A0F0DE53E15DDEE2810BF7BCF7EEFDFFCE79E77E106C366A
          01B400AA1D71081F14ACF3D334BB2EDD110A766809B79603882BA878C63D7747
          EB8C2941608A56FFBFB510E084A3FE45BEC1715FDCA6690537D6011C639EBD9C
          1551E9D83BB74B0E7093D6F066074045ED8C96B1601F00D70FFF36BF9D006080
          9A95571FC0EF03C21D80D36915C32BCBE6A078B628F1F06D0EE062D1C17E48DA
          AFB62855D83307080539FAB00C712DA80B4A3DCD9803F47403017FD3533766E2
          9452C54573002DFD2E57D3533796006C53B2B06B0C40FC6A240E69E795C02C8D
          15CE8D01DC6E60A04F8EB8668A234689C717638040806BA04B92BAF840B218E4
          240B63804EAEFE605016409E0B7042EB1903C4A280D72B090007BC076C9803C4
          8701D521479E90E115903506505506189215BD66E39C81BB5A80EA0B491BA7BE
          372A4BBC8CB20851BA58AA05A8BE92B573F145246DC102595EFF998AAB7F290D
          87E6E0F544AC15A64F38D52394A3FB3479FDA30B6087B5005A007FE80B7F2132
          5E32C60000000049454E44AE426082}
        OnClick = btn__GetPrjPathClick
      end
    end
    object jvsp_NetworkDb: TJvStandardPage
      Left = 0
      Top = 0
      Width = 544
      Height = 443
      Caption = 'jvsp_LocalDb'
      ExplicitWidth = 538
      ExplicitHeight = 390
      object lbl_Servers: TLabel
        Left = 25
        Top = 13
        Width = 88
        Height = 20
        Caption = 'Select Server:'
      end
      object lbl_Alias: TLabel
        Left = 305
        Top = 13
        Width = 79
        Height = 20
        Caption = 'Select Alias:'
      end
      object lbl_Issues: TLabel
        Left = 25
        Top = 236
        Width = 41
        Height = 20
        Caption = 'Issues:'
      end
      object lst_Servers: TJvListBox
        Left = 25
        Top = 32
        Width = 233
        Height = 187
        ItemHeight = 20
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 0
        OnClick = lst_ServersClick
      end
      object lst_Alias: TJvListBox
        Left = 301
        Top = 32
        Width = 225
        Height = 187
        ItemHeight = 20
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 1
        OnClick = lst_AliasClick
      end
      object mmo_IssuesMemo: TMemo
        Left = 14
        Top = 263
        Width = 512
        Height = 145
        Color = 14680062
        Lines.Strings = (
          'mmo_IssuesMemo')
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object jvpnl_FooterPanel: TJvPanel
    Left = 0
    Top = 519
    Width = 544
    Height = 71
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 466
    ExplicitWidth = 538
    object lbl_SelectedItems: TLabel
      Left = 17
      Top = 3
      Width = 36
      Height = 20
      Caption = 'None'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object bbt_OK: TBitBtn
      AlignWithMargins = True
      Left = 17
      Top = 29
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbt_OKClick
    end
    object bbt_Cancel: TBitBtn
      AlignWithMargins = True
      Left = 98
      Top = 30
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object jvmdrntbrpntr__1: TJvModernTabBarPainter
    TabColor = clMedGray
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clGrayText
    DisabledFont.Height = -12
    DisabledFont.Name = 'Tahoma'
    DisabledFont.Style = []
    SelectedFont.Charset = DEFAULT_CHARSET
    SelectedFont.Color = clWindowText
    SelectedFont.Height = -15
    SelectedFont.Name = 'Tahoma'
    SelectedFont.Style = []
    Left = 240
    Top = 409
  end
  object JvSelectDirectory1: TJvSelectDirectory
    Left = 332
    Top = 392
  end
end
