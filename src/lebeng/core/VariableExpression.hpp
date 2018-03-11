/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _VARIABLEEXPRESSION_H
#define _VARIABLEEXPRESSION_H

#include "ConstructibleExpression.h"


class VariableExpression: public ConstructibleExpression {
public: 
    DegreeOfFreedom dof;
    Coordinate * lastCoord;
};

#endif //_VARIABLEEXPRESSION_H