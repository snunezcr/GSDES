/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PARAMETERABINITIOGENERATOR_H
#define _PARAMETERABINITIOGENERATOR_H

#include "Parameter.h"


class ParameterAbInitioGenerator: public Parameter {
public: 
    NoiseGenerator function;
};

#endif //_PARAMETERABINITIOGENERATOR_H