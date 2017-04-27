unit fImpCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, uDmSge, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,   FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxOLE,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.ComCtrls, ppStrtch, ppMemo;

type
  Tfrmcarteira = class(TForm)
    dsCarteira: TDataSource;
    dbgCarteira: TDBGrid;
    btnImprimir: TButton;
    ppDBPipeline1: TppDBPipeline;
    RptCart: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    cds: TClientDataSet;
    dbgMembro: TDBGrid;
    dsConsulta: TDataSource;
    btnEnviar: TButton;
    Label1: TLabel;
    edtCodigo: TEdit;
    btnSelecionar: TButton;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    cdsNucleo: TClientDataSet;
    dsNucleo: TDataSource;
    cbxNucleo: TComboBox;
    btnLimpar: TButton;
    Limpar: TButton;
    cdsConsulta: TClientDataSet;
    edtDtVal: TDateTimePicker;
    Label4: TLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ppLabel12: TppLabel;
    lblDtVal: TppLabel;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLabel15: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppMemo1: TppMemo;
    ppImage3: TppImage;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    //
    procedure TrazMembros(pIdNucleo:integer = 0);
    procedure cbxNucleoCloseUp(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dbgMembroDblClick(Sender: TObject);
    procedure dbgCarteiraDblClick(Sender: TObject);
    procedure LimparClick(Sender: TObject);
    procedure RptCartBeforePrint(Sender: TObject);
    //
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcarteira: Tfrmcarteira;
  sSql:string;
 // cds:TClientDataSet;
  dm:tDm;

implementation

{$R *.dfm}

procedure Tfrmcarteira.btnImprimirClick(Sender: TObject);
begin
  RptCart.PrintReport;
{
  if dm.Conn.Connected then
  begin
    try
      dm.Conn.Connected := False;
    except
    end;
  end;
  //
  if not dm.Conn.Connected  then
  begin
    try
      dm.Conn.Connected := True;
      if dm.Conn.Connected then
      begin
        RptCart.PrintReport;
      end;
    finally
    end;
  end;
}
end;

procedure Tfrmcarteira.btnEnviarClick(Sender: TObject);
begin
  cdsConsulta.First;
  while not cdsConsulta.Eof do
  begin
    cds.Append;
    cds.FieldByName('CODIGO').AsInteger := cdsConsulta.FieldByName('CODIGO').AsInteger;
    cds.FieldByName('NOME').AsString    := cdsConsulta.FieldByName('NOME').AsString;
    cds.FieldByName('FT_MEMBRO').Value  := cdsConsulta.FieldByName('FT_MEMBRO').value;
    cds.FieldByName('RG').AsString      := cdsConsulta.FieldByName('RG').AsString;
    cds.FieldByName('CPF').AsString     := cdsConsulta.FieldByName('CPF').AsString;
    cds.FieldByName('NOMEPAI').AsString := cdsConsulta.FieldByName('NOMEPAI').AsString;
    cds.FieldByName('NOMEMAE').AsString := cdsConsulta.FieldByName('NOMEMAE').AsString;
    cds.FieldByName('DTNASC').AsString  := cdsConsulta.FieldByName('DTNASC').AsString;
    cds.FieldByName('FUNCAO').AsString  := cdsConsulta.FieldByName('FUNCAO').AsString;
    cds.Post;
    cdsConsulta.Next;
  end;
end;

procedure Tfrmcarteira.btnSelecionarClick(Sender: TObject);
begin
  TrazMembros(0);
end;


procedure Tfrmcarteira.btnLimparClick(Sender: TObject);
begin
  edtCodigo.Clear;
  edtNome.Clear;
  cbxNucleo.ItemIndex:=-1;
  cdsConsulta.EmptyDataSet;
end;

procedure Tfrmcarteira.cbxNucleoCloseUp(Sender: TObject);
begin
 if cbxNucleo.ItemIndex >= 0 then
 begin
   cdsNucleo.RecNo:=cbxNucleo.ItemIndex + 1;
   TrazMembros(cdsNucleo.FieldByName('ID_NUCLEO').AsInteger);
 end;
end;

procedure Tfrmcarteira.dbgCarteiraDblClick(Sender: TObject);
begin
  cds.Delete;
end;

procedure Tfrmcarteira.dbgMembroDblClick(Sender: TObject);
begin
  cds.Insert;
  cds.FieldByName('CODIGO').AsInteger := cdsConsulta.FieldByName('CODIGO').AsInteger;
  cds.FieldByName('NOME').AsString    := cdsConsulta.FieldByName('NOME').AsString;
  cds.FieldByName('FT_MEMBRO').Value  := cdsConsulta.FieldByName('FT_MEMBRO').value;
  cds.FieldByName('RG').AsString      := cdsConsulta.FieldByName('RG').AsString;
  cds.FieldByName('CPF').AsString     := cdsConsulta.FieldByName('CPF').AsString;
  cds.FieldByName('NOMEPAI').AsString := cdsConsulta.FieldByName('NOMEPAI').AsString;
  cds.FieldByName('NOMEMAE').AsString := cdsConsulta.FieldByName('NOMEMAE').AsString;
  cds.FieldByName('DTNASC').AsString  := cdsConsulta.FieldByName('DTNASC').AsString;
  cds.Post;
end;

procedure Tfrmcarteira.TrazMembros(pIdNucleo:integer = 0);
begin
  sSql:= 'select m.codigo,m.nome,f.FT_MEMBRO,         '+
         '       m.RG, m.CPF, fc.DESCRICAO as funcao, '+
         '       m.DTNASC, m.NOMEPAI, m.NOMEMAE       '+
         '  from foto f join membro m                 '+
         '    on (f.ID_MEMBRO = m.ID_MEMBRO)          '+
         '       join funcao fc                       '+
         '    on (m.ID_FUNCAO = fc.ID_FUNCAO)         '+
         ' where 1 = 1 and m.id_igreja = 2              '+
         '   and m.ID_SITUACAO = 7';
  if pIdNucleo > 0 then
    sSql:= sSql + ' and m.id_nucleo = '+IntToStr(pIdNucleo);
  if edtCodigo.Text <> '' then
    sSql:= sSql + ' and m.codigo = '+edtCodigo.Text;
  if edtNome.Text <> '' then
    sSql:= sSql + ' and upper(m.nome) like '+chr(39)+uppercase(trim(edtNome.Text))+'%'+chr(39);
  //
  cdsConsulta.Data := dm.GetDataSet(sSql);
  //
end;

procedure Tfrmcarteira.FormCreate(Sender: TObject);
begin
  dm := TDm.Create(self);
  sSql:= 'select m.codigo,m.nome,f.FT_MEMBRO,         '+
         '       m.RG, m.CPF, fc.DESCRICAO as funcao, '+
         '       m.DTNASC, m.NOMEPAI, m.NOMEMAE       '+
         '  from foto f join membro m                 '+
         '    on (f.ID_MEMBRO = m.ID_MEMBRO)          '+
         '       join funcao fc                       '+
         '    on (m.ID_FUNCAO = fc.ID_FUNCAO)         '+
         ' where 1 = 2';
  cds.Data := dm.GetDataSet(sSql);
  //
  sSql:= 'select n.ID_NUCLEO, n.NOME '+
         '  from igreja i join nucleo n '+
         '    on (i.ID_IGREJA = n.ID_IGREJA) '+
         ' where i.ID_IGREJA = 2 ';
  cdsNucleo.Data := dm.GetDataSet(sSql);
  //
  cdsNucleo.first;
  cbxNucleo.Items.Clear;
  while not cdsNucleo.Eof do
  begin
    cbxNucleo.Items.add(cdsNucleo.FieldByName('NOME').AsString);
    cdsNucleo.next;
  end;
  cbxNucleo.ItemIndex:=-1;
  cdsNucleo.first;
  //
end;

procedure Tfrmcarteira.LimparClick(Sender: TObject);
begin
  cds.First;
  while not cds.Eof do
    cds.Delete;
end;

procedure Tfrmcarteira.RptCartBeforePrint(Sender: TObject);
begin
  lblDtVal.Caption:= DateToStr(edtDtVal.Date);
end;

end.
