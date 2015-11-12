unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
Tlera = function ( r: real ): real; stdcall;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  hndDLLHandle: THandle;
  lera: Tlera;
begin

    // ��������� dll �����������
    hndDLLHandle := loadLibrary ( 'Project2.dll' );
    if hndDLLHandle <> 0 then
    begin
    // �������� ����� �������
      @lera := getProcAddress ( hndDLLHandle, 'lera' );
       // ���� ����� ������� ������
      if addr ( lera ) <> nil then
      begin
        // ���������� ��������� ( 21...)
        showMessage ( floatToStr ( lera ( 10.5 ) ) );
      end
       else
        // DLL �� ������� ("handleable")
        showMessage ( 'Function not exists...' );

    end
    else
      // DLL �� ������� ("handleable")
      showMessage ( 'DLL not found...' );
      FreeLibrary( hndDLLHandle);
  end;
 
end.

