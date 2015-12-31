unit Fractions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TFrame1 = class(TFrame)
    edtNumerator: TEdit;
    edtDeterminator: TEdit;
    imgBorder: TImageViewer;
    procedure edtNumeratorKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtDeterminatorKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}


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

end.
