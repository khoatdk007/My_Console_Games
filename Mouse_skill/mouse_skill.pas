{$I+}
uses crt,drivers;
const kh1='Tot lam';
      kh2='Hay !';
      kh3='Phat huy nhe !';
      kh4='Gioi qua !';
      kh5='! Xuat sac !';
var m:tevent;
    j,k,mx,my,nhap:byte;
    h,n:integer;
    khen:string;

procedure writexy(x,y:byte;s:string);
  begin
    gotoxy(x,y);write(s);
  end;
procedure chon;
begin
j:=random(77);
k:=random(22);
if j<=2 then j:=j+3;
if k<=1 then k:=k+2;
if (j in [38..44]) and (k=2) then j:=7+j;
end;
procedure ve(x,y,j,f:byte);
var a,b:byte;
begin
textbackground(f);
gotoxy(x,y);
for a:=1 to j do
begin
for b:=1 to 2*j do write(' ');
gotoxy(x,y+a);
end;
textbackground(0);
end;

procedure muc(n:byte);
begin
gotoxy(38,2);
textcolor(10);
write('MUC ',n);
end;
{____________muc1___________}
procedure muc1;
begin
n:=0;
clrscr;
chon;
initevents;
repeat
highvideo;
ve(j,k,5-n,n+1);
muc(1);
textcolor(lightblue);
writexy(2,24,'Di chuyen chuot den o vuong');
getmouseevent(m);
if m.what=4 then
begin
    mx:=mousewhere.x+1;my:=mousewhere.y+1;
    if (mx in [j..j+10-2*n]) and (my in [k..k+5-n]) then
    begin
    case n of
    0:khen:=kh1;
    1:khen:=kh2;
    2:khen:=kh3;
    3:khen:=kh4;
    4:khen:=kh5;
    end;
    writexy(30,12,khen);
    delay(360);
    clrscr;
    n:=n+1;
    chon;
    ve(j,k,5-n,n+1);
    end;
end;
textcolor(lightblue);
gotoxy(60,24);
write('Diem : ',n);
if n=5 then break;
gotoxy(80,25);
until keypressed;
doneevents;
end;
{_________________het muc1_________}
{__________________muc2_____________}
procedure muc2;
begin
n:=0;
textcolor(3);
clrscr;
chon;
initevents;
repeat
highvideo;
ve(j,k,5-n,2*n+1);
muc(2);
textcolor(lightblue);
writexy(2,24,'Nhap chuot trai vao o vuong');
getmouseevent(m);
case m.what of
4:begin
    mx:=mousewhere.x+1;my:=mousewhere.y+1;
end;
1:if (m.buttons=1) and (mx in [j..j+10-2*n]) and (my in [k..k+5-n]) then
  begin
    case n of
    0:khen:=kh1;
    1:khen:=kh2;
    2:khen:=kh3;
    3:khen:=kh4;
    4:khen:=kh5;
    end;
    writexy(30,12,khen);
    delay(360);
    n:=n+1;
    clrscr;
    chon;
    ve(j,k,5-n,2*n+1);
    end;
end;
gotoxy(60,24);
textcolor(lightblue);
write('Diem : ',n);
if n=5 then break;
gotoxy(80,25);
until keypressed;
doneevents;
end;
{_____________het muc 2_________}
{______________muc 3_____________}
procedure muc3;
begin
n:=0;
clrscr;
chon;
initevents;
repeat
highvideo;
ve(j,k,5-n,n+2);
muc(3);
textcolor(lightblue);
writexy(2,24,'Nhap dup chuot vao o vuong');
getmouseevent(m);
if m.what =4 then begin
    mx:=mousewhere.x+1;my:=mousewhere.y+1;
end;
if (m.what=1) and (m.buttons=1) and (mx in [j..j+10-2*n]) and (my in [k..k+5-n]) then
begin
nhap:=nhap+1;
if (nhap mod 2 = 0) and (nhap>0) then
  begin
    case n of
    0:khen:=kh1;
    1:khen:=kh2;
    2:khen:=kh3;
    3:khen:=kh4;
    4:khen:=kh5;
    end;
    writexy(30,12,khen);
    delay(360);
    n:=n+1;
    clrscr;
    chon;
    ve(j,k,5-n,n+2);
  end;
end;
textcolor(lightblue);
gotoxy(60,24);
write('Diem : ',n);
if n=5 then break;
gotoxy(80,25);
until keypressed;
doneevents;
end;
{______________het muc3___________}
{_______________muc4____________}
procedure muc4;
begin
n:=0;
clrscr;
chon;
initevents;
repeat
highvideo;
ve(j,k,5-n,n+9);
muc(4);
textcolor(lightblue);
writexy(2,24,'Nhap chuot phai vao o vuong');
getmouseevent(m);
case m.what of
4:begin
    mx:=mousewhere.x+1;my:=mousewhere.y+1;
end;
1:if (m.buttons=2) and (mx in [j..j+10-2*n]) and (my in [k..k+5-n]) then
  begin
    case n of
    0:khen:=kh1;
    1:khen:=kh2;
    2:khen:=kh3;
    3:khen:=kh4;
    4:khen:=kh5;
    end;
    writexy(30,12,khen);
    delay(360);
    n:=n+1;
    clrscr;
    chon;
    ve(j,k,5-n,n+9);
    end;

end;
textcolor(lightblue);
gotoxy(60,24);
write('Diem : ',n);
if n=5 then break;
gotoxy(80,25);
until keypressed;
doneevents;
end;
{_____________het muc 4_________}
{____________muc 5___________}
procedure muc5;
begin
n:=0;
clrscr;
chon;
initevents;
repeat
highvideo;
ve(j,k,5-n,n+11);
muc(5);
textcolor(lightblue);
writexy(2,24,'Nhap dup chuot phai vao o vuong');
getmouseevent(m);
if m.what =4 then begin
    mx:=mousewhere.x+1;my:=mousewhere.y+1;
end;
if (m.what=1) and (m.buttons=2) and (mx in [j..j+5-n]) and (my in [k..k+10-2*n]) then
begin
nhap:=nhap+1;
if (nhap mod 2 = 0) and (nhap>0) then
  begin
      case n of
    0:khen:=kh1;
    1:khen:=kh2;
    2:khen:=kh3;
    3:khen:=kh4;
    4:khen:=kh5;
    end;
    writexy(30,12,khen);
    delay(360);
    n:=n+1;
    clrscr;
    chon;
    ve(j,k,5-n,n+11);
  end;
end;
textcolor(lightblue);
gotoxy(60,24);
write('Diem : ',n);
if n=5 then break;
gotoxy(80,25);
until keypressed;
doneevents;
end;
{___________________het muc5____________}
begin
muc1;
muc2;
muc3;
muc4;
muc5;
clrscr;
writexy(30,12,'Ban da vuot qua tro choi nay');
readln;
end.