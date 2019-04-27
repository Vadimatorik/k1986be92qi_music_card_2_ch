Program Pr;
var input: file of char;                                                        //Отсюда читаем. 
    DataST: string;                                                             //Буффер для разбора ноты.
    BufChar: char;                                                              //Буффер для посимвольного чтения.
    Loop: integer;                                                              //Количество нот.
    BufNOT: byte;                                                               //Значение для одной ноты/времени ноты.
    MESNOT: array [0..1000, 0..1] of byte;                                      //Массив до 10000 нот.
    I: integer;                                                                 //Счетчик-оформитель.
Begin
    assign(input, 'INPUT.txt'); reset(input);                                   //Подключаем файл для чтения.
    Loop:=0;
    while not Eof(input) do                                                     //Читаем до окончания файла.
    Begin
      DataST:='';
      while 1=1 do                                                              //Читаем до пробела.
      Begin 
        read(input, BufChar);                                                   //Читаем символ.
        if (BufChar <> ' ') then DataST:=DataST+BufChar                         //Если не пустой символ - дописать.
        else break;                                                             //Иначе - выйти.
      End;

    case DataST[1] of                                                           //Разбираем ноту.
    'C': if (DataST[2] = 'i') then Begin                                        //Если нота До, то смотрим на #.                                                                    
         if      (DataST[4] = '1') then BufNOT:=1                               //До# - малой  октавы. 
         else if (DataST[4] = '2') then BufNOT:=13                              //До# - первой октавы. 
         else if (DataST[4] = '3') then BufNOT:=25                              //До# - второй октавы.
         else if (DataST[4] = '4') then BufNOT:=37                              //До# - третей октавы.
         End else Begin              
         if      (DataST[2] = '1') then BufNOT:=0                               //До  - малой октавы.
         else if (DataST[2] = '2') then BufNOT:=12                              //До  - первой октавы. 
         else if (DataST[2] = '3') then BufNOT:=24                              //До  - второй октавы.   
         else if (DataST[2] = '4') then BufNOT:=36 
         End;
    'D': if      (DataST[2] = 'i') then Begin                                   //Если нота Ре.                                                                   
         if      (DataST[4] = '1') then BufNOT:=3                              
         else if (DataST[4] = '2') then BufNOT:=15                             
         else if (DataST[4] = '3') then BufNOT:=27
         else if (DataST[4] = '4') then BufNOT:=39
         End else Begin
         if      (DataST[2] = '1') then BufNOT:=2                             
         else if (DataST[2] = '2') then BufNOT:=14                             
         else if (DataST[2] = '3') then BufNOT:=26 
         else if (DataST[2] = '4') then BufNOT:=38 End;
          
    'E': if      (DataST[2] = '1') then BufNOT:=4                               //Если нота Ми (Диеза "не имеет").                    
         else if (DataST[2] = '2') then BufNOT:=16                    
         else if (DataST[2] = '3') then BufNOT:=28
         else if (DataST[2] = '4') then BufNOT:=40;
         
    'F': if      (DataST[2] = 'i') then Begin                                   //Если нота Фа.                                                                   
         if      (DataST[4] = '1') then BufNOT:=6                              
         else if (DataST[4] = '2') then BufNOT:=18                             
         else if (DataST[4] = '3') then BufNOT:=30 
         else if (DataST[4] = '4') then BufNOT:=42 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=5                            
         else if (DataST[2] = '2') then BufNOT:=17                             
         else if (DataST[2] = '3') then BufNOT:=29 
         else if (DataST[2] = '4') then BufNOT:=41 End;
         
    'G': if      (DataST[2] = 'i') then Begin                                   //Если нота Соль.                                                                   
         if      (DataST[4] = '1') then BufNOT:=8                           
         else if (DataST[4] = '2') then BufNOT:=20                             
         else if (DataST[4] = '3') then BufNOT:=32 
         else if (DataST[4] = '4') then BufNOT:=44 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=7                           
         else if (DataST[2] = '2') then BufNOT:=19                           
         else if (DataST[2] = '3') then BufNOT:=31 
         else if (DataST[2] = '4') then BufNOT:=43 End;
         
    'A': if      (DataST[2] = 'i') then Begin                                   //Если нота Ля.                                                                   
         if      (DataST[4] = '1') then BufNOT:=10                             
         else if (DataST[4] = '2') then BufNOT:=22                            
         else if (DataST[4] = '3') then BufNOT:=34 
         else if (DataST[4] = '4') then BufNOT:=46 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=9                             
         else if (DataST[2] = '2') then BufNOT:=21                             
         else if (DataST[2] = '3') then BufNOT:=33
         else if (DataST[2] = '4') then BufNOT:=45 End;
         
    'B': if      (DataST[2] = '1') then BufNOT:=11                              //Си.              
         else if (DataST[2] = '2') then BufNOT:=23                    
         else if (DataST[2] = '3') then BufNOT:=35
         else if (DataST[2] = '4') then BufNOT:=47;
    'P': BufNOT:=48;                                                            //В случае "паузы".
    End;
    
    MESNOT[Loop][0]:=BufNOT;                                                    //Сохраняем номер ноты. 
    
    if (DataST[length(DataST)-1] = '.') then                                    //Если длительность с точкой. 
    Begin                    
    if (DataST[length(DataST)-3] = '/') then                                    //Если длительность из одного знака (1/1, 1/2, 1/4, 1/8).
    case DataST[length(DataST)-2] of
      '1': BufNOT:=64+32;
      '2': BufNOT:=32+16;
      '4': BufNOT:=16+8;
      '8': BufNOT:=8+4; end                                                     //64 с точной запрещяна!
    else if (DataST[length(DataST)-3] = '3') and (DataST[length(DataST)-2] = '2') then BufNOT:=2+1 //Если 32-я.
    else if (DataST[length(DataST)-3] = '1') and (DataST[length(DataST)-2] = '6') then BufNOT:=4+2; //Если 16-я.
    End
    else Begin                                                                  //Если длительность без точки.
    if (DataST[length(DataST)-2] = '/') then                                    //Если длительность из одного знака (1/1, 1/2, 1/4, 1/8).
    case DataST[length(DataST)-1] of
      '1': BufNOT:=64;
      '2': BufNOT:=32;
      '4': BufNOT:=16;
      '8': BufNOT:=8; end              
    else if (DataST[length(DataST)-2] = '6') and (DataST[length(DataST)-1] = '4') then BufNOT:=1 //Если 64-я.
    else if (DataST[length(DataST)-2] = '3') and (DataST[length(DataST)-1] = '2') then BufNOT:=2 //Если 32-я.
    else if (DataST[length(DataST)-2] = '1') and (DataST[length(DataST)-1] = '6') then BufNOT:=4; //Если 16-я.
    End;
    
    MESNOT[Loop][1]:=BufNOT;                                                    //Сохраняем длительность. 
    
    Loop:=Loop+1;
    End;
    
    writeln ('//Массив нот.');                                                  //Оформаляем массив.
    write('uint8_t MusicNote [', Loop, '][2] = {');
    for I:=0 to Loop-1 do Begin write(MESNOT[I][0], ',', MESNOT[I][1]);
                              if (I<>(Loop-1)) then write(', ');
                        End;
    write('};');
    
End.