# dynamical-matrix-matlab
A 200-line MATLAB code for calculating the dynamical matrix using the Tersoff potential

## Features

* This is a pedagogical code for teaching some basics of harmonic lattice dynamics.
  * Forces and force constants are calculated by using finite difference from the Tersoff empirical potential.
  * The dynamical matrix at the Gamma point is constructed from the force constants and the phonon density of states (DOS) is calculated from the eigenvalues of the dynamical matrix. 
  * Nowadays no one would calculate the phonon DOS in this way, but I believe this code has pedagogical value. It can also serve as a starting point for building a phonon NEGF (nonequilibrium Green's function) code. I will publish such a code later. 
  
## File organizations

* There are two scripts:
  * test_F.m
  * test_D.m

* The "test_F.m" script calls the "find_r", "find_neighbor", and "find_F" functions.

* The "test_D.m" script calls the "find_r", "find_neighbor", and "find_D" functions.

* Both the "find_F" and "find_D" functions call the "find_E" function.
  
## Unit system

* I use the following basic units:
  * Length: Angstrom
  * Mass: amu (atomic mass unit)
  * Energy: eV
  
* Other units are then derived.

## Running the examples

* Run the "test_F.m" script to test whether the force on each atom is zero. This takes about one second. 
  
* Run the "test_D" script to get a phonon DOS plot. This takes about one minute. 

## Contact

* Zheyong Fan: brucenju(at)gmail.com

