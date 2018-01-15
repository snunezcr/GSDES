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

%{
  open Ast
  open Utils
}%

%token LPAREN RPAREN LSBRACK RSBRACK LBRACE RBRACE SEMI COMMA ASSIGN
%token VALTRUE VALFALSE
%token MODEL
%token ANNOTS ANNAME ANAUTHS ANAFFILS ANDESC ANVERSION ANDDATE
%token EXECS EXDISTR EXPROCS EXSTART EXNOISY EXENSMBL
%token TDET TSTO TGIVEN TREAL TCOMPLEX
%token QLABEL QDIST QSOURCE QVAL QARGS QRANGE QDELTA
%token SRCCSV SRCNETCDF SRCHDF5
%token DUNIF DNORM DEXP DBETA DGAMMA DFPE
%token PARAMS
%token MANIF
%token SYSTEM SYSLEVEL SYSINIT
%token DIFFEQ DEON DEBY EQ
%token FPEPDF FPEDRIFT FPEDIFF FPEFIXED FPEALGEB
%token OPPLUS OPMINUS OPTIMES OPDIVIDE OPPOWER
%token OPSIN OPCOS OPTAN OPCSC OPSEC OPCOT
%token OPARCSIN OPARCCOS OPARCTAN OPARCCSC OPARCSEC OPARCCOT
%token OPSINH OPCOSH OPTANH OPCSCH OPSECH OPCOTH
%token OPARCSINH OPARCCOSH OPARCTANH OPARCCSCH OPARCSECH OPARCCOTH
%token OPLOG OPEXP
%token OUTPUT OUTFILE OUTTRAJ OUTPHASE OUTINTER OUTWITH OUTFREQ OUTSAMP
%token <string> PARID
%token <string> DOFID
%token <string> FPEID
%token <int> INT
%token <float> REAL
%token <Complex.t> COMPLEX
%token <Utils.avers> VERSION
%token <Utils.adate> DATE
%token <string> STRLIT
%token EOF

%left OPPLUS MINUS
%left OPTIMES OPDIVIDE
%left OPPOWER
%nonassoc NEG

%start program
%type <Ast.program> program

%%

program:
  MODEL LBRACE RBRACE
