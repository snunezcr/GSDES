/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _EXECUTION_H
#define _EXECUTION_H

class Execution {
public: 
    boolean distributed;
    int processesMax;
    Level startAt;
    boolean noisy;
    int ensembleMax;
    int processesCurr;
    int ensembleCurr;
    
    void toString();
};

#endif //_EXECUTION_H