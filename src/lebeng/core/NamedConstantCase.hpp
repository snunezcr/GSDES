/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _NAMEDCONSTANTCASE_H
#define _NAMEDCONSTANTCASE_H

class NamedConstantCase {
public: 
    double parameters[];
    function_ptr algorithm;
};

#endif //_NAMEDCONSTANTCASE_H