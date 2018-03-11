/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _JACOBIAN_H
#define _JACOBIAN_H

#include "LebesgueObject.h"


class Jacobian: public LebesgueObject {
public: 
    int rows;
    int columns;
    void matrix[][];
    
    void getCovariant();
    
    void getContravariant();
    
    /**
     * @param Coordinate &p
     */
    void projectCovariant(void Coordinate &p);
    
    /**
     * @param Coordinate &p
     */
    void projectContravariant(void Coordinate &p);
};

#endif //_JACOBIAN_H