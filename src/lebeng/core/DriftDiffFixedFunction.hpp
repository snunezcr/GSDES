/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DRIFTDIFFFIXEDFUNCTION_H
#define _DRIFTDIFFFIXEDFUNCTION_H

#include "AbstractFunction.h"


class DriftDiffFixedFunction: public AbstractFunction {
public: 
    Approximable drift[];
    Approximable diffusion[][];
};

#endif //_DRIFTDIFFFIXEDFUNCTION_H