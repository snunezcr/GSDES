/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DYNAMICS_H
#define _DYNAMICS_H

#include "LebesgueObject.h"


class Dynamics: public LebesgueObject {
public: 
    Differential differential;
    AbstractFunction value;
    
    /**
     * @param Delta deltas[]
     */
    void solveForLevel(void Delta deltas[]);
    
    void deepSolve();
};

#endif //_DYNAMICS_H