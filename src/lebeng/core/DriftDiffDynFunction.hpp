/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DRIFTDIFFDYNFUNCTION_H
#define _DRIFTDIFFDYNFUNCTION_H

#include "AbstractFunction.h"
#include "DynamicalFunction.h"


class DriftDiffDynFunction: public AbstractFunction, public DynamicalFunction {
public: 
    Differential differential;
};

#endif //_DRIFTDIFFDYNFUNCTION_H