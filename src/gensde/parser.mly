/**********************************************************/
/* National Center for Supercomputing Applications and    */
/* Beckman Institute for Advanced Science and Technology  */
/* University of Illinois at Urbana-Champaign             */
/*                                                        */
/* Generalized Stochastic Differential Equations Solver   */
/* GSDES                                                  */
/* Santiago Nunez-Corrales <nunezco2@illinois.edu         */
/* Eric Jakobsson <jake@illinois.edu                      */
/**********************************************************/
%{
  open Ast
  open Parseutils
%}

%token LPAREN RPAREN LSBRACK RSBRACK LBRACE RBRACE SEMI COMMA ASSIGN
%token VALTRUE VALFALSE
%token MODEL
%token ANNOTS ANNAME ANAUTHS ANAFFILS ANDESC ANVERSION ANDATE
%token EXECS EXDISTR EXPROCS EXSTART EXNOISY EXENSMBL
%token TDET TSTO TGIVEN TREAL TCOMPLEX TTIME
%token QLABEL QDIST QSOURCE QVAL QARGS QRANGE QDELTA
%token SRCCSV SRCNETCDF SRCHDF5
%token DUNIF DNORM DEXP DBETA DGAMMA DFPE
%token PARAMS
%token MANIF
%token SYSTEM SYSLEVEL SYSINIT
%token DIFFEQ DEON DEBY DEEQ
%token FPEPDF FPEDRIFT FPEDIFF FPEFIXED FPEALGEB
%token OPPLUS OPMINUS OPTIMES OPDIVIDE OPPOWER
%token OPSIN OPCOS OPTAN OPCSC OPSEC OPCOT
%token OPARCSIN OPARCCOS OPARCTAN OPARCCSC OPARCSEC OPARCCOT
%token OPSINH OPCOSH OPTANH OPCSCH OPSECH OPCOTH
%token OPARCSINH OPARCCOSH OPARCTANH OPARCCSCH OPARCSECH OPARCCOTH
%token OPLOG OPEXP OPRE OPIM OPSUM
%token OUTPUT OUTFILE OUTTRAJ OUTPHASE OUTINTER OUTWITH OUTFREQ OUTSAMP
%token <string> PARID
%token <string> DOFID
%token <string> FPEID
%token <int> INT
%token <float> REAL
%token <float> TIME
%token <Complex.t> COMPLEX
%token <Parseutils.avers> VERSION
%token <Parseutils.adate> DATE
%token <string> STRLIT
%token EOF

%start model
%type <Ast.model> model

%left OPPLUS OPMINUS
%left OPTIMES OPDIVIDE
%left OPPOWER

%%

an_nm:
  ANNAME STRLIT SEMI
  { $2 }

an_dsc:
  ANDESC STRLIT SEMI
  { $2 }

an_aut_single:
  LPAREN INT COMMA STRLIT RPAREN
  { { aid = $2; aname = $4 } }

an_auts_list:
  | an_aut_single
    { [$1] }
  | an_auts_list COMMA an_aut_single
    { $1 @ [$3]}

an_auts:
  ANAUTHS LSBRACK an_auts_list RSBRACK SEMI
  { $3 }

an_aff_single:
  LPAREN INT COMMA STRLIT RPAREN
  { { afid = $2; aforg = $4 } }

an_affs_list:
  | an_aff_single
    { [$1] }
  | an_affs_list COMMA an_aff_single
    { $1 @ [$3]}

an_affs:
  ANAFFILS LSBRACK an_affs_list RSBRACK SEMI
  { $3 }

an_ver:
  ANVERSION VERSION SEMI
  { $2 }

an_dt:
  ANDATE DATE SEMI
  { $2 }

ant_stmt:
  ANNOTS LBRACE an_nm an_dsc an_auts an_affs an_ver an_dt RBRACE
  {
    { aname = $3; adesc = $4; aauths = $5;
      aaffils = $6; aversion = $7; adate = $8 }
  }

ex_dist:
    EXDISTR VALTRUE SEMI
    { true }
  | EXDISTR VALFALSE SEMI
    { false }

ex_procs:
  EXPROCS INT SEMI
  { $2 }

ex_sat:
  EXSTART INT SEMI
  { $2 }

ex_nsy:
    EXNOISY VALTRUE SEMI
    { true }
  | EXNOISY VALFALSE SEMI
    { false }

ex_esb:
  EXENSMBL INT SEMI
  { $2 }

exe_stmt:
  EXECS LBRACE ex_dist ex_procs ex_sat ex_nsy ex_esb RBRACE
  {
    { execdistrd = $3; execprocs = $4; exectstrtt = $5;
      execnoisy = $6; ensemble = $7 }
  }

var_type:
    TREAL
    { Real }
  | TCOMPLEX
    { Complex }
  | TTIME
    { Time }

var_lab:
  QLABEL STRLIT SEMI
  { $2 }

src_type:
    SRCCSV
    { CSV }
  | SRCNETCDF
    { NetCDF }
  | SRCHDF5
    { HDF5 }

par_src:
  QSOURCE src_type LSBRACK STRLIT COMMA STRLIT RSBRACK SEMI
  { { sinput = $2; sfile = $4; sdata = $6 } }

var_val:
    REAL
    { RealVal($1) }
  | COMPLEX
    { ComplexVal($1) }
  | TIME
    { TimeVal($1) }

var_dist_type:
    DUNIF
    { Uniform }
  | DNORM
    { Normal }
  | DEXP
    { Exponential }
  | DBETA
    { Beta }
  | DGAMMA
    { Gamma }
  | DFPE FPEID
    { FpeId($2) }

var_dist:
  QDIST var_dist_type SEMI
  { $2 }

var_args_list:
    REAL
    { [ $1 ]}
  | var_args_list COMMA REAL
    { $1 @ [ $3 ] }

var_args:
  LSBRACK var_args_list RSBRACK
  { $2 }

par_stmt:
    TGIVEN var_type PARID LBRACE var_lab par_src RBRACE
    { GivenPar(ParId($3), $2, $5, $6) }
  | TDET var_type PARID LBRACE var_lab var_val RBRACE
    { DetPar(ParId($3), $2, $5, $6) }
  | TSTO var_type PARID LBRACE var_lab var_dist var_args RBRACE
    { StoPar(ParId($3), $2, $5, $6, $7) }

par_list:
    /* Empty: no parameters may be required */
    { [] }
  | par_list COMMA par_stmt
    { $1 @ [$3] }

par_blk:
  PARAMS LBRACE par_list RBRACE
  { $3 }

mnf_interval:
  LSBRACK COMMA RSBRACK
  {}

mnf_dt:
  QDELTA mnf_interval SEMI
  { $2 }

mnf_rng:
  QRANGE mnf_interval SEMI
  { $2 }

mnf_stmt:
    TDET var_type DOFID LBRACE var_lab mnf_rng mnf_dt RBRACE
    { DetMnf($3, $2, $5, $6) }
  | TSTO var_type DOFID LBRACE var_lab var_dist var_args RBRACE
    { StoMnf($3, $2, $5, $6, $7) }

mnf_list:
      /* Empty: no parameters may be required */
    { [] }
  | mnf_list COMMA mnf_stmt
    { $1 @ [$3] }

mnf_blk:
  PARAMS LBRACE mnf_list RBRACE
  { $3 }

var_list_aux:
    DOFID
    { [ $1 ] }
  | var_list_aux COMMA DOFID
    { $1 @ [$3] }

var_list:
  LPAREN var_list_aux RPAREN
  { $2 }

diff_eqn_def:
  DIFFEQ DOFID DEON var_list DEBY var_list
  { { diff_var = $2; diff_on = $4; diff_by = $6 } }

val_stmt:
    REAL
    { RealVal($1) }
  | COMPLEX
    { ComplexVal($1) }
  | TIME
    { TimeVal($1) }

val_list_aux:
    val_stmt
    { [ $1 ]}
  | val_list_aux COMMA val_stmt
    { $1 @ [ $3 ] }

val_list:
  LSBRACK val_list_aux RSBRACK
  { $2 }

val_list_list_aux:
    val_list
    { [$1] }
  | val_list_list_aux COMMA val_list
    { $1 @ [ $3 ] }

val_list_list:
  LSBRACK val_list_list_aux RSBRACK
  { $2 }

alg_exp_atm:
    REAL
    { RealVal($1) }
  | COMPLEX
    { ComplexVal($1) }
  | TIME
    { TimeVal($1) }
  | DOFID
    { VarId($1) }
  | PARID
    { ParId($1)}
  | OPSIN LPAREN alg_expr RPAREN
    { UnaryOp(Sin, $3) }
  | OPCOS LPAREN alg_expr RPAREN
    { UnaryOp(Cos, $3) }
  | OPTAN LPAREN alg_expr RPAREN
    { UnaryOp(Tan, $3) }
  | OPCSC LPAREN alg_expr RPAREN
    { UnaryOp(Csc, $3) }
  | OPSEC LPAREN alg_expr RPAREN
    { UnaryOp(Sec, $3) }
  | OPCOT LPAREN alg_expr RPAREN
    { UnaryOp(Cot, $3) }
  | OPARCSIN LPAREN alg_expr RPAREN
    { UnaryOp(ASin, $3) }
  | OPARCCOS LPAREN alg_expr RPAREN
    { UnaryOp(ACos, $3) }
  | OPARCTAN LPAREN alg_expr RPAREN
    { UnaryOp(ATan, $3) }
  | OPARCCSC LPAREN alg_expr RPAREN
    { UnaryOp(ACsc, $3) }
  | OPARCSEC LPAREN alg_expr RPAREN
    { UnaryOp(ASec, $3) }
  | OPARCCOT LPAREN alg_expr RPAREN
    { UnaryOp(ACot, $3) }
  | OPSINH LPAREN alg_expr RPAREN
    { UnaryOp(Sinh, $3) }
  | OPCOSH LPAREN alg_expr RPAREN
    { UnaryOp(Cosh, $3) }
  | OPTANH LPAREN alg_expr RPAREN
    { UnaryOp(Tanh, $3) }
  | OPCSCH LPAREN alg_expr RPAREN
    { UnaryOp(Csch, $3) }
  | OPSECH LPAREN alg_expr RPAREN
    { UnaryOp(Sech, $3) }
  | OPCOTH LPAREN alg_expr RPAREN
    { UnaryOp(Coth, $3) }
  | OPARCSINH LPAREN alg_expr RPAREN
    { UnaryOp(ASinh, $3) }
  | OPARCCOSH LPAREN alg_expr RPAREN
    { UnaryOp(ACosh, $3) }
  | OPARCTANH LPAREN alg_expr RPAREN
    { UnaryOp(ATanh, $3) }
  | OPARCCSCH LPAREN alg_expr RPAREN
    { UnaryOp(ACsch, $3) }
  | OPARCSECH LPAREN alg_expr RPAREN
    { UnaryOp(ASech, $3) }
  | OPARCCOTH LPAREN alg_expr RPAREN
    { UnaryOp(ACoth, $3) }
  | OPLOG LPAREN alg_expr RPAREN
    { UnaryOp(Log, $3) }
  | OPEXP LPAREN alg_expr RPAREN
    { UnaryOp(Exp, $3) }
  | LPAREN alg_expr RPAREN
    { $2 }

alg_exp_pow:
    alg_exp_pow OPPOWER alg_exp_atm
    { BinaryOp($1, Power, $3) }
  | alg_exp_atm
    { $1 }

alg_exp_prod:
    alg_exp_prod OPTIMES alg_exp_pow
    { BinaryOp($1, Times, $3) }
  | alg_exp_prod OPDIVIDE alg_exp_pow
    { BinaryOp($1, Divide, $3) }
  | alg_exp_pow
    { $1 }

alg_exp_add:
    alg_exp_add OPSUM alg_exp_prod
    { BinaryOp($1, Plus, $3) }
  | alg_exp_add OPMINUS alg_exp_prod
    { BinaryOp($1, Minus, $3) }
  | OPMINUS alg_exp_prod
    { UnaryOp(Neg, $2) }
  | alg_exp_prod
    { $1 }

alg_expr:
    OPSUM var_list LPAREN alg_expr RPAREN
    { Sum($2,$4) }
  | alg_exp_add
    { $1 }

fpe_alg_expr:
    alg_expr
    { $1 }
  | diff_eqn_def LPAREN fpe_alg_expr RPAREN
    { Diff($1,$3) }

fpe_drf:
    FPEDRIFT FPEFIXED val_list SEMI
    { DriftFix($3) }
  | FPEDRIFT FPEALGEB fpe_alg_expr SEMI
    { DriftAlg($3) }

fpe_dff:
    FPEDIFF FPEFIXED val_list_list SEMI
    { DiffsnFix($3) }
  | FPEDIFF FPEALGEB fpe_alg_expr SEMI
    { DiffsnAlg($3) }

fpe_stmt:
  FPEID LBRACE diff_eqn_def SEMI fpe_drf fpe_dff RBRACE
  { { fid = FpeId($1); fdiff = $3; fdrift = $5; fdiffsn = $6 } }

fpe_list:
    /* Empty: no parameters may be required */
    { [] }
  | fpe_list fpe_stmt
    { $1 @ [$2] }

fpe_blk:
  PARAMS LBRACE fpe_list RBRACE
  { $3 }

sde_eq_expr:
  diff_eqn_def DEEQ alg_expr SEMI
  { Sde($1,$3) }

sde_list:
    sde_eq_expr
    { [$1] }
  | sde_list sde_eq_expr
    { $1 @ [$2] }

init_pair:
  LPAREN DOFID COMMA val_stmt RPAREN
  { { vid = $2; vval = $4 } }

init_list_aux:
    init_pair
    { [$1] }
  | init_list_aux COMMA init_pair
    { $1 @ [$3] }

init_list:
  LSBRACK init_list_aux RSBRACK
  { $2 }

init_stmt:
  SYSINIT init_list SEMI
  { $2 }

level_stmt:
  SYSLEVEL INT LBRACE sde_list init_stmt RBRACE
  { { slid = $2; slsdes = $4; slincnd = $5 } }

level_list:
    level_stmt
    { [$1] }
  | level_list level_stmt
    { $1 @ [$2] }

sys_blk:
  SYSTEM LBRACE level_list RBRACE
  { $3 }

file_stmt:
  OUTFILE src_type STRLIT SEMI
  { { dinput = $2; dfile = $3 } }

out_field_end:
    SEMI
    { false }
  | OUTWITH OUTFREQ SEMI
    { true }


out_field_stmt:
    OUTTRAJ var_list OUTSAMP REAL out_field_end
    { Trajectory($2, $4, $5) }
  | OUTPHASE var_list OUTSAMP REAL out_field_end
    { Phase($2, $4, $5) }
  | OUTINTER var_list OUTSAMP REAL SEMI
    { Interaction($2, $4) }

out_list:
    out_field_stmt
    { [$1] }
  | out_list out_field_stmt
    { $1 @ [$2] }

out_blk:
  OUTPUT LBRACE file_stmt out_list RBRACE
  { { outpt_file = $3; outpt_segmts = $4 } }

model:
  MODEL LBRACE ant_stmt exe_stmt par_blk mnf_blk fpe_blk sys_blk out_blk RBRACE
  {
    { annot_block = $3; exec_block = $4; param_block = $5; mnfld_block = $6;
      fpe_block = $7; system_block = $8; outpt_block = $9 }
  }
