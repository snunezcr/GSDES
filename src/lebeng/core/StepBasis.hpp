/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _STEPBASIS_H
#define _STEPBASIS_H

#include "LebesgueObject.h"


class StepBasis: public LebesgueObject {
public: 
    Projector projector;
    Manifold from;
    Manifold to;
    BoundedSpace constraints;
    
    /**
     * @param Coordinate &c
     */
    void eval(void Coordinate &c);
};

#endif //_STEPBASIS_H