grammar Lang;
options {
	language=ActionScript;
	output=AST;
	ASTLabelType=CommonTree;
}

tokens {DECL;} // an imaginary node

start : decl ;

decl : type ID ';' -> ^(DECL type ID)
     ;
type : INTTYPE  // automatic tree construction builds a node for this rule
     | FLOATTYPE
     ;

INTTYPE : 'int' ;
FLOATTYPE : 'float' ;
ID : 'a'..'z'+ ;
INT : '0'..'9'+ ;
WS : (' '|'\n'|'\r') {$channel=HIDDEN;} ;
