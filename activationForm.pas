unit activationForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, main, MD5;

type
  TfLicKey = class(TForm)
    Label1: TLabel;
    eLicKey: TEdit;
    bEnter: TButton;
    procedure bEnterClick(Sender: TObject);
    function GenerateOriginKey(): string;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    isCorrectKey: boolean;
  end;

var
  fLicKey: TfLicKey;

implementation

{$R *.dfm}

procedure TfLicKey.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize:=False;
end;

function TfLicKey.GenerateOriginKey(): string;
var
  buf:String;
  i:Integer;
  line:string;
begin
  line:=datetostr(now());
  line:=StringReplace(line, '.', 'p',[rfReplaceAll, rfIgnoreCase]);
  buf:='';
  for i:=1 to Length(line) do
    begin
      buf:=buf+IntToHex(Byte(line[i]),2);
    end;
    Result:=buf;
end;


procedure TfLicKey.bEnterClick(Sender: TObject);
var
  originKey: string;
  inputKey: string;
begin
    originKey:=GenerateOriginKey();
    inputKey:=eLicKey.Text;
    if originKey<>inputKey then
      begin
         showmessage('Incorrect License key');
         isCorrectKey:=False;
      end
    else
      begin
        isCorrectKey:=True;
        close();
      end;

end;

end.
