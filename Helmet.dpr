
program Helmet;

uses
  Windows,
  Forms,
  SysUtils,
  Controls,
  Dialogs,
  uHelmet in 'uHelmet.pas' {frmHelmet},
  uMisc in 'uMisc.pas',
  uAtrito in 'uAtrito.pas' {frmAtrito},
  uAcelerometros in 'uAcelerometros.pas' {frmAcelerometros},
  uNormas in 'uNormas.pas' {frmNormas},
  uNormaImpacto in 'uNormaImpacto.pas' {frmNormaImpacto},
  uNovoEnsaio in 'uNovoEnsaio.pas' {frmNovoEnsaio},
  uMachineControl in 'uMachineControl.pas' {frmMachineControl},
  uNormaPerfuracao in 'uNormaPerfuracao.pas' {frmNormaPerfuracao},
  uNormaViseira in 'uNormaViseira.pas' {frmNormaViseira},
  uEmpresas in 'uEmpresas.pas' {frmEmpresas},
  uCapacetes in 'uCapacetes.pas' {frmCapacetes},
  uGrafico in 'uGrafico.pas' {frmGrafico},
  uResultados in 'uResultados.pas' {frmResultados},
  uAbout in 'uAbout.pas' {frmAbout},
  uProgress in 'uProgress.pas' {frmProgress},
  uPerfRes in 'uPerfRes.pas' {frmPerfRes},
  uImpactoPrint in 'uImpactoPrint.pas' {frmImpactoPrint},
  uPerfPrint in 'uPerfPrint.pas' {frmPerfPrint},
  uCintaRes in 'uCintaRes.pas' {frmCintaRes},
  uCintaPrint in 'uCintaPrint.pas' {frmCintaPrint},
  uNormaCinta in 'uNormaCinta.pas' {frmNormaCinta},
  uPos in 'uPos.pas' {frmPos},
  uCondicionamento in 'uCondicionamento.pas' {frmCondicionamento},
  uInvalid in 'uInvalid.pas' {frmInvalid},
  uP in 'uP.pas' {frmP},
  uGeral in 'uGeral.pas' {frmGeral},
  uGeralPrint in 'uGeralPrint.pas' {frmGeralPrint},
  uDiagnostico in 'uDiagnostico.pas' {frmDiagnostico},
  uAutoTeste in 'uAutoTeste.pas' {frmAutoTeste},
  uResultadosTrans in 'uResultadosTrans.pas' {frmResultadosTrans},
  uTransmissaoPrint in 'uTransmissaoPrint.pas' {frmTransmissaoPrint},
  uGraficoTrans in 'uGraficoTrans.pas' {frmGraficoTrans},
  uResultadosPenet in 'uResultadosPenet.pas' {frmResultadosPenet},
  uPenetracaoPrint in 'uPenetracaoPrint.pas' {frmPenetracaoPrint},
  uResultadosCal in 'uResultadosCal.pas' {frmResultadosCal},
  uCalibracaoPrint in 'uCalibracaoPrint.pas' {frmCalibracaoPrint};

{$R *.RES}

var
	hwndMain	:	HWND;
begin
	hwndMain := FindWindow('HelmetForm', nil);
  if (hwndMain=0) then
	begin
		Screen.Cursor := crHourGlass;
		Application.Initialize;
		Application.Title := 'Helmet';
		Application.HelpFile := 'Helmet.hlp';
		sAppPath := ExtractFilePath(Application.ExeName);
	Application.CreateForm(TfrmHelmet, frmHelmet);
  Application.CreateForm(TfrmMachineControl, frmMachineControl);
  Application.CreateForm(TfrmEmpresas, frmEmpresas);
  Application.CreateForm(TfrmCapacetes, frmCapacetes);
  Application.CreateForm(TfrmNormaImpacto, frmNormaImpacto);
  Application.CreateForm(TfrmNovoEnsaio, frmNovoEnsaio);
  Application.CreateForm(TfrmAtrito, frmAtrito);
  Application.CreateForm(TfrmAcelerometros, frmAcelerometros);
  Application.CreateForm(TfrmNormas, frmNormas);
  Application.CreateForm(TfrmGrafico, frmGrafico);
  Application.CreateForm(TfrmResultados, frmResultados);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.CreateForm(TfrmPerfRes, frmPerfRes);
  Application.CreateForm(TfrmImpactoPrint, frmImpactoPrint);
  Application.CreateForm(TfrmPerfPrint, frmPerfPrint);
  Application.CreateForm(TfrmCintaRes, frmCintaRes);
  Application.CreateForm(TfrmCintaPrint, frmCintaPrint);
  Application.CreateForm(TfrmNormaCinta, frmNormaCinta);
  Application.CreateForm(TfrmPos, frmPos);
  Application.CreateForm(TfrmCondicionamento, frmCondicionamento);
  Application.CreateForm(TfrmInvalid, frmInvalid);
  Application.CreateForm(TfrmP, frmP);
  Application.CreateForm(TfrmGeral, frmGeral);
  Application.CreateForm(TfrmGeralPrint, frmGeralPrint);
  Application.CreateForm(TfrmDiagnostico, frmDiagnostico);
  Application.CreateForm(TfrmAutoTeste, frmAutoTeste);
  Application.CreateForm(TfrmResultadosTrans, frmResultadosTrans);
  Application.CreateForm(TfrmTransmissaoPrint, frmTransmissaoPrint);
  Application.CreateForm(TfrmGraficoTrans, frmGraficoTrans);
  Application.CreateForm(TfrmResultadosPenet, frmResultadosPenet);
  Application.CreateForm(TfrmPenetracaoPrint, frmPenetracaoPrint);
  Application.CreateForm(TfrmResultadosCal, frmResultadosCal);
  Application.CreateForm(TfrmCalibracaoPrint, frmCalibracaoPrint);
  Screen.Cursor := crDefault;
	  Application.Run;
  end
  else
		SetForegroundWindow(hwndMain);
end.
