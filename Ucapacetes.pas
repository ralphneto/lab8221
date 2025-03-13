unit uCapacetes;


interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;


type
  TfrmCapacetes = class(TForm)
    lbCapacetes: TListBox;
    bvCapacetes: TBevel;
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
  frmCapacetes: TfrmCapacetes;


implementation


uses uMisc;


{$R *.DFM}


procedure TfrmCapacetes.btnAdicionarClick(Sender: TObject);
var
	sCapacete		: string;
begin
	sCapacete := InputBox( 'Adicionar Capacete',
                         'Nome do Capacete (Max. 16 Carac.)',
                         '' );
  sCapacete := Copy(sCapacete, 1, 16);
  lbCapacetes.Items.Add(sCapacete);
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.btnEditarClick(Sender: TObject);
var
	sCapacete		:	string;
  iSel				:	integer;
begin
	for iSel:=0 to lbCapacetes.Items.Count-1 do
  begin
		if lbCapacetes.Selected[iSel] then
    begin
		  sCapacete := lbCapacetes.Items[iSel];
			sCapacete := InputBox( 'Editar Capacete',
		                         'Nome do Capacete (Max. 16 Carac.)',
                             sCapacete );
      lbCapacetes.Items[iSel] := Copy(sCapacete, 1, 16);
    end;
  end;
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.btnExcluirClick(Sender: TObject);
var
	iSel	:	integer;
begin
	if (Application.MessageBox( 'Isto apagará todos os items selecionados !'#10+
    	                        'Deseja continuar ?',
	                            'Excluir Capacetes',
	                            MB_ICONEXCLAMATION or
	                            MB_YESNO ) = IDNO)
  	then Exit;
	for iSel:=lbCapacetes.Items.Count-1 downto 0 do
  	if lbCapacetes.Selected[iSel] then
			lbCapacetes.Items.Delete(iSel);
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.btnImportarClick(Sender: TObject);
begin
	if (Application.MessageBox( 'Isto apagará todos os items atuais !'#10+
    	                        'Deseja continuar ?',
	                            'Importar Capacetes',
	                            MB_ICONEXCLAMATION or
	                            MB_YESNO ) = IDNO)
  	then Exit;
  if dlgImport.Execute then
  	if FileExists(dlgImport.FileName) then
    	lbCapacetes.Items.LoadFromFile(dlgImport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.btnExportarClick(Sender: TObject);
begin
	if (lbCapacetes.Items.Count>0) then
		if dlgExport.Execute then
    	lbCapacetes.Items.SaveToFile(dlgExport.FileName);
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.FormCreate(Sender: TObject);
begin
	if FileExists(sAppPath+'Capacetes.dat') then
  	lbCapacetes.Items.LoadFromFile(sAppPath+'Capacetes.dat');
end;


{===============================================================================

===============================================================================}
procedure TfrmCapacetes.FormDestroy(Sender: TObject);
begin
	lbCapacetes.Items.SaveToFile(sAppPath+'Capacetes.dat');
end;

end.
