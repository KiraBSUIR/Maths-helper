program kr;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
   TDynamicArray = array of byte;
<<<<<<< HEAD
=======
   MuAra = array of array of Integer;
>>>>>>> a5dc70a2a9f1dea123ef9bcb51e312f894e0e7df

procedure EnterFileName(var FileName: string);
var
   IsFileExist: Boolean;
begin
   repeat
      IsFileExist := True;
      Readln(FileName);
      if not FileExists(FileName) then
      begin
         IsFileExist := False;
         Writeln('Файл с таким именем не найден! Попробуйте еще раз!');
      end;
   until IsFileExist;
end;

procedure ReadFromFile(FileName: string; var Arr: TDynamicArray; var n: integer);
var
   IsCorrectFileData: Boolean;
   InputFile: text;
   i: integer;
begin
   repeat
      write('Укажите путь к файлу, который содержит массив: ');
      IsCorrectFileData := true;
      EnterFileName(FileName);
      Assign(InputFile, FileName);
      Reset(InputFile);
      Readln(InputFile, n);
      SetLength(Arr, n);
      for i := 0 to n - 1 do
      read(InputFile, Arr[i]);
      CloseFile(InputFile);
   until IsCorrectFileData;
end;

procedure PrintOriginalArray(var Arr: TDynamicArray);
var i: integer;
begin
   for i := 0 to Length(Arr) - 1 do
      write(Arr[i], ' ');
end;

procedure SortingArray(var Arr: TDynamicArray);
var
   i, j, tmp: integer;
   Divider: array of Integer;
begin
   writeln;
   SetLength(Divider, Length(Arr));
   for i := 0 to Length(Divider) - 1 do
      Divider[i] := 0;

   for i := 0 to Length(Arr) - 1 do
      for j := 1 to Arr[i] do
         if Arr[i] mod j = 0 then
            inc(Divider[i]);

   for i := 0 to Length(Arr) - 2 do
      for j := i + 1 to Length(Arr) - 1 do
         if Divider[i] > Divider [j] then
         begin
            tmp := Divider[i];
            Divider[i] := Divider[j];
            Divider[j] := tmp;
            tmp := Arr[i];
            Arr[i] := Arr[j];
            Arr[j] := tmp;
         end;
end;

procedure PrintSortedArrayToFile(FileName: string;var Arr: TDynamicArray);
var
   OutputFile: Text;
   i : integer;
begin
   write('Укажите путь к файлу, в который следует записать результат: ');
   EnterFileName(FileName);
   Assign(OutputFile, FileName);
   Rewrite(OutputFile);
   writeln('Отсортированная матрица: ');
   writeln(OutputFile, 'Отсортированная матрица: ');
   for i := 0 to Length(Arr) - 1 do
   begin
      write(Arr[i], ' ');
      write(OutputFile, Arr[i], ' ');
   end;
   CloseFile(OutputFile);
end;

var
   FileName: string;
   Arr : TDynamicArray;
   n : Integer;
begin
   SetConsoleCP(1251);
   SetConsoleOutputCP(1251);
   ReadFromFile(FileName, Arr, n);
   PrintOriginalArray(Arr);
   SortingArray(Arr);
   PrintSortedArrayToFile(FileName, Arr);
   Readln;
end.