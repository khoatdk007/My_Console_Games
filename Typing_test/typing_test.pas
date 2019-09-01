Uses crt;
Var
  a,b,t: Array[1..3] Of Integer;
  dung: Boolean;
  diem,mang,v,chon: Integer;
  ch,s: String;
  d: Array[1..3] Of Char;
  h: Char;

Procedure writexy(x,y:Byte;s:String);
Begin
  Gotoxy(x,y);
  Write(s);
End;
{--------------------------------------------}

Procedure kbd;
Begin
  textbackground(blue);
  Clrscr;
  Gotoxy(30,10);
  textcolor(red);
  Write('TYPING TEST GAME');
  textcolor(yellow);
  Gotoxy(15,12);
  Write('1. Luyen go chu so');
  Gotoxy(45,12);
  Write('2. Luyen go chu thuong');
  Gotoxy(15,14);
  Write('3. Luyen go chu hoa');
  Gotoxy(45,14);
  Write('4. Luyen go chu hoa va chu thuong');
  Gotoxy(20,18);
  Write('6. Thoat game');
  Gotoxy(30,16);
  textcolor(lightred);
  Write('5. Luyen go tat ca');
  textcolor(13);
  Gotoxy(20,20);
  Write('Toi chon (1 -> 6) : ');
End;
{-------------------------------------------}

Procedure vechu(x,y:Byte;s:Char);
Begin
  writexy(x,y-2,'_');
  Gotoxy(x,y-1);
  Write('|',s,'|');
  writexy(x,y,'-');
End;
{---------------------------------------------}

Procedure vekhung;
Var
  a,i: Integer;
Begin
  textbackground(lightgreen);
  Clrscr;
  textcolor(yellow);
  Gotoxy(1,24);
  For a:=1 To 80 Do
    Write('-');
  textcolor(blue);
  Gotoxy(2,25);
  Write('Diem : ',diem);
  textcolor(lightred);
  Gotoxy(40,25);
  For i:=1 To mang Do
    Write(#3);
End;
{---------------------------------------------}

Procedure abc(s:String);
Begin
  Clrscr;
  mang := 8;
  diem := 0;
  ch := s;
  For v:=1 To 3 Do
    Begin
      a[v] := Random(81);
      If a[v]=0 Then a[v] := 80;
      b[v] := Random(25);
      If b[v]<19 Then b[v] := b[v] Div 6 +19;
      t[v] := Random(Length(ch)+1);
      If t[v]=0 Then t[v] := Length(ch);
      d[v] := ch[t[v]];
      h := '/';
    End;
  Repeat
    vekhung;
    dung := False;
    For v:=1 To 3 Do
      Begin
        textcolor(black);
        vechu(a[v],b[v],d[v]);
        b[v] := b[v]-1;
      End;
    If Keypressed Then
      Begin
        h := Readkey;
        dung := True;
      End;
    If dung=True Then
      For v:=1 To 3 Do
        If h=d[v] Then
          Begin
            a[v] := Random(80);
            If a[v]=0 Then a[v] := 80;
            b[v] := Random(25);
            If b[v]< 19 Then b[v] := b[v] Div 6 + 19;
            t[v] := Random(Length(ch)+1);
            If t[v]=0 Then t[v] := Length(ch);
            d[v] := ch[t[v]];
            diem := diem+1;
          End;
    If h='=' Then break;
    For v:=1 To 3 Do
      If b[v]=1 Then
        Begin
          a[v] := Random(80);
          If a[v]=0 Then a[v] := 80;
          b[v] := Random(25);
          If b[v]< 19 Then b[v] := b[v] Div 6 + 19;
          t[v] := Random(Length(ch)+1);
          If t[v]=0 Then t[v] := Length(ch);
          d[v] := ch[t[v]];
          mang := mang-1;
        End;
    delay(240);
  Until mang=0;
  Clrscr;
  Gotoxy(40,12);
  Write('Ban da thua, diem cua ban la : ',diem);
  Readln;
End;
{-------------------------------------------------}
Begin
  While True Do
    Begin
      Repeat
        kbd;
        Readln(chon);
      Until (chon <=6) And (chon>=1);
      Case chon Of
        1: abc('0987654321');
        2: abc('abcdefghiklmnopqrstuvwxyz');
        3: abc('ABCDEFGHIKLMNOPQRSTUVWXYZ');
        4: abc('aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
        5: abc('aA1bB2cC3dD4eE5fF6gG7hH8iI9jJ0kKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
        6: Exit;
      End;
    End;
  Readln;
End.

