%{
    /* Programa en lex presenta en base
    hexadecimal los numeros de 
    entrada en base 10 */
    #include <stdio.h>
    #include <stdlib.h>  
    int count = 0;
%}
dig    [0-9]
/* se usan los {} para generar dig y no solo g -> */
numero {dig}+
%%
{numero} {
    /* yytext apunta a la cadena que pertenece a
    la expresion regular numero yytext es un APUNTADOR */
    int n = atoi(yytext);
    printf("%x", n);
    /* $ 10 23 47 B4 
    no considera a B*/
    if(n>9) count++; }

    /* el . indica cualquier caracter que no
    este en el lenguaje */
.   {printf("\n%s no es un numero", yytext);}
%%
int main()
{
    /* todas la variables que va definir lex 
    a la hora de compilar van a empezar con yy */

    /* yylex() contiene todo el AFD, reconoce cada uno de los lenguajes 
    definidos en las expresiones regulares, contiene la TABLA DE ESTADOS */
    yylex();
    printf("numero de conversiones %d\n", count);
    return 0;
}