/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _OUTPUTTARGET_H
#define _OUTPUTTARGET_H

class OutputTarget {
public: 
    OutputTargetType type;
    double sampleRate;
    boolean withFrequency;
    int withMomenta;
    
    void toString();
};

#endif //_OUTPUTTARGET_H