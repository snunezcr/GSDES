#########################################################
# National Center for Supercomputing Applications and   #
# Beckman Institute for Advanced Science and Technology #
# University of Illinois at Urbana-Champaign            #
#                                                       #
# Generalized Stochastic Differential Equations Solver  #
# GSDES                                                 #
# Santiago Nunez-Corrales <nunezco2@illinois.edu        #
# Eric Jakobsson <jake@illinois.edu                     #
#########################################################

OBJS = ast.cmo parser.cmo lexer.cmo parseutils.cmo main.cmo
MAIN = gsdescc
OCAMLC = ocamlc

OCFLAG = -w -4

build : clean $(MAIN)

$(MAIN) : $(OBJS)
	$(OCAMLC) -o $@ $(OBJS)

lexer.ml : lexer.mll
	ocamllex lexer.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly
	$(OCAMLC) $(OCFLAG) -c parser.mli parseutils.cmo

%.cmi : %.mli
	$(OCAMLC) $(OCFLAG) -c $<

%.cmo : %.ml parseutils.cmo
	$(OCAMLC) $(OCFLAG) -c $<

.PHONY : clean
clean :
	-rm -f $(MAIN) parser.ml parser.mli lexer.ml testall.log \
	*.cmo *.cmi *.output *.diff *~ *.o *.cmx
