const m=100;
const s1='Обнаружен 0';
const s2='Матрица не меняется';
const s3='Некорректное значение n';

type arr=array[1..m*3-2] of integer;
     matr=array[1..m,1..m] of integer;
var 
    a,minpois,maxpois:arr;
    b:matr;
    n,i,j:integer;
procedure zadn(var a:arr;n:integer);
var i:integer;
begin
if (n*3)-2<=4 then 
write('Введите ', (n*3)-2, ' элемента, отличных от 0: ') else
write('Введите ', (n*3)-2, ' элементов, отличных от 0: ');
writeln;
for i:=1 to (n*3)-2 do begin
  //writeln;
  read(a[i]); 
  if a[i]=0 then begin 
  writeln(s1);
  halt;
  end;
  end;
  writeln;
end;
procedure diag(var b:matr;n:integer);
var i,k,j:integer;
begin
writeln('Восстановленная матрица:');
k := 1;
for i:=1 to n do
 begin
  for j:=1 to n do
   begin
    if j in [i-1..i+1] then begin
    b[i,j]:=a[k];
    k:=k+1;
    end
    else b[i,j]:=0;
    write(b[i,j]:3);
   end;
   writeln;
 end;
 writeln;
end;
procedure foundmax(const b:matr;n:integer; var maxpois:arr);
var max,i,j:integer;
begin
    for i := 1 to n do begin
        max:= b[i,1];
        for j := 1 to n do begin
            if (b[i,j] >= max) then begin
                max := b[i,j];
                maxpois[i] := j;
                end;
        end;
        writeln('Строка № ',i);
        writeln('Индекс максимального значения в строке: ', maxpois[i]);
        writeln;
    end;
writeln;
end;
procedure foundmin(const b:matr;n:integer; var minpois:arr);
var min,i,j:integer;
begin
    for i := 1 to n do begin
        min:= b[i,i];
            for j := 1 to n do begin
            if (b[i,j] <= min) then begin
                min := b[i,j];
                minpois[i] := j;
                end;
        end;
        writeln('Строка № ',i);
        writeln('Индекс минимального значения в строке: ', minpois[i]);
        writeln;
    end;
writeln;
end;
procedure change(const n:integer;minpois,maxpois:arr; var b:matr);
var x,j,i:integer;
begin
for i := 1 to n do begin
  foundmax(b,n,minpois);
  foundmin(b,n,maxpois);
  x := b[i,minpois[i]];
  b[i,minpois[i]] := b[i,maxpois[i]];
  b[i,maxpois[i]] := x;
end;
writeln;
writeln('Итоговая матрица:');
for i := 1 to n do begin
    for j := 1 to n do 
        write(b[i,j]:3);
        writeln;
    end;
end;
begin
writeln('Введите размер матрицы от 2 до 10');
write('n=');
readln(n);
if (n < 2) or (n > 10) then writeln (s3)  else begin
zadn(a,n);
diag(b,n);
change(n,maxpois,minpois,b);
end;
end.
