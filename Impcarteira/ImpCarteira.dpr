program ImpCarteira;

uses
  Vcl.Forms,
  fImpCarteira in 'fImpCarteira.pas' {frmcarteira},
  uDmSge in 'uDmSge.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmcarteira, frmcarteira);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
