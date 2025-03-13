unit	 uPerfRes;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls;

type
  TfrmPerfRes = class(TForm)
    Button1: TButton;
		Label3: TLabel;
		Button2: TButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    LabelX: TLabel;
    lbEmpresa: TLabel;
    lbModelo: TLabel;
    lbAmostra: TLabel;
    lbLote: TLabel;
    lbEnsaio: TLabel;
    lbCondicionamento: TLabel;
    lbEnsUnit: TLabel;
    lbResGlobal: TLabel;
    stResGlobal: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    lbDElast: TLabel;
    lbEnsaios: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edElast: TEdit;
    Label5: TLabel;
    lbTamanho: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
	end;

var
	frmPerfRes: TfrmPerfRes;

implementation

uses uPerfPrint, uNovoEnsaio ;
{$R *.DFM}


procedure TfrmPerfRes.Button1Click(Sender: TObject);
begin
	frmPerfRes.Close ;
end;

procedure TfrmPerfRes.Button2Click(Sender: TObject);
begin
	frmPerfPrint.stEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
	frmPerfPrint.stCapacete.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
	frmPerfPrint.stAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
	frmPerfPrint.stLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
	frmPerfPrint.stTamanho.Caption := frmNovoEnsaio.edTamanho.Text ;
	frmPerfPrint.stCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;

	frmPerfPrint.QuickRep1.Print ;
end;













end.
