;***************************************************** 
;
;                   centfar.ASM
;   Este programa nos permite convertir una temperatura en grados centigrados
;   a farenheit
;   
;   Teniendo un rango de -200 a +200 grados centigrados
;   
;   
;
;***************************************************** 
model small
stack 256
;****** VARIABLES DEL PROGRAMA ****************************
dataseg
codsal db 0
centi dw ?   ; Variable en la que ingresamos la temperatura en grados Celsius
fahr dw ?    ; Variable en la que guardamos el valor en grados Fahrenheit
A dw 00c8h   ; A = 200
B dw 0ff38h  ; B = -200
C dw 5
D dw 9
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
mov ax, @data ; Inicializa el segmento de datos
mov ds, ax

; Comparamos si el valor dado en la variable centi esta entre 
; -200 y 2000 

mov ax, [centi] ; Cargamos la temperatura en grados Celsius
cmp [A], ax     
jl fuerarango    

cmp [B], ax      
jg fuerarango    

; Si el valor cumple con lo anterior ejecutamos la formula para convertir

mov bx, 32      ; 32 forma parte de la fórmula
imul [D]        ; Multiplicarlo * 5
idiv [C]         ;Dividimos dentro de 9
add ax, 32      ; (°C * 9/5) + 32

jmp fahrenheit

fuerarango:
mov [fahr], 0
jmp salir

fahrenheit:
mov [fahr], ax

salir:
mov ah, 04Ch
mov al, [codsal]
int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
end inicio