/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _CHARACTERISTICFUNCTION_H
#define _CHARACTERISTICFUNCTION_H

#include "AbstractFunction.h"


class CharacteristicFunction: public AbstractFunction {
public: 
    Predicate predicate;
    
    /**
     * @param Projector &p
     */
    void match(void Projector &p);
    
    /**
     * @param BoundedInterval &i
     */
    void checkSingularity(void BoundedInterval &i);
    
    /**
     * @param BoundedInterval &i
     */
    void checkCountable(void BoundedInterval &i);
    
    /**
     * @param BoundedInterval &i
     */
    void checkFinite(void BoundedInterval &i);
};

#endif //_CHARACTERISTICFUNCTION_H