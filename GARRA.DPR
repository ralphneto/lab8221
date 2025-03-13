program Garra;

uses
  Forms,
  ufAmortecedor in '..\cbTest\ufAmortecedor.pas' {frmAmortecedor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAmortecedor, frmAmortecedor);
  Application.Run;
end.
