/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _BOUNDEDINTERVAL_H
#define _BOUNDEDINTERVAL_H

#include "LebesgueObject.h"
#include "IntervalPolicy.h"


class BoundedInterval: public LebesgueObject {
public: 
    DegreeOfFreedom dof;
    Approximable lower;
    Approximable upper;
    IntervalPolicy 1;
    
    void coarsen();
    
    void refine();
    
    /**
     * @param Approximate &a
     */
    void expand(void Approximate &a);
    
    /**
     * @param Approximate &a
     */
    void contract(void Approximate &a);
    
    /**
     * @param BoundedInterval &b
     */
    void join(void BoundedInterval &b);
    
    /**
     * @param IntervalPolicy &p
     * @param int n
     */
    void split(void IntervalPolicy &p, void int n);
};

#endif //_BOUNDEDINTERVAL_H