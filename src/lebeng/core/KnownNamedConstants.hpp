/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _KNOWNNAMEDCONSTANTS_H
#define _KNOWNNAMEDCONSTANTS_H

class KnownNamedConstants {
public: 
    map<string,NamedConstantCase> mapping;
    
    void init();
    
    /**
     * @param string
     */
    void map(void string);
};

#endif //_KNOWNNAMEDCONSTANTS_H