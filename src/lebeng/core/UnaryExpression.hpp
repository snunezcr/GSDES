/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _UNARYEXPRESSION_H
#define _UNARYEXPRESSION_H

#include "ConstructibleExpression.h"


class UnaryExpression: public ConstructibleExpression {
public: 
    UnaryOperator operator;
    ConstructibleExpression child;
    Differential differential;
    Summation sum;
};

#endif //_UNARYEXPRESSION_H