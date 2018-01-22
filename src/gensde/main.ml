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

(* This main follows close the structure of that in        *)
(* https://github.com/Maruf789/PLT/blob/master/src/main.ml *)

open Printf
open Ast

(* Error message printer *)
let print_error head err_msg =
  eprintf "%s: %s\n" head err_msg

(* Function that reports error to the parser from the lexer *)
let loc_err lex_buf =
  let p = lex_buf.Lexing.lex_curr_p in
  let tok = Lexing.lexeme lex_buf in
  let fname = p.Lexing.pos_fname in
  let line = p.Lexing.pos_lnum in
  let cnum = p.Lexing.pos_cnum - p.Lexing.pos_bol + 1
             - String.length tok in
  sprintf "[F: %s\tL:%d,\tC: %d] Token %s." fname line cnum tok

(* Open the input file *)
let get_lex_buf in_file =
  try
    let lexbuf = Lexing.from_channel (open_in in_file) in
    lexbuf.Lexing.lex_curr_p <- {
      lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = in_file
    };
    lexbuf
  with
    Sys_error x -> let msg = sprintf "Error %s" x in
    raise (Ast.SyntaxError msg)

(* Compiler front end: return AST with lexer and parser *)
let lexer_parser main_file =
  let lex_buf = get_lex_buf main_file in
  try
    Parser.model Lexer.token lex_buf
  with
    Parsing.Parse_error -> raise (Ast.SyntaxError (loc_err lex_buf))

(* Shell interface *)
let main in_file oc = 0

(* Shell interface *)
let () =
  let argc = Array.length Sys.argv in
  let exit_code =
    if argc >= 2 then
      let oc =
        let ofile =
          if argc >= 3 then Sys.argv.(2) else "nofile"
        in
        open_out ofile
      in
      main Sys.argv.(1) oc
    else
      (eprintf "Usage: gsdescc [model file]\n"; 1)
  in
  exit exit_code
