parser grammar Lapsang;


class_declaration
    : attribute_list* class_modifiers CLASS type_identifier type_parameter_list? parameter_list? base_list? type_parameter_constraint_clause* '{'? member_declaration* '}'? ';'?
    ;

class_modifiers
    : class_visibility_override? class_partiality_override? class_concreteness_override?
    ;

class_visibility_override
    : FILE
    | PUBLIC
    ;

class_partiality_override
    : PARTIAL
    ;

class_concreteness_override
    : ABSTRACT
    | CONST
    | UNSEALED
    ;

type_identifier
    : Capitalised_Identifier
    | Escaped_Identifier
    ;

general_identifier
    : Basic_Identifier
    | Underscored_Identifier
    ;

fragment Escaped_Identifier
    : '@' Basic_Identifier
    ;

fragment Capitalised_Identifier
    : Capitalised_Identifier_Start_Character Identifier_Part_Character*
    ;

fragment Basic_Identifier
    : Identifier_Start_Character Identifier_Part_Character*
    ;

fragment Underscored_Identifier
    : Underscore_Character Identifier_Part_Character+
    ;

fragment Identifier_Start_Character
    : Letter_Character
    ;

fragment Capitalised_Identifier_Start_Character
    : Capilalised_Letter_Character
    ;

fragment Underscore_Character: '_';

fragment Identifier_Part_Character
    : Letter_Character
    | Decimal_Digit_Character
    | Connecting_Character
    | Combining_Character
    | Formatting_Character
    ;

fragment Letter_Character: [\p{Letter}\p{Letter_Number}];
fragment Capilalised_Letter_Character: [\p{Uppercase_Letter}\p{Titlecase_Letter}];
fragment Combining_Character: [\p{Non_Spacing_Mark}\p{Spacing_Combining_Mark}];
fragment Decimal_Digit_Character: [\p{Decimal_Digit_Number}];
fragment Connecting_Character: [\p{Connector_Punctuation}];
fragment Formatting_Character: [\p{Format}];

ABSTRACT: 'abstract';
CLASS: 'class';
CONST: 'const';
FILE: 'file';
PARTIAL: 'partial';
PUBLIC: 'public';
UNSEALED: 'unsealed';



type_declaration
  : class_declaration
  // | interface_declaration
  // | record_declaration
  // | struct_declaration
  ;


identifier_token
  : /* see lexical specification */
  ;

expression
   : block_expression
   | non_block_expression
   ;

block_expression
   : '{' terminated_statement+ expression? '}'
   ;

non_block_expression
   : PLACE_HOLDER
  // : anonymous_function_expression
  // | anonymous_object_creation_expression
  // | array_creation_expression
  // | await_expression
  // | base_object_creation_expression
  // | binary_expression
  // | cast_expression
  // | checked_expression
  // | collection_expression
  // | conditional_access_expression
  // | conditional_expression
  // | declaration_expression
  // | default_expression
  // | element_access_expression
  // | element_binding_expression
  // | implicit_array_creation_expression
  // | implicit_element_access
  // | implicit_stack_alloc_array_creation_expression
  // | initializer_expression
  // | instance_expression
  // | interpolated_string_expression
  // | invocation_expression
  // | is_pattern_expression
  // | literal_expression
  // | make_ref_expression
  // | member_access_expression
  // | member_binding_expression
  // | omitted_array_size_expression
  // | parenthesized_expression
  // | postfix_unary_expression
  // | prefix_unary_expression
  // | query_expression
  // | range_expression
  // | ref_expression
  // | ref_type_expression
  // | ref_value_expression
  // | size_of_expression
  // | stack_alloc_array_creation_expression
  // | switch_expression
  // | throw_expression
  // | tuple_expression
  // | type
  // | type_of_expression
  // | with_expression
   ;

terminated_statement
   : statement ';'
   ;

statement
   : mutable_assignment
   | declaration
//   | mutable_assignment
   | discarded_assignment
   ;

mutable_assignment
  : assignment_lhs assignment_operator expression
  ;

assignment_lhs
  : PLACE_HOLDER
  ;

assignment_operator
	: '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '&=' | '|=' | '^=' | '<<=' | '>>='| '>>>=' | '??='
	;

discarded_assignment
   : DISCARD '=' expression
   ;

return_statement
   : RETURN expression?
   ;

declaration
   : MUT type_identifier variable_declaration ('=' expression)?
   | (VAL | type_identifier) variable_declaration '=' expression
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

PLACE_HOLDER
    : '0'
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