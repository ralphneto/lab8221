unit Serial02;

///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  Projeto integrante do mini-curso Delphi aplicado à Eletrônica - Parte VII//
//  Autor: Eduardo Divino Dias Vilela                                        //
//  e-mail: eddv@mailbr.com.br                                               //
//                                                                           //
//  Obs.: Requer instalados os seguintes componentes:                        //
//           - ComPort1 (V2.0) para acesso à porta serial;                   //
//           - ThhALed (Componente visual - LED)                             //
///////////////////////////////////////////////////////////////////////////////

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CPort, ComCtrls, ALed, ExtCtrls;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    pgControl: TPageControl;
    tabSheetRX: TTabSheet;
    tabSheetTX: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    MemoRX1: TMemo;
    MemoRX2: TMemo;
    MemoTX: TMemo;
    MemoTXchar: TMemo;
    MemoTXdeci: TMemo;
    MemoTXhexa: TMemo;
    cboxPort: TComboBox;
    cboxBaud: TComboBox;
    cboxStopBits: TComboBox;
    cboxDataBits: TComboBox;
    cboxParity: TComboBox;
    led0: ThhALed;
    led1: ThhALed;
    led2: ThhALed;
    led3: ThhALed;
    led4: ThhALed;
    led5: ThhALed;
    led6: ThhALed;
    led7: ThhALed;
    ledA: ThhALed;
    ledB: ThhALed;
    ledC: ThhALed;
    ledD: ThhALed;
    ledS7: ThhALed;
    ledS5: ThhALed;
    ledS3: ThhALed;
    ledS1: ThhALed;
    ledS0: ThhALed;
    ledS6: ThhALed;
    ledS4: ThhALed;
    ledS2: ThhALed;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edSaida2a: TEdit;
    edSaida2aH: TEdit;
    edSaida1D: TEdit;
    edSaida1H: TEdit;
    edSaida2b: TEdit;
    edSaida2bH: TEdit;
    btnTX1: TSpeedButton;
    btnTX2: TSpeedButton;
    btnTXmemo: TSpeedButton;
    btnConectar: TSpeedButton;
    btnSair: TSpeedButton;
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
    procedure ledS7Click(Sender: TObject);
    procedure btnTXmemoClick(Sender: TObject);
    procedure MemoTXDblClick(Sender: TObject);
    procedure edSaida2aChange(Sender: TObject);
    procedure edSaida2bChange(Sender: TObject);
    procedure MemoRX1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ledByteOUT : Byte;
implementation

{$R *.DFM}


procedure TForm1.FormCreate(Sender: TObject);
begin
  //   Atualiza os ComboBox de acordo com
  // os valores de design-time do componente
  // ComPort1.

  cboxPort.ItemIndex     := Integer(ComPort1.Port);
  cboxBaud.ItemIndex     := Integer(ComPort1.BaudRate);
  cboxStopBits.ItemIndex := Integer(ComPort1.StopBits);
  cboxDataBits.ItemIndex := Integer(ComPort1.DataBits);
  cboxParity.ItemIndex   := Integer(ComPort1.Parity.Bits);

  // Inicializa variável global
  ledByteOUT := $00;
end;


procedure TForm1.btnConectarClick(Sender: TObject);
begin
  // Conecta/Desconecta programa da COMMx
  if ComPort1.Connected then
    ComPort1.Close
  else
    ComPort1.Open;
end;


procedure TForm1.ComPort1Open(Sender: TObject);
begin
  // Altera o Caption do botão de conexão
  btnConectar.Caption := 'Desconectar';

  // Habilita os botões para transmissão
  // após a conexão, impedindo um erro
  // na tentativa de transmitir sem
  // que a conexão estivesse estabelecida
  btnTX1.Enabled := True;
  btnTX2.Enabled := True;
  btnTXmemo.Enabled := True;
end;


procedure TForm1.ComPort1Close(Sender: TObject);
begin
  // Altera o Caption do botão de conexão
  btnConectar.Caption := 'Conectar';

  // Desabilita os botões para transmissão
  btnTX1.Enabled := False;
  btnTX2.Enabled := False;
  btnTXmemo.Enabled := False;
end;


procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  Str: String;
  i : Integer;
  ByteX, ByteY : Byte;
begin
  // Comportamento diferenciado para
  // diferentes tamanho do buffer de
  // recepção:

  // Para 1 ou 2 bytes, o primeiro byte
  // vai definir o estado do conjunto de
  // 8 LEDs da ENTRADA
  if Count <= 2 then
  begin
    // Lê-se como byte:
    ComPort1.Read(ByteX, 1);

    // Aciona os LEDs correspondentes
    led0.Value := Boolean(ByteX AND $01);
    led1.Value := Boolean(ByteX AND $02);
    led2.Value := Boolean(ByteX AND $04);
    led3.Value := Boolean(ByteX AND $08);
    led4.Value := Boolean(ByteX AND $10);
    led5.Value := Boolean(ByteX AND $20);
    led6.Value := Boolean(ByteX AND $40);
    led7.Value := Boolean(ByteX AND $80);
  end;

  // Se for 2 bytes, o segundo byte define
  // o estado do conjunto de 4 LEDs da
  // ENTRADA
  if Count = 2 then
  begin
    // Lê-se como byte:
    ComPort1.Read(ByteY, 1);

    // Aciona os LEDs correspondentes
    ledA.Value := Boolean(ByteY AND $01);
    ledB.Value := Boolean(ByteY AND $02);
    ledC.Value := Boolean(ByteY AND $04);
    ledD.Value := Boolean(ByteY AND $08);
  end;

  // Se o número de bytes for maior que 2,
  // é porque trata-se de um texto enviado
  // pelo segundo PC, não associando,
  // portanto, com nenhum conjunto de LEDs
  // mas sim com os MEMOS de recepção
  if Count > 2 then
  begin
    // Lê-se como String:
    ComPort1.ReadStr(Str, Count);

    // Associa aos MEMOS:
    MemoRX1.Text := MemoRX1.Text + Str;

    // Converte para HEXADECIMAL o texto
    // recebido
    for i:=1 to Count do
      MemoRX2.Text := MemoRX2.Text +
      IntToHex(Ord(Str[i]),2) + ' ';
  end;
end;


procedure TForm1.btnTX1Click(Sender: TObject);
begin
  // Envia para o programa remoto o byte
  // 'ledByteOUT' que armazena o estado dos
  // LEDs de SAÍDA
  ComPort1.Write(ledByteOUT,1);

  // Preenche os MEMOS do programa local ...
  // ... convertendo para CARACTER,
  MemoTXchar.Text := MemoTXchar.Text + Chr(ledByteOUT) + ' ';
  // ... convertendo para DECIMAL, e
  MemoTXdeci.Text := MemoTXdeci.Text + IntToStr(ledByteOUT) + ' ';
  // ... convertendo para HEXADECIMAL.
  MemoTXhexa.Text := MemoTXhexa.Text + IntToHex(ledByteOUT,2) + ' ';
end;



procedure TForm1.btnTX2Click(Sender: TObject);
Var
  valorInt : Byte;
begin
  // Como não se quer enviar a STRING dos
  // edits 'edSaida2a' e 'edSaida2b', mas sim
  // o valor inteiro correspondente, deve-se
  // fazer a conversão para inteiro e enviar
  // através do método 'ComPort1.Write'
  valorInt := StrToInt(edSaida2a.Text);
  ComPort1.Write(valorInt,1);

  valorInt := StrToInt(edSaida2b.Text);
  ComPort1.Write(valorInt,1);

  // Escreve nos respectivos memos o caracter
  // na suas diferentes 'bases' :
  // Chr, Decimal e Hexadecimal
  // 1- edSaida2a:
  MemoTXchar.Text := MemoTXchar.Text +
    Chr(StrToInt(edSaida2a.Text))+ ' ';
  MemoTXdeci.Text := MemoTXdeci.Text +
    edSaida2a.Text+ ' ';
  MemoTXhexa.Text := MemoTXhexa.Text +
    IntToHex(StrToInt(edSaida2a.Text),2)+ ' ';

  // 2- edSaida2b:
  MemoTXchar.Text := MemoTXchar.Text +
    Chr(StrToInt(edSaida2b.Text))+ ' ';
  MemoTXdeci.Text := MemoTXdeci.Text +
    edSaida2b.Text+ ' ';
  MemoTXhexa.Text := MemoTXhexa.Text +
    IntToHex(StrToInt(edSaida2b.Text),2)+ ' ';
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


procedure TForm1.ledS7Click(Sender: TObject);
begin
  // Trata todos os LEDs do conjunto SAÍDA
  // através deste mesmo manipulador.
  (Sender as ThhALed).Value :=
    NOT (Sender as ThhALed).Value;

  // A propriedade tag de cada LED do conjunto
  // SAÍDA já está definida com os respectivos
  // pesos: 128 64 32 16 8 4 2 1, de forma que
  // através da linha de código a seguir, monta-se
  // a máscara na variável 'ledByteOUT'
  // somando, assim, os bits.
  ledByteOUT := ledByteOUT XOR (Sender as ThhALed).Tag;

  // Escreve o valor da variável global
  // nos edits na base 10 e 16.
  edSaida1D.Text := IntToStr(ledByteOUT);
  edSaida1H.Text := IntToHex(ledByteOUT,2);
end;


procedure TForm1.btnTXmemoClick(Sender: TObject);
Var
  i, tamanho : integer;
begin
  // Envia o texto do MemoTX (o de escrita)
  // no seguinte formato:
  // [nBytes] [... Dados ...]


  // Obtém o tamanho do Texto
  tamanho := Length(MemoTX.Text);

  // Envia o tamanho...
  ComPort1.Write(tamanho,1);

  // ... e exibe o 'tamanho' já enviado
  // nos outros 3 memos, nas 'bases'
  // Chr, Decimal e Hexadecimal.
  MemoTXchar.Text := MemoTXchar.Text + Chr(tamanho) + ' ';
  MemoTXdeci.Text := MemoTXdeci.Text + IntToStr(Ord(tamanho)) + ' ';
  MemoTXhexa.Text := MemoTXhexa.Text + IntToHex(tamanho,2) + ' ';


  // Envia o texto...
  ComPort1.WriteStr(MemoTX.Text);

  // ... e exibe os dados enviados nos
  // outros 3 memos, nas 'bases' Chr,
  // Decimal e Hexadecimal.
  MemoTXchar.Text := MemoTXchar.Text + MemoTX.Text + ' ';
  for i:=1 to Length(MemoTX.Text) do
  begin
    MemoTXdeci.Text := MemoTXdeci.Text +
       IntToStr(Ord(MemoTX.Text[i])) + ' ';
    MemoTXhexa.Text := MemoTXhexa.Text +
       IntToHex(Ord(MemoTX.Text[i]),2) + ' ';
  end;
end;


procedure TForm1.edSaida2aChange(Sender: TObject);
begin
  // Faz um tratamento grosseiro da entrada,
  // de forma a limitar no máximo em '255'
  if StrToInt(edSaida2a.Text) > 255 then
    edSaida2a.Text := '255';
  // Exibe no outro edit valor convertido
  edSaida2aH.Text :=
     IntToHex(StrToInt(edSaida2a.Text),2);
end;


procedure TForm1.edSaida2bChange(Sender: TObject);
begin
  // Exibe no outro edit valor convertido.
   edSaida2bH.Text :=
      IntToHex($0F AND StrToInt(edSaida2b.Text),2);
end;


procedure TForm1.MemoTXDblClick(Sender: TObject);
begin
  // Limpa os MEMOS no evento DoubleClick
  MemoTX.Clear;
  MemoTXchar.Clear;
  MemoTXdeci.Clear;
  MemoTXhexa.Clear;
end;


procedure TForm1.MemoRX1DblClick(Sender: TObject);
begin
  // Limpa os MEMOS no evento DoubleClick
  MemoRX1.Clear;
  MemoRX2.Clear;
end;


end.



