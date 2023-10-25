;**********************************************************
;                   fibo.ASM
;
; Este programa calcula el enésimo número de Fibonacci
; El enésimo número de Fibonacci está dado por:
; Fib(n) = n sí n = 0, 1
; Fib(n) = Fib(n-1) + Fib(n-2) sí n >= 2
;
;
;  Ejemplo, si la variable n es igual a 7
;  el resultado sera 13 
;  |0|1|2|3|4|5|6|7| 
;  |0|1|1|2|3|5|8|13| 
;
;**********************************************************
;****** CÓDIGO DE INICIO **********************************
 ideal
 dosseg
 model small
 stack 256
;****** VARIABLES DEL PROGRAMA ****************************
 dataseg
codsal db 0
n db ?          ;variable donde se almacena el numero del que se quiere obtener el fibonacci
fibn dw ?       ;variable donde se almacena el fibonacci
aux  dw 1h
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
 mov ax, @data      ; Inicializa el segmento de
 mov ds, ax         ; datos
 
 mov ax,0          ; Inicializa AX en 0
 mov cl,[n]        ; Carga el valor de n en CL
 
 jcxz fibonacci    ; Salta a 'fibonacci' si n es igual a 0

 add ax,1          ; Suma 1 a AX
 ciclo:
 dec cx            ; Decrementa el valor de CX         
 jcxz fibonacci    ; Salta a 'fibonacci' si CX es igual a 0
 add ax,[aux]      ; Suma el valor de aux a AX   
 xchg ax,[aux]     ; Intercambia el valor de AX y aux (aux = AX, AX = aux)  
 jmp ciclo

 fibonacci:
 mov[fibn],ax      ; Almacena el resultado en fibn

salir:
 mov ah, 04Ch
 mov al, [codsal]
 int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
 end inicio