/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _BOUNDEDSPACE_H
#define _BOUNDEDSPACE_H

#include "LebesgueObject.h"


class BoundedSpace: public LebesgueObject {
public: 
    Coordinate extrema;
    double density;
    Manifold mfIn;
    Manifold mfOut;
    
    void getIntervalCover();
    
    /**
     * @param Projector &p
     */
    void project(void Projector &p);
    
    /**
     * @param Coordinate cs[]
     */
    void getSubspace(void Coordinate cs[]);
    
    /**
     * @param Projector &p
     * @param Execution &e
     */
    void partition(void Projector &p, void Execution &e);
    
    void enclosingSurface();
};

#endif //_BOUNDEDSPACE_H