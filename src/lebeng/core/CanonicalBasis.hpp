/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _CANONICALBASIS_H
#define _CANONICALBASIS_H

#include "LebesgueObject.h"


class CanonicalBasis: public LebesgueObject {
public: 
    void unities[];
    void dim;
    
    /**
     * @param int dims[]
     */
    void getReduced(void int dims[]);
};

#endif //_CANONICALBASIS_H