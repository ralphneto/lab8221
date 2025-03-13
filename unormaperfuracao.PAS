unit uNormaPerfuracao;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls;


type
	TfrmNormaPerfuracao = class(TForm)
		bvNormaPerfuracao: TBevel;
		btnCancelar: TButton;
		edNomeNorma: TEdit;
		lbNomeNorma: TLabel;
    lbMedidaDinamica: TLabel;
    edMedidaDinamica: TEdit;
		lbUnidAlturaMartelo: TLabel;
		btnOk: TButton;
    edEnsaios: TEdit;
    lbImpactos: TLabel;
    procedure edMedidaDinamicaKeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
	public
		procedure Clear;
	end;


var
	frmNormaPerfuracao: TfrmNormaPerfuracao;


implementation


{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmNormaPerfuracao.Clear;
begin
	edNomeNorma.Text := '';
	edMedidaDinamica.Text := '';
	edEnsaios.Text := '';
end;


{===============================================================================

===============================================================================}
procedure TfrmNormaPerfuracao.edMedidaDinamicaKeyPress(Sender: TObject;
	var Key: Char);
begin
	case Key of
		'0'..'9':;
		#0..#31:;
		',':;
	else
		Key := #0;
	end;
end;



end.
