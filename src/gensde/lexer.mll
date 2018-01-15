(**********************************************************)
(* National Center for Supercomputing Applications and    *)
(* Beckman Institute for Advanced Science and Technology  *)
(* University of Illinois at Urbana-Champaign             *)
(*                                                        *)
(* Generalized Stochastic Differential Equations Solver   *)
(* GSDES                                                  *)
(* Santiago Nunez-Corrales <nunezco2@illinois.edu         *)
(* Eric Jakobsson <jake@illinois.edu                      *)
(**********************************************************)
{
  open Parser
  open Lexing
  open Complexnums

  exception LexingError of string

  (* Increment to line number *)
  let incr_lineno lexbuf =
    let curr_pos = lexbuf.lex_curr_p in
    lexbif.lex_curr_p <- {
      curr_pos with
        pos_lnum = curr_pos.pos_lnum + 1;
        pos_bol = cur_pos.pos_cnum;
    }
  ;;
}

let digit = ['0'-'9']
let parid = ['a'-'z'] ['a'-'z' '_']* ('[' digit+ ']')?
let dofid = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '_']* ('[' digit+ ']')?
let fpeid = ['a'-'a'] ['a'-'z' '0'-'9' '_']*
let ws = [' ' '\r' '\t']
let counter = digit+
let realvalue = '-'? digit+ '.'? digit*
let complexvalue = '-'? digit+ '.'? digit* ('+'|'-') digit+ '.'? digit* 'i'
let version = digit+ '.' digit+
let year = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']
let month = ['A'-'Z']['A'-'Z']['A'-'Z']
let day = ['0'-'9']['0'-'9']
let date = year '-' month '-' day

rule token =
  parse
  | ws                  { token lexbuf }
  | '\n'                { incr_lineno lexbuf; token lexbuf }
  | '#'                 { comment lexbuf }
(* Empty input *)
  | '('                 { LPAREN }
  | ')'                 { RPAREN }
  | '['                 { LSBRACK }
  | ']'                 { RSBRACK }
  | '{'                 { LBRACE }
  | '}'                 { RBRACE }
  | ';'                 { SEMI }
  | ','                 { COMMA }
(* Logical values *)
  | "true"              { VALTRUE }
  | "false"             { VALFALSE }
(* Model *)
  | "model"             { MODEL }
(* Annotations *)
  | "annotations"       { ANNOTS }
  | "name"              { ANNAME }
  | "authors"           { ANAUTHS }
  | "affilitations"     { ANAFFILS }
  | "description"       { ANDESC }
  | "version"           { ANVERSION }
  | "date"              { ANDDATE }
(* Execution *)
  | "execution"         { EXECS }
  | "distributed"       { EXDISTR }
  | "processes"         { EXPROCS }
  | "startat"           { EXSTART }
  | "noisy"             { EXNOISY }
  | "ensemble"          { EXENSMBL }
(* Types *)
  | "det"               { TDET }
  | "sto"               { TSTO }
  | "given"             { TGIVEN }
  | "real"              { TREAL }
  | "complex"           { TCOMPLEX }
(* Qualifiers *)
  | "label"             { QLABEL }
  | "distribution"      { QDIST }
  | "source"            { QSOURCE }
  | "value"             { QVAL }
  | "arguments"         { QARGS }
  | "range"             { QRANGE }
  | "delta"             { QDELTA }
(* Source types *)
  | "netcdf"            { SRCNETCDF }
  | "hdf5"              { SRCHDF5 }
(* Distributions *)
  | "uniform"           { DUNIF }
  | "normal"            { DNORM }
  | "exponential"       { DEXP }
  | "beta"              { DBETA }
  | "gamma"             { DGAMMA }
  | "fpe"               { DFPE }
(* Parameters *)
  | "parameters"        { PARAMS }
(* Manifold *)
  | "mainfold"          { MANIF }
(* System *)
  | "system"            { SYSTEM }
  | "level"             { SYSLEVEL }
  | "initial"           { SYSINIT }
(* Differential equations *)
  | "diff"              { DIFFEQ }
  | "on"                { DEON }
  | "by"                { DEBY }
  | '='                 { EQ }
(* Fokker-Planck equations *)
  | "pdf"               { FPEPDF }
  | "drift"             { FPEDRIFT }
  | "diffusion"         { FPEDIFF }
  | "fixed"             { FPEFIXED }
  | "algebraic"         { FPEALGEB }
(* Algebraic operators *)
  | '+'                 { OPPLUS }
  | '-'                 { OPMINUS }
  | '*'                 { OPTIMES }
  | '/'                 { OPDIVIDE }
  | '%'                 { OPMOD }
  | '^'                 { OPPOWER }
(* Trigonometric operators *)
  | "sin"               { OPSIN }
  | "cos"               { OPCOS }
  | "tan"               { OPTAN }
  | "csc"               { OPCSC }
  | "sec"               { OPSEC }
  | "cot"               { OPCOT }
  | "arcsin"            { OPARCSIN }
  | "arccos"            { OPARCCOS }
  | "arctan"            { OPARCTAN }
  | "arccsc"            { OPARCCSC }
  | "arcsec"            { OPARCSEC }
  | "arccot"            { OPARCCOT }
  | "sinh"              { OPSINH }
  | "cosh"              { OPCOSH }
  | "tanh"              { OPTANH }
  | "csch"              { OPCSCH }
  | "sech"              { OPSECH }
  | "coth"              { OPCOTH }
  | "arcsinh"           { OPARCSINH }
  | "arccosh"           { OPARCCOSH }
  | "arctanh"           { OPARCTANH }
  | "arccsch"           { OPARCCSCH }
  | "arcsech"           { OPARCSECH }
  | "arccoth"           { OPARCCOTH }
(* Exponentials and logarithms *)
  | "log"               { OPLOG }
  | "exp"               { OPLOG }
(* Output *)
  | "output"              { OUTPUT }
  | "file"                { OUTFILE }
  | "trajectory"          { OUTTRAJ }
  | "phase"               { OUTPHASE }
  | "interaction"         { OUTINTER }
  | "with"                { OUTWITH }
  | "frequency"           { OUTFREQ }
  | "sample"              { OUTSAMP }
(* Identificators *)
  | parid as s            { PARID(s) }
  | dofid as s            { DOFID(s) }
  | fpeid as s            { FPEID(s) }
(* Literals *)
  | counter as s          { INT(int_of_string s) }
  | realvalue as s        { REAL(float_of_string s ) }
  | complexvalue as s     { COMPLEX(complex_of_string s) }
  | version as s          { VERSION(s) }
  | date as s             { DATE(s) }
  | '\"'                  { let buffer = [] in
                            STRLIT(string_lit buffer lexbuf) }
(* End of file *)
  | eof                   { EOF }
(* Illegal characters *)
  | _ as c                { let p = lexeme_start_p lexbuf in
                            let msg = Printf.sprintf
                                "[F: %s\tL:%d,\tC: %d] Fatal lexical error.
                                Illegal character %s."
                                p.pos_fname
                                p.pos_lnum
                                (p.pos_cnum - p.pos_bol + 1)
                                (Char.escaped c)
                            in
                            raise (LexingError msg) }

and comment = parse
  '\n' { incr_lineno lexbuf; token lexbuf }
  | eof                 { EOF }
  | _                   { comment lexbuf }

and string_lit buf = parse
  '\"'      { String.concat "" (List.rev buf) }
  | eof       { let p = lexeme_start_p lexbuf in
                let msg = Printf.sprintf
                    "[F: %s\tL:%d,\tC: %d] Fatal lexical error.
                    Unexpected end of file (EOF)."
                    p.pos_fname
                    p.pos_lnum
                    (p.pos_cnum - p.pos_bol + 1)
                in
                raise (Scanner_error msg) }
  | '\n'     { let p = lexeme_start_p lexbuf in
                let msg = Printf.sprintf
                    "[F: %s\tL:%d,\tC: %d] Fatal lexical error.
                    Unexpected end of line (EOL)."
                    p.pos_fname
                    p.pos_lnum
                    (p.pos_cnum - p.pos_bol + 1)
                in
                raise (LexingError msg) }
   | "\\n"    { string_lit ("\\n"::buf) lexbuf }
   | "\\'"    { string_lit ("\\'"::buf) lexbuf }
   | "\\t"    { string_lit ("\\t"::buf) lexbuf }
   | "\\\""    { string_lit ("\\\'"::buf) lexbuf }
   | "\\\\"   { string_lit ("\\\\"::buf) lexbuf }
   | _ as c   { string_lit ((Char.escaped c)::buf) lexbuf }
