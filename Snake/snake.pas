uses crt;
const ScreenHeight = 24;
      ScreenWidth = 40;
type snake_type = record
        dot: array[1..100] of record
            x,y: byte;
        end;
        n: integer;
        tt: (up, down, right, left);
     end;
     stuff_type = record
         x,y: byte;
     end;
     buffer_type = record
         kitu: char;
         color: byte;
         bg: byte
     end;
var snake: snake_type;
    stuff: stuff_type;
    buffer: array[1..ScreenWidth, 1..25] of buffer_type;
    score: integer;
    i,j: integer;
    key: char;

procedure draw_one(x, y: integer; kt: char; color: byte; bg: byte);
begin

     buffer[x][y].kitu := kt;
     buffer[x][y].color := color;
     buffer[x][y].bg := bg;
end;
begin
		textbackground(black);
    clrscr;
    snake.n := 2;
    snake.dot[1].x := 10;
    snake.dot[1].y := 10;
    stuff.x := 20;
    stuff.y := 20;
    snake.tt := right;

    randomize;
    while (true) do
    begin
        {print screen}
        for i := 1 to ScreenWidth do
        begin
             draw_one(i, 1, chr(178), 10, 0);
             draw_one(i, ScreenHeight, chr(178), 10, 0);
        end;
        for i := 1 to ScreenHeight do
        begin
             draw_one(1, i, chr(178), 10, 0);
             draw_one(ScreenWidth, i, chr(178), 10, 0);
             draw_one(2, i, chr(178), 10, 0);
             draw_one(ScreenWidth - 1, i, chr(178), 10, 0);
        end;
        for i := 1 to snake.n do
        begin

            if i=1 then draw_one(snake.dot[1].x, snake.dot[1].y, chr(219), 15, 0)
            else draw_one(snake.dot[i].x, snake.dot[i].y, chr(177), 0, 7);

        end;
        draw_one(stuff.x, stuff.y, '*', 12, 0);
        for i := 1 to ScreenWidth do
            for j := 1 to ScreenHeight do
            begin
                 gotoxy(i,j);
                 textbackground(buffer[i][j].bg);
                 textcolor(buffer[i][j].color);
                 write(buffer[i][j].kitu);
                 buffer[i][j].kitu := ' ';
                 buffer[i][j].bg := black;
                 textcolor(white);
            end;

				textcolor(15);
				gotoxy(ScreenWidth + 5, ScreenHeight div 3);
				write('Dung cac phim mui ten de di chuyen');
				gotoxy(ScreenWidth + 5, ScreenHeight div 3 * 2);
				write('Your score : ', snake.n * 8 - 16);
        {xu li moi}
        if (snake.dot[1].x = stuff.x) and (snake.dot[1].y = stuff.y) then
        begin
            snake.n:= snake.n+1;
            stuff.x:= random(ScreenWidth) + 3;
						if stuff.x > ScreenWidth - 2 then stuff.x := ScreenWidth - 2;
            stuff.y:= random(ScreenHeight - 2) + 2;
        end;
        for i := 2 to snake.n do if (snake.dot[1].x = snake.dot[i].x) and (snake.dot[1].y = snake.dot[i].y) then break;

        for i := snake.n downto 2 do
        begin
            snake.dot[i] := snake.dot[i-1];
        end;
        if keypressed=true then key:=readkey;

        if (key=chr(72)) then
           if snake.tt<>down then snake.tt:=up;
        if (key=chr(80)) then
           if snake.tt<>up then snake.tt:=down;
        if (key=chr(75)) then
           if snake.tt<>right then snake.tt:=left;
        if (key=chr(77)) then
           if snake.tt<>left then snake.tt:=right;
        if key=chr(27) then break;

        if snake.tt=up then snake.dot[1].y:=snake.dot[1].y-1;
        if snake.tt=down then snake.dot[1].y:=snake.dot[1].y+1;
        if snake.tt=left then snake.dot[1].x:=snake.dot[1].x-1;
        if snake.tt=right then snake.dot[1].x:=snake.dot[1].x+1;

        if (snake.dot[1].x = 2)
        or (snake.dot[1].x = ScreenWidth-1)
        or (snake.dot[1].y = 1)
        or (snake.dot[1].y = ScreenHeight)
        then break;
    end;
    gotoxy(ScreenWidth div 2 - 7, ScreenHeight div 2);
    textcolor(15);
    write('Your score : ', snake.n * 8 - 16);
    textcolor(black);
    readln;
end.