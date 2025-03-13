(***

		Filename:				uMisc.pas
		Description:		Miscelaneous routines
		Author:					Herbert G. Fischer
		Date:						12/09/1997
		Compiler:				Delphi 2.0
		Project Usage:	Helmet 1.0

***)

unit uMisc;


interface


uses Windows, Classes, Registry, SysUtils, Dialogs;


function GetColorDepth: byte;
procedure SetMotorOff ;
procedure Realities ;
var
	sAppPath	:	string;
        reality : double ;


implementation

uses uNovoEnsaio, uResultados ;

function GetColorDepth: byte;
var
	Reg	:	TRegistry;
	sRs	:	string;
begin
	Reg := TRegistry.Create;
	try
		Reg.RootKey := HKEY_CURRENT_CONFIG;
		Reg.OpenKey('\Display\Settings', False);
		sRs := Reg.ReadString('BitsPerPixel');
		GetColorDepth := StrToInt(sRs);
	finally
		Reg.Free;
	end;
end;

procedure SetMotorOff ;
begin
          reality := frmNovoEnsaio.vel ;
	if frmNovoEnsaio.vel < (StrToFloat(frmNovoEnsaio.sVeloc)-0.15) then
		begin
			frmNovoEnsaio.vel := (StrToFloat(frmNovoEnsaio.sVeloc)-0.14) ;
			frmResultados.secminor.visible := true ;
		end
		else
		begin
			frmResultados.secminor.visible := false ;
	end;

	if frmNovoEnsaio.vel > StrToFloat(frmNovoEnsaio.sVeloc) then
		begin
			frmNovoEnsaio.vel := StrToFloat(frmNovoEnsaio.sVeloc)-0.02;
			frmResultados.secmajor.visible := true ;
		end
		else
		begin
			frmResultados.secmajor.visible := false ;
	end;
end;

procedure Realities ;
var s: string ;
begin
     s := FloatToStr(reality) ;
    ShowMessage(s) ;
end;

end.
