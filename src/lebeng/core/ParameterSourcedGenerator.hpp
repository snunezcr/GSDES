/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PARAMETERSOURCEDGENERATOR_H
#define _PARAMETERSOURCEDGENERATOR_H

#include "Parameter.h"


class ParameterSourcedGenerator: public Parameter {
public: 
    string sourceFile;
    string sourceAttribute;
    FileFormat sourceFormat;
};

#endif //_PARAMETERSOURCEDGENERATOR_H