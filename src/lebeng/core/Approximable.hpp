/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _APPROXIMABLE_H
#define _APPROXIMABLE_H

#include "LebesgueObject.h"


class Approximable: public LebesgueObject {
public: 
    CanonicalBasis basis;
    Computable coefficients;
    
    void neg();
    
    /**
     * @param Approximable &a
     */
    void plus(void Approximable &a);
    
    /**
     * @param Approximable &a
     */
    void minus(void Approximable &a);
    
    /**
     * @param Approximable &a
     */
    void times(void Approximable &a);
    
    /**
     * @param Approximable &a
     */
    void div(void Approximable &a);
    
    /**
     * @param Approximable &a
     */
    void pow(void Approximable &a);
    
    /**
     * @param int p
     */
    void norm(void int p);
    
    /**
     * @param Approximable &a
     */
    void compare(void Approximable &a);
};

#endif //_APPROXIMABLE_H