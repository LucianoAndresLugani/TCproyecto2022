grammar compiladores;

@header {
package compiladores;
}

PA : '(';
PC : ')';
fragment LETRA : [A-Za-z] ;//NO DEJAR ESPACIOS
fragment DIGITO : [0-9] ;

//DIGITO = 
//SIGNOS : [-+*/]; //CONJUNTO POR EXTENCION 
NUMERO : DIGITO+ ;
WS : [ \n\r\t] -> skip;


//SEQ : '3' [] | [] ; 
OTRO : . ;

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;//variable de progtama



// arranque simbolo inicial esto va primero

si : s EOF;

s : PA s PC s 
  |
  ;


// s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
//   | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
//   | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
//   | EOF
//   ;
