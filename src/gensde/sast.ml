(**********************************************************)
(* National Center for Supercomputing Applications and    *)
(* Beckman Institute for Advanced Science and Technology  *)
(* University of Illinois at Urbana-Champaign             *)
(*                                                        *)
(* Generalized Stochastic Differential Equations Solver   *)
(* GSDES                                                  *)
(* Santiago Nunez-Corrales <nunezco2@illinois.edu>        *)
(* Eric Jakobsson <jake@illinois.edu>                     *)
(**********************************************************)
open Ast
open Parseutils

exception TypeMismatch of string
exception EmptyString of string
exception DataMismatch of string
exception ValueNotAllowed of string
exception RepeatedElement of string

(* A type for representing one author *)
type saauth = {
  said : int;
  saname : string;
}

(* A type for representing one affiliation. One author may have *)
(* multiple affiliations. Safe version.                         *)
type saafil = {
  safid : int;
  saforg : string;
}

(* A safe list of authors with identities *)
type sannot_stmt = {
  saname : string;
  sadesc : string;
  saauths : saauth list;
  saaffils : saafil list;
  saversion : avers;
  sadate : adate;
}

(* Execution block *)
type sexec_stmt = {
  sexecdistrd : bool;
  sexecprocs : int;
  sexectstrtt : int;
  sexecnoisy : bool;
  sensemble : int;
}

(* Safe interval representation *)
type sinterval = {
  smin : var_value;
  smax : var_value;
}

(* Source for a variable *)
type ssource = {
  ssinput : file_format;
  ssfile : string;
  ssdata : string;
}

(* Parameter definition *)
type sparam_stmt =
    SGivenPar of parid * field_type * string * ssource
  | SStoPar of parid * field_type * string * prb_function * (float list)
  | SDetPar of parid * field_type * string * var_value

(* Degree of freedom in the manifold *)
type smfld_stmt =
    SStoMnf of varid * field_type * string * prb_function * (float list)
  | SDetMnf of varid * field_type * string * sinterval * sinterval

(* Safe left hand side of an DE   *)
(*                                *)
(* Example:                       *)
(* d A(X, Y)/ d (V, W)            *)
(*                                *)
(* diff_f = A                     *)
(* diff_on = [VarId(X), VarId(Y)] *)
(* diff_by = [VarId(V), VarId(W)] *)
(*                                *)
(* diff_on - diff_by = diff_on    *)
type sdifferential = {
  sdiff_var : varid;
  sdiff_on : varid list;
  sdiff_by : varid list;
}

(* Algebraic expression for stochastic differential equations and  *)
(* Fokker-Planck equations. Safe versions.                         *)
type ssde_expr =
    VarSDE of string
  | ParSDE of string
  | RealSDE of float
  | ComplexSDE of Complex.t
  | TimeSDE of float
  | SBinaryOp of ssde_expr * binop * ssde_expr
  | SUnaryOp of unop * ssde_expr
  | SSum of varid list * ssde_expr
  | SDiff of sdifferential * ssde_expr

(* Fokker-Planck drift *)
type sfpe_drift =
    SDriftFix of var_value list
  | SDriftAlg of ssde_expr

(* Fokker-Planck diffusion *)
type sfpe_diffusion =
    SDiffsnFix of var_value list list
  | SDiffsnAlg of ssde_expr

(* Safe Fokker-Planck statement *)
type sfpe_stmt = {
  sfid : fpeid;
  sfdiff : sdifferential;
  sfdrift : sfpe_drift;
  sfdiffsn : sfpe_diffusion;
}

(* Safe representation for an SDE *)
type ssde_stmt = SSde of sdifferential * ssde_expr

(* Safe representation for initial conditions *)
type sinit_cond = {
  svid : varid;
  svval : var_value;
}

(* Representation of a system level*)
type slevel_stmt = {
  slid : int;
  slsdes: ssde_stmt list;
  slincnd: sinit_cond list;
}

(* A safe ouput segment determines the collection of *)
type sout_segment =
    STrajectory of varid list * float * bool
  | SPhase of varid list * float * bool
  | SInteraction of varid list * float

(* Safe source for a variable *)
type sdestination = {
  sdinput : file_format;
  sdfile : string;
}

(* Output statements *)
type soutpt_stmt = {
  soutpt_file : sdestination;
  soutpt_segmts : sout_segment list;
}

(* Safe model *)
type smodel = {
  sannot_block : sannot_stmt;
  sexec_block : sexec_stmt;
  sparam_block : sparam_stmt list;
  smnfld_block : smfld_stmt list;
  sfpe_block : sfpe_stmt list;
  ssystem_block : slevel_stmt list;
  soutpt_block : soutpt_stmt;
}
