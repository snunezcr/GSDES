/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _SOLVERSTUB_H
#define _SOLVERSTUB_H

class SolverStub {
public: 
    Level system[];
    Parameter parameters[];
    SolverConfiguration configuration;
    BoundedSpace space;
    Coordinate currentConditions;
    string namedConstants[];
    KnownNamedCostants constants;
};

#endif //_SOLVERSTUB_H