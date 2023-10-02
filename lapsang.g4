parser grammar Lapsang;

expression
   : block_expression
   | non_block_expression
   ;

block_expression
   : '{' terminated_statement+ value_expression? '}'
   ;

non_block_expression
   : value_expression
   | void_expression
   ;

terminated_statement
   : statement ';'
   ;

statement
   : void_expression
   | declaration
   | mutable_assignment
   | discarded_assignment
   ;


mutable_assignment
	: _unary_expression_ assignment_operator value_expression
	| _unary_expression_ '??=' throwable_expression
	;

assignment_operator
	: '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '&=' | '|=' | '^=' | '<<=' | '>>='
	;

return_statement
   : RETURN value_expression?
   ;

declaration
   : val_or_mut type_identifier variable ('=' value_expression)?
   ;

discarded_assignment
   : DISCARD '=' value_expression
   ;

is_pattern_expression
  : _expression_ 'is' pattern
  ;


switch_value_expression
  : _expression_ 'switch' '{' switch_value_expression_arm (',' switch_value_expression_arm)* '}'
  ;

switch_void_expression
  : 'switch' '{' switch_void_expression_arm (',' switch_void_expression_arm)* '}'
  ;

switch_value_expression_arm
  : pattern when_clause? '=>' value_expression
  ;

switch_void_expression_arm
  : pattern when_clause? '=>' void_expression
  ;


pattern
  : binary_pattern
  | constant_pattern
  | declaration_pattern
  | discard_pattern
  | list_pattern
  | parenthesized_pattern
  | recursive_pattern
  | relational_pattern
  | slice_pattern
  | type_pattern
  | unary_pattern
  | var_pattern
  ;

binary_pattern
  : pattern ('or' | 'and') pattern
  ;

constant_pattern
  : constant_expression
  ;

declaration_pattern
  : type variable_designation
  ;

variable_designation
  : discard_designation
  | parenthesized_variable_designation
  | single_variable_designation
  ;

discard_designation
  : DISCARD
  ;

parenthesized_variable_designation
  : '(' (variable_designation (',' variable_designation)*)? ')'
  ;

single_variable_designation
  : identifier_token
  ;

discard_pattern
  : '_'
  ;

list_pattern
  : '[' (pattern (',' pattern)* ','?)? ']' variable_designation?
  ;

parenthesized_pattern
  : '(' pattern ')'
  ;

recursive_pattern
  : type? positional_pattern_clause? property_pattern_clause? variable_designation?
  ;

positional_pattern_clause
  : '(' (subpattern (',' subpattern)*)? ')'
  ;

subpattern
  : base_expression_colon? pattern
  ;

base_expression_colon
  : expression_colon
  | name_colon
  ;

expression_colon
  : expression ':'
  ;

property_pattern_clause
  : '{' (subpattern (',' subpattern)* ','?)? '}'
  ;

relational_pattern
  : '!=' expression
  | '<' expression
  | '<=' expression
  | '==' expression
  | '>' expression
  | '>=' expression
  ;

slice_pattern
  : '..' pattern?
  ;

type_pattern
  : type
  ;

unary_pattern
  : 'not' pattern
  ;

var_pattern
  : 'var' variable_designation
  ;

when_clause
  : 'when' expression
  ;

val_or_mut
   : VAL
   | MUT
   ;

boolean_literal
    : TRUE
    | FALSE
    ;

integer_Literal
    : decimal_integer_literal
    | hexadecimal_integer_literal
    | binary_integer_literal
    ;

decimal_integer_literal
    : decimal_digit decorated_decimal_digit*
    ;

decorated_decimal_digit
    : '_'? decimal_digit
    ;

decimal_digit
    : '0' .. '9'
    ;

hexadecimal_integer_literal
    : '0X' hexadecimal_digit decorated_hexadecimal_digit*
    ;

decorated_hexadecimal_digit
    : '_'? hexadecimal_digit
    ;

hexadecimal_digit
    : '0' .. '9'
    | 'A' .. 'F'
    ;

binary_integer_literal
    : '0B' binary_digit decorated_binary_digit*
    ;

decorated_binary_digit
    : '_'? binary_digit
    ;

binary_digit
    : '0' | '1'
    ;
    
DISCARD
   : '_'
   ;

FALSE
    : 'false'
    ;

MUT
   : 'mut'
   ;

RETURN
   : 'return'
   ;

TRUE
    : 'true'
    ;

VAL
   : 'val'
   ;