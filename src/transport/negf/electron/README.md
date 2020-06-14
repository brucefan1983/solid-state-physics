# RGF-electron-matlab
A 100-line MATLAB code for the recursive Green's function method for electron transport


## Features

* This is a simple but working code for calculating the electron transmission in the Anderson square lattice model.
* This code was used to do some calculations in a review article (to be submitted).
  
## File organizations

* A script for testing:
  * test_ballistic.m: calculates the transmission in the absence of Anderson disorder

* The testing script calls
  * the driver function "find_T" to do the calculations

* The driver function "find_T" calls
  * the "find_H" function to construct the tight-binding Hamiltonian
  * the "find_Sigma" function to calculate the self-energies
  * the "find_T1" function to calculate the transmission for a single energy point and a single disorder realization
  
* The "find_Sigma" function calls 
  * the "find_g00" function to calculate the surface Green's function
  
## Unit system

* I use the following basic units:
  * Length: lattice constant a=1
  * Energy: hopping integral t=1

## Running the examples

* Run the "test_ballistc.m" script to get the ballistic transmission in a square lattice with a width of 2.

## Contact

* Zheyong Fan: brucenju(at)gmail.com

