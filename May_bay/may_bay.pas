uses crt;
var x,y,diem,a,b,g,h,u,mang,v,td,z,c,m,p,n,d,chon:integer;
    l,j,k,o:array[1..5] of integer;
    s:char;
    w:string;
begin
td:=1;
w:='[++++}';
while 0=0 do
begin
	textbackground(green);
	clrscr;
	textcolor(red);
	gotoxy(30,9);
	write('TRO CHOI MAY BAY');
	textcolor(yellow);
	gotoxy(15,11);
	write('1. Bat dau choi');
	gotoxy(45,11);
	write('2. Huong dan choi');
	gotoxy(15,13);
	write('3. Chon may bay');
	gotoxy(45,13);
	write('4. Chon muc choi');
	gotoxy(30,15);
	write('5. Thoat ');
	gotoxy(15,20);
	write('Toi chon : ');
	readln(chon);
{------------Phan choi------------}
if chon=1 then
begin
     randomize;
     clrscr;
     x:=2;
     y:=2;
     for v:=1 to td do
     begin
     l[v]:=random(79);
     o[v]:=random(24);
     end;
     for n:=1 to td do
     begin
     j[n]:=random(79);
     k[n]:=random(24);
     end;
     diem:=0;
     mang:=3;
     z:=random(79);
     if z<=40 then z:=z+40;
     c:=random(24);
     if c<=1 then c:=c+23;

     while (mang>0) do
     begin
          textbackground(blue);
          clrscr;
          u:=random(12);
          textcolor(u);
          gotoxy(x,y);
          write(w);
          {------Di chuyen-----------}
          if keypressed then s:=readkey;
          case s of
          'j','J':dec(x,2);
          'l','L':inc(x,2);
          'k','K':inc(y);
          'i','I':dec(y);
          '6','^':break;
          end;
          (*-------------------------*)
          for v:=1 to td do
          begin
          gotoxy(l[v],o[v]);
          textcolor(white);
          write('C',#16);
          dec(l[v]);
          end;
          for v:=1 to td do
          begin
          if (x<=l[v]) and (x+length(w)>=l[v]) and (y=o[v]) then
          begin
               mang:=mang-1;
               l[v]:=random(79);
               o[v]:=random(24);
               if l[v]<= 40 then l[v]:=40+l[v];
               if o[v]<=2 then o[v]:=2+o[v];
          end;
          end;
          for v:=1 to td do
          if l[v]=1 then
          begin
          l[v]:=random(79);
          o[v]:=random(24);
          end;
          for n:=1 to td do
          begin
          gotoxy(j[n],k[n]);
          textcolor(yellow);
          write('$');
          dec(j[n]);
          end;
          for n:=1 to td do
          begin
          if (x<=j[n]) and (x+length(w)>=j[n]) and (y=k[n]) then
          begin
               diem:=diem+1;
               j[n]:=random(79);
               k[n]:=random(24);
               if j[n]<40 then j[n]:=j[n]+40;
               if (k[n]<=1) then k[n]:=23+k[n];
          end;
          end;
          for n:=1 to td do
          if j[n]=1 then begin
          j[n]:=random(79);
          k[n]:=random(24);
          end;

          textcolor(lightred);
          gotoxy(1,1);
          write('Mang : ',mang);
          gotoxy(45,1);
          write('Diem : ',diem);
          if (x+length(w)=80) or (y=25) or (x=1) or (y=1) then
          begin
          mang:=mang-1;
          x:=random(40);
          y:=random(24);
          if y<=1 then y:=1+y;
          if y>=23 then y:=26-y;
          end;

          if (diem mod 6 = 0) and (diem>=6) then
          begin
          textcolor(u);
          gotoxy(z,c);
          write(#3);
          dec(z,1);
          if (x<=z) and (x+length(w)>=z) and (y=c) then
          begin
          z:=random(79);
          if z<=2 then z:=random(79);
          c:=random(24);
          if c<=1 then c:=23+c;
          mang:=mang+1;
          diem:=diem+1;
          end;
          end;
          delay(160);
     end;
     clrscr;
     gotoxy(30,11);
     textcolor(lightblue);
     write('Diem cua ban la ',diem);
     readln;
end;
{----------------------het--------------------------}
{-------------Phan huong dan choi-------------------}
if chon=2 then
begin
	clrscr;
	gotoxy(30,1);
	textcolor(red);
	writeln('HUONG DAN CHOI');
	gotoxy(1,3);
	writeln('Dung cac phim j,k,i,l de di chuyen : ');
	writeln('- Phim j qua trai');
	writeln('- Phim l qua phai');
	writeln('- Phim i di len');
	writeln('- Phim k di xuong');
	writeln('Dung phim 6 de ve trang chinh');
	readln;
end;
{--------------------------het-------------------------}
{------------------Phan chon may bay------------------}
if chon=3 then
begin
	clrscr;
	gotoxy(30,1);
	textcolor(red);
	write('CHON MAY BAY');
	gotoxy(2,3);
	textcolor(blue);
	writeln('[++++}     (----->    :>====}      C===|D ');
	write('   1          2          3           4    ');
	gotoxy(4,5);
	write('Chon so : ');
	readln(d);
	case d of
	 1 : w:='[++++}';
	 2 : w:='(----->';
	 3 : w:=':>====}';
	 4 : w:='C===|D';
	end;
end;
{---------------het---------}
{------------chon muc choi-------}
if chon=4 then
begin
repeat
	clrscr;
	gotoxy(3,3);
	write('Chon muc choi (3 den 7): ');
	readln(td);
until ((td>=3) and (td<=7));
end;
{--------------het-----------}
{------------phan thoat--------}
if chon=5 then exit;
{----------het-------------}
end;
end.




