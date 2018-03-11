/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DYNAMICALFUNCTION_H
#define _DYNAMICALFUNCTION_H

#include "AbstractFunction.h"


class DynamicalFunction: public AbstractFunction {
public: 
    ConstructibleExpression expression;
    BoundedSpace space;
    StepBasis stepFunctions[];
    CharacteristicFunction chiFunction;
    
    void lebesgueRepresentation();
};

#endif //_DYNAMICALFUNCTION_H