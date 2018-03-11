/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _ANNOTATIONS_H
#define _ANNOTATIONS_H

class Annotations {
public: 
    string modelName;
    Author authors[];
    string description;
    Version version;
    Date date;
    
    void toString();
};

#endif //_ANNOTATIONS_H