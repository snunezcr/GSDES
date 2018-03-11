/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _SOLVERCONFIGURATION_H
#define _SOLVERCONFIGURATION_H

class SolverConfiguration {
public: 
    Annotations annotations;
    Execution execution;
    Output output;
    Delta deltas[];
    
    /**
     * @param Delta deltas[]
     */
    void updateDeltas(void Delta deltas[]);
    
    void describe();
    
    void initializeModel();
};

#endif //_SOLVERCONFIGURATION_H