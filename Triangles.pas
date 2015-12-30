unit Triangles;

interface

uses
<<<<<<< HEAD
  Math, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
=======
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

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
    btnShowMenu: TButton;
    edtFirstAngle: TEdit;
<<<<<<< HEAD
    btnwithangles: TButton;
    btnWithoutAngles: TButton;
    btnClearAll: TButton;
    lblFormules: TLabel;
    lblFormulaisocleses: TLabel;
=======
    edtSecondAngle: TEdit;
    edtThirdAngle: TEdit;
    btnwithangles: TButton;
    btnWithoutAngles: TButton;
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
    procedure btnFindSquareClick(Sender: TObject);
    procedure btnThroughTheRadiusClick(Sender: TObject);
    procedure btnWithoutRadiusClick(Sender: TObject);
    procedure btnShowMenuClick(Sender: TObject);
    procedure btnwithanglesClick(Sender: TObject);
    procedure btnWithoutAnglesClick(Sender: TObject);
<<<<<<< HEAD
    procedure btnClearAllClick(Sender: TObject);
=======
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
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
<<<<<<< HEAD
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
=======
procedure TForm1.btnFindSquareClick(Sender: TObject);
var
   FirstSide, SecondSide, ThirdSide, Radius: Integer;
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
   Height, Square: real;
begin
   if (edtFirstSide.Text <> '') then
      FirstSide := StrToInt(EdtFirstSide.text);
   if (edtSecondSide.Text <> '') then
      SecondSide := StrToInt(edtSecondSide.text);
   if (edtThirdSide.Text <> '') then
      ThirdSide := StrToInt(edtThirdSide.text);
<<<<<<< HEAD
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

=======
   if (check = 0) then
      if (FirstSide = SecondSide) and (FirstSide = ThirdSide) and (SecondSide = ThirdSide) then
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
      {if (FirstSide = SecondSide) then
      begin
         ThirdSide := round((1 / 2) * ThirdSide);
         height := (SecondSide * SecondSide) - (ThirdSide * ThirdSide);
         Height := Sqrt(height);
         Square := ThirdSide * height;
         LabelSquare.Text := 'square of triangle is: ' + FloatToStr(Square);
      end;       }
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
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
end;

procedure TForm1.btnwithanglesClick(Sender: TObject);
begin
   check := 2;
   edtFirstAngle.Visible := True;
<<<<<<< HEAD
=======
   edtSecondSide.Visible := True;
   edtThirdAngle.Visible := true;
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
end;

procedure TForm1.btnWithoutAnglesClick(Sender: TObject);
begin
   check := 0;
   edtFirstAngle.Visible := false;
<<<<<<< HEAD
=======
   edtSecondSide.Visible := false;
   edtThirdAngle.Visible := false;
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df
end;

procedure TForm1.btnWithoutRadiusClick(Sender: TObject);
begin
   check := 0;
   edtRadius.Visible := false;
end;

end.
