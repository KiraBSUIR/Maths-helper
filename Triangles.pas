unit Triangles;

interface

uses
  Math, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Rtti, FMX.Grid, FMX.Layouts;

type
  TForm1 = class(TForm)
    edtFirstSide: TEdit;
    edtSecondSide: TEdit;
    edtThirdSide: TEdit;
    btnFindSquare: TButton;
    LabelSquare: TLabel;
    btnThroughTheRadius: TButton;
    edtRadius: TEdit;
    btnWithoutRadius: TButton;
    edtFirstAngle: TEdit;
    btnwithangles: TButton;
    btnWithoutAngles: TButton;
    btnClearAll: TButton;
    lblFormula: TLabel;
    StringFormula: TStringGrid;
    angleandradius: TStringColumn;
    strngclmnequilateral: TStringColumn;
    strngclmnisosceles: TStringColumn;
    strngclmnderi: TStringColumn;
    lblvinoska: TLabel;
    lblvinoska2: TLabel;
    labelVinoska3: TLabel;
    procedure btnFindSquareClick(Sender: TObject);
    procedure btnThroughTheRadiusClick(Sender: TObject);
    procedure btnWithoutRadiusClick(Sender: TObject);
    procedure btnShowMenuClick(Sender: TObject);
    procedure btnwithanglesClick(Sender: TObject);
    procedure btnWithoutAnglesClick(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure edtFirstSideKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSecondSideKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtThirdSideKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtFirstAngleKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtRadiusKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  check: word;

implementation

{$R *.fmx}
uses Menu;
procedure TForm1.btnClearAllClick(Sender: TObject);
begin
   edtFirstAngle.Text := '';
   edtFirstSide.Text := '';
   edtSecondSide.Text := '';
   edtThirdSide.Text := '';
   edtRadius.Text := '';
   LabelSquare.Text := 'Square of triangle: ';
end;

procedure TForm1.btnFindSquareClick(Sender: TObject);
var
   semiperimeter, FirstAngle, FirstSide, SecondSide, ThirdSide, Radius: Integer;
   Height, Square: real;
const
   clGreen = $4F7524;
begin
   if (edtFirstSide.Text <> '') then
      FirstSide := StrToInt(EdtFirstSide.text);
   if (edtSecondSide.Text <> '') then
      SecondSide := StrToInt(edtSecondSide.text);
   if (edtThirdSide.Text <> '') then
      ThirdSide := StrToInt(edtThirdSide.text);
   if (edtFirstAngle.Text <> '') then
      FirstAngle := StrToInt(edtFirstAngle.text);
   if (edtRadius.Text <> '') then
      Radius := StrToInt(edtRadius.text);
      if (FirstSide = SecondSide) and (FirstSide = ThirdSide) and (SecondSide = ThirdSide) then
         begin
            if (check = 0) then
               begin
                  Square := Trunc((Sqr(FirstSide) * Sqrt(3)) / 4);
                  LabelSquare.Text := 'square of equilateral triangle is: ' + FloatToStr(Square);
               end;
            if (Check = 1) then
               begin
                  if (edtRadius.Text <> '') then
                     Radius := StrToInt(edtRadius.text);
                  Radius := Radius * Radius;
                  Square := 3 * Sqrt(3) * Radius;
                  LabelSquare.Text := 'square of equilateral triangle is: ' + FloatToStr(Square);
               end;
         end;
      if (FirstSide = SecondSide) then
         begin
            if (check = 2) then
               begin
                  Square := trunc((1 / 2) * FirstSide * SecondSide * Sin(FirstAngle));
                  LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
               end
            else
               if (check = 1) then
                  begin
                     semiperimeter := Trunc((FirstSide + SecondSide + ThirdSide) / 2);
                     Square := Semiperimeter * Radius;
                      LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
                  end
               else
            begin
               ThirdSide := round((1 / 2) * ThirdSide);
               height := (SecondSide * SecondSide) - (ThirdSide * ThirdSide);
               Height := Sqrt(height);
               Square := Trunc(ThirdSide * height);
               LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
            end;
         end;
      if (FirstSide = ThirdSide) then
         begin
            if (check = 2) then
               begin
                  Square := trunc((1 / 2) * FirstSide * ThirdSide * Sin(FirstAngle));
                  LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
               end
            else
               if (check = 1) then
                  begin
                     semiperimeter := Trunc((FirstSide + SecondSide + ThirdSide) / 2);
                     Square := Semiperimeter * Radius;
                      LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
                  end
               else
            begin
               SecondSide := round((1 / 2) * SecondSide);
               height := (FirstSide * FirstSide) - (SecondSide * SecondSide);
               Height := Sqrt(height);
               Square := Trunc(SecondSide * height);
               LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
            end;
         end;
      if (SecondSide = ThirdSide) then
         begin
            if (check = 2) then
               begin
                  Square := trunc((1 / 2) * SecondSide * ThirdSide * Sin(FirstAngle));
                  LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
               end
            else
               if (check = 1) then
                  begin
                     semiperimeter := Trunc((FirstSide + SecondSide + ThirdSide) / 2);
                     Square := Semiperimeter * Radius;
                      LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
                  end
               else
            begin
               FirstSide := round((1 / 2) * FirstSide);
               height := (ThirdSide * ThirdSide) - (FirstSide * FirstSide);
               Height := Sqrt(height);
               Square := Trunc(FirstSide * height);
               LabelSquare.Text := 'square of isosceles triangle is: ' + FloatToStr(Square);
            end;
         end;
      if (FirstSide <> SecondSide) and (SecondSide <> ThirdSide) and (FirstSide <> ThirdSide) then
         begin
            if (check = 2) then
               begin
                  Square := Trunc((1 / 2) * (FirstSide * SecondSide * Sin(FirstAngle)));
                  LabelSquare.Text := 'square of derivative triangle is: ' + FloatToStr(Square);
               end
            else
               if (check = 1) then
                  begin
                     Square := Trunc((FirstSide * SecondSide * ThirdSide) / (4 * Radius));
                     LabelSquare.Text := 'square of derivative triangle is: ' + FloatToStr(Square);
                  end
               else
                  begin
                     semiperimeter := Round((FirstSide + SecondSide + ThirdSide) / 2);
                     Square := Trunc(Sqrt((semiperimeter - FirstSide) * (semiperimeter - SecondSide) * (semiperimeter - ThirdSide)));
                     LabelSquare.Text := 'square of derivative triangle is: ' + FloatToStr(Square);
                  end;
         end;

end;

procedure TForm1.btnShowMenuClick(Sender: TObject);
begin
   Form4.Show;
   Form1.Close;
end;

procedure TForm1.btnThroughTheRadiusClick(Sender: TObject);
begin
   Check := 1;
   edtRadius.Visible := true;
   btnWithoutRadius.Visible := True;
   btnThroughTheRadius.Visible := false;
   btnwithangles.Visible := false;
end;

procedure TForm1.btnwithanglesClick(Sender: TObject);
begin
   check := 2;
   edtFirstAngle.Visible := True;
   btnwithangles.Visible := false;
   btnWithoutAngles.Visible := true;
   btnThroughTheRadius.Visible := False;
end;

procedure TForm1.btnWithoutAnglesClick(Sender: TObject);
begin
   check := 0;
   edtFirstAngle.Visible := false;
   btnwithangles.Visible := True;
   btnWithoutAngles.Visible := false;
   btnThroughTheRadius.Visible := True;
end;

procedure TForm1.btnWithoutRadiusClick(Sender: TObject);
begin
   check := 0;
   edtRadius.Visible := false;
   btnThroughTheRadius.Visible := True;
   btnWithoutRadius.Visible := False;
   btnwithangles.Visible := true;
end;

procedure TForm1.edtFirstAngleKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Length(edtFirstAngle.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;

procedure TForm1.edtFirstSideKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (Length(edtFirstSide.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;



procedure TForm1.edtRadiusKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Length(edtRadius.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;

procedure TForm1.edtSecondSideKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Length(edtSecondSide.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;

procedure TForm1.edtThirdSideKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Length(edtThirdSide.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
   StringFormula.Cells[0,0] := ('additional');
   StringFormula.Cells[1,0] := ('equilateral');
   StringFormula.Cells[2,0] := ('isosceles');
   StringFormula.Cells[3,0] := ('derivative');
   StringFormula.Cells[0,1] := ('Without additional');
   StringFormula.Cells[1,1] := ('(AnySide^2)* 1.73) / 4)');
   StringFormula.Cells[2,1] := ('0.5*Height*Side');
   StringFormula.Cells[3,1] := ('((p-AB)*(p-AC)*(p-BC))^(1/2)**');
   StringFormula.Cells[0,2] := ('With Angle');
   StringFormula.Cells[1,2] := ('there is no special formule');
   StringFormula.Cells[2,2] := ('(1/2) * AB^2 Sin(Angle***)');
   StringFormula.Cells[3,2] := ('(1/2)*AB*BC*Sin(angle)');
   StringFormula.Cells[0,3] := ('with radius');
   StringFormula.Cells[1,3] := ('3*(3^(1/2))*Radius');
   StringFormula.Cells[2,3] := ('p*Radius');
   StringFormula.Cells[3,3] := ('(AB*BC*CB)/4Radius');
end;

end.
