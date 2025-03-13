unit uResultadosTrans;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls;

type
	TfrmResultadosTrans = class(TForm)
	nbPages: TNotebook;
    lbResult: TLabel;
	GroupBox1: TGroupBox;
	Label1: TLabel;
    lbMaximo: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    lbNMaximo: TLabel;
    Label4: TLabel;
    lbNorma: TLabel;
    gbPrimeiroLimite: TGroupBox;
    lbDesacPrimLimite: TLabel;
	lbUnidDesacPrimLimite: TLabel;
    lbTempoPrimLimite: TLabel;
    lbUnidTempoPrimLimite: TLabel;
    edDesacPrimLimite: TEdit;
	edTempoPrimLimite: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edDesacSegLimite: TEdit;
    edTempoSegLimite: TEdit;
    Label8: TLabel;
	Label9: TLabel;
	lbAltImp: TLabel;
	lbVelImp: TLabel;
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
	Shape1: TShape;
	Shape2: TShape;
	cool: TCoolBar;
    lbEnsaios: TLabel;
    LabelX: TLabel;
    lbCondicionamento: TLabel;
    Label11: TLabel;
    lbTemp: TLabel;
    secminor: TLabel;
    secmajor: TLabel;
    yu: TSpeedButton;
    Label12: TLabel;
    lbResReal: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    sbGeral: TSpeedButton;
    Label23: TLabel;
    lbTamanho: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lbObs: TLabel;
    Panel1: TPanel;
    imgGraf: TImage;
    SpeedButton2: TSpeedButton;
    Label27: TLabel;
    lbSituacao: TLabel;
	procedure spBtnSalvarClick(Sender: TObject);
	procedure coolClick(Sender: TObject);
    procedure secminorDblClick(Sender: TObject);
    procedure secmajorDblClick(Sender: TObject);
    procedure yuClick(Sender: TObject);
    procedure sbGeralClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmResultadosTrans: TfrmResultadosTrans;

implementation
uses uGrafico, uImpactoPrint, uMisc, uAbout, uHelmet, uNovoEnsaio, uGeral,
  uGraficoTrans ;

{$R *.DFM}

procedure TfrmResultadosTrans.coolClick(Sender: TObject);
begin
	frmAbout.Show ;
end;


procedure TfrmResultadosTrans.spBtnSalvarClick(Sender: TObject);
var AppPath: string;
begin
        // Salva gr�fico e coloca no report
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

procedure TfrmResultadosTrans.secminorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosTrans.secmajorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosTrans.yuClick(Sender: TObject);
begin
	frmGraficoTrans.WindowState := wsMaximized ;
	frmGraficoTrans.Show ;
end;

procedure TfrmResultadosTrans.sbGeralClick(Sender: TObject);
begin
  frmGeral.tblAtual.Active := true;
  frmGeral.tblAtual.Refresh;
  frmGeral.lbEmpresa.Caption := lbEmpresa.Caption;
  frmGeral.lbNorma.Caption := lbNorma.Caption;
	frmGeral.show;
end;



procedure TfrmResultadosTrans.FormActivate(Sender: TObject);
begin
     imgGraf.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\GRAFTMP.WMF');
end;

procedure TfrmResultadosTrans.SpeedButton2Click(Sender: TObject);
begin
        Close();
end;

end.
