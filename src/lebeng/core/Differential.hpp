/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DIFFERENTIAL_H
#define _DIFFERENTIAL_H

#include "ConstructibleExpression.h"
#include "LebesgueObject.h"
#include "LebesgueObject.h"


class Differential: public ConstructibleExpression, public LebesgueObject, public LebesgueObject {
public: 
    DegreeOfFreedom dof;
    DegreeOfFreedom on;
    DegreeOfFreedom by[];
    DegreeOfFreedom independentDOF[];
    
    /**
     * @param ConstructiveExpression &e
     */
    void eval(void ConstructiveExpression &e);
};

#endif //_DIFFERENTIAL_H