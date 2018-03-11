/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _CONSTRUCTIBLEEXPRESSION_H
#define _CONSTRUCTIBLEEXPRESSION_H

#include "LebesgueObject.h"
#include "LebesgueObject.h"


class ConstructibleExpression: public LebesgueObject, public LebesgueObject {
public: 
    ConstructibleExpression parent;
    
    void isAtomic();
    
    void simplify();
    
    void differentiateSymbolic();
    
    /**
     * @param Coordinate &c
     */
    void differentiateNumeric(void Coordinate &c);
    
    /**
     * @param Coordinate &c
     */
    void eval(void Coordinate &c);
};

#endif //_CONSTRUCTIBLEEXPRESSION_H