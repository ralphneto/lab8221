unit uNormas;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, StdCtrls, ComCtrls;


type
	TfrmNormas = class(TForm)
    btnFechar: TButton;
    dlgExport: TSaveDialog;
    dlgImport: TOpenDialog;
    pcNormas: TPageControl;
    tsNormasImpacto: TTabSheet;
    tsNormasPerfuracao: TTabSheet;
		tsNormasViseira: TTabSheet;
    btnAdicionarNormaImpacto: TButton;
		btnEditarNormaImpacto: TButton;
    btnExcluirNormaImpacto: TButton;
    btnImportarNormasImpacto: TButton;
		btnExportarNormasImpacto: TButton;
    btnExportarNormasPerfuracao: TButton;
    btnImportarNormasPerfuracao: TButton;
    btnExcluirNormaPerfuracao: TButton;
    btnEditarNormaPerfuracao: TButton;
		btnAdicionarNormaPerfuracao: TButton;
		btnExportarNormasViseira: TButton;
		btnImportarNormasViseira: TButton;
		btnExcluirNormaViseira: TButton;
		btnEditarNormaViseira: TButton;
		btnAdicionarNormaViseira: TButton;
		lvNormasImpacto: TListView;
		lvNormasPerfuracao: TListView;
		lvNormasViseira: TListView;
		TabSheet1: TTabSheet;
		lvNormasCinta: TListView;
    AdicionarNormaPerf: TButton;
    Button2: TButton;
    Button3: TButton;
    btnImportarNormasCinta: TButton;
    btnExportarNormasCinta: TButton;
		procedure FormCreate(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
		procedure lvNormasImpactoDblClick(Sender: TObject);

		procedure btnAdicionarNormaImpactoClick(Sender: TObject);
		procedure btnEditarNormaImpactoClick(Sender: TObject);
		procedure btnExcluirNormaImpactoClick(Sender: TObject);
		procedure btnImportarNormasImpactoClick(Sender: TObject);
		procedure btnExportarNormasImpactoClick(Sender: TObject);

		procedure btnAdicionarNormaPerfuracaoClick(Sender: TObject);
		procedure btnEditarNormaPerfuracaoClick(Sender: TObject);
		procedure btnExcluirNormaPerfuracaoClick(Sender: TObject);
		procedure btnImportarNormasPerfuracaoClick(Sender: TObject);
		procedure btnExportarNormasPerfuracaoClick(Sender: TObject);

		procedure btnAdicionarNormaViseiraClick(Sender: TObject);
		procedure btnEditarNormaViseiraClick(Sender: TObject);
		procedure btnExcluirNormaViseiraClick(Sender: TObject);
		procedure btnImportarNormasViseiraClick(Sender: TObject);
		procedure btnExportarNormasViseiraClick(Sender: TObject);

		procedure btnImportarNormasCintaClick(Sender: TObject);
		procedure btnExportarNormasCintaClick(Sender: TObject);
		procedure btnAdicionarNormaCintaClick(Sender: TObject);
		procedure btnEditarNormaCintaClick(Sender: TObject);
		procedure btnExcluirNormaCintaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

	private
		{ Private declarations }
	public
		procedure SaveImpacto(FileName: TFileName);
		procedure LoadImpacto(FileName: TFileName);
		procedure SavePerfuracao(FileName: TFileName);
		procedure LoadPerfuracao(FileName: TFileName);
		procedure SaveViseira(FileName: TFileName);
		procedure LoadViseira(FileName: TFileName);
		procedure SaveCinta(FileName: TFileName);
		procedure LoadCinta(FileName: TFileName);
	end;


var
	frmNormas: TfrmNormas;


implementation


uses uNormaImpacto, uNormaPerfuracao, uNormaViseira, uMisc, uNormaCinta,
			uAtrito, uNovoEnsaio, uAcelerometros;


const
	IMPACTO_FILE_ID			:	string	=	'NRM-IMPACTO';
	PERFURACAO_FILE_ID	:	string	=	'NRM-PERFURACAO';
	VISEIRA_FILE_ID			:	string	=	'NRM-VISEIRA';
	CINTA_FILE_ID				: string  = 'NRM-CINTA';


{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnAdicionarNormaImpactoClick(Sender: TObject);
var
	liImpacto		: TListItem;
begin
	frmNormaImpacto.Clear;
	if (frmNormaImpacto.ShowModal=mrOk) then
	begin
		liImpacto := lvNormasImpacto.Items.Add;
		liImpacto.Caption := frmNormaImpacto.edNomeNorma.Text;
		liImpacto.SubItems.Add(frmNormaImpacto.edAcelMax.Text);

		liImpacto.SubItems.Add(frmNormaImpacto.edType1.Text); //Tipo 1
		liImpacto.SubItems.Add(frmNormaImpacto.edAltImp.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edVelImp.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edReal1.Text);

		liImpacto.SubItems.Add(frmNormaImpacto.edType2.Text); //Tipo 2
		liImpacto.SubItems.Add(frmNormaImpacto.edAltImp2.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edVelImp2.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edReal2.Text);

		liImpacto.SubItems.Add(frmNormaImpacto.edType3.Text); //Tipo 3
		liImpacto.SubItems.Add(frmNormaImpacto.edAltImp3.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edVelImp3.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edReal3.Text);

		liImpacto.SubItems.Add(frmNormaImpacto.edAltSens.Text);
//		liImpacto.SubItems.Add(frmNormaImpacto.edImpactos.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edDesacPrimLimite.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edTempoPrimLimite.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edDesacSegLimite.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edTempoSegLimite.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edVelSup.Text);
		liImpacto.SubItems.Add(frmNormaImpacto.edVelInf.Text);
	end;
	frmNormaImpacto.Clear;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnEditarNormaImpactoClick(Sender: TObject);
var
	iSel		: integer;
begin
	for iSel := 0 to lvNormasImpacto.Items.Count-1 do
	begin
		with lvNormasImpacto.Items.Item[iSel] do
		begin
			if Selected then
			begin
				frmNormaImpacto.edNomeNorma.Text := Caption;
				frmNormaImpacto.edAcelMax.Text := SubItems.Strings[0];

				frmNormaImpacto.edType1.Text := SubItems.Strings[1];
				frmNormaImpacto.edAltImp.Text := SubItems.Strings[2];
				frmNormaImpacto.edVelImp.Text := SubItems.Strings[3];
				frmNormaImpacto.edReal1.Text := SubItems.Strings[4];

				frmNormaImpacto.edType2.Text := SubItems.Strings[5];
				frmNormaImpacto.edAltImp2.Text := SubItems.Strings[6];
				frmNormaImpacto.edVelImp2.Text := SubItems.Strings[7];
				frmNormaImpacto.edReal2.Text := SubItems.Strings[8];

				frmNormaImpacto.edType3.Text := SubItems.Strings[9];
				frmNormaImpacto.edAltImp3.Text := SubItems.Strings[10];
				frmNormaImpacto.edVelImp3.Text := SubItems.Strings[11];
				frmNormaImpacto.edReal3.Text := SubItems.Strings[12];


				frmNormaImpacto.edAltSens.Text := SubItems.Strings[13];
				frmNormaImpacto.edDesacPrimLimite.Text := SubItems.Strings[14];
				frmNormaImpacto.edTempoPrimLimite.Text := SubItems.Strings[15];
				frmNormaImpacto.edDesacSegLimite.Text := SubItems.Strings[16];
				frmNormaImpacto.edTempoSegLimite.Text := SubItems.Strings[17];
				frmNormaImpacto.edVelSup.Text := SubItems.Strings[18];
				frmNormaImpacto.edVelInf.Text := SubItems.Strings[19];

				if (frmNormaImpacto.ShowModal=mrOk) then
				begin
					Caption := frmNormaImpacto.edNomeNorma.Text;
					SubItems.Strings[0] := frmNormaImpacto.edAcelMax.Text;

					SubItems.Strings[1]:= frmNormaImpacto.edType1.Text;
					SubItems.Strings[2] := frmNormaImpacto.edAltImp.Text;
					SubItems.Strings[3] := frmNormaImpacto.edVelImp.Text;
					SubItems.Strings[4] := frmNormaImpacto.edReal1.Text;

					SubItems.Strings[5]:= frmNormaImpacto.edType2.Text;
					SubItems.Strings[6]:= frmNormaImpacto.edAltImp2.Text;
					SubItems.Strings[7]:= frmNormaImpacto.edVelImp2.Text;
					SubItems.Strings[8]:= frmNormaImpacto.edReal2.Text;

					SubItems.Strings[9]:= frmNormaImpacto.edType3.Text;
					SubItems.Strings[10]:= frmNormaImpacto.edAltImp3.Text;
					SubItems.Strings[11]:= frmNormaImpacto.edVelImp3.Text;
					SubItems.Strings[12]:= frmNormaImpacto.edReal3.Text;

					SubItems.Strings[13] := frmNormaImpacto.edAltSens.Text;
//				SubItems.Strings[11] := frmNormaImpacto.edImpactos.Text;
					SubItems.Strings[14] := frmNormaImpacto.edDesacPrimLimite.Text;
					SubItems.Strings[15] := frmNormaImpacto.edTempoPrimLimite.Text;
					SubItems.Strings[16] := frmNormaImpacto.edDesacSegLimite.Text;
					SubItems.Strings[17] := frmNormaImpacto.edTempoSegLimite.Text;
					SubItems.Strings[18] := frmNormaImpacto.edVelSup.Text;
					SubItems.Strings[19] := frmNormaImpacto.edVelInf.Text;

				end;
			end;
		end;
	end;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExcluirNormaImpactoClick(Sender: TObject);
var
	iSel		: integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
															'Deseja continuar ?',
															'Excluir Normas de Impacto',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lvNormasImpacto.Items.Count-1 downto 0 do
		with lvNormasImpacto.Items.Item[iSel] do
			if Selected then
				Delete;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.SaveImpacto(FileName: TFileName);
var
	iItem	: integer;
	fImp	:	TextFile;
begin
(*	if (lvNormasImpacto.Items.Count=0) then exit;
	AssignFile(fImp, FileName);
        {$I-}
	        ReWrite(fImp);
        {$I+}
        if IOResult <> 0 then
        begin
                //ShowMessage('Erro abrindo arquivo Impacto.nri')
        end;

        //else
        begin
	        WriteLn(fImp, IMPACTO_FILE_ID);
        	WriteLn(fImp, frmAtrito.edAtrito.Text)	 ;
	        WriteLn(fImp, formatfloat('#0.00#', frmNovoEnsaio.AcelX));
        	WriteLn(fImp, formatfloat('#0.00#', frmNovoEnsaio.AcelY));
	        WriteLn(fImp, formatfloat('#0.00#', frmNovoEnsaio.AcelZ));
        	WriteLn(fImp, IntToStr(lvNormasImpacto.Items.Count));
	        for iItem:=0 to lvNormasImpacto.Items.Count-1 do
        	begin
		        with lvNormasImpacto.Items.Item[iItem] do
	        	begin
        			WriteLn(fImp, Caption);
			        WriteLn(fImp, SubItems.Strings[0]);
		        	WriteLn(fImp, SubItems.Strings[1]);
	        		WriteLn(fImp, SubItems.Strings[2]);
        			WriteLn(fImp, SubItems.Strings[3]);
			        WriteLn(fImp, SubItems.Strings[4]);
		        	WriteLn(fImp, SubItems.Strings[5]);
	        		WriteLn(fImp, SubItems.Strings[6]);
        			WriteLn(fImp, SubItems.Strings[7]);
			        WriteLn(fImp, SubItems.Strings[8]);
		        	WriteLn(fImp, SubItems.Strings[9]);
	        		WriteLn(fImp, SubItems.Strings[10]);
        			WriteLn(fImp, SubItems.Strings[11]);
			        WriteLn(fImp, SubItems.Strings[12]);
		        	WriteLn(fImp, SubItems.Strings[13]);
	        		WriteLn(fImp, SubItems.Strings[14]);
        			WriteLn(fImp, SubItems.Strings[15]);
			        WriteLn(fImp, SubItems.Strings[16]);
		        	WriteLn(fImp, SubItems.Strings[17]);
	        		WriteLn(fImp, SubItems.Strings[18]);
        			WriteLn(fImp, SubItems.Strings[19]);
			        WriteLn(fImp);
		        end;
	        end;
	        CloseFile(fImp);
        end;*)
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.LoadImpacto(FileName: TFileName);
var
	liImpacto		: TListItem;
	fImp				:	TextFile;
	iItem				:	integer;
	sTemp				:	string;
begin
	if not FileExists(FileName) then exit;
	lvNormasImpacto.Items.Clear;
	AssignFile(fImp, FileName);
	Reset(fImp);
	ReadLn(fImp, sTemp);
	if (sTemp<>IMPACTO_FILE_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
		Exit;
	end;
	ReadLn(fImp, sTemp);
	//frmAtrito.edAtrito.Text := sTemp ;

	ReadLn(fImp, sTemp);
	//frmAcelerometros.edAcelX.Text := sTemp ;
	//frmNovoEnsaio.AcelX := strtofloat(sTemp);
	ReadLn(fImp, sTemp);
	//frmAcelerometros.edAcelY.Text := sTemp ;
	//frmNovoEnsaio.AcelY := strtofloat(sTemp);
	ReadLn(fImp, sTemp);
	//frmAcelerometros.edAcelZ.Text := sTemp ;
	//frmNovoEnsaio.AcelZ := strtofloat(sTemp);

	ReadLn(fImp, sTemp);
	for iItem:=1 to StrToInt(sTemp) do
	begin
		liImpacto := lvNormasImpacto.Items.Add;
		ReadLn(fImp, sTemp);
		liImpacto.Caption := sTemp;
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//0
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//1
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//2
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//3
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//4
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//5
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//6
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//7
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//8
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//9
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//10
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//11
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//12
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//13
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//14
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//15
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//16
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//17
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//18
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);//19
		ReadLn(fImp, sTemp);
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.FormCreate(Sender: TObject);
begin
	//if FileExists(sAppPath+'Impacto.nri') then
	//	LoadImpacto(sAppPath+'Impacto.nri');
(*	if FileExists(sAppPath+'Perfuracao.nrp') then
		LoadPerfuracao(sAppPath+'Perfuracao.nrp');
	if FileExists(sAppPath+'Viseira.nrv') then
		LoadViseira(sAppPath+'Viseira.nrv');*)
	//if FileExists(sAppPath+'Cinta.nrc') then
	//	LoadCinta(sAppPath+'Cinta.nrc');
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.FormDestroy(Sender: TObject);
begin
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.lvNormasImpactoDblClick(Sender: TObject);
begin
	btnEditarNormaImpacto.Click;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnImportarNormasImpactoClick(Sender: TObject);
begin
	//dlgImport.Title := 'Importar Normas para o Ensaio de Impacto';
	//dlgImport.DefaultExt := 'nri';
	//dlgImport.FilterIndex := 1;
	//if dlgImport.Execute then
	//	if FileExists(dlgImport.FileName) then
	//		LoadImpacto(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExportarNormasImpactoClick(Sender: TObject);
begin
	dlgExport.Title := 'Exportar Normas para o Ensaio de Impacto';
	dlgExport.DefaultExt := 'nri';
	dlgExport.FilterIndex := 1;
	//if dlgExport.Execute then
		//SaveImpacto(dlgExport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnAdicionarNormaPerfuracaoClick(Sender: TObject);
var
	liImpacto		: TListItem;
begin
	frmNormaPerfuracao.Clear;
	if (frmNormaPerfuracao.ShowModal=mrOk) then
	begin
		liImpacto := lvNormasPerfuracao.Items.Add;
		liImpacto.Caption := frmNormaPerfuracao.edNomeNorma.Text;
		liImpacto.SubItems.Add(frmNormaPerfuracao.edMedidaDinamica.Text);
		liImpacto.SubItems.Add(frmNormaPerfuracao.edEnsaios.Text);
	end;
	frmNormaPerfuracao.Clear;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnEditarNormaPerfuracaoClick(Sender: TObject);
var
	iSel		: integer;
begin
	for iSel:=0 to lvNormasPerfuracao.Items.Count-1 do
	begin
		with lvNormasPerfuracao.Items.Item[iSel] do
		begin
			if Selected then
			begin
				frmNormaPerfuracao.edNomeNorma.Text := Caption;
				frmNormaPerfuracao.edMedidaDinamica.Text := SubItems.Strings[0];
				frmNormaPerfuracao.edEnsaios.Text := SubItems.Strings[1];
				if (frmNormaPerfuracao.ShowModal=mrOk) then
				begin
					Caption := frmNormaPerfuracao.edNomeNorma.Text;
					SubItems.Strings[0] := frmNormaPerfuracao.edMedidaDinamica.Text;
					SubItems.Strings[1] := frmNormaPerfuracao.edEnsaios.Text;
				end;
			end;
		end;
	end;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExcluirNormaPerfuracaoClick(Sender: TObject);
var
	iSel		: integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
															'Deseja continuar ?',
															'Excluir Normas de Perfuração',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lvNormasPerfuracao.Items.Count-1 downto 0 do
		with lvNormasPerfuracao.Items.Item[iSel] do
			if Selected then
				Delete;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.SavePerfuracao(FileName: TFileName);
var
	iItem	: integer;
	fImp	:	TextFile;
begin
	if (lvNormasPerfuracao.Items.Count=0) then exit;
	AssignFile(fImp, FileName);
	ReWrite(fImp);
	WriteLn(fImp, PERFURACAO_FILE_ID);
	WriteLn(fImp, IntToStr(lvNormasPerfuracao.Items.Count));
	for iItem:=0 to lvNormasPerfuracao.Items.Count-1 do
	begin
		with lvNormasPerfuracao.Items.Item[iItem] do
		begin
			WriteLn(fImp, Caption);
			WriteLn(fImp, SubItems.Strings[0]);
			WriteLn(fImp, SubItems.Strings[1]);
			WriteLn(fImp);
		end;
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.LoadPerfuracao(FileName: TFileName);
var
	liImpacto		: TListItem;
	fImp				:	TextFile;
	iItem				:	integer;
	sTemp				:	string;
begin
	if not FileExists(FileName) then exit;
	lvNormasPerfuracao.Items.Clear;
	AssignFile(fImp, FileName);
	Reset(fImp);
	ReadLn(fImp, sTemp);
	if (sTemp<>PERFURACAO_FILE_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
		Exit;
	end;
	ReadLn(fImp, sTemp);
	for iItem:=1 to StrToInt(sTemp) do
	begin
		liImpacto := lvNormasPerfuracao.Items.Add;
		ReadLn(fImp, sTemp);
		liImpacto.Caption := sTemp;
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnImportarNormasPerfuracaoClick(Sender: TObject);
begin
	dlgImport.Title := 'Importar Normas para o Ensaio de Perfuracao';
	dlgImport.DefaultExt := 'nrp';
	dlgImport.FilterIndex := 2;
	if dlgImport.Execute then
		if FileExists(dlgImport.FileName) then
			LoadPerfuracao(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExportarNormasPerfuracaoClick(Sender: TObject);
begin
	dlgExport.Title := 'Exportar Normas para o Ensaio de Perfuracao';
	dlgExport.DefaultExt := 'nrp';
	dlgExport.FilterIndex := 2;
	if dlgExport.Execute then
		SavePerfuracao(dlgExport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnAdicionarNormaViseiraClick(Sender: TObject);
var
	liImpacto		: TListItem;
begin
	frmNormaViseira.Clear;
	if (frmNormaViseira.ShowModal=mrOk) then
	begin
		liImpacto := lvNormasViseira.Items.Add;
		liImpacto.Caption := frmNormaViseira.edNomeNorma.Text;
		liImpacto.SubItems.Add(frmNormaViseira.edMedidaDinamica.Text);
		liImpacto.SubItems.Add(frmNormaViseira.edEnsaios.Text);
	end;
	frmNormaViseira.Clear;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnEditarNormaViseiraClick(Sender: TObject);
var
	iSel		: integer;
begin
	for iSel:=0 to lvNormasViseira.Items.Count-1 do
	begin
		with lvNormasViseira.Items.Item[iSel] do
		begin
			if Selected then
			begin
				frmNormaViseira.edNomeNorma.Text := Caption;
				frmNormaViseira.edMedidaDinamica.Text := SubItems.Strings[0];
				frmNormaViseira.edEnsaios.Text := SubItems.Strings[1];
				if (frmNormaViseira.ShowModal=mrOk) then
				begin
					Caption := frmNormaViseira.edNomeNorma.Text;
					SubItems.Strings[0] := frmNormaViseira.edMedidaDinamica.Text;
					SubItems.Strings[1] := frmNormaViseira.edEnsaios.Text;
				end;
			end;
		end;
	end;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExcluirNormaViseiraClick(Sender: TObject);
var
	iSel		: integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
															'Deseja continuar ?',
															'Excluir Normas da Viseira',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lvNormasViseira.Items.Count-1 downto 0 do
		with lvNormasViseira.Items.Item[iSel] do
			if Selected then
				Delete;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.SaveViseira(FileName: TFileName);
var
	iItem	: integer;
	fImp	:	TextFile;
begin
	if (lvNormasViseira.Items.Count=0) then exit;
	AssignFile(fImp, FileName);
	ReWrite(fImp);
	WriteLn(fImp, VISEIRA_FILE_ID);
	WriteLn(fImp, IntToStr(lvNormasViseira.Items.Count));
	for iItem:=0 to lvNormasViseira.Items.Count-1 do
	begin
		with lvNormasViseira.Items.Item[iItem] do
		begin
			WriteLn(fImp, Caption);
			WriteLn(fImp, SubItems.Strings[0]);
			WriteLn(fImp, SubItems.Strings[1]);
			WriteLn(fImp);
		end;
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.LoadViseira(FileName: TFileName);
var
	liImpacto		: TListItem;
	fImp				:	TextFile;
	iItem				:	integer;
	sTemp				:	string;
begin
	if not FileExists(FileName) then exit;
	lvNormasViseira.Items.Clear;
	AssignFile(fImp, FileName);
	Reset(fImp);
	ReadLn(fImp, sTemp);
	if (sTemp<>VISEIRA_FILE_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
		Exit;
	end;
	ReadLn(fImp, sTemp);
	for iItem:=1 to StrToInt(sTemp) do
	begin
		liImpacto := lvNormasViseira.Items.Add;
		ReadLn(fImp, sTemp);
		liImpacto.Caption := sTemp;
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnImportarNormasViseiraClick(Sender: TObject);
begin
	dlgImport.Title := 'Importar Normas para o Ensaio da Viseira';
	dlgImport.DefaultExt := 'nrv';
	dlgImport.FilterIndex := 3;
	if dlgImport.Execute then
		if FileExists(dlgImport.FileName) then
			LoadViseira(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExportarNormasViseiraClick(Sender: TObject);
begin
	dlgExport.Title := 'Exportar Normas para o Ensaio da Viseira';
	dlgExport.DefaultExt := 'nrv';
	dlgExport.FilterIndex := 3;
	if dlgExport.Execute then
		SaveViseira(dlgExport.FileName);
end;

//Cinta

{===============================================================================

===============================================================================}
procedure TfrmNormas.btnAdicionarNormaCintaClick(Sender: TObject);
var
	liImpacto		: TListItem;
begin

	if (frmNormaCinta.ShowModal=mrOk) then
	begin
		liImpacto := lvNormasCinta.Items.Add;
		liImpacto.Caption := frmNormaCinta.edNomeNorma.Text;
		liImpacto.SubItems.Add(frmNormaCinta.edMedidaDinamica.Text);
		liImpacto.SubItems.Add(frmNormaCinta.edMedidaEstatica.Text);
	end;
	frmNormaViseira.Clear;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnEditarNormaCintaClick(Sender: TObject);
var
	iSel		: integer;
begin
	for iSel:=0 to lvNormasCinta.Items.Count-1 do
	begin
		with lvNormasCinta.Items.Item[iSel] do
		begin
			if Selected then
			begin
				frmNormaCinta.edNomeNorma.Text := Caption;
				frmNormaCinta.edMedidaDinamica.Text := SubItems.Strings[0];
				frmNormaCinta.edMedidaEstatica.Text := SubItems.Strings[1];
				if (frmNormaCinta.ShowModal=mrOk) then
				begin
					Caption := frmNormaCinta.edNomeNorma.Text;
					SubItems.Strings[0] := frmNormaCinta.edMedidaDinamica.Text;
					SubItems.Strings[1] := frmNormaCinta.edMedidaEstatica.Text;
				end;
			end;
		end;
	end;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExcluirNormaCintaClick(Sender: TObject);
var
	iSel		: integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
															'Deseja continuar ?',
															'Excluir Normas da Viseira',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lvNormasCinta.Items.Count-1 downto 0 do
		with lvNormasCinta.Items.Item[iSel] do
			if Selected then
				Delete;
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.SaveCinta(FileName: TFileName);
var
	iItem	: integer;
	fImp	:	TextFile;
begin
	if (lvNormasCinta.Items.Count=0) then exit;
	AssignFile(fImp, FileName);
	ReWrite(fImp);
	WriteLn(fImp, CINTA_FILE_ID);
	WriteLn(fImp, IntToStr(lvNormasCinta.Items.Count));
	for iItem:=0 to lvNormasCinta.Items.Count-1 do
	begin
		with lvNormasCinta.Items.Item[iItem] do
		begin
			WriteLn(fImp, Caption);
			WriteLn(fImp, SubItems.Strings[0]);
			WriteLn(fImp, SubItems.Strings[1]);
			WriteLn(fImp);
		end;
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.LoadCinta(FileName: TFileName);
var
	liImpacto		: TListItem;
	fImp				:	TextFile;
	iItem				:	integer;
	sTemp				:	string;
begin
	if not FileExists(FileName) then exit;
	lvNormasCinta.Items.Clear;
	AssignFile(fImp, FileName);
	Reset(fImp);
	ReadLn(fImp, sTemp);
	if (sTemp<>CINTA_FILE_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
		Exit;
	end;
	ReadLn(fImp, sTemp);
	for iItem:=1 to StrToInt(sTemp) do
	begin
		liImpacto := lvNormasCinta.Items.Add;
		ReadLn(fImp, sTemp);
		liImpacto.Caption := sTemp;
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
		liImpacto.SubItems.Add(sTemp);
		ReadLn(fImp, sTemp);
	end;
	CloseFile(fImp);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnImportarNormasCintaClick(Sender: TObject);
begin
	dlgImport.Title := 'Importar Normas para o Ensaio de Cinta';
	dlgImport.DefaultExt := 'nrc' ;
	dlgImport.FilterIndex := 4;
	if dlgImport.Execute then
		if FileExists(dlgImport.FileName) then
			LoadCinta(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmNormas.btnExportarNormasCintaClick(Sender: TObject);
begin
	dlgExport.Title := 'Exportar Normas para o Ensaio de Cinta';
	dlgExport.DefaultExt := 'nrc';
	dlgExport.FilterIndex := 4;
	if dlgExport.Execute then
		SaveCinta(dlgExport.FileName);
end;




procedure TfrmNormas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	SaveImpacto(sAppPath+'Impacto.nri');
	SavePerfuracao(sAppPath+'Perfuracao.nrp');
	SaveViseira(sAppPath+'Viseira.nrv');
	SaveCinta(sAppPath+'Cinta.nrc');
end;

end.
