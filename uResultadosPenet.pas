unit uResultadosPenet;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls;

type
	TfrmResultadosPenet = class(TForm)
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
    Label23: TLabel;
    lbTamanho: TLabel;
    Label26: TLabel;
    lbObs: TLabel;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Label1: TLabel;
    lbPenet: TLabel;
    lbTempo1: TLabel;
    lbTempo2: TLabel;
    Label11: TLabel;
    lbTemp: TLabel;
    Label27: TLabel;
    lbSituacao: TLabel;
    GroupBox2: TGroupBox;
    Shape2: TShape;
    Label2: TLabel;
    lbNPenet: TLabel;
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
    sbGeral: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
	frmResultadosPenet: TfrmResultadosPenet;

implementation
uses uGrafico, uImpactoPrint, uMisc, uAbout, uHelmet, uNovoEnsaio, uGeral,
  uPenetracaoPrint ;

{$R *.DFM}

procedure TfrmResultadosPenet.coolClick(Sender: TObject);
begin
	frmAbout.Show ;
end;


procedure TfrmResultadosPenet.spBtnSalvarClick(Sender: TObject);
var AppPath: string;
begin
        // Salva gráfico e coloca no report
//(*
        frmGrafico.WindowState := wsMaximized ;
	frmGrafico.tcGrafico.Series[1].active := false ;
	frmGrafico.tcGrafico.Series[2].active := false ;
	frmGrafico.tcGrafico.Series[3].active := false ;
	frmGrafico.tcGrafico.UndoZoom ;
    Application.ProcessMessages ;
    frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX ) ;
	frmGrafico.tcGrafico.SaveToMetafile('HMTGRAF.WMF') ;
	frmImpactoPrint.qrGrafico.Picture.LoadFromFile('HMTGRAF.WMF') ;

	frmGrafico.dlgPrinterSetup.Execute ;
    frmImpactoPrint.qrImpacto.ShowProgress := true ;
    frmImpactoPrint.qrImpacto.Print ;
    //frmImpactoPrint.qrImpacto.EndPage ;
    //frmHelmet.SaveImpacto('E'+formatfloat('00000', frmHelmet.ESCount));
    frmHelmet.ESCount := frmHelmet.ESCount + 1;
//*)
    AppPath := extractfilepath(application.exename);
    //if not frmHelmet.dlgSalvar.Execute then Exit;
    //frmHelmet.SaveImpacto(frmHelmet.dlgSalvar.FileName);
    //frmHelmet.SaveImpacto(AppPath+'UltimoEnsaio.hmi');
end;

procedure TfrmResultadosPenet.secminorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosPenet.secmajorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosPenet.yuClick(Sender: TObject);
begin
        if dlgPrinterSetup.Execute then
        begin
    	        frmPenetracaoPrint.qrImpacto.ShowProgress := true ;
		frmPenetracaoPrint.qrImpacto.Print ;
        end;
end;

procedure TfrmResultadosPenet.sbGeralClick(Sender: TObject);
begin
  frmGeral.tblAtual.Active := true;
  frmGeral.tblAtual.Refresh;
  frmGeral.lbEmpresa.Caption := lbEmpresa.Caption;
  frmGeral.lbNorma.Caption := lbNorma.Caption;
  frmGeral.show;
end;



procedure TfrmResultadosPenet.SpeedButton2Click(Sender: TObject);
begin
        Close();
end;

end.
