/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DEGREEOFFREEDOM_H
#define _DEGREEOFFREEDOM_H

#include "LebesgueObject.h"
#include "BoundedInterval.h"
#include "Manifold.h"


class DegreeOfFreedom: public LebesgueObject {
public: 
    string representation;
    string description;
    void ordering;
    void affine;
    void submanifold;
    bool time;
    NoiseGenerator noise;
    BoundedInterval 1;
    Manifold 1;
    
    void isOrdered();
    
    void fromAffine();
    
    void isEmergent();
    
    void isTime();
    
    void isNoisy();
};

#endif //_DEGREEOFFREEDOM_H