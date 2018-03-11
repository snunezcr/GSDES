/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PROJECTOR_H
#define _PROJECTOR_H

#include "LebesgueObject.h"


class Projector: public LebesgueObject {
public: 
    int dofs;
    bool dofmap;
    
    /**
     * @param Coordinate &p
     */
    void project(void Coordinate &p);
};

#endif //_PROJECTOR_H