program ThreadGen;

uses
  Forms,
  ThreadGenMain in 'ThreadGenMain.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ThreadGen by Kia';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
