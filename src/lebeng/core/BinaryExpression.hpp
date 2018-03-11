/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _BINARYEXPRESSION_H
#define _BINARYEXPRESSION_H

#include "ConstructibleExpression.h"


class BinaryExpression: public ConstructibleExpression {
public: 
    BinaryOperator operator;
    ConstructibleExpression child_a;
    ConstructibleExpression child_b;
};

#endif //_BINARYEXPRESSION_H