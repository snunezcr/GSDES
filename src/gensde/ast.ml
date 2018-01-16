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
open Utils

exception SyntaxError of string

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

(* A list of authors with identities *)
type annot_stmt = {
  aname : string;
  adesc : string;
  aauths : aauth list;
  aaffils : aafil list;
  aversion : avers;
  adate : adate;
}

(* Execution block *)
type exec_stmt = {
  execdistrd : bool;
  execprocs : int;
  exectstrtt : int;
  execnoisy : bool;
  ensemble : int;
}

(* Single parameter id *)
type parid = ParId of string

(* Single variable id *)
type varid = VarId of string

(* Fokker-Planck equation id *)
type fpeid = FpeId of string

(* Field from which the variable is drawn *)
type field_type = Real | Complex | Time

(* Probability density functions *)
type prb_function =
    Uniform
  | Normal
  | Exponential
  | Beta
  | Gamma
  | FpeId of string

(* Values *)
type var_value =
    RealVal of float
  | ComplexVal of float * float
  | TimeVal of float

(* Interval representation *)
type interval = {
  min : var_value;
  max : var_value;
}

(* Data input/output format alternatives *)
type file_format = CSV | NetCDF | HDF5

(* Source for a variable *)
type source = {
  sinput : file_format;
  sfile : string;
  sdata : string;
}

(* Parameter definition *)
type param_stmt =
    Given of parid * field_type * string * source
  | Sto of parid * field_type * string * prb_function * (float list)
  | Det of parid * field_type * string * var_value

(* Degree of freedom in the manifold *)
type mfld_stmt =
    Sto of varid * field_type * string * prb_function * (float list)
  | Det of varid * field_type * string * interval * interval

(* Mathematical binary operators *)
type binop =  Plus | Minus | Times | Divide | Power

(* Mathematical unary operators *)
type unop = Sin | Cos | Tan | Csc | Sec | Cot
          | Sinh | Cosh | Tanh | Csch | Sech | Coth
          | ASin | ACos | ATan | ACsc | ASec | ACot
          | ASinh | ACosh | ATanh | ACsch | ASech | ACoth
          | Exp | Log | Neg

(* Left hand side of an DE        *)
(*                                *)
(* Example:                       *)
(* d A(X, Y)/ d (V, W)            *)
(*                                *)
(* diff_f = A                     *)
(* diff_on = [VarId(X), VarId(Y)] *)
(* diff_by = [VarId(V), VarId(W)] *)
(*                                *)
(* diff_on - diff_by = diff_on    *)
type differential = {
  diff_on : varid list;
  diff_by : varid list;
}

(* Algebraic expression for Fokker-Planck equations *)
type fpe_expr =
    VarId of string
  | ParId of string
  | RealVal of float
  | ComplexVal of float * float
  | TimeVal of float
  | BinaryOp of fpe_expr * binop * fpe_expr
  | UnaryOp of unop * fpe_expr
  | Sum of varid list * fpe_expr
  | Diff of differential * fpe_expr

(* Fokker-Planck drift *)
type fpe_drift =
    DriftFix of var_value list
  | DriftAlg of fpe_expr

(* Fokker-Planck diffusion *)
type fpe_diffusion =
    DiffsnFix of var_value list list
  | DiffsnAlg of fpe_expr

(* Fokker-Planck statement *)
type fpe_stmt = {
  fid : fpeid;
  fdiff : differential;
  fdrift : fpe_drift;
  fdiffsn : fpe_diffusion;
}

(* Algebraic expression for stochastic differential equations *)
type sde_expr =
    VarId of string
  | ParId of string
  | RealVal of float
  | ComplexVal of float * float
  | TimeVal of float
  | BinaryOp of sde_expr * binop * sde_expr
  | UnaryOp of unop * sde_expr
  | Sum of varid list * sde_expr

(* Representation for an SDE *)
type sde_stmt = Sde of differential * sde_expr

(* Representation for initial conditions *)
type init_cond = {
  vid : varid;
  vval : var_value;
}

(* Representation of a system level*)
type level_stmt = {
  slid : int;
  slsdes: sde_stmt list;
  slincnd: init_cond list;
}

(* An ouput segment determines the collection of *)
type out_segment =
    Trajectory of varid list * bool * float
  | Phase of varid list * bool * float
  | Interaction of varid list * float

(* Output statements *)
type outpt_stmt = {
  outpt_format : file_format;
  outpt_segmts : out_segment list;
}

(* A model is the top level entity that contains all specifications *)
type model = {
  annot_block : annot_stmt;
  exec_block : exec_stmt;
  param_block : param_stmt list;
  mnfld_block : mfld_stmt list;
  fpe_block : fpe_stmt list;
  system_block : level_stmt list;
  outpt_block : outpt_stmt list;
}
