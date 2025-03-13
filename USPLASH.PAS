unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uMisc;

type
  TfrmSplash = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    Image	:	TBitmap;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.DFM}

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
	frmSplash.Canvas.Draw(0, 0, Image);
end;


procedure TfrmSplash.FormCreate(Sender: TObject);
var
	ResName	:	string;
begin
	Image := TBitmap.Create;
	case GetColorDepth of
		16..32	:	ResName := 'SPLASH24';		//	Up to 64K Colors
		8..15		:	ResName	:= 'SPLASH8';			//	From 256 to 32K Colors
	else
		ResName := 'SPLASH4';								//	Unknown Color Depth
	end;
	Image.LoadFromResourceName(HInstance, ResName);
end;


procedure TfrmSplash.FormClick(Sender: TObject);
begin
	if Visible then Close;
end;


end.
