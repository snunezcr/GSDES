/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _MEASURE_H
#define _MEASURE_H

#include "DynamicalFunction.h"
#include "AbstractFunction.h"


class Measure: public DynamicalFunction, public AbstractFunction {
public: 
    ConstructibleExpression expresion;
    
    /**
     * @param Coordinate &c
     * @param Coordinate &d
     */
    void eval(void Coordinate &c, void Coordinate &d);
    
    /**
     * @param DegreeOfFreedom df[]
     */
    void chainRule(void DegreeOfFreedom df[]);
};

#endif //_MEASURE_H