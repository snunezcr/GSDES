/**
 * Project Generalized Stochastic Differential Equations Solver
 * @author Santiago Nunez-Corrales
 * @version 0.1
 */


#include "AbstractFunction.h"

/**
 * AbstractFunction implementation
 */


/**
 * @param DegreeofFreedom ds[]
 */
void AbstractFunction::coarsen(void DegreeofFreedom ds[]) {

}

/**
 * @param Manifold &m
 */
void AbstractFunction::refine(void Manifold &m) {

}

/**
 * @param Coordinate &c
 */
void AbstractFunction::evalAt(void Coordinate &c) {

}

/**
 * @return bool
 */
bool AbstractFunction::isFokkerPlanck() {
    return false;
}