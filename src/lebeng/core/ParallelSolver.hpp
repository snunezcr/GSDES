/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _PARALLELSOLVER_H
#define _PARALLELSOLVER_H

class ParallelSolver {
public: 
    SolverStub * stub;
    DescriptionParser parser;
    HashObjectAssociation hashObjectAssoc[];
    vector<long long> workerThreads;
    Solver * parent;
    Ensamble ensamble;
    
    void init();
    
    /**
     * @param string file
     */
    void parse(void string file);
    
    void step();
    
    void run();
    
    int finalize();
    
    int finalizeAndReport();
    
    void isMaster();
    
    void partitionWithSpace();
};

#endif //_PARALLELSOLVER_H