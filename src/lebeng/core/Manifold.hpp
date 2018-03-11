/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _MANIFOLD_H
#define _MANIFOLD_H

#include "LebesgueObject.h"
#include "DegreeOfFreedom.h"


class Manifold: public LebesgueObject {
public: 
    void dofs;
    void jacobian;
    DegreeOfFreedom 1;
    
    void getJacobian();
    
    void project();
    
    void invert();
    
    /**
     * @param Manifold &m
     */
    void embed(void Manifold &m);
    
    /**
     * @param Manifold &m
     */
    void product(void Manifold &m);
};

#endif //_MANIFOLD_H