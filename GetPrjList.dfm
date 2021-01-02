object frm_SelectProject: Tfrm_SelectProject
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Select Project'
  ClientHeight = 651
  ClientWidth = 1521
  Color = clBtnFace
  Constraints.MinHeight = 563
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CardPanel1: TCardPanel
    AlignWithMargins = True
    Left = 203
    Top = 81
    Width = 1315
    Height = 529
    Align = alClient
    ActiveCard = crd_SetDbLocalNetworked
    Caption = 'CardPanel1'
    TabOrder = 0
    OnCardChange = CardPanel1CardChange
    object Card_CreateSelectPrjDb_: TCard
      Left = 1
      Top = 1
      Width = 1313
      Height = 527
      Caption = 'CreateSelectPrjDb'
      CardIndex = 0
      TabOrder = 0
      object Label3: TLabel
        Left = 0
        Top = 2
        Width = 285
        Height = 23
        Alignment = taCenter
        Caption = 'Create, Edit, Remove Projects'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_actCnPrefixWizard: TJvXPButton
        Left = 2
        Top = 156
        Width = 165
        Action = act_DefaultPrj
        TabOrder = 0
      end
      object btn_actCnPrefixWizard1: TJvXPButton
        Left = 4
        Top = 105
        Width = 166
        Height = 34
        Action = act_OpenPrj
        TabOrder = 1
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000001
          594944415478DAEDD6BD4BC3401806F0E7C00FA4A9E0E27F62071787403727C1
          FF42DC5CAAC521D50E0AA2B33A282EBA886005752A2854B05470534B716CA54A
          52F1D25C5EAF050797C4EAA5E790670884703CBF7C1D2F83E6B018F0EF00767A
          729C09B109466910C614B534E5F18C06DBF3C942B91E0868991347043613C9DD
          321C262E4AB32180944D80110540C6362E4BA38100C74C5144E5DD48C0B7CE18
          F02B004B18A096A30F309CB140CF35B8FBDB80EF6B002CAD6060CA84A8DC82AF
          66418D7AD89268009DD0DB2BF8BA057155D403F88A775E00DFC803FC430FA013
          BF5605B732F0AB8F1A01B945F84F0F7D06908FF6DE0EDC835DF92EBCC0B5EA3F
          C29706787E19A27C13B64C3D405C17C1D772F24F68FEA85C1D60210B717F07EF
          F4583E82DE766E355BB1910439764FC54A017F490C0805681FC9B40FA5DDB1DC
          F3B6E49569793AA2A8FB5D569DD0903B173A96F73B31403BE013BB63D621A437
          4B110000000049454E44AE426082}
      end
      object btn_actCnPrefixWizard2: TJvXPButton
        Left = 4
        Top = 36
        Width = 85
        Height = 46
        Action = act_CreatePrj
        TabOrder = 2
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
          264944415478DA63641860C038EA8041E980FDFBFFB308B2BD7262FAC7C84F0D
          4BFE31FDFFF8FE97D83E4747C63F4439E0C2D157CD8CFFFFD750D9A74D7A36E2
          F54439E0E2D197AB18FE338452D301409B56EB5B8B878D3A608838E0F0AB1606
          C6FFD5D4B59FA1199808EB887200381BB2BEB065FACFC44C0DCBFF31FEFBFBFE
          B7C461A2B3E1683930F08970D40103EE002A95035FFE7E6278F6EB3198FDE9CF
          FB056B6ECFC9D89EB7FD274107505A0E9CFF724C62D3DB95191FFF7CB0FCCFF0
          9F0949EA2310F7B17D62EA843984EAE5C0F6776BB5F77ED852F2F7FF1F6EDCAA
          FE9F60F9C3E8BD3365E73BAA96036F7FBF62E87B5CCFF0FDDF57B8589D032426
          AFBDBACEB0E6DA3AA4A067DCB5277E87075513E1C21753192E7E39892206B404
          4C1F7A7898A1E9402B8A1CE37FC660AA39E0DBDFAF0CF50F721980414FBC0318
          FF6FA39A036E7FBBC630FD59073CD8EDE46D71AA6D3ED8CA70F0C16110F30DD5
          1C70E5EB798679CFFB4975C00FAA95038F7EDC6398F0A401CC0ED10A62D012D3
          04B3610E79F3ED0DC3B5D7D7C1ECD557D7325C7F7D03C4BC4FB572E0CB9FCF2C
          0D8FF25702D3001FB238BE34004C05B3A8DA317199EF56F19F91B19D4807FC66
          FAFF4F9BAA0E7098EFC0C1CCC87E10C8348389D92B40A2E0D5D7D7B060877A9E
          A17A6FFCCE36AA77CD9C173A0B33FC67590E64BAE25002CCA78C757BE3777400
          1DF19F367DC3FF0C8C4E0B3D2280E6470379A6402C04C4F781128718FFB34CDC
          93B8ED324C2900553A51DD1ECF02070000000049454E44AE426082}
      end
      object btn_actCnPrefixWizard3: TJvXPButton
        Left = 4
        Top = 187
        Width = 166
        Height = 36
        Action = act_DeletePrj
        TabOrder = 3
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000003
          404944415478DAED956948545114C7FFF7CDE26CDAA8D9B438656A822115424A
          9F9CB4A46C218D89B0A868D590AC14AB0F464605B650A0916254F4A545A2B2CC
          704C26C8D2B120DA090BB322A31CC59AD537737B3D732B46A77A83129D2FF79E
          BB9CF33BF79C7B2FC1300BF90FD0D3494CAB9CE4028AE0865C500F0C6C2E913B
          EB4EF9A29641011252AFEB39F5A26FE2A4CB6E5F5E583EB201D6E6DDCB902AA4
          277CE1DE6975669E3A38AB645080F30D9DEB8343E465BE0068FB64DBB03C3EE0
          E4A000D5AF593D01F5490A28C8B2E470F1E029189100C5D5EFF9362B79025695
          3CF7CA595C7800BF5E1080A68F36BE8DD4C8617AD5E91540904AC2AFFF370086
          3D0542C91F03543D32F3EDFC694128BCDEE2D181882198131388191355BE0328
          36BCF708A08B5623265409D59B17185B530EF5F34610D6C9CF59B45170A8C714
          4F961464933DDC57E79314500AEDD53284DE38CBF73D447A87FB6D9704DC32B5
          790D305411267091AF4B1887D0CA33D05E19FA15E7D0EA5552B38E543539BC02
          E87F0D9FBEB3FC62306CB40C9AD6978839B01184BA41144A48B3F3E02C2D0235
          7FE6AC3390666E056B34C0FDECF18FC322FBFC6B1BF27F1BE0E77740251761EA
          7825224FEF47C8DD1BFC985F6E3EC4F316C2FDB619F6DC2C4857AF8738650968
          473BAC2B53013B6FCFAC742934C46864FF2A05D3B98ACF49D12276C752F8995B
          BBA3191508D9E1E360264770CEEC804C06381CB0EFCE85EB81A92FEF0C662A0D
          A6FB43027823F1193A30AEAE3EE341A3213F7D0144A9E20BD2515800B6A66AC0
          1E42E962656DE3354100666E5B00F1D78E6E8561E0B76B2FC4B3E776DF06C259
          FCD80A5B4E0668EB87DE3D94A13A7F43E36D4100A28F6D87FA6903DF976EDA02
          897E05C076C171E40024E9ABC168C3E06E69866DF39A9E1A7076B99C9A40E3C3
          0E410082EFD722AAB4BBA899882990ED3F0AC7A1BD7CCE7B6A82BD5981AE4BE7
          7F9C3FCEA96A4CE9BDE9F85D873FCBF783B624C619384B49BC418502D46AED9D
          1FA013B48B5826566EAC6F160CE0BB7426C50573DF41254713EF7111E79C8249
          F3AFA9370E1C1648A84E27FB2AB6EE2414D99CAAEE37C5124A2A1837C9E91FB9
          E000BD207ABDC8D2FE6E2AE757C35062B1D8254F42EAEABE783E9861966107F8
          064FA49B305E3B6A650000000049454E44AE426082}
      end
      object btn__Close: TJvXPButton
        Left = 2
        Top = 347
        Width = 153
        Height = 23
        Caption = 'Close -- Set project to Default'
        TabOrder = 4
        OnClick = btn__CloseClick
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 171
        Top = 48
        Width = 754
        Height = 328
        DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
        PanelHeight = 82
        PanelWidth = 737
        TabOrder = 5
        RowCount = 4
        SelectedColor = clBtnShadow
        object Label6: TLabel
          Left = 8
          Top = 11
          Width = 68
          Height = 13
          Caption = 'Project Name:'
        end
        object Label7: TLabel
          Left = 8
          Top = 36
          Width = 42
          Height = 13
          Caption = 'Prj Path:'
        end
        object Label8: TLabel
          Left = 211
          Top = 11
          Width = 123
          Height = 13
          Caption = 'DB password (for Prj Db):'
        end
        object Label9: TLabel
          Left = 4
          Top = 61
          Width = 51
          Height = 13
          Caption = 'Transport:'
        end
        object Label10: TLabel
          Left = 184
          Top = 61
          Width = 36
          Height = 13
          Caption = 'Server:'
        end
        object Label11: TLabel
          Left = 374
          Top = 61
          Width = 26
          Height = 13
          Caption = 'Alias:'
        end
        object rzdbed_PrjName: TRzDBEdit
          Left = 82
          Top = 8
          Width = 121
          Height = 21
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'PrjName'
          TabOrder = 0
        end
        object RzDBEdit1: TRzDBEdit
          Left = 53
          Top = 33
          Width = 468
          Height = 21
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'PrjPath'
          TabOrder = 1
        end
        object RzDBEdit2: TRzDBEdit
          Left = 340
          Top = 8
          Width = 177
          Height = 21
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'DbPassWord'
          TabOrder = 2
        end
        object RzDBEdit3: TRzDBEdit
          Left = 58
          Top = 58
          Width = 121
          Height = 21
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'Transport'
          PopupMenu = popm_Transport
          TabOrder = 3
        end
        object RzDBEdit4: TRzDBEdit
          Left = 222
          Top = 58
          Width = 150
          Height = 21
          Hint = 
            'Your project'#39's Server| Set Your projects Sever in the main proga' +
            'm by selecting a server.'
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'Server'
          ReadOnly = True
          Color = clInfoBk
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object RzDBEdit5: TRzDBEdit
          Left = 400
          Top = 58
          Width = 121
          Height = 21
          Hint = 
            'Your Project'#39's Database|You can set your projects database in th' +
            'e Main App by selecting - Transport/Server/Database(alias).'
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'Alias'
          ReadOnly = True
          Color = clInfoBk
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object RzDBMemo1: TRzDBMemo
          Left = 523
          Top = 4
          Width = 209
          Height = 78
          DataField = 'Memo'
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          ScrollBars = ssVertical
          TabOrder = 6
        end
      end
      object RzDBNavigator1: TRzDBNavigator
        Left = 171
        Top = 384
        Width = 280
        Height = 25
        DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
        Hints.Strings = (
          'Go to First Project'
          'Go to Previous Project'
          'Go to Next Project'
          'Go to Last Project'
          'Create New Project'
          'Delete selected Project'
          'Edit selected Project'
          'Post Changes'
          'Cancel Changes'
          'Refresh record data')
        BorderOuter = fsNone
        TabOrder = 6
        VisualStyle = vsGradient
      end
      object xpbtn_GetPrjPath: TJvXPButton
        Left = 90
        Top = 35
        Width = 79
        Height = 47
        Action = act_SetPrjPath
        TabOrder = 7
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
      end
      object JvDBSearchComboBox1: TJvDBSearchComboBox
        Left = 472
        Top = 7
        Width = 145
        Height = 21
        DataField = 'PrjName'
        DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
        TabOrder = 8
        Text = 'MOW'
        OnChange = JvDBFindEdit1Change
      end
      object JvDBFindEdit1: TJvDBFindEdit
        Left = 336
        Top = 7
        Width = 121
        Height = 21
        TabOrder = 9
        Text = ''
        OnChange = JvDBFindEdit1Change
        DataField = 'PrjName'
        DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
      end
      object JvXPButton4: TJvXPButton
        Left = 2
        Top = 243
        Width = 166
        Height = 18
        Caption = 'Encrypt Password'
        TabOrder = 10
        OnClick = act_DeletePrjExecute
      end
    end
    object Card_MostRecentlyUsedPrj_: TCard
      Left = 1
      Top = 1
      Width = 1313
      Height = 527
      Caption = 'Most Recently Used'
      CardIndex = 1
      TabOrder = 1
      object lbl4: TLabel
        Left = 19
        Top = 29
        Width = 430
        Height = 49
        AutoSize = False
        Caption = 'Click a Project Name to Open'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 0
        Top = 3
        Width = 187
        Height = 23
        Alignment = taCenter
        Caption = 'Most Recently used'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lstGemMruList1: tGemMruList
        Left = 24
        Top = 74
        Width = 425
        Height = 317
        MaxNumItems = 15
        MruListFile = 'NONE'
        StringListType = uslt_NameValue
        OnClick = lstGemMruList1Click
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object crd_SetDbLocalNetworked: TCard
      Left = 1
      Top = 1
      Width = 1313
      Height = 527
      Caption = 'crd_SetDbLocalNetworked'
      CardIndex = 2
      TabOrder = 2
      object Label13: TLabel
        Left = 16
        Top = 6
        Width = 13
        Height = 25
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape2: TShape
        Left = 11
        Top = 52
        Width = 479
        Height = 8
        Brush.Color = clBlue
      end
      object Label14: TLabel
        Left = 16
        Top = 66
        Width = 13
        Height = 25
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_CaptionForLocalDbPath: TLabel
        Left = 45
        Top = 78
        Width = 102
        Height = 13
        Caption = 'Local Database Path:'
      end
      object bl_1: TJvBehaviorLabel
        Left = 278
        Top = 75
        Width = 110
        Height = 13
        Behavior = 'Appearing'
        Caption = 'Folder does NOT exist!'
        Visible = False
      end
      object lbl_CaptionForServerLb: TLabel
        Left = 4
        Top = 125
        Width = 111
        Height = 13
        Caption = 'Select WinSock Server:'
      end
      object lbl_CaptionNetServerSelected: TLabel
        Left = 252
        Top = 125
        Width = 80
        Height = 13
        Caption = 'Selected Server:'
      end
      object lbl_CaptionForDBAlais: TLabel
        Left = 253
        Top = 217
        Width = 118
        Height = 13
        Caption = 'Network Database Alias:'
      end
      object Shape3: TShape
        Left = 11
        Top = 292
        Width = 479
        Height = 8
        Brush.Color = clBlue
      end
      object Label15: TLabel
        Left = 16
        Top = 314
        Width = 13
        Height = 25
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 45
        Top = 343
        Width = 19
        Height = 19
        Caption = 'Or'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rb_LocalDb: TJvRadioButton
        Left = 73
        Top = 6
        Width = 94
        Height = 17
        Action = act_PrjEdit
        Alignment = taLeftJustify
        TabOrder = 0
        LinkedControls = <>
      end
      object rb_NetworkedDb: TJvRadioButton
        Left = 73
        Top = 29
        Width = 137
        Height = 17
        Action = act_SetNetwodkDbType
        Alignment = taLeftJustify
        TabOrder = 1
        LinkedControls = <>
      end
      object btn_ResetLocalDbPath: TJvXPButton
        Left = 432
        Top = 66
        Width = 33
        Height = 27
        Hint = 'Reset Default Db Path'
        TabOrder = 2
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000001
          894944415478DACDD5CD2B445118C7F16794852489BCEE882485A22449D97B29
          4B2FA168A2ACAC14933F40B24258C886506267252F2BC9CB42497668B0B1B042
          7C4FE7A8DB69EECC9D3B33354F7D6ABAF7CEF9CD9CFB9C730292E20AA4434001
          BAD18222F39D175C6117CF7E03CA308321649A815EF1831294E21B9B9836F743
          98758EEB16D08E1D6463116BB8B79EA9C23026F1893E347B0968C3111ED01361
          60BB2AB1851A6CA33F5A40316E10462B3E3CBC235579384139B2A2052C6100B5
          78F43070C8F159354310196E018578C202A63CFEF25F97EB110346B16CE6F2CE
          6340CC7206A8C1BB44BF87A49533E040747F37A62AE050F44A6D4A70CC0BD18B
          AED30E583117139DA237D18B346807A82D611D75A2D7829F6AC02506B16107F8
          6953BBE631217A9F7AB70354C5BBD09CA5B68C5BD1FBD6F8FFC5646D15B93847
          BE99E2B05B80AA7837BB6AECA1021D3875DE8CB55DE7605574875D5BCFD4630C
          23E69FF6E2D81EC8CF81A34A35847A915FA23B6F4E5C4E363F47A698393EC3BE
          986E71ABB438F413AA3F1D325119D8D540420000000049454E44AE426082}
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_ResetLocalDbPathClick
      end
      object JvXPButton1: TJvXPButton
        Left = 471
        Top = 66
        Width = 26
        Height = 49
        Hint = 'Set path to local database'
        Caption = '...'
        TabOrder = 3
        Glyph.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000000
          DE4944415478DA6364A031601CB580680BFE2F60F00652938158118BAA0AC678
          864E4A2D7804A464F1A824CB1284056B78FE33488A3330B0B25216267FFEFC66
          F8FCA595D1FD4523AA054795FF536C380CFCFEF387D1FA0E2BAA05A734FE6353
          BBE95B3AC3E6AFE92862229CBF18E2D9F31834584FE10E1AB31B8C645B60AFC0
          C2C0CEF28F41ED553E833EFB41DA586007C4471FFE6030799FCCA0CA7A9EBA16
          20035FEE990C7E5C33472D18B5804E163C0152D20C5401FF1F339ADD9443B5E0
          A4A63703E3FF5940A61485A63F6560644C6334BDBE0DC5025A81510B080200DD
          D79119E558E9920000000049454E44AE426082}
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        OnClick = JvXPButton1Click
      end
      object edit_DbPath: TEdit
        Left = 1
        Top = 94
        Width = 464
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object lb_ServerNames: TJvListBox
        Left = 8
        Top = 144
        Width = 225
        Height = 137
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 5
        OnClick = lb_ServerNames1Click
      end
      object edt_NetWorkServer: TEdit
        Left = 253
        Top = 144
        Width = 217
        Height = 21
        Color = clCream
        ReadOnly = True
        TabOrder = 6
        Text = 'NxDelphiSqlTools'
      end
      object ts_DefaultAliasBtnDb: TToggleSwitch
        Left = 252
        Top = 191
        Width = 158
        Height = 20
        StateCaptions.CaptionOn = 'Use Alias You Set up.'
        StateCaptions.CaptionOff = 'Use Defualt Alias'
        TabOrder = 7
        OnClick = ts_DefaultAliasBtnDbClick
      end
      object edt_Alias: TEdit
        Left = 303
        Top = 236
        Width = 162
        Height = 21
        Color = clCream
        Enabled = False
        ReadOnly = True
        TabOrder = 8
        Text = 'NxDelphiSqlTools'
      end
      object btn_ConnectDb: TButton
        Left = 35
        Top = 306
        Width = 33
        Height = 34
        Action = act_ConnectBtn
        Images = frm_NxToolsMain.il_AppImages
        TabOrder = 9
      end
      object btn_CopyDbTables: TButton
        Left = 35
        Top = 363
        Width = 179
        Height = 38
        Caption = 'Close Program. Can Not continue with out Db Open.'
        TabOrder = 10
        WordWrap = True
        OnClick = btn_CopyDbTablesClick
      end
    end
    object crd_CreateNewDbTables: TCard
      Left = 1
      Top = 1
      Width = 1313
      Height = 527
      Caption = 'crd_CreateNewDbTables'
      CardIndex = 3
      TabOrder = 3
    end
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 0
    Width = 1521
    Height = 78
    Align = alTop
    TabOrder = 1
    object JvLED1: TJvLED
      Left = 0
      Top = 14
      ParentShowHint = False
      ShowHint = True
      Status = False
    end
    object Label1: TLabel
      Left = 23
      Top = 2
      Width = 218
      Height = 19
      Caption = 'Manage Projects Database'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 23
      Top = 22
      Width = 561
      Height = 4
      Brush.Color = clBlue
    end
    object NxDelphiSqlTools_Status: TJvDBStatusLabel
      Left = 271
      Top = 29
      Width = 171
      Height = 16
      DataSetName = 'NxDelphiSqlTools'
      Captions.Strings = (
        'NxDelphiDbTools Db: ')
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object GEMDBLabel1: TGEMDBLabel
      Left = 42
      Top = 27
      Width = 98
      Height = 19
      Caption = 'GEMDBLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      CloseAction = dtnChange
      DataField = 'PrjName'
      DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
    end
    object btn__SplitViewOpenClose: TButton
      Left = 4
      Top = 37
      Width = 35
      Height = 37
      Hint = 'Toggle Setup Database Type Panel'
      ImageIndex = 0
      Images = frm_NxToolsMain.il_imlIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn__SplitViewOpenCloseClick
    end
    object btn_GridMruSelection: TButton
      Left = 43
      Top = 47
      Width = 229
      Height = 25
      Action = act_ClickLabel
      Caption = '(Select, Create, Edit, Remove Projects)'
      Images = frm_NxToolsMain.il_AppImages
      TabOrder = 1
    end
    object jvxpbtn_HaltProgram: TJvXPButton
      Left = 278
      Top = 51
      Width = 179
      Caption = 'Close Program'
      TabOrder = 2
      OnClick = jvxpbtn_HaltProgramClick
    end
  end
  object StatusBarPro: TStatusBarPro
    Left = 0
    Top = 613
    Width = 1521
    Height = 38
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
    WordWrap = True
  end
  object sv_SetLocalNetworkPrjDb_: TSplitView
    Left = 0
    Top = 78
    Width = 200
    Height = 535
    Color = clBtnText
    DockSite = True
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 3
    OnClosing = sv_SetLocalNetworkPrjDb_Closing
    OnOpened = sv_SetLocalNetworkPrjDb_Opened
    OnOpening = sv_SetLocalNetworkPrjDb_Opening
    object ctgrybtns_: TCategoryButtons
      Left = 0
      Top = 0
      Width = 200
      Height = 285
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 45
      ButtonWidth = 40
      ButtonOptions = [boAllowReorder, boFullSize, boGradientFill, boShowCaptions, boBoldCaptions, boCaptionOnlyBorder]
      Categories = <
        item
          Caption = 'Projects'
          Color = 16771839
          Collapsed = False
          Items = <
            item
              Caption = 'Recent Projects'
              ImageIndex = 0
            end
            item
              Caption = 'Create/Edit Projects'
              ImageIndex = 2
            end>
        end
        item
          Caption = 'Database Tools'
          Color = 16771818
          Collapsed = False
          Items = <
            item
              Caption = 'Change Db Network Type'
            end
            item
              Caption = 'Create/Update Databases'
            end
            item
              Caption = 'Pack/Restructure Dbs'
            end>
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = il1
      RegularButtonColor = clBtnText
      SelectedButtonColor = clBlack
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Images = frm_NxToolsMain.il_AppImages
    Left = 760
    Top = 32
    object act_DefaultPrj: TAction
      Caption = 'Use Default Project'
      OnExecute = act_DefaultPrjExecute
    end
    object act_OpenPrj: TAction
      Caption = 'Open Selected Project'
      OnExecute = act_OpenPrjExecute
      OnUpdate = act_OpenPrjUpdate
    end
    object act_CreatePrj: TAction
      Caption = 'Create New Project'
      OnExecute = act_CreatePrjExecute
    end
    object act_DeletePrj: TAction
      Caption = 'Delete Selected Project'
      OnExecute = act_DeletePrjExecute
      OnUpdate = act_DeletePrjUpdate
    end
    object act_ClickLabel: TAction
      Caption = '(Create, Edit, Remove Projects)'
      ImageIndex = 9
      OnExecute = act_ClickLabelExecute
      OnUpdate = act_ClickLabelUpdate
    end
    object act_SetNetwodkDbType: TAction
      Caption = 'act_SetNetwodkDbType'
      OnExecute = act_SetNetwodkDbTypeExecute
    end
    object act_SetPrjPath: TAction
      Caption = 'Set Project Path'
      OnExecute = act_SetPrjPathExecute
    end
    object act_ConnectBtn: TAction
      ImageIndex = 6
      OnExecute = act_ConnectBtnExecute
      OnUpdate = act_ConnectBtnUpdate
    end
    object act_PrjEdit: TAction
      Caption = 'Local Database'
      OnExecute = act_PrjEditExecute
      OnUpdate = act_PrjEditUpdate
    end
  end
  object JvFormStorage1: TJvFormStorage
    Active = False
    AppStorage = frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpState, fpSize]
    StoredProps.Strings = (
      'act_ClickLabel.Tag'
      'CardPanel1.ActiveCard')
    StoredValues = <>
    Left = 817
    Top = 8
  end
  object JvSelectDirectory1: TJvSelectDirectory
    Left = 576
    Top = 24
  end
  object popm_Transport: TPopupMenu
    Left = 928
    Top = 20
    object WinSock2: TMenuItem
      Caption = 'WinSock'
      OnClick = TransPortClick
    end
    object NamePipe2: TMenuItem
      Tag = 1
      Caption = 'NamePipe'
      OnClick = TransPortClick
    end
    object LocalServer2: TMenuItem
      Tag = 2
      Caption = 'Local Server'
      OnClick = TransPortClick
    end
    object SharedMem2: TMenuItem
      Tag = 3
      Caption = 'Shared Mem'
      Enabled = False
      OnClick = TransPortClick
    end
    object None2: TMenuItem
      Tag = 4
      Caption = 'None'
      OnClick = TransPortClick
    end
  end
  object timer_SearchTimerBlank: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = timer_SearchTimerBlankTimer
    Left = 680
    Top = 8
  end
  object popm_Server: TPopupMenu
    Left = 1032
    Top = 20
    object MenuItem1: TMenuItem
      Caption = 'WinSock'
      OnClick = TransPortClick
    end
    object MenuItem2: TMenuItem
      Tag = 1
      Caption = 'NamePipe'
    end
    object MenuItem3: TMenuItem
      Tag = 2
      Caption = 'Local Server'
    end
    object MenuItem4: TMenuItem
      Tag = 3
      Caption = 'Shared Mem'
      OnClick = SharedMem2Click
    end
    object MenuItem5: TMenuItem
      Tag = 4
      Caption = 'None'
    end
  end
  object popm_Database: TPopupMenu
    Left = 1120
    Top = 20
    object MenuItem6: TMenuItem
      Caption = 'WinSock'
      OnClick = TransPortClick
    end
    object MenuItem7: TMenuItem
      Tag = 1
      Caption = 'NamePipe'
    end
    object MenuItem8: TMenuItem
      Tag = 2
      Caption = 'Local Server'
    end
    object MenuItem9: TMenuItem
      Tag = 3
      Caption = 'Shared Mem'
      OnClick = SharedMem2Click
    end
    object MenuItem10: TMenuItem
      Tag = 4
      Caption = 'None'
    end
  end
  object jvblnhnt_1: TJvBalloonHint
    UseBalloonAsApplicationHint = True
    Left = 1240
    Top = 14
  end
  object jvmglst_: TJvImageList
    Items = <>
    Left = 916
    Top = 122
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F7966FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966FF8F7966FF8F7966FF483D33800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F7966FF8F7966FF8F7966FF8F7966FF8F7966FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F7966FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F7966FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C7387B4499AB8FB3C7387B4020405070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010232A3976AFC5F4E7D4C5FFB77D52FFE7D5C7FFDFEEF3FF1021
      2837000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000386F83B1FFFFFFFFFFFFFFFFF0B78BFF5D4C3EFFF0B78BFFC79774FFFFFF
      FFFF6EAAC1F30000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006FABC1F3FFFFFFFFFFFFFFFFF0B78BFF4D4036FFF0B78BFFB97F55FFFFFF
      FFFFF9FBFDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000509BB7F5FFFFFFFFBD8459FFEBB386FFFFFFFFFFFFFFFFFF4F9A
      B6F5000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000254A5776BBDAE5FFF2F8FAFFBAD9E5FF4B97B3F20000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object il1: TImageList
    Height = 32
    Width = 32
    Left = 908
    Top = 234
    Bitmap = {
      494C010103000C00040020002000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5BBB1008F7966008F7966008F7966008F7966008F7966008F796600C5BB
      B100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C5BBB1008F7966008F7966008F7966008F7966008F7966008F796600C5BB
      B100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C5BB
      B1008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      6600C5BBB1000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5BB
      B1008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      6600C5BBB100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5BBB1008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F796600C5BBB10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5BBB1008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F796600C5BBB100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1B6AB008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F796600C1B6AB00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1B6AB008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F796600C1B6AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000BFA2B600A17393009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009E6C8D00C3ACBE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966008F79660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7966008F796600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000AF87A200AC98B400BACBE400BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BCD0E8009F6D8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966008F79660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7966008F796600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000DFD0DA00AB81
      9E009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D00A06E
      8F00AFA0BB00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966008F79660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7966008F796600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000E0D1DB00A4799700B7BD
      D700BED6EE00BED8EF00BED8EF00DFEDFA00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00EEF6FE00E0F0FB00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00D9E5
      F200A16F9000BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966008F79660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7966008F796600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000AC84A000B6BCD500BED8
      EF00BED8EF00BED8EF00BED8EF00E0EEFA00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F2F8FE00E0F0FB00DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00C4B9CD00C4B9CD00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F7966008F79660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7966008F796600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009E6C8E00BED6EC00BED8
      EF00BED8EF00BED8EF00BED8EF00A97F9D00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F2F8FF00F9FCFF00EEF6FE00E0F0FB00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00C2B4C900C2B5C900DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F7966008F7966008F7966008F7966008F79
      66008F7966008F7966008F7966008F796600000000009F6C8D00BBCDE500BED8
      EF00BED8EF00BED8EF00BBCCE5009F6C8D00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00EEF6FE00E0F0FB00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00B19DB900BED8
      EF00BED8EF00BED7EF00B29CB8009F6C8D00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00EEF6FE00E1F0
      FB00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00A9809D00A9809E00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00B08BA600AA88
      A500AF9DB900A987A400B08BA6009F6C8D00EBF5FE00AC819E009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D00A9809E00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00EEF5FD00D8CC
      DC00CCB9CC00D8CCDC00EEF5FD009F6C8D00DFF0FA00EBF5FE00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00EEF6FE00E0F0FB00E1F1FB00DEEFFA00DEEFFA00C4B9CD00C4B9CD00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00E1F0FB00DFF0FA0089CBA600D3EA
      E500F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FE00F9FCFE00EEF7FC00DEEFFA00C2B4C900C2B5C900DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00EEF6FE00E0F0FB00C5E5E1007DC6
      9B00D2EAE500F0F7FF00F0F7FF00D4EBE700D4EBE700F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F6FAFE00E4F2FC00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00F0F7FF00EEF6FE00E0F0FB00C4E5
      E0007DC69B00D2EAE500D1E9E3007DC59A007DC59A00D0E9E300F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00EEF6FE00E0F0FB00A9809D00A9809E00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3DDE70085BCD00060A7C2004B9BBA004B9BBA0061A8C20085BCD000C4DE
      E700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3DDE70085BCD00060A7C2004B9BBA004B9BBA0061A8C20085BCD000C4DE
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00EEF6FE00F0F7FF00EEF6FE00E0F0
      FB00C4E4DF007CC59A007DC59A00D1EAE400D2EAE4007DC59A00D1E9E300F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00EEF6FE00E0F0FB00DEEFFA00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ACD1DE0055A0
      BE007DB7CD00BAD9E500E7F2F600FAFCFD00FAFCFD00E7F2F600BAD9E5007DB7
      CD0055A1BE00ADD1DF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACD1DE0055A0
      BE007DB7CD00BAD9E500E7F2F600FAFCFD00FAFCFD00E7F2F600BAD9E5007DB7
      CD0055A1BE00ADD1DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00E0F0FB00EEF6FE00F0F7FF00EEF6
      FE00E0F0FB00C7E5E300D1EAE600F0F7FF00F0F7FF00D2EAE5007EC69B00D1E9
      E300F0F7FF0084C9A100F0F7FF00F0F7FF00F0F7FF00CDBDCF00C5B9CE00DEEF
      FA009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5E7EE0061A8C2007FB8CE00E0EE
      F30000000000E7D4C500C6967100B77D5200B77D5200C6967200E7D5C7000000
      0000DFEEF3007FB8CD0062A8C200D6E7EE000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5E7EE0061A8C2007FB8CE00E0EE
      F300FFFFFF00E7D4C500C6967100B77D5200B77D5200C6967200E7D5C700FFFF
      FF00DFEEF3007FB8CD0062A8C200D6E7EE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00E7F3FD00E0F0FB00EEF6FE00F0F7
      FF00EEF6FE00E0F0FB00DFF0FA00EBF5FE00F0F7FF00F0F7FF00CEE8E2007EC6
      9B00D3EBE60072C19100F0F7FF00F0F7FF00F0F7FF00CCB9CC00CBB9CB00E0F0
      FB009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6CEDC0057A2BE00CBE3EC00000000000000
      0000DABAA200BD845A00DDA37700EDB48800EDB48700DDA47800BE865C00D9BB
      A5000000000000000000CBE2EB0057A2BD00A8CEDD0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A6CEDC0057A2BE00CBE3EC00FFFFFF00FFFF
      FF00DABAA200BD845A00DDA37700EDB48800EDB48700DDA47800BE865C00D9BB
      A500FFFFFF00FFFFFF00CBE2EB0057A2BD00A8CEDD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00EEF6FE00E7F3FD00E0F0FB00F6FA
      FE00F1F8FF00EEF6FE00E0F0FB00DEF0FA00EBF5FE00F0F7FF00F0F7FF00D2EB
      E6007FC69C0072C19100F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00EEF6
      FE009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008ABED20067ABC400E7F2F6000000000000000000E9D7
      CA00BF875D00ECB38700F0B78B00F0B78B00F0B78B00F0B78B00ECB38700BF87
      5C00EAD8CC000000000000000000E7F2F60066ABC4008CBFD300000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008ABED20067ABC400E7F2F600FFFFFF00FFFFFF00E9D7
      CA00BF875D00ECB38700F0B78B00F0B78B00F0B78B00F0B78B00ECB38700BF87
      5C00EAD8CC00FFFFFF00FFFFFF00E7F2F60066ABC4008CBFD300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00E1F0FB00EEF6FE00F2F9FE00FEFF
      FF00FCFDFF00F2F8FF00EEF6FE00E0F0FB00DFF0FA00EBF5FE0086C9A20072C1
      910072C1910078C49700F0F7FF00F0F7FF00F0F7FF00AC819E00AC829F00F0F7
      FF009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000085BBCF0079B5CB00F6FAFC00000000000000000000000000C696
      7200DEA47800F0B78B00BF9372005D4C3E005E4C3F00C0957300F0B78B00DDA4
      7800C7977400000000000000000000000000F6FAFC0078B3CB0087BCD0000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0085BBCF0079B5CB00F6FAFC00FFFFFF00FFFFFF00FFFFFF00C696
      7200DEA47800F0B78B00BF9372005D4C3E005E4C3F00C0957300F0B78B00DDA4
      7800C7977400FFFFFF00FFFFFF00FFFFFF00F6FAFC0078B3CB0087BCD000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00DEEFFA00E1F0FB00EFF7FE00FAFD
      FF00ECF6FD00EEF6FE00F0F7FF00EEF6FE00E0F0FB00DFF0FA00EBF5FE00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF009F6C8D00BED8EF009F6C8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000091C2D40078B3CB00F9FBFD0000000000000000000000000000000000B87F
      5400EEB48800F0B78B005E4C3F004D4036004D4036005F4E4000F0B78B00EDB4
      8700B97F540000000000000000000000000000000000F9FBFD0077B3C90092C3
      D50000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0091C2D40078B3CB00F9FBFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B87F
      5400EEB48800F0B78B005E4C3F004D4036004D4036005F4E4000F0B78B00EDB4
      8700B97F5400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FBFD0077B3C90092C3
      D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00DEEFFA00DEEFFA00E1F0FB00F0F7
      FE00E7F3FD00E0F0FB00EEF6FE00F0F7FF00EEF6FE00E0F0FB00DFF0FA00EBF5
      FE00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00CEBDD000CEBDD000F0F7
      FF009F6C8D00BCCEE6009F6D8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000092C2D40079B4CB00FBFDFD0000000000000000000000000000000000B87E
      5400EDB48800F0B78B005F4E40004D4036004D403600614E4000F0B78B00EDB3
      8800B97F550000000000000000000000000000000000F9FBFD0075B2CA0093C3
      D50000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0092C2D40079B4CB00FBFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B87E
      5400EDB48800F0B78B005F4E40004D4036004D403600614E4000F0B78B00EDB3
      8800B97F5500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FBFD0075B2CA0093C3
      D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00DEEFFA00DEEFFA00DEEFFA00E1F0
      FB00EEF6FE00E7F3FD00E0F0FB00EEF6FE00F0F7FF00EEF6FE00E0F0FB00DFF0
      FA00EBF5FE00F0F7FF00F0F7FF00F0F7FF00F0F7FF00CCB9CC00CCBACC00F0F7
      FF009F6C8D009F6F8F00C2AABE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000085BBCF0078B4CB00F7FBFC00000000000000000000000000C696
      7200DDA37700F0B78B00BF93720062504100634F4200C0957300F0B78B00DDA3
      7700C7977400000000000000000000000000F6FAFC0076B3CA0087BCD0000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0085BBCF0078B4CB00F7FBFC00FFFFFF00FFFFFF00FFFFFF00C696
      7200DDA37700F0B78B00BF93720062504100634F4200C0957300F0B78B00DDA3
      7700C7977400FFFFFF00FFFFFF00FFFFFF00F6FAFC0076B3CA0087BCD000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA00E0F0FB00EEF6FE00E7F3FC00E0F0FB00EEF6FE00F0F7FF00EEF6FE00E0F0
      FB00DEF0FA00EBF5FE00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00E9EB
      F500A06E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008ABED20068ABC500E8F2F6000000000000000000E7D4
      C500BD845900ECB38700F0B78B00F0B78B00F0B78B00F8DECA00FEFDFC00E0C6
      B100E8D5C7000000000000000000E7F2F60066ABC4008CBFD300000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008ABED20068ABC500E8F2F600FFFFFF00FFFFFF00E7D4
      C500BD845900ECB38700F0B78B00F0B78B00F0B78B00F8DECA00FEFDFC00E0C6
      B100E8D5C700FFFFFF00FFFFFF00E7F2F60066ABC4008CBFD300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C
      8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6C8D009F6F
      8F00C8AEC0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6CEDC0058A3BE00CDE4EC00000000000000
      0000D5B29900BD845900DDA37700EBB38600EBB38600FDFBF90000000000FDFB
      FA000000000000000000CBE3EC0057A2BD00A8CEDD0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A6CEDC0058A3BE00CDE4EC00FFFFFF00FFFF
      FF00D5B29900BD845900DDA37700EBB38600EBB38600FDFBF900FFFFFF00FDFB
      FA00FFFFFF00FFFFFF00CBE3EC0057A2BD00A8CEDD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5E7EE0061A8C20089BED000E7F2
      F60000000000E7D4C500C6967100BA815600BA815600E5CFBE00FDFCFB000000
      0000E5F1F50087BDD00061A8C200D6E7EE000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5E7EE0061A8C20089BED000E7F2
      F600FFFFFF00E7D4C500C6967100BA815600BA815600E5CFBE00FDFCFB00FFFF
      FF00E5F1F50087BDD00061A8C200D6E7EE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009F6C8D00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF009F6C8D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ACD1DE0056A2
      BE007EB8CD00BBDAE500E4F0F500F2F8FA00F1F8FA00E4F0F500BAD9E5007DB7
      CD0056A2BE00ADD1DF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACD1DE0056A2
      BE007EB8CD00BBDAE500E4F0F500F2F8FA00F1F8FA00E4F0F500BAD9E5007DB7
      CD0056A2BE00ADD1DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000A7799700E8E9F300F0F7
      FF00F0F7FF00F0F7FF00E8E8F300A87A98000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3DDE70085BCD00060A7C20052A0BD0052A0BD0061A8C20085BCD000C4DE
      E700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3DDE70085BCD00060A7C20052A0BD0052A0BD0061A8C20085BCD000C4DE
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C2A3B800C0A6BC00F0F7
      FF00F0F7FF00F0F6FF00C0A5BB00C2A4B9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000B087A200B18C
      A600C1A8BE00B18BA500B188A200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000E0D1
      DB00D2BBCA00E0D1DB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFF00FFF00000000FFFFFFFF00000000
      FFE007FF00000000FFFFFFFF00000000FFC003FF00000000FFFFFFFF00000000
      FF8001FF00000000F800000100000000FFFE7FFF00000000F000000100000000
      FFFE7FFF00000000C000000100000000FFFE7FFF000000008000000100000000
      FFFE7FFF000000008000000100000000FFFE7FFF000000008000000100000000
      00000000000000008000000100000000FFFFFFFF000000008000000100000000
      FFFFFFFF000000008000000100000000FFFFFFFF000000008000000100000000
      FFFFFFFF000000008000000100000000FFFFFFFF000000008000000100000000
      FFFFFFFF000000008000000100000000FFF00FFF000000008000000100000000
      FFC003FF000000008000000100000000FF0810FF000000008000000100000000
      FE300C7F000000008000000100000000FC60063F000000008000000100000000
      F8E0071F000000008000000100000000F1E0078F000000008000000100000000
      F1E0078F000000008000000100000000F8E0071F000000008000000700000000
      FC60063F000000008000000700000000FE302C7F0000000080FFFFFF00000000
      FF0810FF0000000080FFFFFF00000000FFC003FF0000000080FFFFFF00000000
      FFF00FFF0000000080FFFFFF00000000FFFFFFFF00000000C1FFFFFF00000000
      FFFFFFFF00000000E3FFFFFF00000000}
  end
end
