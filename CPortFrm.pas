// TComPort component ver. 2.00 for Delphi 2, 3, 4, 5
// written by Dejan Crnila, 1998 - 1999
// email: dejancrn@yahoo.com

unit CPortFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSerialFrm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox5: TComboBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SerialFrm: TSerialFrm;

implementation

{$R *.DFM}

procedure TSerialFrm.SpeedButton1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 2;
  CheckBox1.Checked := True;
end;

procedure TSerialFrm.SpeedButton2Click(Sender: TObject);
begin
  RadioGroup2.ItemIndex := 2;
  CheckBox2.Checked := True;
end;

procedure TSerialFrm.SpeedButton3Click(Sender: TObject);
begin
  CheckBox3.Checked := True;
  CheckBox4.Checked := True;
end;

procedure TSerialFrm.SpeedButton4Click(Sender: TObject);
begin
  CheckBox1.Checked := False;
  CheckBox2.Checked := False;
  CheckBox3.Checked := False;
  CheckBox4.Checked := False;
  RadioGroup1.ItemIndex := 0;
  RadioGroup2.ItemIndex := 0;
end;

end.
