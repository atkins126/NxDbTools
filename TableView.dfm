object frm_TableView: Tfrm_TableView
  Left = 0
  Top = 0
  Caption = 'frm_TableView'
  ClientHeight = 669
  ClientWidth = 1071
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnGetSiteInfo = FormGetSiteInfo
  OnShow = FormShow
  OnStartDock = FormStartDock
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_1: TPanel
    Left = 0
    Top = 582
    Width = 1071
    Height = 87
    Align = alBottom
    Anchors = [akLeft]
    DragKind = dkDock
    TabOrder = 0
    object lbl_FieldTypelabel: TGEMDBLabel
      Left = 422
      Top = 6
      Width = 49
      Height = 13
      Caption = 'Field Type'
      CloseAction = dtnChange
    end
    object lbl_1: TLabel
      Left = 8
      Top = 53
      Width = 64
      Height = 13
      Caption = 'Select Index:'
    end
    object lbl_12: TLabel
      Left = 0
      Top = 34
      Width = 96
      Height = 13
      Caption = 'Number of Records:'
    end
    object lab_Size: TLabel
      Left = 422
      Top = 21
      Width = 6
      Height = 13
      Caption = '0'
    end
    object OvcDbFieldComboBoxLabel1: TOvcAttachedLabel
      Left = 271
      Top = 6
      Width = 136
      Height = 13
      AutoSize = False
      Caption = 'Name of Field for Search:'
      FocusControl = OvcDbFieldComboBox
      Transparent = False
      Control = OvcDbFieldComboBox
    end
    object lbl1: TLabel
      Left = 271
      Top = 45
      Width = 66
      Height = 13
      Caption = 'Enter Search:'
    end
    object lbl2: TLabel
      Left = 543
      Top = 33
      Width = 74
      Height = 13
      Caption = 'Filter for Table:'
    end
    object cbb_IndexComboBox: TComboBox
      Left = 78
      Top = 53
      Width = 145
      Height = 21
      TabOrder = 0
      OnChange = cbb_IndexComboBoxChange
    end
    object btn_EmptyTableBtn: TJvXPButton
      Left = 432
      Top = 62
      Width = 90
      Caption = ' Empty Table'
      TabOrder = 1
      OnClick = btn_EmptyTableBtnClick
    end
    object btn_PackTableBtn: TJvXPButton
      Left = 432
      Top = 35
      Width = 89
      Caption = 'Pack Table'
      TabOrder = 2
      OnClick = btn_PackTableBtnClick
    end
    object OvcDbFieldComboBox: TOvcDbFieldComboBox
      Left = 271
      Top = 19
      Width = 145
      Height = 19
      DataSource = ds_TableDS
      ItemHeight = 13
      LabelInfo.OffsetX = 0
      LabelInfo.OffsetY = 0
      LabelInfo.Visible = True
      TabOrder = 3
      OnChange = OvcDbFieldComboBoxChange
    end
    object JvDBFindEdit: TJvDBFindEdit
      Left = 271
      Top = 60
      Width = 145
      Height = 21
      TabOrder = 4
      Text = 'JvDBFindEdit'
      DataSource = ds_TableDS
    end
    object chk_SetFilter: TCheckBox
      Left = 718
      Top = 30
      Width = 65
      Height = 17
      Caption = 'Set Filter'
      TabOrder = 5
      OnClick = chk_SetFilterClick
    end
    object rzdbnvgtr_1: TRzDBNavigator
      Left = 25
      Top = 6
      Width = 240
      Height = 25
      DataSource = ds_TableDS
      BorderOuter = fsNone
      TabOrder = 6
    end
    object btn_TableFilters: TEsMenuButton
      Left = 864
      Top = 45
      Width = 75
      Height = 24
      Caption = ''
      EsLabelInfo.OffsetX = 0
      EsLabelInfo.OffsetY = 0
      EsLabelInfo.Visible = False
      Glyph.Data = {
        32010000424D3201000000000000360000002800000009000000070000000100
        200000000000FC00000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
        0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
        00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
        0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      PopupMenu = pm_TableFilters
      TabOrder = 7
    end
    object edt_MasterTableFilter: TRzEdit
      Left = 541
      Top = 49
      Width = 317
      Height = 21
      Text = ''
      TabOrder = 8
    end
  end
  object pgc_TableInfo: TPageControl
    Left = 0
    Top = 0
    Width = 1071
    Height = 582
    ActivePage = ts_Grid
    Align = alClient
    MultiLine = True
    TabOrder = 1
    TabPosition = tpLeft
    object ts_Grid: TTabSheet
      Caption = 'Data Grid'
      object rzdbgrd_1: TRzDBGrid
        Left = 0
        Top = 0
        Width = 1043
        Height = 574
        Align = alClient
        DataSource = ds_TableDS
        FixedColor = clInactiveCaptionText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FrameColor = 12164479
        FrameVisible = True
        FixedLineColor = 12164479
        LineColor = clInactiveCaption
        AltRowShading = True
      end
    end
    object ts_FieldDescriptors: TTabSheet
      Caption = 'Field Descriptors'
      ImageIndex = 1
      object lv_FieldDescrip: TRzListView
        Left = 0
        Top = 0
        Width = 1043
        Height = 574
        Align = alClient
        Color = clGradientActiveCaption
        Columns = <
          item
            AutoSize = True
            Caption = 'Field Num'
          end
          item
            AutoSize = True
            Caption = 'Field Name'
          end
          item
            AutoSize = True
            Caption = 'Data Type'
          end
          item
            AutoSize = True
            Caption = 'Size'
          end
          item
            AutoSize = True
            Caption = 'Required'
          end>
        GridLines = True
        Items.ItemData = {}
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object ts_IndexDescriptors: TTabSheet
      Caption = 'Index Descriptors'
      ImageIndex = 2
      object lv_IndexDescrips: TRzListView
        Left = 0
        Top = 0
        Width = 1043
        Height = 574
        Align = alClient
        Color = 16776176
        Columns = <
          item
            AutoSize = True
            Caption = 'Index Name'
          end
          item
            AutoSize = True
            Caption = 'Fields'
          end
          item
            AutoSize = True
            Caption = 'Description'
          end>
        GridLines = True
        Items.ItemData = {}
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object nxTable: TnxTable
    Database = dm_DataMod.nxDatabase
    Left = 232
    Top = 48
  end
  object ds_TableDS: TJvDataSource
    DataSet = nxTable
    Left = 240
    Top = 120
  end
  object adpmr_TableFilters: TadpMRU
    GroupIndex = 0
    MaxItems = 0
    ParentMenuItem = mni_RecentFilters
    UseIniFile = False
    Version = 'GEM Components: 1.2'
    OnClick = adpmr_TableFiltersClick
    Left = 752
    Top = 260
  end
  object pm_TableFilters: TPopupMenu
    Left = 752
    Top = 316
    object mni_RecentFilters: TMenuItem
      Caption = 'Recent Filters'
    end
    object mni_Close1: TMenuItem
      Caption = 'Close'
    end
  end
end
