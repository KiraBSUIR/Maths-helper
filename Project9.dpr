program Project9;

uses
  System.StartUpCopy,
  FMX.Forms,
  Menu in 'frames\Menu.pas' {Form4},
  Calculator in 'frames\Calculator.pas' {Form5},
  Triangles in 'frames\Triangles.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
