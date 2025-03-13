unit Serial01;

///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  Projeto integrante do mini-curso Delphi aplicado à Eletrônica - Parte VI //
//  Autor: Eduardo Divino Dias Vilela                                        //
//  e-mail: eddv@mailbr.com.br                                               //
//                                                                           //
//  Obs.: Requer instalado o componente ComPort1 (V2.0) para acesso          //
//       à porta serial.                                                     //
///////////////////////////////////////////////////////////////////////////////

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CPort;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cboxPort: TComboBox;
    cboxBaud: TComboBox;
    cboxStopBits: TComboBox;
    cboxDataBits: TComboBox;
    cboxParity: TComboBox;
    btnSair: TSpeedButton;
    btnConectar: TSpeedButton;
    Memo2: TMemo;
    btnTX1: TSpeedButton;
    btnTX2: TSpeedButton;
    edTX: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ComPort1: TComPort;
    chkRetCarro: TCheckBox;
    Memo1: TMemo;
    Memo3: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure ComPort1Close(Sender: TObject);
    procedure ComPort1Open(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cboxPortChange(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnTX1Click(Sender: TObject);
    procedure btnTX2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboxBaudChange(Sender: TObject);
    procedure cboxStopBitsChange(Sender: TObject);
    procedure cboxDataBitsChange(Sender: TObject);
    procedure cboxParityChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.FormCreate(Sender: TObject);
begin
  //   Atualiza os ComboBox de acordo com
  // os valores de design-time do componente
  // ComPort1.
  // A sintaxe "Integer(XXXX)" é um typeCast, ou seja
  // uma tranformação de tipo para compatibilizar
  // o parâmetro de forma conveniente para a
  // propriedade ItemIndex
  cboxPort.ItemIndex     := Integer(ComPort1.Port);
  cboxBaud.ItemIndex     := Integer(ComPort1.BaudRate);
  cboxStopBits.ItemIndex := Integer(ComPort1.StopBits);
  cboxDataBits.ItemIndex := Integer(ComPort1.DataBits);
  cboxParity.ItemIndex   := Integer(ComPort1.Parity.Bits);
end;

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  // Conecta/Desconecta programa da COMMx
  if ComPort1.Connected then
    ComPort1.Close
  else
    ComPort1.Open;
end;


procedure TForm1.ComPort1Close(Sender: TObject);
begin
  btnConectar.Caption := 'Conectar';
end;

procedure TForm1.ComPort1Open(Sender: TObject);
begin
  btnConectar.Caption := 'Desconectar';
end;


procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  Str: String;
  i : Integer;
begin
  // Lê Count bytes do buffer de recepção serial e
  // armazena-os na variável Str
  // Para cada memo, procede de maneira diferente:

  // Memo1: escreve caracter por caracter, usando a
  // propriedade Text do mesmo. (Vide componente Memo)
  // Memo2: usando a propriedade Lines.Add
  // Memo3: Escreve os caracteres, em hexadecimal,
  // usando a propriedade Text

  ComPort1.ReadStr(Str, Count);
  Memo1.Text := Memo1.Text + Str;
  Memo2.Lines.Add(Str);

  for i:=1 to Count do
    Memo3.Text := Memo3.Text + IntToHex(Ord(Str[i]),2) + ' ';
end;


procedure TForm1.btnTX1Click(Sender: TObject);
begin
  // Envia o valor da Tag do btnTX1
  // Envia o valor da Tag convertido para string
  // Incrementa a Tag, até um máximo de 255,
  // voltando a zero
  if ComPort1.Connected then
  begin
    ComPort1.Write(btnTX1.Tag,1);
    ComPort1.WriteStr(IntToStr(btnTX1.Tag));

    btnTX1.Tag := btnTX1.Tag +1;
    if btnTX1.Tag = 256 then btnTX1.Tag := 0;
  end;
end;



procedure TForm1.btnTX2Click(Sender: TObject);
Var
  Str: String;
begin
  // Envia o conteúdo do edTX.Text, e
  // se chkRetCarro estiver selecionado, envia também
  // os caracteres de retorno de carro (nova linha)
  if ComPort1.Connected then
  begin
    Str := edTX.Text;
    if chkRetCarro.Checked then
      Str := Str + #13#10;
    ComPort1.WriteStr(Str);
  end;
end;


procedure TForm1.cboxPortChange(Sender: TObject);
begin
  // Atualiza os parâmetros de configuração
  // da porta serial: atualiza COMMx
  // a partir da ação do usuário no
  // respectivo ComboBox.
  // Mais um typeCast...
  ComPort1.Port := TPortType(cboxPort.ItemIndex);
end;

procedure TForm1.cboxBaudChange(Sender: TObject);
begin
  // Atualiza Taxa Baud
  ComPort1.BaudRate := TBaudRate(cboxBaud.ItemIndex);
end;

procedure TForm1.cboxStopBitsChange(Sender: TObject);
begin
  // Atualiza número de Stop Bits
  ComPort1.StopBits := TStopBits(cboxStopBits.ItemIndex);
end;

procedure TForm1.cboxDataBitsChange(Sender: TObject);
begin
  // Atualiza número de Bits de Dados
  ComPort1.DataBits := TDataBits(cboxDataBits.ItemIndex);
end;

procedure TForm1.cboxParityChange(Sender: TObject);
begin
  // Atualiza tipo de paridade
  ComPort1.Parity.Bits := TParityBits(cboxParity.ItemIndex);
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  // Encerra a execução do programa
  Close;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Ao fechar o programa, assegura a desconexão
  if ComPort1.Connected then
    ComPort1.Close;
end;

end.
