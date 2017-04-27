object dm: Tdm
  OldCreateOrder = False
  Height = 341
  Width = 778
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 208
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 80
  end
  object Conn: TFDConnection
    Params.Strings = (
      'Database=imaxbyte'
      'User_Name=imaxbyte'
      'Password=jr42r215'
      'Server=imaxbyte.mysql.dbaas.com.br'
      'CharacterSet=latin1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 97
  end
  object QryG: TFDQuery
    Connection = Conn
    Left = 144
    Top = 160
  end
  object Qtmp: TFDQuery
    Connection = Conn
    Left = 56
    Top = 16
  end
  object CdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 112
    Top = 64
  end
  object DsProvider: TDataSetProvider
    DataSet = Qtmp
    Left = 80
    Top = 200
  end
  object ConnAux: TFDConnection
    Params.Strings = (
      'Database=sagaeplus'
      'User_Name=sagaeplus'
      'Password=js42r215'
      'Server=mysql.sagaeplus.com.br'
      'CharacterSet=latin1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 96
    Top = 137
  end
  object ConnGenesis: TFDConnection
    Params.Strings = (
      'Database=D:\RENOVAR_SIS\Renovar\Renovar.mdb'
      
        'ODBCAdvanced=DefaultDir=D:\RENOVAR_SIS\Renovar;DriverId=25;MaxBu' +
        'fferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Thr' +
        'eads=3;UserCommitSync=Yes'
      'User_Name=admin'
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 392
    Top = 25
  end
  object QryLerMembrosGenesis: TFDQuery
    Connection = ConnGenesis
    SQL.Strings = (
      'SELECT Membros.[Codigo],membros.[obs]'
      'FROM Membros'
      'where Membros.[obs] <> '#39#39
      'order by codigo')
    Left = 392
    Top = 80
  end
  object DsMembrosGenesis: TDataSource
    DataSet = QryLerMembrosGenesis
    Left = 392
    Top = 136
  end
  object QryInsMembrosSagae: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'insert into membro'
      '  (ID_IGREJA,  ID_NUCLEO, CODIGO,  NOME,  LOGRADOURO,'
      
        '  BAIRRO,  CEP,  CIDADE,  ESTADO,  TIPO,  TELRES,  TELCEL, NATUR' +
        'ALIDADE,'
      
        '  NACIONALIDADE,  NOMEPAI,  NOMEMAE,  ID_ESTCIVIL,  PROFISSAO,  ' +
        'SEXO,'
      
        '  ID_ESCOLAR,  CPF,   RG,  ORGAO,  ID_FUNCAO,  DTNASC,  DTCONVER' +
        'SAO,'
      '  DTBATISMO,  FLGBATISMOES,  DTAPRESENT, ID_SITUACAO)'
      'values'
      '  (:p_ID_IGREJA,:p_ID_NUCLEO,:p_CODIGO,:p_NOME,:p_LOGRADOURO,'
      
        '   :p_BAIRRO,:p_CEP,:p_CIDADE,:p_ESTADO,:p_TIPO,:p_TELRES,:p_TEL' +
        'CEL,:p_NATURALIDADE,'
      
        '   :p_NACIONALIDADE,:p_NOMEPAI,:p_NOMEMAE,:p_ID_ESTCIVIL,:p_PROF' +
        'ISSAO,:p_SEXO,'
      
        '   :p_ID_ESCOLAR,:p_CPF, :p_RG,:p_ORGAO,:p_ID_FUNCAO,:p_DTNASC,:' +
        'p_DTCONVERSAO,'
      '   :p_DTBATISMO,:p_FLGBATISMOES, :p_DTAPRESENT,:p_ID_SITUACAO)')
    Left = 400
    Top = 208
    ParamData = <
      item
        Name = 'P_ID_IGREJA'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_NUCLEO'
        ParamType = ptInput
      end
      item
        Name = 'P_CODIGO'
        ParamType = ptInput
      end
      item
        Name = 'P_NOME'
        ParamType = ptInput
      end
      item
        Name = 'P_LOGRADOURO'
        ParamType = ptInput
      end
      item
        Name = 'P_BAIRRO'
        ParamType = ptInput
      end
      item
        Name = 'P_CEP'
        ParamType = ptInput
      end
      item
        Name = 'P_CIDADE'
        ParamType = ptInput
      end
      item
        Name = 'P_ESTADO'
        ParamType = ptInput
      end
      item
        Name = 'P_TIPO'
        ParamType = ptInput
      end
      item
        Name = 'P_TELRES'
        ParamType = ptInput
      end
      item
        Name = 'P_TELCEL'
        ParamType = ptInput
      end
      item
        Name = 'P_NATURALIDADE'
        ParamType = ptInput
      end
      item
        Name = 'P_NACIONALIDADE'
        ParamType = ptInput
      end
      item
        Name = 'P_NOMEPAI'
        ParamType = ptInput
      end
      item
        Name = 'P_NOMEMAE'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_ESTCIVIL'
        ParamType = ptInput
      end
      item
        Name = 'P_PROFISSAO'
        ParamType = ptInput
      end
      item
        Name = 'P_SEXO'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_ESCOLAR'
        ParamType = ptInput
      end
      item
        Name = 'P_CPF'
        ParamType = ptInput
      end
      item
        Name = 'P_RG'
        ParamType = ptInput
      end
      item
        Name = 'P_ORGAO'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_FUNCAO'
        ParamType = ptInput
      end
      item
        Name = 'P_DTNASC'
        ParamType = ptInput
      end
      item
        Name = 'P_DTCONVERSAO'
        ParamType = ptInput
      end
      item
        Name = 'P_DTBATISMO'
        ParamType = ptInput
      end
      item
        Name = 'P_FLGBATISMOES'
        ParamType = ptInput
      end
      item
        Name = 'P_DTAPRESENT'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_SITUACAO'
        ParamType = ptInput
      end>
  end
  object QryGetMembroSagae: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'select  ID_IGREJA, ID_MEMBRO from membro where codigo = :p_codig' +
        'o')
    Left = 280
    Top = 208
    ParamData = <
      item
        Name = 'P_CODIGO'
        ParamType = ptInput
      end>
  end
  object QryInsHistorico: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'insert into historico'
      '  (assunto, descricao, id_usuario, id_membro)'
      'values'
      '  (:p_assunto, :p_descricao,:p_id_usuario, :p_id_membro)')
    Left = 400
    Top = 256
    ParamData = <
      item
        Name = 'P_ASSUNTO'
        ParamType = ptInput
      end
      item
        Name = 'P_DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_MEMBRO'
        ParamType = ptInput
      end>
  end
  object QryLerFoto: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select  id_foto, id_membro, ft_membro'
      'from foto'
      'where id_membro = :p_id_membro')
    Left = 632
    Top = 40
    ParamData = <
      item
        Name = 'P_ID_MEMBRO'
        ParamType = ptInput
      end>
  end
  object QryInsFoto: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'insert into foto (id_membro, ft_membro)'
      'values (:p_id_membro, :p_foto )')
    Left = 632
    Top = 96
    ParamData = <
      item
        Name = 'P_ID_MEMBRO'
        ParamType = ptInput
      end
      item
        Name = 'P_FOTO'
        ParamType = ptInput
      end>
  end
  object qryLerMembrosSagae: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT id_membro, codigo FROM membro'
      'where id_membro >= 7212'
      'order by codigo')
    Left = 632
    Top = 160
  end
  object QryAltFoto: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'update foto set ft_membro = :p_foto'
      'where id_membro = :p_id_membro')
    Left = 712
    Top = 96
    ParamData = <
      item
        Name = 'P_FOTO'
        ParamType = ptInput
      end
      item
        Name = 'P_ID_MEMBRO'
        ParamType = ptInput
      end>
  end
end
