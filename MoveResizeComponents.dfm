object frm_MoveResizeComponents: Tfrm_MoveResizeComponents
  Left = 0
  Top = 0
  Caption = 'frm_MoveResizeComponents'
  ClientHeight = 720
  ClientWidth = 1130
  Color = clBtnFace
  Constraints.MinHeight = 606
  Constraints.MinWidth = 877
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1130
    720)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 733
    Top = -11
    Width = 41
    Height = 13
    Caption = 'Button 2'
  end
  object Label2: TLabel
    Left = 904
    Top = -11
    Width = 26
    Height = 13
    Caption = 'Panel'
  end
  object gmshpbtn: TgemShapeBtn
    Left = 222
    Top = 147
    Width = 68
    Height = 49
    ShapeStyle.TextStyle = txNone
    ShapeStyle.LineColor = clGray
    ShapeStyle.LineStyle = fmRelief
    ShapeStyle.LineWidth = 3
    ShapeStyle.FillColor = clBtnFace
    ShapeStyle.ShadowColor = clBlue
    ShapeStyle.XRadius = 5
    ShapeStyle.YRadius = 5
    ShapeStyle.MouseDownLuma = 35
    Shape = drLeftArrow
    Border = True
    Action = act_MoveBtnRtL
    Caption = 'Move Btn'
  end
  object lbl2: TLabel
    Left = 225
    Top = 105
    Width = 73
    Height = 39
    Caption = 'Move Selected Btn to This Panel'
    WordWrap = True
  end
  object rzrlbl_UrlHelp: TRzURLLabel
    Left = 813
    Top = 43
    Width = 134
    Height = 23
    Caption = 'rzrlbl_UrlHelp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object gmshpbtnMoveBtn: TgemShapeBtn
    Left = 225
    Top = 224
    Width = 68
    Height = 49
    ShapeStyle.TextStyle = txNone
    ShapeStyle.LineColor = clGray
    ShapeStyle.LineStyle = fmRelief
    ShapeStyle.LineWidth = 3
    ShapeStyle.FillColor = clBtnFace
    ShapeStyle.ShadowColor = clBlue
    ShapeStyle.XRadius = 5
    ShapeStyle.YRadius = 5
    ShapeStyle.MouseDownLuma = 35
    Shape = drRightArrow
    Border = True
    Action = act_MoveBtnLtR
  end
  object Label6: TLabel
    Left = 540
    Top = 334
    Width = 48
    Height = 26
    Alignment = taRightJustify
    Caption = 'Long SQL code:'
    WordWrap = True
  end
  object Label7: TLabel
    Left = 555
    Top = 56
    Width = 92
    Height = 13
    Caption = 'Search on Caption:'
  end
  object chkPositionRunTime: TCheckBox
    Left = 176
    Top = 61
    Width = 165
    Height = 17
    Action = act_EditAndPostion
    Caption = 'Allow Edit Of Buttons'
    TabOrder = 0
    OnClick = chkPositionRunTimeClick
  end
  object StatusBarPro1: TStatusBarPro
    Left = 0
    Top = 680
    Width = 1130
    Height = 40
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    SimplePanel = False
    WordWrap = False
  end
  object RzPanel1: TRzPanel
    Tag = 1
    Left = 8
    Top = 84
    Width = 216
    Height = 366
    Anchors = [akLeft, akTop, akBottom]
    GridXSize = 5
    GridYSize = 25
    TabOrder = 2
    OnPaint = RzPanel1Paint
  end
  object btn_GetButtonsOldDb: TButton
    Left = 6
    Top = 53
    Width = 144
    Height = 25
    Caption = 'Get buttons Db'
    TabOrder = 3
    OnClick = btn_GetButtonsOldDbClick
  end
  object grp_DefSQLBtns: TGroupBox
    Left = 6
    Top = 456
    Width = 637
    Height = 218
    Anchors = [akLeft, akBottom]
    Caption = 'Button Defaults:'
    Color = clGradientInactiveCaption
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label5: TLabel
      Left = 10
      Top = 53
      Width = 283
      Height = 13
      Caption = 'Click btn or btn definition in data grid to dispaly btn results:'
    end
    object RzURLLabel1: TRzURLLabel
      Left = 360
      Top = 128
      Width = 62
      Height = 13
      Caption = 'RzURLLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object synm_SQLBtnTest: TSynMemo
      Left = 3
      Top = 72
      Width = 606
      Height = 137
      Color = 14024701
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      CodeFolding.CollapsedLineColor = clGrayText
      CodeFolding.FolderBarLinesColor = clGrayText
      CodeFolding.ShowCollapsedLine = False
      CodeFolding.IndentGuidesColor = clGray
      CodeFolding.IndentGuides = True
      UseCodeFolding = False
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Lines.Strings = (
        'Click Button diffinition, result '
        'displayed here.')
      ReadOnly = True
      FontSmoothing = fsmNone
    end
  end
  object RzPanel2: TRzPanel
    Tag = 2
    Left = 296
    Top = 84
    Width = 238
    Height = 366
    Anchors = [akLeft, akTop, akBottom]
    GridXSize = 5
    GridYSize = 25
    TabOrder = 5
    OnPaint = RzPanel1Paint
  end
  object btn_SaveSqlButtons: TButton
    Left = 362
    Top = 53
    Width = 144
    Height = 25
    Caption = 'Save Btns Db'
    TabOrder = 6
    OnClick = btn_SaveSqlButtonsClick
  end
  object dbmmo1: TDBMemo
    Left = 594
    Top = 334
    Width = 528
    Height = 85
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SqlCode'
    DataSource = dm_DataMod.ds_NSqlBtnsT
    TabOrder = 7
  end
  object jvdbltmgrd_1: TJvDBUltimGrid
    Left = 540
    Top = 72
    Width = 583
    Height = 256
    Anchors = [akLeft, akTop, akRight]
    DataSource = dm_DataMod.ds_NSqlBtnsT
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = jvdbltmgrd_1CellClick
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <
      item
        ControlName = 'DBSynEdit1'
        FieldName = 'SqlCode'
        FitCell = fcBiggest
        LeaveOnEnterKey = True
        LeaveOnUpDownKey = True
      end>
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'BtnId'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PanelNum'
        Title.Caption = 'Panel Num'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BtnTop'
        Title.Caption = 'Btn Top'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BtnLeft'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BtnWidth'
        Title.Caption = 'Btn Width'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caption'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ExtraText'
        Title.Caption = 'Extra Text'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SqlCode'
        Title.Caption = 'Code Template Placed in Editor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CursorBeforeThisChar'
        Title.Caption = 'Cursor Before This Char'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SpaceAfterCursor'
        Title.Caption = 'Space After Cursor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UseExtendedSql'
        Title.Caption = 'Use Extended Sql'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hints'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NexusDbHelpUrl'
        Title.Caption = 'Nexus Db Help Url'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AddToEditorFunctionList'
        Title.Caption = 'Add Editor Function List'
        Visible = True
      end>
  end
  object jvdbnvgtr_1: TJvDBNavigator
    Left = 594
    Top = 425
    Width = 240
    Height = 25
    DataSource = dm_DataMod.ds_NSqlBtnsT
    TabOrder = 9
  end
  object SplitView1: TSplitView
    Left = 0
    Top = 41
    Width = 0
    Height = 639
    Opened = False
    OpenedWidth = 400
    Placement = svpLeft
    TabOrder = 10
    object JvPageControl2: TJvPageControl
      Left = 48
      Top = 24
      Width = 352
      Height = 577
      ActivePage = TabSheet2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object JvPageControl1: TJvPageControl
          Left = 14
          Top = 36
          Width = 321
          Height = 489
          ActivePage = TabSheet4
          TabOrder = 0
          object TabSheet3: TTabSheet
            Caption = 'TabSheet1'
          end
          object TabSheet4: TTabSheet
            Caption = 'TabSheet2'
            ImageIndex = 1
            object BtnJVPanel: TJvPanel
              Left = 34
              Top = -3
              Width = 279
              Height = 464
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object JvDBSearchEdit1: TJvDBSearchEdit
    Left = 653
    Top = 45
    Width = 121
    Height = 21
    DataSource = dm_DataMod.ds_NSqlBtnsT
    DataField = 'Caption'
    TabOrder = 11
    Text = 'JvDBSearchEdit1'
  end
  object Memo1: TMemo
    Left = 649
    Top = 456
    Width = 473
    Height = 218
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '1. Get the buttons.'
      
        '2. If want to change button location, checked this box and move ' +
        'buttons with mouse.'
      
        '3.  Can NOT use mouse to move buttons from one panel to the othe' +
        'r, but selecting a button '
      'and then clicking the Move Btn arrows will do the job.'
      
        '4. Using the arrow buttons will save the buttons data to the dat' +
        'abase and refresh the buttons.'
      
        '5. Red colored buttons indicate buttons placed on top on one ano' +
        'ther.')
    TabOrder = 12
  end
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 1130
    Height = 41
    ControlCollection = <
      item
        Control = btn__SplitViewOpenClose
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 13
    DesignSize = (
      1130
      41)
    object btn__SplitViewOpenClose: TButton
      Left = 4
      Top = 2
      Width = 35
      Height = 37
      Hint = 'Toggle Setup Database Type Panel'
      Anchors = []
      ImageIndex = 5
      Images = frm_NxToolsMain.il_imlIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn__SplitViewOpenCloseClick
    end
  end
  object actlst1: TActionList
    Left = 824
    object act_MoveBtnLtR: TAction
      Category = 'MoveBtn'
      Caption = 'Move Btn'
      OnExecute = act_MoveBtnLtRExecute
      OnUpdate = act_MoveBtnLtRUpdate
    end
    object act_EditAndPostion: TAction
      Category = 'MoveBtn'
      Caption = 'act_EditAndPostion'
      OnUpdate = act_EditAndPostionUpdate
    end
    object act_MoveBtnRtL: TAction
      Category = 'MoveBtn'
      Caption = 'act_MoveBtnRtL'
      OnExecute = act_MoveBtnRtLExecute
      OnUpdate = act_MoveBtnLtRUpdate
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 480
    Top = 72
  end
end
