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

let complex_of_string z =
  { re=1; im=0 }
