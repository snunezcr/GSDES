/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _ABSTRACTFUNCTION_H
#define _ABSTRACTFUNCTION_H

#include "LebesgueObject.h"
#include "LebesgueObject.h"


class AbstractFunction: public LebesgueObject, public LebesgueObject {
public: 
    String denotator;
    Manifold from;
    Manifold to;
    Projector projector;
    
    /**
     * @param DegreeofFreedom ds[]
     */
    void coarsen(void DegreeofFreedom ds[]);
    
    /**
     * @param Manifold &m
     */
    void refine(void Manifold &m);
    
    /**
     * @param Coordinate &c
     */
    void evalAt(void Coordinate &c);
    
    bool isFokkerPlanck();
};

#endif //_ABSTRACTFUNCTION_H