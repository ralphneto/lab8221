unit uCintaRes;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls;

type
	TfrmCintaRes = class(TForm)
	Button1: TButton;
	Button2: TButton;
    Label18: TLabel;
    lbEmpresa: TLabel;
    lbModelo: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
		LabelX: TLabel;
    lbCondicionamento: TLabel;
    lbTam: TLabel;
    lbLote: TLabel;
    lbAmostra: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lbDElast: TLabel;
    Label4: TLabel;
    lbDPlast: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edPlast: TEdit;
    edElast: TEdit;
    Label5: TLabel;
    lbObs: TLabel;
    stRes: TLabel;
		procedure Button1Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmCintaRes: TfrmCintaRes;

implementation

uses uCintaPrint, uNovoEnsaio ;

{$R *.DFM}




procedure TfrmCintaRes.Button1Click(Sender: TObject);
begin
	frmCintaRes.Close ;
end;

procedure TfrmCintaRes.Button2Click(Sender: TObject);
begin
	frmCintaPrint.stEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
	frmCintaPrint.stCapacete.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
	frmCintaPrint.stAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
	frmCintaPrint.stLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
	frmCintaPrint.stTamanho.Caption := frmNovoEnsaio.edTamanho.Text ;
	frmCintaPrint.stCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;

	frmCintaPrint.qrCinta.Preview ;
end;





end.
