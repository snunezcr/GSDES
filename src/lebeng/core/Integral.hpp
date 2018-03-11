/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _INTEGRAL_H
#define _INTEGRAL_H

#include "DynamicalFunction.h"
#include "LebesgueObject.h"


class Integral: public DynamicalFunction, public LebesgueObject {
public: 
    Coordinate a;
    Coordinate b;
    Measure u;
    Dynamics dynamics[];
    
    /**
     * @param Delta deltas[]
     */
    void step(void Delta deltas[]);
    
    Delta newDeltas();
    
    /**
     * @param Ensemble &e
     * @param int id
     */
    void saveToEnsemble(void Ensemble &e, void int id);
};

#endif //_INTEGRAL_H