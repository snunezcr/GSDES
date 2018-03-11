/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _COORDINATE_H
#define _COORDINATE_H

#include "LebesgueObject.h"


class Coordinate: public LebesgueObject {
public: 
    int dofs;
    Approximate components;
    Approximate uncertainties;
    
    /**
     * @param int p
     */
    void norm(void int p);
    
    void getUncertainty();
    
    /**
     * @param Coordinate &c
     */
    void combine(void Coordinate &c);
};

#endif //_COORDINATE_H