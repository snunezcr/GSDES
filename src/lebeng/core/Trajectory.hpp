/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _TRAJECTORY_H
#define _TRAJECTORY_H

#include "LebesgueObject.h"


class Trajectory: public LebesgueObject {
public: 
    Manifold from;
    Manifold to;
    int entityID;
    Coordinate pointList[];
    
    void getSpace();
    
    void refine();
    
    void coarsen();
    
    /**
     * @param Projector &p
     */
    void toFrequencyDomain(void Projector &p);
    
    /**
     * @param Projector &p
     */
    void toPhaseDiagram(void Projector &p);
    
    void toInteractionSpace();
};

#endif //_TRAJECTORY_H