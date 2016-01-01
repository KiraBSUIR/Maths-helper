unit Fractions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,Menu;

type
  TFrame1 = class(TFrame)
    edtNumerator: TEdit;
    edtDeterminator: TEdit;
    imgBorder: TImageViewer;
    cbbFractions: TComboBox;
    lstSimplificate: TListBoxItem;
    btnConfirm: TButton;
    lstMultiplie: TListBoxItem;
    edtNumerator2: TEdit;
    edtDeterminatror2: TEdit;
    imgborder2: TImageViewer;
    edtnumeratorResult: TEdit;
    edtDeterminatorResult: TEdit;
    imgBorderResult: TImageViewer;
    lstMixedNumber: TListBoxItem;
    edtWhole: TEdit;
    procedure edtNumeratorKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtDeterminatorKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    function nod(r, p: integer): integer;
    procedure btnConfirmClick(Sender: TObject);
    procedure edtDeterminatorKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeratorKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure lstMultiplieClick(Sender: TObject);
    procedure Simplificate(var numer, determ: Integer);
    procedure cbbFractionsClosePopup(Sender: TObject);
    procedure MixedNumber(var numer, determ, Whole: Integer);
    procedure checkForAll;
    procedure CheckOnlyFirst;
    procedure CheckForEmptiness(var numer, determ: Integer;var edtNumer, edtDeterm: TEdit);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}


procedure TFrame1.btnConfirmClick(Sender: TObject);
var
   det, numerator, determinator,SecondNumerator, SecondDeterminator: integer;
   whole, ResultNumerator, ResultDeterminator: Integer;
begin
   if (edtNumerator.Text <> '') then
      numerator := strtoInt(edtnumerator.Text);
   if (edtdeterminator.Text <> '') then
      determinator := strtoInt(edtdeterminator.Text);
   if (cbbFractions.Selected = lstSimplificate) then
      begin
         Simplificate(numerator, determinator);
         CheckOnlyFirst;
      end;
   edtNumerator.Text := IntToStr(numerator);
   edtDeterminator.Text := IntToStr(determinator);

   SecondDeterminator := strtoInt(edtDeterminatror2.Text);
   if (cbbFractions.Selected = lstMultiplie) then
      begin
         checkForAll;
         Simplificate(SecondNumerator, SecondDeterminator);
         ResultNumerator := numerator * SecondDeterminator;
         ResultDeterminator := determinator * SecondNumerator;
         Simplificate(ResultNumerator, ResultDeterminator);
         edtnumeratorResult.Text := IntToStr(ResultNumerator);
         edtDeterminatorResult.Text := IntToStr(ResultDeterminator);
      end;
   if (cbbFractions.Selected = lstMixedNumber) then
      begin
         Whole := numerator div determinator;
         numerator := numerator mod determinator;
         edtWhole.Text := IntToStr(whole);
         edtNumerator.Text := IntToStr(numerator);
      end;
end;

procedure TFrame1.cbbFractionsClosePopup(Sender: TObject);
begin
   if (cbbFractions.Selected = lstMultiplie) then
      begin
         edtNumerator2.Visible := True;
         edtDeterminatror2.Visible := True;
         imgborder2.Visible := true;
      end;
end;

procedure TFrame1.checkForAll;
begin
   if  not (edtNumerator2.Visible) And not (edtDeterminatror2.Visible) and not (imgborder2.Visible) then
      begin
         edtNumerator2.Visible := true;
         edtDeterminatror2.Visible := true;
         imgborder2.Visible := true;
      end;
   if not (edtnumeratorResult.Visible) and not (edtDeterminatorResult.Visible) and not (imgBorderResult.Visible) then
      begin
         edtnumeratorResult.Visible := true;
         edtDeterminatorResult.Visible := true;
         imgBorderResult.Visible := True;
      end;
end;

procedure TFrame1.CheckForEmptiness(var numer, determ: Integer; var edtNumer,
  edtDeterm: TEdit);
begin
   if (edtNumer.Text <> '') then
      numer := strtoInt(edtNumer.Text);
   if (edtdeterm.Text <> '') then
      determ := strtoInt(edtdeterm.Text);
end;

procedure TFrame1.CheckOnlyFirst;
begin
   if (edtNumerator2.Visible) and (edtDeterminatror2.Visible) and (imgborder2.Visible) then
      begin
         edtNumerator2.Visible := False;
         edtDeterminatror2.Visible := False;
         imgborder2.Visible := False;
      end;
   if (edtNumeratorResult.Visible) and (edtDeterminatorResult.Visible) and (imgBorderResult.Visible) then
      begin
         edtnumeratorResult.Visible := false;
         edtDeterminatorResult.Visible := false;
         imgBorderResult.Visible := false;
      end;
end;

procedure TFrame1.edtDeterminatorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (pos('-',edtDeterminator.text) <> 0) then
      KeyChar := #0;
    if (Length(edtDeterminator.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;

procedure TFrame1.edtDeterminatorKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (Length(edtDeterminator.Text) >= 2) then
      begin
         edtDeterminator.Width := 42;
         if (imgBorder.Width < 42) then
            imgBorder.Width := 42;
      end;
   if (Length(edtDeterminator.Text) >= 4) then
      begin
         edtDeterminator.Width := 63;
         if (imgBorder.Width < 63) then
            imgBorder.Width := 63;
      end;
   if (Length(edtDeterminator.Text) >= 6) then
      begin
         edtDeterminator.Width := 75;
         if (imgBorder.Width < 75) then
            imgBorder.Width := 75;
      end;
   if (Length(edtDeterminator.Text) <= 6 ) then
      begin
         edtDeterminator.Width := 63;
         if (Length(edtNumerator.Text) <= 6) then
            imgBorder.Width := 63;
      end;
   if (Length(edtDeterminator.Text) <= 4 ) then
      begin
         edtDeterminator.Width := 42;
         if (Length(edtNumerator.Text) <= 4) then
            imgBorder.Width := 42;
      end;
   if (Length(edtDeterminator.Text) <= 2) then
      begin
         edtDeterminator.Width := 21;
         imgBorder.Width := 21;
      end;
end;

procedure TFrame1.edtNumeratorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (pos('-',edtNumerator.text) <> 0) then
      KeyChar := #0;
    if (Length(edtNumerator.Text) = 0) then
       if (KeyChar ='0') then
          Keychar := #0;
end;

procedure TFrame1.edtNumeratorKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (Length(edtNumerator.Text) >= 2) then
      begin
         edtNumerator.Width := 42;
         if (imgBorder.Width < 42) then
            imgBorder.Width := 42;
      end;
   if (Length(edtNumerator.Text) >= 4) then
      begin
         edtNumerator.Width := 63;
         if (imgBorder.Width <= 63) then
            imgBorder.Width := 63;
      end;
   if (Length(edtNumerator.Text) >= 6) then
      begin
         edtNumerator.Width := 75;
         if (imgBorder.Width < 75) then
            imgBorder.Width := 75;
      end;
   if (Length(edtNumerator.Text) <= 6 ) then
      begin
         edtNumerator.Width := 63;
         if (Length(edtDeterminator.Text) <= 6) then
            imgBorder.Width := 63;
      end;
   if (Length(edtNumerator.Text) <= 4 ) then
      begin
         edtNumerator.Width := 42;
         if (Length(edtDeterminator.Text) <= 4) then
            imgBorder.Width := 42;
      end;
   if (Length(edtNumerator.Text) <= 2) then
      begin
         edtNumerator.Width := 21;
         imgBorder.Width := 21;
      end;
end;



procedure TFrame1.lstMultiplieClick(Sender: TObject);
begin
   if (cbbFractions.Selected = lstMultiplie) then
      begin
         edtNumerator2.Visible := True;
         edtNumerator2.Visible := True;
         imgborder2.Visible := true;
      end;

end;

procedure TFrame1.MixedNumber(var numer, determ, Whole: Integer);
begin
   if (numer > determ) then
      begin
         Whole := numer div determ;
         numer := numer mod determ;
         edtWhole.Text := IntToStr(whole);
         edtNumerator.Text := IntToStr(numer);
      end;
end;

function TFrame1.nod(r, p: integer): integer;
var
   RNod, PNod: integer;
begin
   RNod := r;
   PNod := p;
   while(RNod<> PNod) do
   begin
      if (RNod > PNod) then
         RNod := RNod - PNod
      else
         PNod := PNod - RNod;
   end;
   nod := RNod;
end;


procedure TFrame1.Simplificate(var numer, determ: Integer);
var
   det: Integer;
begin
   det := nod(Abs(numer), determ);
      numer := trunc(numer / det);
      determ := trunc(determ / det);
end;


end.
