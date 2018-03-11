/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _OUTPUT_H
#define _OUTPUT_H

class Output {
public: 
    String filename;
    FileFormat format;
    OutputTarget target;
    
    void toString();
};

#endif //_OUTPUT_H