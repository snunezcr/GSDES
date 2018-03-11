/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PARAMETER_H
#define _PARAMETER_H

#include "LebesgueObject.h"


class Parameter: public LebesgueObject {
public: 
    string representation;
    string description;
    
    void measure();
    
    void toExpression();
};

#endif //_PARAMETER_H