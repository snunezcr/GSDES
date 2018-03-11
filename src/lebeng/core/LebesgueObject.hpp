/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _LEBESGUEOBJECT_H
#define _LEBESGUEOBJECT_H

class LebesgueObject {
public: 
    SolverConfiguration settings;
    long long objectID;
    string universalName;
    
    void toString();
    
    void pack();
    
    void unpack();
    
    /**
     * @param string rep
     */
    void hash(void string rep);
};

#endif //_LEBESGUEOBJECT_H