/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DELTA_H
#define _DELTA_H

class Delta {
public: 
    BoundedInterval range;
    Approximable scalings [];
    
    /**
     * @param Approximable as[]
     */
    void setScalings(void Approximable as[]);
    
    /**
     * @param int dof
     */
    void refineFrom(void int dof);
    
    /**
     * @param int dof
     */
    void coarsenTo(void int dof);
};

#endif //_DELTA_H