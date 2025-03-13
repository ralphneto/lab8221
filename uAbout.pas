unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfrmAbout = class(TForm)
    lbFabricante: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    btOk: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmAbout: TfrmAbout;

implementation

uses uMisc ;
{$R *.DFM}

procedure TfrmAbout.btOkClick(Sender: TObject);
begin
	frmAbout.Close ;
end;

end.
