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
  open Utils
%}

%token LPAREN RPAREN LSBRACK RSBRACK LBRACE RBRACE SEMI COMMA ASSIGN
%token VALTRUE VALFALSE
%token MODEL
%token ANNOTS ANNAME ANAUTHS ANAFFILS ANDESC ANVERSION ANDATE
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

%start model
%type <Ast.model> model

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
  ANDATE VERSION SEMI
  { $2 }

ant_stmt:
  ANNOTS LBRACE an_nm an_dsc an_auts an_affs an_ver an_dt RBRACE
  {
    { aname = $3; adesc = $4; aauths $5;
      aaffils = $6; aversion = $7; adate = $8 }
  }

model:
  MODEL LBRACE ant_stmt exe_stmt par_blk mnf_blk fpe_blk sys_blk out_blk RBRACE
  {
    { annot_block = $3; exec_block = $4; param_block = $5; mnfld_block = $6;
      fpe_block = $7; system_block = $8; outpt_block = $9 }
  }
