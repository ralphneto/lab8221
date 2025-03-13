unit uEmpresas;


interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls;
	


type
	TfrmEmpresas = class(TForm)
    lbEmpresas: TListBox;
    bvEmpresas: TBevel;
    btnExportar: TButton;
    btnImportar: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnAdicionar: TButton;
    btnFechar: TButton;
    dlgImport: TOpenDialog;
    dlgExport: TSaveDialog;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
		procedure btnExcluirClick(Sender: TObject);
		procedure btnImportarClick(Sender: TObject);
		procedure btnExportarClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;


var
  frmEmpresas: TfrmEmpresas;


implementation


uses uMisc;


{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.btnAdicionarClick(Sender: TObject);
var
	sEmpresa		: string;
begin
	sEmpresa := InputBox( 'Nova Empresa',
												'Nome da Empresa (Max. 64 Carac.)',
												'' );
  sEmpresa := Copy(sEmpresa, 1, 64);
  lbEmpresas.Items.Add(sEmpresa);
end;


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.btnEditarClick(Sender: TObject);
var
	sEmpresa		:	string;
	iSel				:	integer;
begin
	for iSel:=0 to lbEmpresas.Items.Count-1 do
  begin
		if lbEmpresas.Selected[iSel] then
		begin
		  sEmpresa := lbEmpresas.Items[iSel];
			sEmpresa := InputBox( 'Editar Empresa',
		                         'Nome da Empresa (Max. 64 Carac.)',
                             sEmpresa );
      lbEmpresas.Items[iSel] := Copy(sEmpresa, 1, 64);
    end;
  end;
end;


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.btnExcluirClick(Sender: TObject);
var
	iSel	:	integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
    	                        'Deseja continuar ?',
	                            'Excluir Empresas',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
  	then Exit;
	for iSel:=lbEmpresas.Items.Count-1 downto 0 do
  	if lbEmpresas.Selected[iSel] then
			lbEmpresas.Items.Delete(iSel);
end;


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.btnImportarClick(Sender: TObject);
begin
	if (Application.MessageBox( 'Isto apagará todos os items atuais !'#10+
    	                        'Deseja continuar ?',
	                            'Importar Empresas',
	                            MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
  	then Exit;
  if dlgImport.Execute then
  	if FileExists(dlgImport.FileName) then
    	lbEmpresas.Items.LoadFromFile(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.btnExportarClick(Sender: TObject);
begin
	if (lbEmpresas.Items.Count>0) then
		if dlgExport.Execute then
    	lbEmpresas.Items.SaveToFile(dlgExport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmEmpresas.FormCreate(Sender: TObject);
begin
	if FileExists(sAppPath+'Empresas.dat') then
		lbEmpresas.Items.LoadFromFile(sAppPath+'Empresas.dat');
end;

procedure TfrmEmpresas.FormDestroy(Sender: TObject);
begin
	lbEmpresas.Items.SaveToFile(sAppPath+'Empresas.dat');
end;

end.
