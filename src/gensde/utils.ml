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

open Complex
open Str
open List

(* Storage type for version *)
type avers = {
  avmajor : int;
  avminor : int;
}

(* Dates are represented as YYYY-MMM-DD *)
type adate = {
  dyear : int;
  dmonth: string;
  dday : int;
}

(* Obtain the version of the model from a string *)
let version_of_string ver =
  let numbers = String.split_on_char '.' ver in
  { avmajor = int_of_string (List.nth numbers 0);
    avminor = int_of_string (List.nth numbers 1) }

(* Obtain the date of the model from a string *)
let date_of_string date =
  let dateparts = String.split_on_char '-' date in
  { dyear = int_of_string (List.nth dateparts 0);
    dmonth = List.nth dateparts 1;
    dday = int_of_string (List.nth dateparts 2) }

(* Replace text in a string *)
let replace input output =
  Str.global_replace (Str.regexp_string input) output

(* Obtain a complex number from a string *)
let complex_of_string cplx =
  let no_i = replace "i" "" cplx in
  let no_plus = replace "+" " " no_i in
  let no_minus = replace "-" " " no_plus in
  let cplx_parts = String.split_on_char ' ' no_minus in
  { re = float_of_string (List.nth cplx_parts 0);
    im = float_of_string (List.nth cplx_parts 1) }
