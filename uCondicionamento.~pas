unit uCondicionamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls;

type
  TfrmCondicionamento = class(TForm)
    bvCapacetes: TBevel;
    lbCondicionamentos: TListBox;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnImportar: TButton;
    btnExportar: TButton;
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
	frmCondicionamento: TfrmCondicionamento;

implementation
uses uMisc ;
{$R *.DFM}

procedure TfrmCondicionamento.btnAdicionarClick(Sender: TObject);
var
	sCondicionamento : string;
begin
	sCondicionamento := InputBox( 'Adicionar Condicionamento',
												 'Condicionamento do Ensaio (Max. 16 Carac.)',
												 '' );
	sCondicionamento := Copy(sCondicionamento, 1, 16);
	lbCondicionamentos.Items.Add(sCondicionamento);
end;

procedure TfrmCondicionamento.btnEditarClick(Sender: TObject);
var
	sCondicionamento :	string;
	iSel				:	integer;
begin
	for iSel:=0 to lbCondicionamentos.Items.Count-1 do
	begin
		if lbCondicionamentos.Selected[iSel] then
		begin
			sCondicionamento := lbCondicionamentos.Items[iSel];
			sCondicionamento := InputBox( 'Editar Condicionamento',
														 'Condicionamento do Ensaio (Max. 16 Carac.)',
														 sCondicionamento );
			lbCondicionamentos.Items[iSel] := Copy(sCondicionamento, 1, 16);
		end;
	end;

end;

procedure TfrmCondicionamento.btnExcluirClick(Sender: TObject);
var
	iSel	:	integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
															'Deseja continuar ?',
															'Excluir Condicionamentos',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lbCondicionamentos.Items.Count-1 downto 0 do
		if lbCondicionamentos.Selected[iSel] then
			lbCondicionamentos.Items.Delete(iSel);
end;


procedure TfrmCondicionamento.btnImportarClick(Sender: TObject);
begin
	if (Application.MessageBox( 'Isto apagará todos os items atuais !'#10+
    	                        'Deseja continuar ?',
															'Importar Condicionamentos',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	if dlgImport.Execute then
		if FileExists(dlgImport.FileName) then
			lbCondicionamentos.Items.LoadFromFile(dlgImport.FileName);
end;

procedure TfrmCondicionamento.btnExportarClick(Sender: TObject);
begin
	if (lbCondicionamentos.Items.Count>0) then
		if dlgExport.Execute then
			lbCondicionamentos.Items.SaveToFile(dlgExport.FileName);
end;

procedure TfrmCondicionamento.FormCreate(Sender: TObject);
begin
	if FileExists(sAppPath+'Cond.dat') then
		lbCondicionamentos.Items.LoadFromFile(sAppPath+'Cond.dat');
end;

procedure TfrmCondicionamento.FormDestroy(Sender: TObject);
begin
	lbCondicionamentos.Items.SaveToFile(sAppPath+'Cond.dat');
end;

end.
