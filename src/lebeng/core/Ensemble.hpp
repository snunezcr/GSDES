/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _ENSEMBLE_H
#define _ENSEMBLE_H

#include "LebesgueObject.h"


class Ensemble: public LebesgueObject {
public: 
    int numEntities;
    Trajectory trajectories[];
    
    /**
     * @param int entity
     * @param Coordinate &c
     */
    void extend(void int entity, void Coordinate &c);
    
    void toInteractionSpace();
    
    /**
     * @param Projector &p
     */
    void toFrequecyDomain(void Projector &p);
    
    /**
     * @param Projector &p
     */
    void toPhaseDiagram(void Projector &p);
    
    /**
     * @param Output &o
     * @param boolean withMomenta
     */
    void toFile(void Output &o, void boolean withMomenta);
    
    void computeMomenta();
};

#endif //_ENSEMBLE_H