/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _LEVEL_H
#define _LEVEL_H

class Level {
public: 
    int id;
    Integral integrals[];
    int depth;
    Coordinates lastCoord;
    
    /**
     * @param int n
     */
    void solveDownTo(void int n);
    
    /**
     * @param n
     */
    void fixUpTo(void n);
};

#endif //_LEVEL_H