program BinaryViewer;

uses
  Vcl.Forms,
  main in 'main.pas' {fMain},
  Vcl.Themes,
  Vcl.Styles,
  MD5 in 'MD5.pas',
  activationForm in 'activationForm.pas' {fLicKey},
  aboutForm in 'aboutForm.pas' {fAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfAbout, fAbout);
  Application.Run;
end.
