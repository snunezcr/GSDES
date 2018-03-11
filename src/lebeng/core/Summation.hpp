/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _SUMMATION_H
#define _SUMMATION_H

#include "LebesgueObject.h"


class Summation: public LebesgueObject {
public: 
    Approximate start[];
    Approximate end[];
    Approximate step[];
    DegreeOfFreedom dofs[];
    
    /**
     * @param int dofs[]
     */
    void collapse(void int dofs[]);
    
    void collapse();
    
    /**
     * @param int k
     */
    void splitEval(void int k);
};

#endif //_SUMMATION_H