grammar compiladores;

@header {
package compiladores;
}

PA : '(';
PC : ')';
CA : '[';
CC : ']';
LA : '{';
LC : '}';
MAS : '+';
MENOS : '-';
MULT : '*';
DIV : '/';
MOD : '%';
PYC : ';';
COMA: ',';




INT: ('+' | '-')? [0-9]+;

FLOAT: INT | INT '.' [0-9]+ | INT ('.' [0-9]+)? 'e' INT;

IGUAL: '=';
COMP_IGUAL: '==';
MENOR_QUE: '<';
MENOR_0_IGUAL: '<=';
MAYOR_0_IGUAL: '>=';
MAYOR_QUE: '>';

DATO_TIPO_CHAR: 'char';
DATO_TIPO_SHORT: 'short';
DATO_TIPO_INT: 'int';
DATO_TIPO_LONG: 'long';
DATO_TIPO_FLOAT: 'float';
DATO_TIPO_DOUBLE: 'double';
DATO_TIPO_VOID: 'void';

CS_IF: 'if';
CS_FOR: 'for';
CS_WHILE: 'while';


AND: '&&';
OR: '||';
NOT: '!';



ID : [a-zA-Z_][a-zA-Z0-9_]*;


  s : intrucciones ;
  


  intrucciones: declaracion intrucciones
  | bloque intrucciones
  | funcion intrucciones
  | asignacion PYC
  | estructura_de_if intrucciones
  | estructura_de_while intrucciones
  | estructura_de_for intrucciones
  |
  ;

asignacion: ID IGUAL exp;

bloque: LA intrucciones LC ;

tipo_de_dato: DATO_TIPO_DOUBLE | DATO_TIPO_FLOAT | DATO_TIPO_INT | DATO_TIPO_VOID;

operador_aritmetico: MAS | MENOS | DIV | MULT | MOD;

operador_logico: IGUAL | MENOR_QUE | MENOR_0_IGUAL | MAYOR_0_IGUAL | MAYOR_QUE | AND | OR ;

exp: operador_aritmetico
  | token_exp
  ;

token_exp: ID | INT | FLOAT;

exp_logica: token_exp
  | NOT token_exp
  ;

aritmetica_operacion: token_exp operador_aritmetico aritmetica_operacion
  | token_exp
  ;

logica_operacion: exp_logica operador_logico logica_operacion
  | exp_logica
  ;

declaracion_de_variable: asignacion 
  | ID
  ;


lista_de_variable: declaracion_de_variable COMA lista_de_variable
  | declaracion_de_variable
  ;

declaracion: tipo_de_dato lista_de_variable PYC;




lista_de_parametros: tipo_de_dato ID COMA lista_de_parametros
  | tipo_de_dato ID
  |
  ;

lista_de_parametro_para_declarar_una_funcion: tipo_de_dato COMA lista_de_parametro_para_declarar_una_funcion
  | tipo_de_dato ID COMA lista_de_parametro_para_declarar_una_funcion
  | tipo_de_dato ID
  | tipo_de_dato
  |
  ;

declaracion_de_funcion: definicion_de_funcion
  | tipo_de_dato ID PA lista_de_parametro_para_declarar_una_funcion PC
  ;

definicion_de_funcion: tipo_de_dato ID PA lista_de_parametros PC;

funcion: declaracion_de_funcion PYC
  | definicion_de_funcion bloque
  ;

estructura_de_if: CS_IF PA logica_operacion PC bloque ;

estructura_de_while: CS_WHILE PA logica_operacion PC bloque ;

for_ini: tipo_de_dato asignacion
  | asignacion
  | token_exp
  | 
  ;

for_exp: ID MAS MAS 
  | 
  ;  


estructura_de_for: CS_FOR PA for_ini PYC logica_operacion PYC for_exp PC bloque;
  

COMMENT : '//'.*?'\n' -> skip;
WS : [ \n\t] -> skip;