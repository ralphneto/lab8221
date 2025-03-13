unit uNormaImpacto;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls;


type
  TfrmNormaImpacto = class(TForm)
		lbNomeNorma: TLabel;
		edNomeNorma: TEdit;
    bvNormaImpacto: TBevel;
    gbPrimeiroLimite: TGroupBox;
    lbDesacPrimLimite: TLabel;
		edDesacPrimLimite: TEdit;
		lbUnidDesacPrimLimite: TLabel;
    lbTempoPrimLimite: TLabel;
		edTempoPrimLimite: TEdit;
		lbUnidTempoPrimLimite: TLabel;
    gbParametros: TGroupBox;
    gbSegundoLimite: TGroupBox;
		lbDesacSegLimite: TLabel;
		lbUnidDesacSegLimite: TLabel;
    lbTempoSegLimite: TLabel;
    lbUnidTempoSegLimite: TLabel;
    edDesacSegLimite: TEdit;
		edTempoSegLimite: TEdit;
		btnCancelar: TButton;
		btnOk: TButton;
		edAltImp: TEdit;
    lbAltImp: TLabel;
    lbUnidAltImp: TLabel;
		lbUniVelImp: TLabel;
    edVelImp: TEdit;
    lbVelImp: TLabel;
    use2nd: TCheckBox;
    lbAcelMax: TLabel;
    edAcelMax: TEdit;
    lbUnidAcelMax: TLabel;
    lbAltSens: TLabel;
    edAltSens: TEdit;
    lbUnidAltSens: TLabel;
    Label1: TLabel;
    edType1: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edAltImp2: TEdit;
    edVelImp2: TEdit;
    edType2: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edAltImp3: TEdit;
    edVelImp3: TEdit;
    edType3: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edReal1: TEdit;
    edReal2: TEdit;
    edReal3: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edVelInf: TEdit;
    edVelSup: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
		procedure edDesacPrimLimiteKeyPress(Sender: TObject; var Key: Char);
		procedure edAltImpOnExit(Sender: TObject);
		procedure edVelImpOnExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure use2ndClick(Sender: TObject);
    procedure edAltImp2Exit(Sender: TObject);
    procedure edAltImp3Exit(Sender: TObject);
    procedure edVelImp2Exit(Sender: TObject);
    procedure edVelImp3Exit(Sender: TObject);
    procedure edAltImpChange(Sender: TObject);
    procedure edAltImp2Change(Sender: TObject);
    procedure edAltImp3Change(Sender: TObject);
 	private
		{ Private declarations }
	public
		procedure Clear;
	end;


var
	frmNormaImpacto: TfrmNormaImpacto;


implementation

 uses uAtrito ;
{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmNormaImpacto.Clear;
begin
	edNomeNorma.Text := '';
	edAcelMax.Text := '';
	edType1.Text := '';
	edAltImp.Text := '';
	edVelImp.Text := '';
	edReal1.Text := '';
	edType2.Text := '';
	edAltImp2.Text := '';
	edVelImp2.Text := '';
	edReal2.Text := '';
	edType3.Text := '';
	edAltImp3.Text := '';
	edVelImp3.Text := '';
  edReal3.Text := '';
	edAltSens.Text := '';
	edDesacPrimLimite.Text := '';
	edTempoPrimLimite.Text := '';
	edDesacSegLimite.Text := '';
	edTempoSegLimite.Text := '';
end;


{===============================================================================

===============================================================================}
procedure TfrmNormaImpacto.edDesacPrimLimiteKeyPress(Sender: TObject;
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


procedure TfrmNormaImpacto.edAltImpOnExit(Sender: TObject);
var sTexto : string ;
begin
			if edAltImp.text <> '' then
		begin
		if strtofloat(edAltImp.text) > 3 then ShowMessage('Altura não pode ultrapassar 3 metros') else
			sTexto := formatfloat('###0.00',sqrt((strtofloat(edAltImp.text)*19.6))) ;
		if  sTexto <> '' then
		edVelImp.Text := sTexto ;
	end;
end;

procedure TfrmNormaImpacto.edVelImpOnExit(Sender: TObject);
var sTexto : string ;
begin
	if edVelImp.text <> '' then
	begin
	sTexto := formatfloat('####.00',sqr(strtofloat(edVelImp.text))/19.6) ;
		if sTexto <> '' then
			edAltImp.text := sTexto ;
	end;
end;


procedure TfrmNormaImpacto.btnOkClick(Sender: TObject);
begin
		if frmNormaImpacto.edDesacSegLimite.text = '' then frmNormaImpacto.edDesacSegLimite.text := #$20 ;
		if frmNormaImpacto.edTempoSegLimite.text = '' then frmNormaImpacto.edTempoSegLimite.text := #$20 ;
        if frmNormaImpacto.edDesacPrimLimite.text = '' then
        begin
        	ShowMessage('O campo de Desacel. 1º limite não'+#13+
            			'foi preenchido corretamente e terá'+#13+
            			'seu valor substituído por 0.');
            frmNormaImpacto.edDesacPrimLimite.Text := '0';
        end;
        if frmNormaImpacto.edTempoPrimLimite.text = '' then
        begin
        	ShowMessage('O campo de Tempo do 1º limite não'+#13+
            			'foi preenchido corretamente e terá'+#13+
            			'seu valor substituído por 0.');
            frmNormaImpacto.edTempoPrimLimite.text := '0';
        end;

        if (edReal1.Text <> '') then
        if strtofloat(edReal1.Text) > 3 then
		ShowMessage('A altura real não pode ultrapassar a 3 metros!');

        if (edReal2.Text <> '') then
        if strtofloat(edReal2.Text) > 3 then
		ShowMessage('A altura real não pode ultrapassar a 3 metros!');

        if (edReal3.Text <> '') then
        if strtofloat(edReal3.Text) > 3 then
		ShowMessage('A altura real não pode ultrapassar a 3 metros!');

end;

procedure TfrmNormaImpacto.use2ndClick(Sender: TObject);
begin
	if use2nd.checked = true then
		begin
			edDesacSegLimite.enabled := true ;
			edTempoSegLimite.enabled := true ;
		end
	else
		begin
			edDesacSegLimite.enabled := false ;
			edTempoSegLimite.enabled := false ;
		end;
end;

procedure TfrmNormaImpacto.edAltImp2Exit(Sender: TObject);
var sTexto : string ;
begin
			if edAltImp2.text <> '' then
		begin
		if strtofloat(edAltImp2.text) > 3 then ShowMessage('Altura não pode ultrapassar 3 metros') else
			sTexto := formatfloat('###0.00',sqrt((strtofloat(edAltImp2.text)*19.6))) ;
		if  sTexto <> '' then
		edVelImp2.Text := sTexto ;
	end;
end;

procedure TfrmNormaImpacto.edAltImp3Exit(Sender: TObject);
var sTexto : string ;
begin
			if edAltImp3.text <> '' then
		begin
		if strtofloat(edAltImp3.text) > 3 then ShowMessage('Altura não pode ultrapassar 3 metros') else
			sTexto := formatfloat('###0.00',sqrt((strtofloat(edAltImp3.text)*19.6))) ;
		if  sTexto <> '' then
		edVelImp3.Text := sTexto ;
	end;
end;

procedure TfrmNormaImpacto.edVelImp2Exit(Sender: TObject);
var sTexto : string ;
begin
	if edVelImp2.text <> '' then
	begin
	sTexto := formatfloat('####.00',sqr(strtofloat(edVelImp2.text))/19.6) ;
		if sTexto <> '' then
			edAltImp2.text := sTexto ;
	end;
end;

procedure TfrmNormaImpacto.edVelImp3Exit(Sender: TObject);
var sTexto : string ;
begin
	if edVelImp3.text <> '' then
	begin
	sTexto := formatfloat('####.00',sqr(strtofloat(edVelImp3.text))/19.6) ;
		if sTexto <> '' then
			edAltImp3.text := sTexto ;
	end;
end;






procedure TfrmNormaImpacto.edAltImpChange(Sender: TObject);
begin
			edReal1.text := edAltImp.Text
end;

procedure TfrmNormaImpacto.edAltImp2Change(Sender: TObject);
begin
			edReal2.text := edAltImp2.Text
end;

procedure TfrmNormaImpacto.edAltImp3Change(Sender: TObject);
begin
			edReal3.text := edAltImp3.Text
end;

end.
