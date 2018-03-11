/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _CONSTANTEXPRESSION_H
#define _CONSTANTEXPRESSION_H

#include "ConstructibleExpression.h"


class ConstantExpression: public ConstructibleExpression {
public: 
    Approximable value;
};

#endif //_CONSTANTEXPRESSION_H