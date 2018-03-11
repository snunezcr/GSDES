/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PARAMETEREXPRESSION_H
#define _PARAMETEREXPRESSION_H

#include "ConstructibleExpression.h"


class ParameterExpression: public ConstructibleExpression {
public: 
    Parameter * parameter;
};

#endif //_PARAMETEREXPRESSION_H