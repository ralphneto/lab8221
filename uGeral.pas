unit uGeral;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, Buttons, Db, DBTables, Grids, DBGrids, StdCtrls,inifiles;

type
  TfrmGeral = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tblAtual: TTable;
    Panel1: TPanel;
    g_open: TOpenDialog;
    g_save: TSaveDialog;
    tblTmp: TTable;
    Panel2: TPanel;
    btnSairGeral: TSpeedButton;
    btnPrintGeral: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbEmpresa: TLabel;
    lbModelo: TLabel;
    lbNorma: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    mmObs: TMemo;
    tblAtualCapaceteN: TStringField;
    tblAtualModelo: TStringField;
    tblAtualTamcm: TStringField;
    tblAtualCondicionamento: TStringField;
    tblAtualPosio: TStringField;
    tblAtualVelRealms: TStringField;
    tblAtualMximaAcelg: TStringField;
    tblAtualBDEDesigner1Limitems: TStringField;
    tblAtualBDEDesigner2Limitems: TStringField;
    procedure btnSairGeralClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnPrintGeralClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
	end;

var
	frmGeral: TfrmGeral;
const DEFAULT_DIR : string = 'C:\INT\';

implementation

{$R *.DFM}

		uses uGeralPrint;
procedure TfrmGeral.btnSairGeralClick(Sender: TObject);
begin
  tblAtual.Active := false;
	Close;
end;

procedure TfrmGeral.SpeedButton3Click(Sender: TObject);
var ini : TIniFile;
begin
	if IDYES=Application.MessageBox('Abrir relat�rio padr�o?', 'Abrir', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) then
	begin
        	ini := TIniFile.Create('rel.gen');
                lbEmpresa.Caption := ini.ReadString('Anterior', 'Empresa', '');
		lbModelo.Caption  := ini.ReadString('Anterior', 'Modelo', '');
		lbNorma.Caption   := ini.ReadString('Anterior', 'Norma', '');
		mmObs.Lines.Clear;
		mmObs.Lines.Add(ini.ReadString('Anterior', 'Obs', ''));

		tblAtual.Active := false;
		tblAtual.BatchMove(tblTmp, batCopy);
		tblAtual.Active := true;

                ini.Free;
        end
        else
        begin
                if g_open.execute then
		begin
		        tblTmp.TableName := g_open.Filename;
			tblAtual.Active := false;
			tblAtual.BatchMove(tblTmp, batCopy);
			tblAtual.Active := true;
			tblTmp.TableName := 'anterior.db';

			ini := TIniFile.Create('rel.gen');
			lbEmpresa.Caption:= ini.ReadString(g_open.Filename, 'Empresa', '');
			lbModelo.Caption := ini.ReadString(g_open.Filename, 'Modelo', '');
			lbNorma.Caption  := ini.ReadString(g_open.Filename, 'Norma', '');
			mmObs.Lines.Clear;
			mmObs.Lines.Add(ini.ReadString(g_open.Filename, 'Obs', ''));
                        ini.Free;
		 end;
        end;
end;

procedure TfrmGeral.SpeedButton4Click(Sender: TObject);
var ini : TIniFile;
begin

	if g_save.execute then
	begin
	 // Verifica��es de seguran�a
	 //if not FileExists(DEFAULT_DIR+'HELMET.DB') then
                if not FileExists(extractfilepath(application.exename)+'HELMET.DB') then
                begin
		        ShowMessage('Arquivo tempor�rio n�o encontrado!'+#13+'Imposs�vel salvar arquivo.');
		        Exit;
	        end;
	        if FileExists(g_save.Filename) then
	        begin
		        ShowMessage('J� existe um arquivo com o mesmo nome no local especificado.'+#13+
								'Por favor escolha um diferente.');
		        Exit;
	        end;

		tblAtual.Active := false;
		if not CopyFile(PChar(extractfilepath(application.exename)+'HELMET.DB'), PChar(g_save.Filename), false) then
		begin
			ShowMessage('Erro desconhecido ao gravar arquivo.');
			tblAtual.Active := true;
			Exit;
		end;
		tblAtual.Active := true;

	        // Salva dados sobre modelo, empresa e observa��o do capacete.
	        ini := TIniFile.Create('rel.gen');
	        ini.WriteString(g_save.Filename, 'Empresa', lbEmpresa.Caption);
	        ini.WriteString(g_save.Filename, 'Modelo', lbModelo.Caption);
	        ini.WriteString(g_save.Filename, 'Norma', lbNorma.Caption);
	        ini.WriteString(g_save.Filename, 'Obs', mmObs.Lines.Strings[0]);
                ini.Free;
	end;

end;

procedure TfrmGeral.btnPrintGeralClick(Sender: TObject);
var ini : TIniFile;
begin

	//Atualiza campos para impressao
	frmGeralPrint.lbEmpresa.caption := lbEmpresa.Caption;
	//frmGeralPrint.lbModelo.caption := lbModelo.Caption;
	frmGeralPrint.lbNorma.caption := lbNorma.Caption;
	frmGeralPrint.mmObs.Lines.Clear;
	frmGeralPrint.mmObs.Lines := mmObs.Lines;

	// Salva dados do arquivo geral.
	ini := TIniFile.Create('rel.gen');

	ini.WriteString('Anterior', 'Empresa', lbEmpresa.Caption);
	ini.WriteString('Anterior', 'Modelo', lbModelo.Caption);
	ini.WriteString('Anterior', 'Norma', lbNorma.Caption);
	ini.WriteString('Anterior', 'Obs', mmObs.Lines.Strings[0]);

	// Ativa dataset e gera impressao sem spool.
	//frmGeralPrint.Table1.active := true;
	frmGeralPrint.qrGeral.ShowProgress := true;
	frmGeralPrint.qrGeral.Preview;
	//frmGeralPrint.Table1.active := false;
	//tblAtual.Active := false;

	// Salva conjunto de ensaios atual no arquivo padr�o
        {
		if tblAtual.Active = true then
		begin
			tblAtual.Active := false;
			tblTmp.BatchMove(tblAtual, batCopy);
			tblAtual.EmptyTable;
			tblAtual.Active := true;
		end else
		begin
			tblTmp.BatchMove(tblAtual, batCopy);
			tblAtual.EmptyTable;
		end;}
end;

procedure TfrmGeral.SpeedButton1Click(Sender: TObject);
begin
        if IDYES=Application.MessageBox('Deseja realmente limpar o relat�rio atual?', 'Limpar', mb_applmodal+mb_iconwarning+mb_yesno+mb_defbutton2) then
        begin
	        if tblAtual.Active = true then
		begin
		        tblAtual.Active := false;
			tblAtual.EmptyTable;
			tblAtual.Active := true;
                end else
		begin
          	        tblAtual.EmptyTable;
                end;
        end;
end;

procedure TfrmGeral.FormClose(Sender: TObject; var Action: TCloseAction);
var ini : TIniFile;
begin
	ini := TIniFile.Create('rel.gen');
	//ini.FileName := 'rel.gen';
	ini.WriteString('Anterior', 'Empresa', lbEmpresa.Caption);
	ini.WriteString('Anterior', 'Modelo', lbModelo.Caption);
	ini.WriteString('Anterior', 'Norma', lbNorma.Caption);
	ini.WriteString('Anterior', 'Obs', mmObs.Lines.Strings[0]);
        ini.Free;
end;

procedure TfrmGeral.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        if tblAtual.RecordCount > 0 then
	        if Column.Title.Caption = 'N�' then
                begin
    	                DBGrid1.Canvas.Font.Style := [fsBold];
    	                DBGrid1.Canvas.TextRect(Rect, Rect.Left+1, Rect.Top+Round((Rect.Bottom-Rect.Top-12)/2), inttostr(tblAtual.RecNo));
                end;
end;


procedure TfrmGeral.SpeedButton2Click(Sender: TObject);
begin
	if tblAtual.RecordCount > 0 then
    begin
    	if ID_YES=Application.MessageBox(PChar('Deseja realmente excluir o registro atual?'#13+'Registro: '+inttostr(tblAtual.RecNo)), 'Excluir', mb_applmodal+mb_iconerror+mb_yesno+mb_defbutton2) then
        begin
        	tblAtual.Delete;
        end;
    end;
end;

procedure TfrmGeral.FormCreate(Sender: TObject);
begin
	tblAtual.TableName := extractfilepath(application.exename)+'HELMET.DB';
    tblTmp.TableName := extractfilepath(application.exename)+'anterior.DB';
end;

end.

