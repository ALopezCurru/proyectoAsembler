;***************************************************** 
;
;                   bisiesto.ASM
;   Este programa indica si un año es bisiesto (1) o no (0)
;   dada la variable anio que nosotros podemos definir al ejecutar el programa
;   
;   Un año bisiesto es aquel año que es divisible entre 4 
;   pero no es divisible entre 100, a menos que sea divisible entre 400, en cuyo
;   caso si es bisiesto
;
;***************************************************** 
.model small
.data
;*********************** VARIABLES DEL PROGRAMA
anio dw ?       ; Ingresamos  el año que queremos verificar 
resul db 0      ; Variable que nos servira para almacenar la respuesta (1 o 0)
cuatro dw 4
cien dw 100
cuatrocientos dw 400
;****** CÓDIGO DEL PROGRAMA *******************************
.code
inicio:
    mov ax, @data ; Inicializa el segmento de datos
    mov ds, ax

    mov ax, [anio]   ; Carga el año en el registro AX
    xor dx, dx       ; Establece DX en 0 (limpia DX)

    ; Verificar si el año es divisible por 4
    
    div word ptr [cuatro]       ; Divide AX por 4
    cmp dx, 0                   ;Compara el residuo (en DX) con 0
    jnz no_bisiesto             ;Salta a 'no_bisiesto' si el residuo no es cero

    ; Verificar si el año es divisible por 100

    mov ax, [anio]              ; Carga el año nuevamente en AX
    xor dx, dx                  ; Limpia DX
    div word ptr [cien]         ; Divide AX por 100
    cmp dx, 0                   ; Compara el residuo (en DX) con 0
    jnz bisiesto                ; Salta a 'bisiesto' si el residuo no es cero

    ; Verificar si el año es divisible por 400
    
    mov ax, [anio]                  ; Carga el año nuevamente en AX
    xor dx, dx                      ; Limpia DX nuevamente
    div word ptr [cuatrocientos]    ; Divide AX por 400
    cmp dx, 0                       ; Compara el residuo (en DX) con 0
    jnz no_bisiesto                 ; Salta a 'no_bisiesto' si el residuo no es cero

bisiesto:
    mov byte ptr [resul], 1   ; Es bisiesto
    jmp Salir

no_bisiesto:
    mov byte ptr [resul], 0   ; No es bisiesto

Salir:
    mov ah, 4Ch
    int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
end inicio