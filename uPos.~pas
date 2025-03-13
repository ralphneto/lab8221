unit uPos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmPos = class(TForm)
    bvCapacetes: TBevel;
    lbPosicoes: TListBox;
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
  frmPos: TfrmPos;

implementation
uses uMisc ;

{$R *.DFM}




procedure TfrmPos.btnAdicionarClick(Sender: TObject);
var
	sPosicao : string;
begin
	sPosicao := InputBox( 'Adicionar Posicao',
												 'Posicao do Ensaio (Max. 16 Carac.)',
												 '' );
	sPosicao := Copy(sPosicao, 1, 16);
	lbPosicoes.Items.Add(sPosicao);
end;

procedure TfrmPos.btnEditarClick(Sender: TObject);
var
	sPosicao		:	string;
	iSel				:	integer;
begin
	for iSel:=0 to lbPosicoes.Items.Count-1 do
	begin
		if lbPosicoes.Selected[iSel] then
		begin
			sPosicao := lbPosicoes.Items[iSel];
			sPosicao := InputBox( 'Editar Posição',
														 'Posição do Ensaio (Max. 16 Carac.)',
														 sPosicao );
			lbPosicoes.Items[iSel] := Copy(sPosicao, 1, 16);
		end;
	end;

end;

procedure TfrmPos.btnExcluirClick(Sender: TObject);
var
	iSel	:	integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
    	                        'Deseja continuar ?',
															'Excluir Posições',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	for iSel:=lbPosicoes.Items.Count-1 downto 0 do
		if lbPosicoes.Selected[iSel] then
			lbPosicoes.Items.Delete(iSel);
end;


procedure TfrmPos.btnImportarClick(Sender: TObject);
begin
	if (Application.MessageBox( 'Isto apagará todos os items atuais !'#10+
    	                        'Deseja continuar ?',
															'Importar Posições',
															MB_ICONEXCLAMATION or
															MB_YESNO ) = IDNO)
		then Exit;
	if dlgImport.Execute then
		if FileExists(dlgImport.FileName) then
    	lbPosicoes.Items.LoadFromFile(dlgImport.FileName);
end;

procedure TfrmPos.btnExportarClick(Sender: TObject);
begin
	if (lbPosicoes.Items.Count>0) then
		if dlgExport.Execute then
			lbPosicoes.Items.SaveToFile(dlgExport.FileName);
end;

procedure TfrmPos.FormCreate(Sender: TObject);
begin
	if FileExists(sAppPath+'Pos.dat') then
		lbPosicoes.Items.LoadFromFile(sAppPath+'Pos.dat');
end;

procedure TfrmPos.FormDestroy(Sender: TObject);
begin
	lbPosicoes.Items.SaveToFile(sAppPath+'Pos.dat');
end;

end.
