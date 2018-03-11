/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#ifndef _DESCRIPTIONPARSER_H
#define _DESCRIPTIONPARSER_H

class DescriptionParser {
public: 
    string file;
    Description descriptions[];
    HashObjectAssociation * lastHashAssoc;
    
    Description lineToDescription();
    
    void parseAll();
    
    /**
     * @param int desc
     */
    void descriptionToObject(void int desc);
    
    /**
     * @param int desc
     */
    void register(void int desc);
    
    void registerAll();
    
    vector<string> fileToLines();
};

#endif //_DESCRIPTIONPARSER_H