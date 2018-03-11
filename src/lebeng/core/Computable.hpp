/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _COMPUTABLE_H
#define _COMPUTABLE_H

#include "LebesgueObject.h"


class Computable: public LebesgueObject {
public: 
    int accuracy;
    function_ptr algorithm;
    int usedParams;
    double params[];
    
    void eval();
    
    void effectiveZero();
};

#endif //_COMPUTABLE_H