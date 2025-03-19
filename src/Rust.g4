grammar Rust;

// Keywords
LET: 'let';
FN: 'fn';
IF: 'if';
ELSE: 'else';
RETURN: 'return';
WHILE: 'while';
LOOP: 'loop';

// Operators and Symbols
ASSIGN: '=';
SEMI: ';';
COLON: ':';
COMMA: ',';
LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
PLUS: '+';
MINUS: '-';
STAR: '*';
SLASH: '/';
EQ: '==';
NEQ: '!=';
LT: '<';
GT: '>';
LEQ: '<=';
GEQ: '>=';

// Identifiers and Literals
IDENT: [a-zA-Z_][a-zA-Z0-9_]*;
NUMBER: [0-9]+;
WHITESPACE: [ \t\r\n]+ -> skip; // Ignore whitespace

program: statement* EOF;

statement:
      variableDeclaration
    | functionDeclaration
    | expressionStatement
    | ifStatement
    | whileLoop
    | loopStatement
    | returnStatement
    ;

variableDeclaration: LET IDENT ASSIGN expression SEMI;

functionDeclaration: FN IDENT LPAREN RPAREN LBRACE statement* RBRACE;

expressionStatement: expression SEMI;

expression:
      NUMBER 
    | IDENT 
    | expression (PLUS | MINUS | STAR | SLASH) expression 
    | LPAREN expression RPAREN
    ;

ifStatement: IF LPAREN expression RPAREN LBRACE statement* RBRACE (ELSE LBRACE statement* RBRACE)?;

whileLoop: WHILE LPAREN expression RPAREN LBRACE statement* RBRACE;

loopStatement: LOOP LBRACE statement* RBRACE;

returnStatement: RETURN expression? SEMI;
