Include Irvine32.inc
.data
msg1 byte   "                 Enter User Name:",0 
msg2 byte   "                        Enter Four digit Password:",0
user byte   20 dup(?)
checku byte "FAB",0
congratulation byte "                          You Have Login Successfull , Press Enter To Continue",0

    welcome BYTE '           WELCOME TO FAST UNIVERSITY HOTEL MANAGEMENT',0dh,0ah,0

  stringmenu BYTE ' Please Select From Following Options:',0dh,0ah
             BYTE ' Enter 1 - Dhaaba ',0dh,0ah
             BYTE ' Enter 2 - Shawarma Corner ',0dh,0ah
             BYTE ' Enter 3 - Fast Cafe ',0dh,0ah
             BYTE ' Enter 4 - Biryani Corner ',0dh,0ah
             BYTE ' Enter 5 - Drinks ',0dh,0ah
             BYTE ' Enter 6 - Exit ',0dh,0ah,0

    string1  BYTE '  Enter 1 - Shami Burger              = Rs 100 per plate',0dh,0ah
             BYTE '  Enter 2 - Egg Burger               = Rs 90 per plate',0dh,0ah
             BYTE '  Enter 3 - Tikka                = Rs 70 per plate',0dh,0ah
             BYTE '  Enter 4 - Malai Boti Roll      = Rs 85 per plate',0dh,0ah
             BYTE '  Enter 5 - Exit ',0dh,0ah,0
    price1 DWORD 100,90,70,85

	  stringroti BYTE ' Enter 1 - Naan   = Rs 10',0dh,0ah
             BYTE ' Enter 2 - Roti   = Rs 05',0dh,0ah
             BYTE ' Enter 3 - Exit ',0dh,0ah,0
    priceroti DWORD 10,05

    string2  BYTE '   Enter 1 - Chicken Shawarma          = Rs 100 per shawarma ',0dh,0ah
             BYTE '   Enter 2 - Chicken Cheese Shawarma             = Rs 130 per shawarma ',0dh,0ah
             BYTE '   Enter 3 - Chicken Macroni Shawarma          = Rs 110 per shawarma ',0dh,0ah
             BYTE '   Enter 4 - Zinger Shawarma         = Rs 150 per shawarma ',0dh,0ah
             BYTE '   Enter 5 - Exit ',0dh,0ah,0
   price2 DWORD 150,165,95,80

    string3  BYTE '   Enter 1 - Zinger Burger    = Rs 250 ',0dh,0ah
             BYTE '   Enter 2 - Chicken Pizza    = Rs 350',0dh,0ah
             BYTE '   Enter 3 - Chicken Sandwich            = Rs 80',0dh,0ah
             BYTE '   Enter 4 - Lays Chips = Rs 30',0dh,0ah
             BYTE '   Enter 5 - Exit ',0dh,0ah,0
    price3 DWORD 100,150,50,95

    string5  BYTE '   Enter 1 - Sprite        = Rs 90 (1.5 litre)',0dh,0ah
             BYTE '   Enter 2 - Coca Cola     = Rs 90 (1.5 litre)',0dh,0ah
             BYTE '   Enter 3 - Sting          = Rs 65',0dh,0ah
             BYTE '   Enter 4 - Juice          = Rs 70',0dh,0ah
             BYTE '   Enter 5 - Exit ',0dh,0ah,0
    price4 DWORD 90,90,65,70

    string4  BYTE '   Enter 1 - Chicken Biryani     = Rs 150',0dh,0ah
             BYTE '   Enter 2 - Chicken Pulao            = Rs 150',0dh,0ah
             BYTE '   Enter 3 - Aloo Biryani            = Rs 110',0dh,0ah
             BYTE '   Enter 4 - Raita          = Rs 30',0dh,0ah
             BYTE '   Enter 5 - Exit ',0dh,0ah,0
    price5 DWORD 155,145,75,60

    Quantity BYTE '    Quantity:     ',0

	stringchoice  BYTE ' Enter 1- To continue',0dh,0ah
             BYTE ' Enter 2 - Exit ',0dh,0ah,0

    billing BYTE  '       Total Bill:   Rs ',0    
	bill DWORD 0

.code
main proc

;;;;;;;;;;;;; setting color ;;;;;;;;;;;;
mov eax,black+4*16
call settextcolor
call clrscr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



above:
;;;;;;;;;; asking for user adn passsword ;;;;;;;;;;;;;
call clrscr
mov dh,4
mov dl,7
call gotoxy

mov edx,offset msg1
call writestring

mov edx,offset user
mov ecx,lengthof user
call readstring

;;;;;;;;;;;; verifing login id ;;;;;;;;;;;;;;;;;;;;;;
mov edi,offset checku
mov esi,offset user
mov ecx,lengthof checku
repe cmpsb
je start0

jmp above

;;;;;;;;;;;; verifing password ;;;;;;;;;;;;;;;;;;;;;;;
start0:
mov edx,offset msg2
call writestring

call readdec
cmp eax,1234
je start1
jmp endd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start1:
mov edx,offset congratulation
call writestring 
call readchar
mov eax,yellow+3*16
call settextcolor
call clrscr


     call Crlf
	mov edx,OFFSET welcome
     call WriteString
     L1:          
	 call clrscr               
       mov edx,OFFSET  stringmenu
       call WriteString
	  
       call ReadDec

	   call clrscr

       cmp eax,1      ; main menu item list
       je L2
       cmp eax,2
       je L3
       cmp eax,3
       je L4
       cmp eax,4
       je L5
       cmp eax,5
       je L6
       jmp last

     L2: call  Eastern       ; calling procedures depends on what user enters from the main menu list
         jmp L7
     L3: call Chinese
         jmp L7
     L4: call FastFood
         jmp L7
     L5: call Drinks
         jmp L7
     L6: call Dessert
     L7: mov edx,OFFSET stringchoice 
         call WriteString
        
         call ReadDec
         
         cmp eax,1           ; if user want to continue then jump to L1
         je L1
     last:                    
         call Crlf
         call Crlf
         mov edx,OFFSET billing
         call WriteString
         mov eax,bill        
         call WriteDec       ; prints the bill
         call Crlf   ; next line
         call Crlf
         call WaitMsg
		 endd:
	exit
main endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; understood till here
;1-------------------------------------------------------------
 Eastern PROC
         mov edx,OFFSET string1
         call WriteString
       
         call ReadDec
         call Crlf
       
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price1]      ; price1 is array contains price of eastern foods

     L11:                   ; no of quantity times a loop L11 runs           
        add bill,ebx            ; add price into bill
        loop L11
     jmp last

 L2: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price1 + 4]
     L22:
         add bill,ebx
         loop L22
     call NaanRoti
     jmp last

 L3: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price1 + 8]

     L33:
         add bill,ebx
         loop L33

     call NaanRoti
     jmp last
	
 L4: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price1 + 12]
     L44:
         add bill,ebx
         loop L44
     call NaanRoti
last:
ret
 Eastern ENDP

;--------------------------------------------
NaanRoti PROC
 
        mov edx,OFFSET  stringroti
        call WriteString
        call ReadDec
    
        cmp eax,1
        je L1
        cmp eax,2
        je L2
        jmp last
     L1:
        mov ebx,[priceroti]    ; buuffer3 is array contains price of Naan and roti
        mov edx,OFFSET Quantity
        call WriteString
        call ReadDec
        call Crlf
        mov ecx,eax
        L11:
          add bill,ebx
          loop L11
       jmp last
     L2:
        mov ebx,[priceroti + 4]
        mov edx,OFFSET Quantity
        call WriteString
        call ReadDec
        call Crlf
        mov ecx,eax
        L22:
          add bill,ebx
          loop L22
last:
ret
NaanRoti ENDP

;2------------------------------------------------------------
Chinese PROC
         mov edx,OFFSET string2
         call WriteString
         call ReadDec
         call Crlf
       
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last

 ; price of 1st,2nd,.. item of Chinese menu is on 1st,2nd.. index of buffer5 respectively
 ; same for all other menus

 L1: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     mov ecx,eax
     mov ebx,[price2]   
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     mov ecx,eax
     mov ebx,[price2 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price2 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price2 + 12]
     L44:
         add bill,ebx
         loop L44
last:

ret
Chinese ENDP

;3--------------------------------------------------------
FastFood PROC
         mov edx,OFFSET string3
         call WriteString
         call ReadDec
         call Crlf
        
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price3]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price3 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price3 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price3 + 12]
     L44:
         add bill,ebx
         loop L44
last:
ret
FastFood ENDP
    
;4---------------------------------------------------------
Drinks PROC
         mov edx,OFFSET string4
         call WriteString
         call ReadDec
         call Crlf
         
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price4]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price4 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price4 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price4 + 12]
     L44:
         add bill,ebx
         loop L44
last:
ret
Drinks ENDP

;5---------------------------------------------------------
Dessert PROC
         mov edx,OFFSET string5
         call WriteString
         call ReadDec
         call Crlf
        
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price5]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price5 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     mov ecx,eax
     call Crlf
     mov ebx,[price5+ 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call WriteString
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[price5 + 12]
     L44:
         add bill,ebx
         loop L44
last:


ret
Dessert ENDP
end main