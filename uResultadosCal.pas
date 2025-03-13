unit uResultadosCal;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls;

type
	TfrmResultadosCal = class(TForm)
    Label24: TLabel;
    Label25: TLabel;
    nbPages: TNotebook;
    lbResult: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lbEmpresa: TLabel;
    lbModelo: TLabel;
    lbAmostra: TLabel;
    lbLote: TLabel;
    lbEnsaio: TLabel;
    lbEnsaios: TLabel;
    LabelX: TLabel;
    lbCondicionamento: TLabel;
    secminor: TLabel;
    secmajor: TLabel;
    yu: TSpeedButton;
    sbGeral: TSpeedButton;
    Label23: TLabel;
    lbTamanho: TLabel;
    Label26: TLabel;
    lbObs: TLabel;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Label1: TLabel;
    lbMaxZ: TLabel;
    lbMaxN: TLabel;
    lbDifZN: TLabel;
    Label11: TLabel;
    lbTemp: TLabel;
    Label27: TLabel;
    lbSituacao: TLabel;
    GroupBox2: TGroupBox;
    Shape2: TShape;
    lbDifMaxNorma: TLabel;
    lbDifMax: TLabel;
    Label4: TLabel;
    lbNorma: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAltImp: TLabel;
    lbVelImp: TLabel;
    Label12: TLabel;
    lbResReal: TLabel;
    cool: TCoolBar;
    dlgPrinterSetup: TPrinterSetupDialog;
    Label3: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    lbMaxZg: TLabel;
	procedure spBtnSalvarClick(Sender: TObject);
	procedure coolClick(Sender: TObject);
    procedure secminorDblClick(Sender: TObject);
    procedure secmajorDblClick(Sender: TObject);
    procedure yuClick(Sender: TObject);
    procedure sbGeralClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmResultadosCal: TfrmResultadosCal;

implementation
uses uGrafico, uImpactoPrint, uMisc, uAbout, uHelmet, uNovoEnsaio, uGeral,
  uPenetracaoPrint, uCalibracaoPrint ;

{$R *.DFM}

procedure TfrmResultadosCal.coolClick(Sender: TObject);
begin
	frmAbout.Show ;
end;


procedure TfrmResultadosCal.spBtnSalvarClick(Sender: TObject);
var AppPath: string;
begin

end;

procedure TfrmResultadosCal.secminorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosCal.secmajorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosCal.yuClick(Sender: TObject);
begin
        if dlgPrinterSetup.Execute then
        begin
    	        frmCalibracaoPrint.qrImpacto.ShowProgress := true ;
		frmCalibracaoPrint.qrImpacto.Print ;
        end;
end;

procedure TfrmResultadosCal.sbGeralClick(Sender: TObject);
begin
  frmGeral.tblAtual.Active := true;
  frmGeral.tblAtual.Refresh;
  frmGeral.lbEmpresa.Caption := lbEmpresa.Caption;
  frmGeral.lbNorma.Caption := lbNorma.Caption;
  frmGeral.show;
end;



procedure TfrmResultadosCal.SpeedButton2Click(Sender: TObject);
begin
        Close();
end;

end.
