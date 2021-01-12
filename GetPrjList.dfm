object frm_SelectProject: Tfrm_SelectProject
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Select Project'
  ClientHeight = 552
  ClientWidth = 1165
  Color = clBtnFace
  Constraints.MinHeight = 563
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cardpnl_Dialogs: TCardPanel
    AlignWithMargins = True
    Left = 213
    Top = 81
    Width = 949
    Height = 430
    Align = alClient
    ActiveCard = Card_CreateSelectPrjDb
    Caption = 'cardpnl_Dialogs'
    TabOrder = 0
    OnCardChange = cardpnl_DialogsCardChange
    object Card_CreateSelectPrjDb: TCard
      Left = 1
      Top = 1
      Width = 947
      Height = 428
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
          Width = 70
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
          Width = 128
          Height = 13
          Caption = 'DB password (for Prj Db):'
        end
        object Label9: TLabel
          Left = 4
          Top = 61
          Width = 52
          Height = 13
          Caption = 'Transport:'
          Enabled = False
        end
        object Label10: TLabel
          Left = 184
          Top = 61
          Width = 34
          Height = 13
          Caption = 'Server:'
        end
        object Label11: TLabel
          Left = 374
          Top = 61
          Width = 27
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
          TabOrder = 3
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
          TabOrder = 4
        end
        object RzDBMemo1: TRzDBMemo
          Left = 523
          Top = 4
          Width = 209
          Height = 78
          DataField = 'Memo'
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object RzDBEdit3: TRzDBEdit
          Left = 62
          Top = 58
          Width = 121
          Height = 21
          Hint = 
            'Can select on the main form|Set Your projects Sever in the main ' +
            'progam by selecting a server.'
          DataSource = dm_DataMod.ds_NxDbSqlToolsPrjs
          DataField = 'Transport'
          ReadOnly = True
          Enabled = False
          ParentShowHint = False
          PopupMenu = popm_Transport
          ShowHint = True
          TabOrder = 6
          OnClick = RzDBEdit3Click
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
        Color = 15987699
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
    object Card_MostRecentlyUsedPrj: TCard
      Left = 1
      Top = 1
      Width = 947
      Height = 428
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
        Left = 2
        Top = 58
        Width = 447
        Height = 351
        MaxNumItems = 15
        MruListFile = 'NONE'
        StringListType = uslt_NameValue
        OnClick = lstGemMruList1Click
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object crd_SetDbServer: TCard
      Left = 1
      Top = 1
      Width = 947
      Height = 428
      Caption = 'crd_SetDbServer'
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
        Top = 75
        Width = 106
        Height = 13
        Caption = 'Local Database Path:'
      end
      object bl_1: TJvBehaviorLabel
        Left = 278
        Top = 75
        Width = 116
        Height = 13
        Behavior = 'Appearing'
        Caption = 'Folder does NOT exist!'
        Visible = False
      end
      object lbl_CaptionForServerLb: TLabel
        Left = 10
        Top = 120
        Width = 115
        Height = 13
        Caption = 'Select WinSock Server:'
      end
      object lbl_CaptionNetServerSelected: TLabel
        Left = 251
        Top = 120
        Width = 80
        Height = 13
        Caption = 'Selected Server:'
      end
      object lbl_CaptionForDBAlais: TLabel
        Left = 256
        Top = 251
        Width = 78
        Height = 13
        Caption = 'Database Alias:'
      end
      object Shape3: TShape
        Left = 11
        Top = 292
        Width = 242
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
        Left = 52
        Top = 355
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
      object shp4: TShape
        Left = 266
        Top = 292
        Width = 231
        Height = 8
        Brush.Color = clGreen
      end
      object lbl_Caption4: TLabel
        Left = 267
        Top = 292
        Width = 64
        Height = 30
        Caption = 'Issues:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_CaptionAliasLB: TLabel
        Left = 256
        Top = 163
        Width = 27
        Height = 13
        Caption = 'Alias:'
      end
      object btn_ResetLocalDbPath: TJvXPButton
        Left = 432
        Top = 66
        Width = 33
        Height = 27
        Hint = 'Reset Default Db Path'
        TabOrder = 0
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
      object jvxpbtn_GetLocalPath: TJvXPButton
        Left = 471
        Top = 66
        Width = 26
        Height = 49
        Hint = 'Set path to local database'
        Caption = '...'
        TabOrder = 1
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
        OnClick = jvxpbtn_GetLocalPathClick
      end
      object edit_LocalDbPath: TEdit
        Left = 1
        Top = 94
        Width = 464
        Height = 21
        Color = 14811134
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        OnChange = edit_LocalDbPathChange
      end
      object edt_NetWorkServer: TEdit
        Left = 252
        Top = 136
        Width = 217
        Height = 21
        Color = 14811134
        ReadOnly = True
        TabOrder = 3
      end
      object edt_Alias: TEdit
        Left = 256
        Top = 265
        Width = 162
        Height = 21
        Color = clCream
        Enabled = False
        ReadOnly = True
        TabOrder = 4
        Text = 'NxDelphiSqlTools'
      end
      object btn_ConnectDb: TButton
        Left = 45
        Top = 306
        Width = 42
        Height = 47
        Cursor = crHandPoint
        Action = act_ConnectBtn
        ImageAlignment = iaCenter
        Images = il1
        TabOrder = 5
      end
      object btn_CopyDbTables: TButton
        Left = 45
        Top = 380
        Width = 179
        Height = 38
        Caption = 'Close Program. Can Not continue with out Db Open.'
        TabOrder = 6
        WordWrap = True
        OnClick = btn_CopyDbTablesClick
      end
      object jvrdgrp_ServerType: TJvRadioGroup
        Left = 35
        Top = 11
        Width = 364
        Height = 35
        Caption = 'Server Type:'
        Columns = 4
        ItemIndex = 3
        Items.Strings = (
          'Local'
          'Pipe'
          'Tcpip'
          'No Server')
        TabOrder = 7
        OnClick = jvrdgrp_ServerTypeClick
      end
      object jvlstbx_AlaisNames: TJvListBox
        Left = 251
        Top = 180
        Width = 217
        Height = 65
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 8
        OnClick = jvlstbx_AlaisNamesClick
      end
      object lb_ServerNames: TListBox
        Left = 16
        Top = 139
        Width = 201
        Height = 121
        ItemHeight = 13
        TabOrder = 9
        OnClick = lb_ServerNames1Click
      end
      object jvpnl_PleaseWait: TJvPanel
        Left = 172
        Top = 163
        Width = 93
        Height = 62
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        Visible = False
        object img_1: TImage
          Left = 1
          Top = 1
          Width = 91
          Height = 48
          Align = alTop
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
            003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000003
            C34944415478DAED99494C13511880FF379D16EA9620B2A8A8B4601422A0504C
            8C8A6C232E70D2A8713BC0411385839E257AF0A889D683315113D1B8C4C40318
            51B0D56A6222285B0C1A6925811041D4C4859676DAE73FC586568B1666EA6B23
            7F3279336FFBFF6FDEFF967F8640940B616DC034006B03FE39C0E9EA2A332550
            18166308351D3973A924AC00A76AAA68388CF7C9D1B3172765D354009E60B22E
            4CF65B1060435801FCA5BABC4891D1303698A76CC77F0F20DB9D7041B09CAB37
            4FCA6D140368B68AE594D07A397D701CD95292CADF6302D06473DEC42E76C8E9
            0308BD2EE834BB5901F462174B6401007927E8793D2300971D935879006017F4
            EA19AC008630499009308800C98C00149803406F0A7ACD2E26000F7B9DB91E0F
            6955BB86C99AA7D9A0717D08A99D539D00CFD675824B3D8F0247F384544D1B13
            0049D08D1A31294B7E7F035674EE0BA94D57F635184CF60E5C23BACF6639FA65
            0398DFD214B74AECC42D396E79F72148E9BBF0C7FAFD8B0EC2EB0CA3A4F8B3CA
            CD67172D25FD4C012469B23A2BF12C7C9173DB21BFA500667F690F5AEFEB9C55
            D0B2DA021E0E172E4A2B8534CD65B9BA150B689A6CA211AD3A8CF3010C2DC530
            F35B7740F9F75919D09A6F92FC5E526BC4B5BF4609BD8A01DC7A4535715AF101
            DE6ED0DA7B210F21621D7DDE3247EC62AFF10EAD77CF7B14F789DF6830105744
            0148523F40676847C57A4AA158323EB755F0E6BFC86F86D19814F43230D963F8
            8A8A056444299D8AC7C43F21EE2244A1341292D8B5A99226B323862F57D2F8B0
            0034F6D1B99C5334E1DBCEF9A5A8DDADE64B362D229F2216A0B99FC653A7D884
            B7ABA4E7BCD652C09D0A5E1A1EF8AAB4110D2F94A6908F1107E03F897D7986E7
            8518B07038074CFE55237312E3B9E80A7617DA560CB40ECF3FFB2306C0B791FD
            9A1FC485FC1822642333D91CCBDCA07A89B7BF9DE92770219F8CA8C09D5BAC8F
            7DC314C077989B6273B687B9FB36570107F038782985B4B7B5D2F742B0A69F98
            5015E61694EAD54F98004C14D010EA82CC570760FE409DF77960E17EE8CE3C8F
            EEA40E06CA2EA0091652721E07E4B46F87F8E1FB01753FCE2B838E95B7C74EA2
            81C232A40C0CEAA5379FD5B1071287EE04AD3F94B40D8399AB3812BC7F36CBA0
            5EB4A10BE8C69E286475EE85A4F7B7FED86670FE4EE8CAAA1B574D8855D0F1E9
            8C00C6E7405ACF71D0D94E86D4CE96760CAFDA9F16B0FCB06515B7A2010D2AF7
            08ACB5A4871ED46B12E1E9FA1EF0A8B4D222B5B954A76E6402505D5E64C6A450
            4E1F2826638379527F65940488FACFEBD10730FD93EF2F32FD932FDA641A80B5
            443DC00F89777940117A3C3B0000000049454E44AE426082}
          Proportional = True
          Stretch = True
          ExplicitLeft = 72
          ExplicitWidth = 128
        end
        object lbl_1: TLabel
          Left = 1
          Top = 1
          Width = 91
          Height = 60
          Align = alBottom
          Alignment = taCenter
          Caption = 'Working Hard'
          WordWrap = True
          ExplicitTop = 3
        end
      end
      object mmo_IssuesMemo: TMemo
        Left = 230
        Top = 320
        Width = 275
        Height = 105
        Color = clMedGray
        Lines.Strings = (
          '')
        ScrollBars = ssBoth
        TabOrder = 11
      end
    end
    object crd_CreateNewDbTables: TCard
      Left = 1
      Top = 1
      Width = 947
      Height = 428
      Caption = 'crd_CreateNewDbTables'
      CardIndex = 3
      TabOrder = 3
    end
    object crd_PackRestructureDb: TCard
      Left = 1
      Top = 1
      Width = 947
      Height = 428
      Caption = 'crd_PackRestructureDb'
      CardIndex = 4
      TabOrder = 4
    end
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 0
    Width = 1165
    Height = 78
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1165
      78)
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
      Width = 681
      Height = 7
      Anchors = [akLeft, akTop, akRight]
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
      Width = 38
      Height = 19
      Caption = 'MOW'
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
    object btn_OpenCloseSv: TPngSpeedButton
      Left = 6
      Top = 35
      Width = 34
      Height = 38
      OnClick = btn__SplitViewOpenCloseClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F800000006624B474400FF00FF00FFA0BDA793000000324944415478DA6364A0
        3160A4B905D1D1D1FF87B605B4347CD482510BA864C168461BB560D482D18C46
        8405B4349C2E160000F6260C7913779A3F0000000049454E44AE426082}
    end
    object btn_GridMruSelection: TButton
      Left = 43
      Top = 47
      Width = 229
      Height = 25
      Action = act_ClickLabel
      Caption = '(Select, Create, Edit, Remove Projects)'
      Images = frm_NxToolsMain.il_AppImages
      TabOrder = 0
      Visible = False
    end
    object jvxpbtn_HaltProgram: TJvXPButton
      Left = 278
      Top = 51
      Width = 179
      Caption = 'Close Program'
      TabOrder = 1
      OnClick = jvxpbtn_HaltProgramClick
    end
    object btn_1: TButton
      Left = 480
      Top = 32
      Width = 75
      Height = 25
      Caption = 'btn_1'
      TabOrder = 2
      OnClick = btn_1Click
    end
  end
  object StatusBarPro: TStatusBarPro
    Left = 0
    Top = 514
    Width = 1165
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
  object sv_MenuItems: TSplitView
    Left = 0
    Top = 78
    Width = 210
    Height = 436
    CloseStyle = svcCompact
    Color = clBtnText
    DockSite = True
    OpenedWidth = 210
    Placement = svpLeft
    TabOrder = 3
    OnClosed = sv_MenuItemsClosed
    OnOpened = sv_MenuItemsOpened
    OnOpening = sv_MenuItemsOpening
    object ctgrybtns_Menu: TCategoryButtons
      Left = 0
      Top = 0
      Width = 210
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
              Action = act_RecentPrjs
            end
            item
              Action = act_CreateEditPrjs
            end>
        end
        item
          Caption = 'Database Tools'
          Color = 16771818
          Collapsed = False
          Items = <
            item
              Action = act_ChangeDbServers
              Caption = 'ChangeProject Db Server'
            end
            item
              Action = act_CreateUpdateDb
              Caption = 'Create/Update Project Tables'
              Hint = 'Create empty Project Db Tables'
            end
            item
              Action = act_PackRestDb
              Caption = 'Pack/Restructure Project Db'
              Hint = 'Pack/Restructure Project Db'
            end>
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Images = il1
      RegularButtonColor = clBtnText
      SelectedButtonColor = clBlack
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Images = il1
    Left = 824
    Top = 104
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
      ImageIndex = 8
      OnExecute = act_ConnectBtnExecute
      OnUpdate = act_ConnectBtnUpdate
    end
    object act_PrjEdit: TAction
      Caption = 'Local Database'
      OnExecute = act_PrjEditExecute
      OnUpdate = act_PrjEditUpdate
    end
    object act_RecentPrjs: TAction
      Category = 'sv_menuItems'
      Caption = 'Recent Projects'
      Hint = 'Open a Recent Project'
      ImageIndex = 0
      OnExecute = act_RecentPrjsExecute
    end
    object act_CreateEditPrjs: TAction
      Category = 'sv_menuItems'
      Caption = 'Create/Edit Projects'
      Hint = 'Create\Edit a Project'
      ImageIndex = 2
      OnExecute = act_CreateEditPrjsExecute
    end
    object act_ChangeDbServers: TAction
      Category = 'sv_menuItems'
      Caption = 'Change Db Server'
      Hint = 'Change/Select Db Server'
      ImageIndex = 3
      OnExecute = act_ChangeDbServersExecute
    end
    object act_CreateUpdateDb: TAction
      Category = 'sv_menuItems'
      Caption = 'Create/Update Db Tables'
      Hint = 'Create empty Db Tables'
      ImageIndex = 6
      OnExecute = act_CreateUpdateDbExecute
    end
    object act_PackRestDb: TAction
      Category = 'sv_menuItems'
      Caption = 'Pack/Restructure Db'
      Hint = 'Pack/Restructure Db'
      ImageIndex = 7
      OnExecute = act_PackRestDbExecute
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = frm_NxToolsMain.jvpxmlflstrg_NxDbToolsPrefs
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpState, fpSize]
    StoredProps.Strings = (
      'act_ClickLabel.Tag'
      'cardpnl_Dialogs.ActiveCard'
      'sv_MenuItems.Opened')
    StoredValues = <>
    Left = 817
    Top = 8
  end
  object JvSelectDirectory1: TJvSelectDirectory
    Left = 576
    Top = 24
  end
  object popm_Transport: TPopupMenu
    Left = 1000
    Top = 388
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
    Left = 808
    Top = 288
  end
  object popm_Server: TPopupMenu
    Left = 792
    Top = 388
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
    Left = 888
    Top = 388
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
    Left = 976
    Top = 86
  end
  object il1: TImageList
    Height = 32
    Width = 32
    Left = 1036
    Top = 18
    Bitmap = {
      494C01010C002400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000C3C3C3002727270000000000000000000000000000000000000000000000
      0000000000000101010039393900DBDBDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2D6EB00A6789700EBE3
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001818180055555500A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900A9A9A900A9A9A90039393900414141000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3D9F900A47ED200A374
      9600EBE1E7000000000000000000ECE4E900D3BCCB00CCB1C200DBCAD5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD009D9D9D009898980098989800BDBDBD0000000000DADA
      DA0000000000DADADA0000000000000000000000000000000000000000000000
      00000000000000000000B1B1B100040404000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1D6F600A47FE000A37C
      D100A4749500E9DEE500C5A8BB00A4749100BB94A300C09BA600B3899D00A576
      9400E8DCE4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080002222
      2200000000000101010019191900202020000D0D0D00000000006F6F6F00D5D5
      D50000000000000000000000000000000000D4D4D40028282800000000000000
      00000000000000000000B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDE4EF009F6E9300A47C
      D300A37CD0009E6C8C00AF839900E0C4BD00E7CDC200E7CDC200E7CDC200CFAD
      B000A4749200E6DAE20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC8BD00DEDAD200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072727200070707001D1D1D008686
      8600C7C7C7000000000000000000000000000000000000000000DBDBDB00D5D5
      D500000000000000000000000000999999000202020000000000111111000000
      00000000000000000000B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5D8E5009F6E
      9300A175A800AF849C00E4C9C000E7CDC200E7CDC200E7CDC200E7CDC200E6CC
      C100D4B3B400A4759200E8DCE400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCC6BA00AEA49000ACA28E00DBD7CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6002E2E2E0012121200A0A0A000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D5000000000000000000AEAEAE000000000021212100B3B3B300010101002323
      23000000000000000000B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BC9A
      B100AF839A00E4C9C000E7CDC200E7CDC200E7CDC200E7CDC200DCBDBA00A878
      9300CEB2AC00C6A6A700A3749100A7799600A2729100AF859F00F0E9EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D3C900AEA49000AEA49000ACA38F00DEDAD20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8D8D800151515003E3E3E000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D5000000000000000000000000008B8B8B0000000000000000009F9F9F000000
      00004040400000000000B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBC8D300A97A
      9500E4C9C000E7CDC200E7CDC200E7CDC200E7CDC200D9BAB800DDC4B900BE9C
      A100C6A8A600C19FA200A4749100DEC7C500EDDDD300C19FAB00BB97AE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7D3C900AEA49000AEA49000ACA38F00DEDAD20000000000D1CB
      C000CCC6BA00CCC6BA00CCC6BA00EEEDE9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001D1D1D0047474700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D500000000000000000000000000000000000000000000000000000000006767
      67000000000070707000B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD839D00D3B1
      B300E7CDC200E7CDC200E7CDC200E7CDC200E5CCC100A8789400BD9AA100D0B7
      AC00C1A0A200A4749100DFC8C600EDDDD300DFC9C700A5769300DECED7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCD8D000ACA28E00AEA49000ACA28E00BAB2A200AEA4
      9000AEA49000AEA49000AEA49000B4AB9900F2F0ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000484848003838380000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000484848004F4F4F00B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6C8C00E4C9
      C000E7CDC200E7CDC200E7CDC200CDA9AE00D8BCB500CCB0A900C8ABA700C1A0
      A200A4749100DEC8C600EDDDD300DFCAC700A5769300DCCAD600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7D3C900AEA49000ADA38F00AEA49000AEA4
      9000AEA49000AEA49000AEA49000AEA49000B6AD9C0000000000CAC5BB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A30004040400D3D3D30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7D7
      D70000000000DDDDDD0000000000000000000000000000000000000000000000
      00000000000000000000B4B4B400020202000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A16F8E00DFC2
      BC00E7CDC200E7CDC200E7CDC200C39EA600AD829600D0B7AC00C1A0A300A575
      9200DEC8C600EDDDD300DFCAC700A5769300DCCAD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9B1A000AEA49000AEA49000AEA4
      9000AEA49000AEA49000AEA49000AEA49000AEA49000BAB3A300796D54009489
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002323
      2300717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0D007878780000000000000000000000000000000000000000000000
      0000000000000000000056565600333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BA97AC00C19C
      A600E7CDC200CCA9AE00C5A1A800D0B7AC00CFB5AC00C2A1A300A4759200DEC7
      C600EDDDD300E0CAC700A5769300DCCAD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFC9BD00AEA49000AEA49000AEA49000AEA4
      9000AEA49000AEA49000AEA49000AEA49000B5AD9D007B6F55007A6E5400796D
      5400D2CEC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C2000000
      0000D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACACAC000B0B0B0000000000000000000000000000000000000000000000
      000000000000000000001A1A1A00C9C9C9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDE5EA00A373
      9100D3B1B200DBBDB700AB7E9500CFB5AB00C2A1A300A4759200DEC7C600EDDD
      D300E0CBC700A5769300DCCAD60000000000D5C0CE00B18FA900DFCED9000000
      0000000000000000000000000000EEE6EB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9C3B600AEA49000AEA49000AEA49000AEA4
      9000AEA49000AEA49000AEA49000B6AE9D007A6E55007A6E5400796D5300C5C0
      B500000000009F96850000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464003E3E
      3E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0D0D000CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00D5D5D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4D7
      DF00A3739100CEAFAE00D0B7AC00C4A5A500A4769200DCC4C300EDDDD300E2CD
      C800A7779500D6C1CE0000000000000000009E6C8D0094B4D200A0799800DAC9
      D5000000000000000000DBC9D300A4759300A97B980000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9C3B600AEA49000AEA49000AEA49000AEA4
      9000AEA49000AEA49000B6AE9D007A6E55007A6E5400796D5300C5C0B5000000
      00008A7F69007A6E54008F857100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000353535007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5D9E100A2739000B8939D00A4759200DEC7C600EDDDD300E1CAC800A678
      9400DCCAD600000000000000000000000000AB85A10099A1BF0091CDEA00A079
      9800DACAD500DBC9D400A7789500E2CDC800BE9BAA00CFB5C500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9C3B600AEA49000AEA49000AEA49000AEA4
      9000AEA49000B8B0A0007A6E55007A6E5400796D5300C5C0B500000000008E84
      6E007A6E54007A6E540092887300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0C0C00A8A8
      A800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7C3D000A2718F00DEC7C600EDDDD300E1CAC800A5789400DBCA
      D4000000000000000000000000000000000000000000A9839F00989FBC0091CE
      EB009F779600A7799500E2CCC900EDDDD300C8A8B200C8ACBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECEAE500B1A89500AEA49000AEA49000AEA4
      9000B6AD9D007A6E55007A6E5400796D5300C6C1B600000000008E846F007A6E
      54007A6E5400978E7900BBB3A200F3F2EF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8ABBD00C9A9B200EDDDD300E1CBC800A6789500DBCAD4000000
      0000E1D2DC00D3BCCB0000000000000000000000000000000000A9849F00998C
      AB00A2779600E1CCC900EDDDD300DEC7C600A2729000D7C3D000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECEAE600B1A89500AEA49000B6AD
      9D007A6E55007A6E5400796D5300C6C1B600000000008E846F007A6E54007A6E
      5400978E7900B2A89500AEA49000B5AC9A00F1EFEC0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDB3C300C09DAB00E1CBC800A6789500DBCAD40000000000F0E9
      ED00A07695009A90AD00AB87A200000000000000000000000000D1BAC900A476
      9400E1CBC800EDDDD300DEC7C600A5779300B9939D00A3729000E3D6DF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0EEEB00BAB3A3007A6E
      55007A6E5400796D5300C6C1B600000000008E846F007A6E54007A6E5400978E
      7900AFA69300AEA49000AEA49000AEA49000B2A99600F1EFEC00000000000000
      000000000000000000000000000000000000000000000000000006060600AEAE
      AE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBDBDB007474
      7400909090000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A87B9700A4769300DBCAD4000000000000000000F1EA
      EE00A076950092CAE800989FBC00AB85A20000000000D6C1CF00A4769300E1CB
      C800EDDDD300DEC8C500A5769300C4A3A500D0B7AC00CBA9AB00A3729000E3D5
      DE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDC9BF00796D53007A6E
      54007A6E5400CDC9BF00000000008F8571007A6E54007A6E5400978D7900B2A8
      9500AEA49000AEA49000AEA49000AEA49000AEA49000E2DFD800000000000000
      0000000000000000000000000000000000000000000000000000343434007C7C
      7C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB005C5C5C00040404000000
      00000D0D0D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEE7EC000000000000000000000000000000
      0000DAC9D6009F77970091CCE900999FBE00A77D9A00A4769400E1CAC800EDDD
      D300DEC7C600A5759200C3A2A400CDB4AA00A97C9300D9BCB600D2B1B300A372
      9100EEE5EB000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDECE900897E6700796D
      5300C6C1B700000000008F8571007A6E54007A6E5400978D7900B2A89500AEA4
      9000AEA49000AEA49000AEA49000AEA49000AEA49000E2DFD800000000000000
      00000000000000000000000000000000000000000000000000006F6F6F003E3E
      3E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBBBBB0023232300030303004F4F4F00A3A3A3000505
      0500000000009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DAC9D4009F78970095A9C700A1769500E0CBC700EDDDD300DEC7
      C600A5759200C3A2A300CAAEA800D0B7AC00C3A0A600D1AFB200E7CDC200C09A
      A500BC97AE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D4D0
      C800000000008F8571007A6E54007A6E5400978D7900B2A89500AEA49000AEA4
      9000AEA49000AEA49000AEA49000AEA49000AEA49000E2DFD800000000000000
      0000000000000000000000000000000000000000000000000000BABABA000202
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBBBBB00858585000000000000000000959595000E0E
      0E006B6B6B002828280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C2A5B800A1759300E0CBC700EDDDD300DEC8C600A576
      9300C3A1A200D0B7AC00A97B9300C09BA300E7CCC100E7CDC200E7CDC200DEC1
      BC00A1708F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A19785007A6E54007A6E54009D948000AFA69300AEA49000AEA49000AEA4
      9000AEA49000AEA49000AEA49000AEA49000B1A89500F1EFEC00000000000000
      0000000000000000000000000000000000000000000000000000000000002D2D
      2D00717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002D2D2D006868
      6800DDDDDD0001010100BCBCBC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBC9D400A4769300DFCAC700EDDDD300DEC8C600A4759200C3A1
      A300C6A8A600CBB0A900D4B8B100D1AEB000E7CDC200E7CDC200E7CDC200E3C8
      C0009F6C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECEAE700897E6700938A7500B6AE9D00AEA49000AEA49000AEA49000AEA4
      9000AEA49000AEA49000AEA49000B0A79400D5D0C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A20006060600D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009191910009090900DEDE
      DE00000000004A4A4A0061616100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DECDD700A5769300DFCAC700EDDDD300DFC8C600A5759300C1A0A300D0B7
      AC00BC99A000A8799300E7CBC100E7CDC200E7CDC200E7CDC200E7CDC200D3B3
      B400AE839D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDEBE700B1A89500AEA49000AEA49000AEA4
      9000AEA49000AEA49000AFA79400B7AE9D00ACA38F00DEDAD300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000464646003737370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D8000D0D0D00898989000000
      00000000000000000000D7D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B996AC00C2A0AB00EDDDD300DEC7C500A5769300C1A0A300C6A7A500BE9C
      A100D9C0B400DBBCB800E7CDC200E7CDC200E7CDC200E7CDC200E4C9C000A97B
      9600DCCAD6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEBE700B1A89500AEA49000AEA4
      9000AEA49000B0A79400D5D0C700ACA28E00AEA49000ACA28E00DCD8CF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001313130050505000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DBDBDB001B1B1B0043434300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0E9ED00AF859F00A2729100A6779500A2739100C5A4A600CDB0AB00A878
      9400DEC0BB00E7CDC200E7CDC200E7CDC200E7CDC200E5CAC000B0849B00BF9D
      B300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F0ED00E2DFD800E2DF
      D800E2DFD800F0EFEC0000000000DAD6CD00ACA28E00AEA49000ACA38F00DFDB
      D300000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00181818003D3D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BEBEBE001A1A1A003C3C3C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7DCE300A4739100D3B1B200E7CD
      C200E7CDC200E7CDC200E7CDC200E7CDC200E5CAC000B2879C00AB8B9300A274
      8E00E9DEE4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDAD200ACA38F00AEA49000CEC8
      BC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCDCDC002B2B2B0015151500A1A1A100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075757500020202005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6DAE200A3739000CDAB
      AF00E7CDC200E7CDC200E7CDC200E0C5BD00B0859B009D6B8B00AAAD7A00AAAC
      7B00A1748D00EEE9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDBD400CFC9BE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800006060600202020007F7F
      7F00C7C7C7000000000000000000000000000000000000000000BBBBBB006B6B
      6B000A0A0A0017171700A2A2A200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7DCE300A576
      9300B2879C00C09BA600BC94A300A4749100C6AABB00E6DCE200A1748D00AAAD
      7A00ACB87700E4EAD50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000838383002222
      220000000000080808001A1A1A00212121001616160004040400040404003939
      39009F9F9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8C4D100CAAFC000CEB5C500ECE4E9000000000000000000EAE0E700A376
      9100ABAC7D00E7EED60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500989898009898980099999900C1C1C100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBE1
      E800A6789500E5E2DB0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000CDCDCD00BABA
      BA00ABABAB00A9A9A900ADADAD00BABABA00CFCFCF0000000000000000000000
      00000000000000000000D0D0D0005C5C5C0016161600000000000E0E0E004C4C
      4C00B8B8B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDCDCD00BABA
      BA00ABABAB00A9A9A900A9A9A900B2B2B200CECECE0000000000000000000000
      00000000000000000000000000008D8D8D000000000000000000929292000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CBCBCB00606060001E1E1E00010101000E0E0E004D4D
      4D00B9B9B9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8D8D800888888004B4B4B001414140000000000000000000000
      00000D0D0D00101010000B0B0B00000000000000000000000000171717000000
      00000000000085858500010101003939390096969600A9A9A900A0A0A0004E4E
      4E00000000005959590000000000000000000000000000000000000000000000
      000000000000D9D9D900898989004C4C4C001414140000000000000000000000
      00000D0D0D00101010001010100005050500000000002B2B2B00000000000000
      0000818181007F7F7F0000000000616161003E3E3E003A3A3A00666666000000
      00007C7C7C008989890000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100909090006F6F6F006565
      650054545400545454005E5E5E006F6F6F008080800096969600C8C8C8000000
      00000000000086868600020202003838380087878700A8A8A800919191004C4C
      4C00000000005F5F5F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100909090006F6F6F006565
      6500545454005454540054545400656565006D6D6D0091919100B6B6B6000000
      0000000000009A9A9A0000000000000000008F8F8F00000000004D4D4D000000
      000000000000909090000000000000000000000000000000000000000000B6B6
      B6003939390000000000191919005C5C5C0099999900C2C2C200000000000000
      00000000000000000000000000000000000000000000C1C1C100AAAAAA000000
      00008E8E8E0005050500A1A1A100000000000000000000000000000000000000
      0000C1C1C100161616005959590000000000000000000000000000000000B7B7
      B7003A3A3A0000000000191919005B5B5B0099999900C2C2C200000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00040404001111110026262600080808007B7B7B0076767600080808002323
      2300111111000303030089898900000000000000000000000000000000000000
      0000CBCBCB006D6D6D0024242400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      03002424240005050500A1A1A100000000000000000000000000000000000000
      0000C1C1C100151515005E5E5E00000000000000000000000000000000000000
      0000CBCBCB006D6D6D0024242400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909000000
      0000AFAFAF00000000000E0E0E00494949000303030000000000000000003535
      350026262600000000006E6E6E000000000000000000000000004D4D4D000101
      010056565600BEBEBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000070707009090900000000000000000000000000031313100CDCDCD000000
      000000000000BEBEBE0000000000B7B7B70000000000000000004F4F4F000000
      000055555500BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005D5D
      5D001E1E1E00DADADA00626262009F9F9F000000000000000000A0A0A0006161
      6100CFCFCF00161616005E5E5E00000000000000000000000000C1C1C1003737
      3700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009090900000000000000000000000000031313100CDCDCD000000
      000000000000BEBEBE0000000000B7B7B7000000000000000000C1C1C1003737
      3700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006464
      6400000000002727270000000000000000000000000000000000000000000000
      0000000000000F0F0F00DDDDDD0000000000000000002A2A2A0025252500CBCB
      CB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E001F1F1F000000000000000000000000000000000000000000C0C0C0000000
      000000000000000000004C4C4C004F4F4F00000000002B2B2B0024242400CACA
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000111111007C7C7C000000000000000000979797009A9A9A00000000000000
      00005D5D5D001F1F1F0000000000000000000000000077777700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F1F1F000000000000000000000000000000000000000000C0C0C0000000
      000000000000000000004B4B4B004E4E4E000000000077777700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000707070078787800A8A8
      A800000000006565650000000000000000002A2A2A00727272003D3D3D000000
      0000000000002D2D2D0000000000000000006D6D6D001F1F1F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004444
      44006767670000000000D9D9D900C0C0C000B8B8B8000000000091919100C0C0
      C000CDCDCD000000000098989800151515006E6E6E001E1E1E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5007373
      730003030300ACACAC000000000015151500191919001C1C1C00202020000000
      000098989800070707006D6D6D00A5A5A5008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006767670000000000D9D9D900C0C0C000B8B8B8000000000091919100C0C0
      C000CDCDCD000000000097979700141414008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001313130000000000B2B2
      B200767676000B0B0B0000000000191919000000000000000000000000003E3E
      3E0000000000000000005A5A5A00969696001D1D1D0097979700000000000000
      000000000000000000000000000000000000DEDEDE00B5B5B5008A8A8A007676
      760067676700656565006D6D6D007C7C7C008D8D8D0000000000000000003535
      35007B7B7B000000000064646400000000000000000000000000000000000000
      00003131310000000000ACACAC00040404001D1D1D0096969600000000000000
      000000000000000000000000000000000000D0D0D000ACACAC00898989007676
      7600676767006565650071717100BABABA000000000000000000000000003535
      35006D6D6D00000000007E7E7E002B2B2B000000000000000000191919009595
      9500000000007474740032323200000000001A1A1A0000000000000000000000
      0000000000000000000000000000030303002C2C2C0052525200676767007B7B
      7B008E8E8E009898980098989800989898008E8E8E006E6E6E00505050000E0E
      0E007A7A7A000000000064646400000000000000000000000000000000000000
      00003131310000000000ACACAC00030303001A1A1A0000000000000000000000
      0000000000000000000000000000030303002D2D2D0052525200686868007B7B
      7B008E8E8E00989898009191910082828200676767005A5A5A00000000003232
      3200000000000000000000000000454545000000000000000000000000007676
      76000000000000000000000000000000000000000000B6B6B600000000000000
      000000000000A5A5A500555555001818180000000000080808002C2C2C004343
      43004343430043434300434343003232320031313100D7D7D700000000004D4D
      4D005D5D5D000000000000000000000000000000000000000000B8B8B8000000
      000000000000000000008D8D8D001C1C1C0000000000B6B6B600000000000000
      000000000000A7A7A700525252001111110000000000070707002C2C2C004343
      4300434343004343430042424200989898000000000000000000000000005050
      50008B8B8B00000000007B7B7B003131310000000000000000001E1E1E009292
      9200000000008888880046464600000000000000000000000000000000000606
      06004A4A4A0095959500C9C9C900000000000000000000000000D5D5D500CBCB
      CB00BABABA00BABABA00BABABA00CACACA00D1D1D10000000000000000005151
      51005C5C5C000000000000000000000000000000000000000000B8B8B8000000
      000000000000000000008C8C8C001A1A1A000000000000000000000000000606
      06004A4A4A0095959500C9C9C900000000000000000000000000C6C6C600BABA
      BA00A9A9A900A9A9A900B0B0B000BEBEBE00D4D4D4000000000000000000B2B2
      B2007676760009090900000000000D0D0D00DCDCDC0000000000000000002929
      290000000000010101006E6E6E009B9B9B0000000000B6B6B600000000007D7D
      7D000E0E0E000C0C0C005B5B5B00A0A0A000DDDDDD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F8F
      8F00121212000000000000000000000000000000000000000000C0C0C0000000
      00000000000000000000353535005F5F5F0000000000B6B6B600000000007E7E
      7E000F0F0F000C0C0C005B5B5B009F9F9F00DDDDDD0000000000000000000000
      0000000000000000000000000000000000000000000000000000767676004949
      490000000000CFCFCF00DBDBDB000D0D0D002F2F2F0029292900171717000000
      00009595950008080800525252007A7A7A000000000008080800797979000000
      000000000000D3D3D3008A8A8A00474747001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000171717001515
      1500121212000000000000000000000000000000000000000000C0C0C0000000
      00000000000000000000353535005C5C5C0000000000080808007A7A7A000000
      000000000000C2C2C2007F7F7F00444444001313130000000000000000000000
      000000000000000000000000000000000000000000000707070078787800AAAA
      AA00000000005858580000000000000000000D0D0D003F3F3F00161616000000
      00000000000044444400000000000000000000000000919191001A1A1A001B1B
      1B009A9A9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000131313006C6C6C0000000000000000000000000064646400D9D9D9000000
      0000000000009C9C9C0002020200D0D0D00000000000919191001A1A1A001B1B
      1B00999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0D007373730000000000D8D8D8007575750078787800000000000000
      0000505050003131310000000000000000002E2E2E00D9D9D900000000009D9D
      9D00323232000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6C6C0000000000000000000000000064646400D9D9D9000000
      0000000000009B9B9B0002020200CCCCCC002E2E2E00D9D9D900000000008C8C
      8C00222222000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006D6D
      6D00000000002F2F2F0000000000000000000000000000000000000000000000
      0000000000001D1D1D00000000000000000000000000080808005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF00000000006E6E6E00000000000000000000000000000000000000
      000090909000050505007F7F7F00000000000000000008080800585858000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B0017171700D0D0D00061616100A2A2A20000000000000000009E9E9E006565
      6500BFBFBF0006060600999999000000000000000000D1D1D1002C2C2C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E00000000000000000000000000000000000000
      00008F8F8F0005050500838383000000000000000000CACACA001F1F1F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A0A0A000000
      0000B3B3B300000000001C1C1C006B6B6B001111110000000000050505005757
      57003A3A3A00000000008D8D8D0000000000000000002E2E2E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AEAEAE00141414001212120063636300767676006D6D6D001F1F
      1F00090909008C8C8C000000000000000000000000002E2E2E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B00080808001414140021212100070707007B7B7B0076767600070707001C1C
      1C0018181800030303008181810000000000CBCBCB000B0B0B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001212120063636300767676006D6D6D001F1F
      1F00070707008A8A8A000000000000000000CBCBCB000A0A0A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004747
      470000000000ABABAB0000000000000000009898980000000000565656000000
      000000000000A3A3A30000000000000000000000000076767600000000000000
      000000000000000000000000000000000000000000000000000000000000DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC000000000000000000000000000000
      00000000000000000000000000008F8F8F004949490032323200414141007F7F
      7F00000000000000000000000000000000000000000076767600000000000000
      000000000000000000000000000000000000000000000000000000000000DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC000000000000000000000000000000
      0000727272007171710000000000606060004848480044444400656565000000
      0000575757007A7A7A0000000000000000003636360000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0B001B1B1B002121210019191900090909000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F008383
      8300000000000000000000000000000000003636360000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0B001B1B1B002121210019191900090909000000000000000000000000000000
      00004646460000000000888888008B8B8B00C9C9C900212121008F8F8F000000
      00000000000000000000000000000000000000000000AEAEAE00000000000000
      00000000000000000000BBBBBB007E7E7E00454545001C1C1C00000000000000
      00000000000000000000000000000000000001010100212121004C4C4C008686
      8600C3C3C3000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00000000000000
      00000000000000000000B8B8B800747474003737370013131300000000000000
      00000000000000000000000000000000000000000000171717003D3D3D007D7D
      7D00C2C2C20000000000000000008A8A8A0000000000000000008F8F8F000000
      0000000000000000000000000000000000000202020000000000000000000000
      0000000000002F2F2F006363630094949400C5C5C50000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008E8E
      8E005D5D5D0027272700000000000000000000000000000000001F1F1F000000
      0000000000000000000000000000000000000202020000000000000000000000
      0000000000002F2F2F006363630094949400C5C5C50000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF008E8E
      8E005C5C5C0037373700000000005B5B5B000000000000000000000000000000
      00000000000000000000000000000000000000000000B6B6B60000000000DDDD
      DD006C6C6C0012121200040404003A3A3A0077777700A0A0A000C5C5C500DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DBDBDB00BFBFBF009B9B9B00717171003131
      3100010101001B1B1B00797979000000000000000000B6B6B6004D4D4D000000
      00000000000000000000000000000000000000000000B6B6B60000000000DEDE
      DE006D6D6D0013131300040404003939390077777700A0A0A000C5C5C500DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DBDBDB00BFBFBF009B9B9B00707070003030
      3000010101001C1C1C007A7A7A00DEDEDE00DCDCDC00DCDCDC00000000000000
      0000000000000000000000000000000000000000000000000000101010007878
      7800DADADA000000000000000000ADADAD007E7E7E005D5D5D003C3C3C003232
      320021212100212121002323230032323200404040006060600081818100B5B5
      B5000000000000000000CFCFCF006969690009090900000000001E1E1E000000
      0000000000000000000000000000000000000000000000000000101010007878
      7800DADADA000000000000000000ADADAD007E7E7E005D5D5D003C3C3C003232
      320021212100212121002323230032323200404040006060600081818100B5B5
      B5000000000000000000CECECE00717171002B2B2B00212121003C3C3C000000
      00000000000000000000000000000000000000000000B2B2B200717171000505
      0500353535009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8F8F00272727000B0B0B0089898900969696001E1E1E000000
      00000000000000000000000000000000000000000000B2B2B200727272000505
      0500343434009B9B9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E8E8E00262626000B0B0B008B8B8B00D3D3D3008B8B8B000000
      0000000000000000000000000000000000000303030075757500000000000000
      0000989898003A3A3A0002020200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000404040045454500A3A3A3000000000000000000616161001E1E1E000000
      0000000000000000000000000000000000000303030075757500000000000000
      0000989898003A3A3A0002020200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000404040045454500A3A3A3000000000000000000606060001E1E1E000000
      000000000000000000000000000000000000000000002E2E2E0013131300ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009696960009090900383838001E1E1E000000
      000000000000000000000000000000000000000000003030300013131300A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009595950008080800393939001E1E1E000000
      000000000000000000000000000000000000B6B6B600000000008F8F8F001212
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1C1C00A2A2A20000000000B5B5B5000000
      000000000000000000000000000000000000B6B6B600000000008F8F8F001212
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1C1C00A2A2A20000000000B5B5B5000000
      000000000000000000000000000000000000000000000D0D0D00DDDDDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8C8C80003030300131313000000
      000000000000000000000000000000000000000000000D0D0D00DCDCDC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C70003030300131313000000
      0000000000000000000000000000000000000000000047474700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F5F5F00000000000000
      0000000000000000000000000000000000000000000047474700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F5F5F00000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3F00080808000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003E3E3E00080808000000
      0000000000000000000000000000000000006868680000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888000000
      0000000000000000000000000000000000006868680000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888000000
      000000000000000000000000000000000000000000009B9B9B00000000000000
      000000000000000000000000000000000000ABABAB0082828200575757004343
      4300343434003232320036363600434343005D5D5D0087878700B2B2B2000000
      00000000000000000000000000000000000000000000717171000B0B0B000000
      000000000000000000000000000000000000000000009B9B9B00000000000000
      0000000000000000000000000000DADADA009D9D9D0079797900565656004343
      4300343434003232320036363600434343005A5A5A007D7D7D00A3A3A3000000
      00000000000000000000000000000000000000000000717171000B0B0B000000
      0000000000000000000000000000000000001010100000000000000000000000
      0000000000000000000005050500383838006464640088888800A0A0A000B6B6
      B600C5C5C500CBCBCB00C3C3C300B4B4B4009E9E9E00848484005E5E5E003232
      32000202020000000000000000000000000000000000000000002F2F2F000000
      0000000000000000000000000000000000001010100000000000000000000000
      0000000000000000000005050500383838006464640088888800A0A0A000B6B6
      B600C5C5C500CBCBCB00C3C3C300B4B4B4009E9E9E00848484005E5E5E003232
      32000202020000000000000000000000000000000000000000002F2F2F000000
      00000000000000000000000000000000000000000000B6B6B600000000000000
      0000D2D2D200727272002222220000000000121212003A3A3A005F5F5F007676
      76007676760076767600767676007575750059595900353535000E0E0E000000
      00002A2A2A007F7F7F00DCDCDC000000000000000000979797001E1E1E000000
      00000000000000000000000000000000000000000000B6B6B600000000000000
      0000D3D3D300747474001F1F1F0000000000121212003A3A3A005F5F5F007676
      76007676760076767600767676007575750059595900353535000D0D0D000000
      00002929290080808000DDDDDD000000000000000000979797001E1E1E000000
      0000000000000000000000000000000000000000000000000000000000000606
      060052525200ABABAB00000000000000000000000000C3C3C300A2A2A2009898
      980087878700878787008989890098989800A6A6A600C7C7C700000000000000
      000000000000A1A1A100474747000202020000000000000000001E1E1E000000
      0000000000000000000000000000000000000000000000000000000000000606
      060052525200ABABAB00000000000000000000000000C3C3C300A2A2A2009898
      980087878700878787008989890098989800A6A6A600C7C7C700000000000000
      000000000000A1A1A100474747000202020000000000000000001E1E1E000000
      00000000000000000000000000000000000000000000B6B6B600D0D0D0004A4A
      4A0000000000363636008E8E8E00D3D3D3000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CACA
      CA008484840029292900010101005B5B5B00DEDEDE00979797001E1E1E000000
      00000000000000000000000000000000000000000000B6B6B600D1D1D1004B4B
      4B0000000000353535008E8E8E00D2D2D2000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9C9
      C9008383830028282800010101005C5C5C0000000000979797001E1E1E000000
      0000000000000000000000000000000000000000000008080800797979000000
      0000000000009F9F9F0057575700151515000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D0060606000ABABAB0000000000DDDDDD0069696900020202001E1E1E000000
      0000000000000000000000000000000000000000000008080800797979000000
      0000000000009F9F9F0057575700151515000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D0060606000ABABAB0000000000DDDDDD0069696900020202001E1E1E000000
      0000000000000000000000000000000000000000000073737300060606004545
      4500CDCDCD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD0034343400101010006E6E6E001E1E1E000000
      0000000000000000000000000000000000000000000074747400070707004444
      4400CCCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBBBBB0033333300101010006E6E6E001E1E1E000000
      0000000000000000000000000000000000002E2E2E00D9D9D900000000006C6C
      6C000B0B0B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000121212007F7F7F0000000000C9C9C9003C3C3C000000
      0000000000000000000000000000000000002E2E2E00D9D9D900000000006C6C
      6C000B0B0B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000121212007F7F7F0000000000C9C9C9003C3C3C000000
      0000000000000000000000000000000000000000000000000000818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063636300060606001A1A1A000000
      00000000000000000000000000000000000000000000010101008A8A8A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00060606001A1A1A000000
      00000000000000000000000000000000000000000000B7B7B700141414000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021212100CDCDCD00000000000000
      00000000000000000000000000000000000000000000B7B7B700141414000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021212100CDCDCD00000000000000
      0000000000000000000000000000000000000000000040404000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000232323000B0B0B000000
      0000000000000000000000000000000000000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000232323000B0B0B000000
      000000000000000000000000000000000000B6B6B60002020200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090900D1D1D1000000
      000000000000000000000000000000000000B6B6B60002020200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090900D1D1D1000000
      000000000000000000000000000000000000000000007C7C7C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054545400060606000000
      000000000000000000000000000000000000000000007C7C7C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000053535300060606000000
      0000000000000000000000000000000000002B2B2B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004B4B4B000000
      0000000000000000000000000000000000002B2B2B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004B4B4B000000
      0000000000000000000000000000000000002828280075757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054545400474747000000
      0000000000000000000000000000000000002929290074747400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200484848000000
      0000000000000000000000000000000000001111110000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131000000
      0000000000000000000000000000000000001111110000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131000000
      0000000000000000000000000000000000009F9F9F0006060600BABABA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F0002020200BFBFBF000000
      000000000000000000000000000000000000A0A0A00005050500B9B9B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9D9D0001010100C0C0C0000000
      0000000000000000000000000000000000006767670000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888000000
      0000000000000000000000000000000000006767670000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888000000
      000000000000000000000000000000000000000000006F6F6F00030303007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063636300020202008F8F8F00000000000000
      0000000000000000000000000000000000000000000071717100030303007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000626262000202020090909000000000000000
      0000000000000000000000000000000000000000000041414100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000041414100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000A4A4A4001D1D
      1D001010100069696900C2C2C200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7B7B7005C5C5C00090909002A2A2A00B9B9B90000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A4A4001919
      19001010100068686800C1C1C100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6B6B6005B5B5B00090909002C2C2C00BBBBBB0000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000A0A
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000131313009393930000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000A0A
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000131313009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9F9F003F3F3F00010101000B0B0B00444444006D6D6D0092929200A9A9
      A900A9A9A900A9A9A900A9A9A900A8A8A8008C8C8C00686868003E3E3E000707
      0700030303004C4C4C00ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000929292003B3B3B00010101000B0B0B00444444006D6D6D0092929200A9A9
      A900A9A9A900A9A9A900A9A9A900A8A8A8008C8C8C00686868003D3D3D000606
      0600040404004D4D4D00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000878787002828280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003434340093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000878787002828280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003434340093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6A6A6006969690045454500232323001010
      100010101000101010001010100010101000272727004A4A4A0070707000AFAF
      AF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A7A7A7006A6A6A0046464600232323001010
      100010101000101010001010100010101000272727004A4A4A0070707000B0B0
      B000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C0068686800424242001B1B1B001010
      10001010100010101000101010001010100020202000464646006E6E6E00A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C0068686800424242001B1B1B001010
      10001010100010101000101010001010100020202000464646006E6E6E00A5A5
      A500000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000037373700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000036363600000000000000
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
      000000000000C5C5C50000000000A2A2A200A9A9A900A9A9A900A9A9A900A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A2A2A20000000000C5C5C5000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A100A2A2A20000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000C8C8C8000000000000000000CACACA00000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000191919001A1A1A0000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000001E1E1E001F1F1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000C8C8C8000000000000000000CACACA00000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A100A2A2A20000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300000000000000000000000000C0C0C0000000
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
      000000000000C0C0C0000000000000000000000000000101010080808000A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900A9A9A9008080800001010100000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000006060600363636004848
      4800484848004848480048484800484848004848480048484800484848004848
      4800484848003636360006060600000000000000000000000000C0C0C0000000
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
      000000000000C0C0C0000000000000000000000000000C0C0C00080808000909
      0900090909000909090009090900090909000909090009090900090909000909
      090009090900080808000D0D0D00000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C0000000000000000000000000002C2C2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002E2E2E00000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000BFBFBF00BABA
      BA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00BABA
      BA00BABABA00BFBFBF0000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
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
      000000000000C0C0C00000000000CDCDCD00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00D1D1D10000000000C2C2C2000000
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
      0000000000000000000003030300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040400000000000000
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
      00000000000000000000BFBFBF000303030064646400A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A1006767670004040400BEBEBE00000000000000
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
      0000000000000000000000000000A6A6A6001A1A1A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000018181800A7A7A70000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      8FFFFFFFFFFFFFFFFFFFF000FFFFFFFF861FFFFFFFFFFFFFFFF823FCFFFFFFFF
      8007FFFFFFFFFFFFFFC0073CFFFFFFFF8003FFFFF9FFFFFFFF07C61CFFFFFFFF
      C001FFFFF0FFFFFFFC3FE40CFFFFFFFFE0001FFFF07FFFFFF8FFE6C4FFFFFFFF
      C0001FFFF820FFFFF9FFE7E0F000000FC0001FFFFC007FFFF3FFE7F0F000000F
      C0003FFFFE005FFFE3FFE3FCFFFFFFFFC0007FFFFF000FFFE7FFF3FCFFFFFFFF
      C000FFFFFE0007FFC7FFF000FFFFFFFFC0011EFFFE000BFFCFFFFC03FFFFFFFF
      E0030C7FFE0011FFCFFFFFFFFFFFFFFFF007003FFE0021FFCFFFFFFFFFFFFFFF
      F80F803FFE0040FFCFFFFFFFF000000FF813C03FFF00807FCFFFFFFFF000000F
      F821C01FFF81003FCFFFFFC7FFFFFFFFFC60800FFF82003FCFFFFF07FFFFFFFF
      FEF00007FF84003FCFFFFC03FFFFFFFFFFF80007FFE8003FCFFFFCC3FFFFFFFF
      FFFC0007FFF0003FE7FFFFC1FFFFFFFFFFF80007FFF0007FE3FFFF89FFFFFFFF
      FFF00007FFFE003FF3FFFF1DF000000FFFF00007FFFF001FF9FFFE3FF000000F
      FFF0000FFFFF820FF8FFFC7FFFFFFFFFFFFF0007FFFFFF0FFC3FF8FFFFFFFFFF
      FFFF8003FFFFFF9FFF07C1FFFFFFFFFFFFFFC003FFFFFFFFFFC007FFFFFFFFFF
      FFFFF0C3FFFFFFFFFFF83FFFFFFFFFFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC07C07FFC07E1FFFFFFC07FFFFFF1F
      F8001803F8003213FF001803FF001B1BE03F91F1E03FE001F00001F1F0001001
      C3FFF398C3FFE0C1C0000398C00008018FFFE79C8FFFF3338000079C80000803
      3FFFE4043FFFC21000000404000020E03F0064043F00C4C800000404000020E0
      3800279C3800C4C801C0679C01C06060207FE79C207FC0101800079C18000803
      07FFF39807FFF23320000398200008031FFFF1F11FFFE0C1800001F180001001
      3FFFF8033FFFE0010000000300000B1B3FE0FE0F3FE0F2130000000F0000041F
      3C0007FF3C00061F007FC01F007FC0FF2000019F2000003F06000C1F06000C1F
      03FFF81F03FFF81F3000019F3000019F0FFFFE1F0FFFFE1F4000005F4000005F
      1FFFFF1F1FFFFF1F8000003F8000003F3FFFFF9F3FFFFF9F0000001F0000001F
      3F001F9F3E001F9F0000001F0000001F3000019F3000019F0380381F0380381F
      00FFE01F00FFE09F1800021F1800021F07FFFC1F07FFFC1F2000009F2000009F
      1FFFFF1F1FFFFF1F8000003F8000003F3FFFFF9F3FFFFF9F0000001F0000001F
      3FFFFF9F3FFFFF9F0000001F0000001F3FFFFF9F3FFFFF9F0000001F0000001F
      1FFFFF1F1FFFFF1F0000001F0000001F8FFFFE3F8FFFFE3F8000003F8000003F
      C1FFF07FC1FFF07FC000007FC000007FF00001FFF00001FFF00001FFF00001FF
      FE000FFFFE000FFFFE000FFFFE000FFFFFF00FFF00000000FFFFFFFFFC00003F
      FFE007FF00000000FFFFFFFFF800001FFFC003FF00000000FFFFFFFFF9FFFF9F
      FF8001FF00000000F8000001F9FFFF9FFFFE7FFF00000000F0000001F9FE7F9F
      FFFE7FFF00000000C0000001F9FC3F9FFFFE7FFF0000000080000001F9FE7F9F
      FFFE7FFF0000000080000001F9FFFF9FFFFE7FFF0000000080000001F9FFFF9F
      000000000000000080000001F9FE7F9FFFFFFFFF0000000080000001F9FC3F9F
      FFFFFFFF0000000080000001F9FE7F9FFFFFFFFF0000000080000001F9FFFF9F
      FFFFFFFF0000000080000001F9FFFF9FFFFFFFFF0000000080000001F9FFFF9F
      FFFFFFFF0000000080000001F9FFFF9FFFF00FFF0000000080000001F980019F
      FFC003FF0000000080000001F980019FFF0810FF0000000080000001F99FF99F
      FE300C7F0000000080000001F99FF99FFC60063F0000000080000001F980019F
      F8E0071F0000000080000001F980019FF1E0078F0000000080000001F99FF99F
      F1E0078F0000000080000001F99FF99FF8E0071F0000000080000007F99FF99F
      FC60063F0000000080000007F980019FFE302C7F0000000080FFFFFFF9C0039F
      FF0810FF0000000080FFFFFFF9FFFF9FFFC003FF0000000080FFFFFFF800001F
      FFF00FFF0000000080FFFFFFFC00003FFFFFFFFF00000000C1FFFFFFFC00003F
      FFFFFFFF00000000E3FFFFFFFE00007F00000000000000000000000000000000
      000000000000}
  end
end
