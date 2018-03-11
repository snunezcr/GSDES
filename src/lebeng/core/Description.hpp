/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DESCRIPTION_H
#define _DESCRIPTION_H

class Description {
public: 
    int id;
    string instructionRoll[];
    bool historySesitive;
    
    /**
     * @param HashObjectAssociation *a
     */
    LebesgueObject toLebesgueObject(void HashObjectAssociation *a);
};

#endif //_DESCRIPTION_H