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

exception SyntaxError of string

(* Dates are represented as YYYY-MMM-DD *)
type adate = {
  dyear : int;
  dmonth: string;
  dday : int;
}

(* A type for representing one author *)
type aauth = {
  aid : int;
  aname : string;
}

(* A type for representing one affiliation. One author may have *)
(* multiple affiliations.                                       *)
type aafil = {
  afid : int;
  aforg : string;
}

(* Storage type for version *)
type avers = {
  avmajor : int;
  avminor : int;
}

(* A list of authors with identities *)
type annot_stmt = {
  aname : string;
  adesc : string;
  aauths : aauth list;
  aaffils : aafil list;
  aversion : avers;
  adate : adate;
}

(* A model is the top level entity that contains all specifications *)
type model = {
  annot_block : annot_stmt list;
  exec_block : exec_stmt list;
  param_block : param_stmt list;
  mnfld_block : mfld_stmt list;
  fpe_block : fpe_stmt list;
  system_block : level_stmt list;
  outpt_block : outpt_block list;
}
