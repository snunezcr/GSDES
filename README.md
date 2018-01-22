# GSDES
# Generalized Stochastic Differential Equations Solver

**Prof. Eric Jakobsson (jake@illinois.edu)**

*Beckman Institute for Advanced Science and Technology, UIUC*

**Santiago Nunez-Corrales (nunezco2@illinois.edu)**

*National Center for Supercomputing Applications, UIUC*

*Illinois Informatics Institute, UIUC*

## Executive summary

Many natural and human constructed dynamic systems are best described by
stochastic differential equations.  This includes both systems in which quantum
effects are explicitly significant, and also complex systems with too many
variables to represent explicitly.  Packages for solving the dynamics of these
systems typically represent such systems deterministically, using Riemann
integration.  The deterministic approximation fails to correctly describe
thresholds or tipping points.  Deterministic representations can be improved by
adding noise, but this is typically done at substantial cost in computational
efficiency.

An alternative to Riemann integration is Lebesgue integration.  Unlike Riemann
integration, Lebesgue integration naturally takes into account singularities in
the function being integrated, including the effectively instantaneous
fluctuations characteristic of noise due to uncontrolled variables.  Because
Lebesgue integration is inherently as efficient as Riemann integration, this
approach provides the ability to do stochastic integration as efficiently as
deterministic integration.  This will be important for simulating chemical
systems, nervous systems, biological populations, weather, astronomical
many-body systems, social systems, and many others.

The present project is to create a differential equation solver that will use
Lebesgue integration.  The significance of the project will be to enable
Lebesgue integration in a general differential equation solver, thus making
stochastic representations of dynamical systems more efficient, and therefore
more feasible.

## Project structure

### gensde

### lebeng

### stovm

### manishow

### fpesolve

## Current research

At present, we focus on providing a solver that can handle general Stochastic
Differential equation models and runs in parallel using Charm++. This is our
milestone target for v1.0.

## Future research

After reaching the v1.0 milestone, our goal is to add the following features:

* All operations in posit arithmetics.
* Unit annotations for consistency checking.

## Funding

This work is funded by the Informatics PhD Program at UIUC and the ACM/SIGHPC
Computational and Data Science Fellows 2017 Program. In addition, this research
has been partially funded by the Citizen Network of Meteorological Stations
(RECIEM), Costa Rica.

## References

* Kale, Laxmikant V., and Sanjeev Krishnan. "CHARM++: a portable concurrent
object oriented system based on C++." In ACM Sigplan Notices, vol. 28, no. 10,
pp. 91-108. ACM, 1993.
* Gustafson, John L., and Isaac T. Yonemoto. "Beating Floating Point at its Own
Game: Posit Arithmetic." Supercomputing Frontiers and Innovations 4, no. 2
(2017): 71-86.
