Program Pr;
var input: file of char;                                                        //������ ������. 
    DataST: string;                                                             //������ ��� ������� ����.
    BufChar: char;                                                              //������ ��� ������������� ������.
    Loop: integer;                                                              //���������� ���.
    BufNOT: byte;                                                               //�������� ��� ����� ����/������� ����.
    MESNOT: array [0..1000, 0..1] of byte;                                      //������ �� 10000 ���.
    I: integer;                                                                 //�������-����������.
Begin
    assign(input, 'INPUT.txt'); reset(input);                                   //���������� ���� ��� ������.
    Loop:=0;
    while not Eof(input) do                                                     //������ �� ��������� �����.
    Begin
      DataST:='';
      while 1=1 do                                                              //������ �� �������.
      Begin 
        read(input, BufChar);                                                   //������ ������.
        if (BufChar <> ' ') then DataST:=DataST+BufChar                         //���� �� ������ ������ - ��������.
        else break;                                                             //����� - �����.
      End;

    case DataST[1] of                                                           //��������� ����.
    'C': if (DataST[2] = 'i') then Begin                                        //���� ���� ��, �� ������� �� #.                                                                    
         if      (DataST[4] = '1') then BufNOT:=1                               //��# - �����  ������. 
         else if (DataST[4] = '2') then BufNOT:=13                              //��# - ������ ������. 
         else if (DataST[4] = '3') then BufNOT:=25                              //��# - ������ ������.
         else if (DataST[4] = '4') then BufNOT:=37                              //��# - ������ ������.
         End else Begin              
         if      (DataST[2] = '1') then BufNOT:=0                               //��  - ����� ������.
         else if (DataST[2] = '2') then BufNOT:=12                              //��  - ������ ������. 
         else if (DataST[2] = '3') then BufNOT:=24                              //��  - ������ ������.   
         else if (DataST[2] = '4') then BufNOT:=36 
         End;
    'D': if      (DataST[2] = 'i') then Begin                                   //���� ���� ��.                                                                   
         if      (DataST[4] = '1') then BufNOT:=3                              
         else if (DataST[4] = '2') then BufNOT:=15                             
         else if (DataST[4] = '3') then BufNOT:=27
         else if (DataST[4] = '4') then BufNOT:=39
         End else Begin
         if      (DataST[2] = '1') then BufNOT:=2                             
         else if (DataST[2] = '2') then BufNOT:=14                             
         else if (DataST[2] = '3') then BufNOT:=26 
         else if (DataST[2] = '4') then BufNOT:=38 End;
          
    'E': if      (DataST[2] = '1') then BufNOT:=4                               //���� ���� �� (����� "�� �����").                    
         else if (DataST[2] = '2') then BufNOT:=16                    
         else if (DataST[2] = '3') then BufNOT:=28
         else if (DataST[2] = '4') then BufNOT:=40;
         
    'F': if      (DataST[2] = 'i') then Begin                                   //���� ���� ��.                                                                   
         if      (DataST[4] = '1') then BufNOT:=6                              
         else if (DataST[4] = '2') then BufNOT:=18                             
         else if (DataST[4] = '3') then BufNOT:=30 
         else if (DataST[4] = '4') then BufNOT:=42 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=5                            
         else if (DataST[2] = '2') then BufNOT:=17                             
         else if (DataST[2] = '3') then BufNOT:=29 
         else if (DataST[2] = '4') then BufNOT:=41 End;
         
    'G': if      (DataST[2] = 'i') then Begin                                   //���� ���� ����.                                                                   
         if      (DataST[4] = '1') then BufNOT:=8                           
         else if (DataST[4] = '2') then BufNOT:=20                             
         else if (DataST[4] = '3') then BufNOT:=32 
         else if (DataST[4] = '4') then BufNOT:=44 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=7                           
         else if (DataST[2] = '2') then BufNOT:=19                           
         else if (DataST[2] = '3') then BufNOT:=31 
         else if (DataST[2] = '4') then BufNOT:=43 End;
         
    'A': if      (DataST[2] = 'i') then Begin                                   //���� ���� ��.                                                                   
         if      (DataST[4] = '1') then BufNOT:=10                             
         else if (DataST[4] = '2') then BufNOT:=22                            
         else if (DataST[4] = '3') then BufNOT:=34 
         else if (DataST[4] = '4') then BufNOT:=46 End
         else Begin
         if      (DataST[2] = '1') then BufNOT:=9                             
         else if (DataST[2] = '2') then BufNOT:=21                             
         else if (DataST[2] = '3') then BufNOT:=33
         else if (DataST[2] = '4') then BufNOT:=45 End;
         
    'B': if      (DataST[2] = '1') then BufNOT:=11                              //��.              
         else if (DataST[2] = '2') then BufNOT:=23                    
         else if (DataST[2] = '3') then BufNOT:=35
         else if (DataST[2] = '4') then BufNOT:=47;
    'P': BufNOT:=48;                                                            //� ������ "�����".
    End;
    
    MESNOT[Loop][0]:=BufNOT;                                                    //��������� ����� ����. 
    
    if (DataST[length(DataST)-1] = '.') then                                    //���� ������������ � ������. 
    Begin                    
    if (DataST[length(DataST)-3] = '/') then                                    //���� ������������ �� ������ ����� (1/1, 1/2, 1/4, 1/8).
    case DataST[length(DataST)-2] of
      '1': BufNOT:=64+32;
      '2': BufNOT:=32+16;
      '4': BufNOT:=16+8;
      '8': BufNOT:=8+4; end                                                     //64 � ������ ���������!
    else if (DataST[length(DataST)-3] = '3') and (DataST[length(DataST)-2] = '2') then BufNOT:=2+1 //���� 32-�.
    else if (DataST[length(DataST)-3] = '1') and (DataST[length(DataST)-2] = '6') then BufNOT:=4+2; //���� 16-�.
    End
    else Begin                                                                  //���� ������������ ��� �����.
    if (DataST[length(DataST)-2] = '/') then                                    //���� ������������ �� ������ ����� (1/1, 1/2, 1/4, 1/8).
    case DataST[length(DataST)-1] of
      '1': BufNOT:=64;
      '2': BufNOT:=32;
      '4': BufNOT:=16;
      '8': BufNOT:=8; end              
    else if (DataST[length(DataST)-2] = '6') and (DataST[length(DataST)-1] = '4') then BufNOT:=1 //���� 64-�.
    else if (DataST[length(DataST)-2] = '3') and (DataST[length(DataST)-1] = '2') then BufNOT:=2 //���� 32-�.
    else if (DataST[length(DataST)-2] = '1') and (DataST[length(DataST)-1] = '6') then BufNOT:=4; //���� 16-�.
    End;
    
    MESNOT[Loop][1]:=BufNOT;                                                    //��������� ������������. 
    
    Loop:=Loop+1;
    End;
    
    writeln ('//������ ���.');                                                  //���������� ������.
    write('uint8_t MusicNote [', Loop, '][2] = {');
    for I:=0 to Loop-1 do Begin write(MESNOT[I][0], ',', MESNOT[I][1]);
                              if (I<>(Loop-1)) then write(', ');
                        End;
    write('};');
    
End.