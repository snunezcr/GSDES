/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _NOISEGENERATOR_H
#define _NOISEGENERATOR_H

#include "LebesgueObject.h"


class NoiseGenerator: public LebesgueObject {
public: 
    double arguments[];
    String type;
    double seeds[];
    Dynamics dynamics;
    
    void sample();
    
    /**
     * @param double seeds[]
     */
    void reseed(void double seeds[]);
    
    void reset();
    
    /**
     * @param int dof
     * @param Coordinate &c
     */
    void perturbate(void int dof, void Coordinate &c);
};

#endif //_NOISEGENERATOR_H