Optical Bloch Waves
===================

Background
----------

This simulation calculates the transmission and reflection coefficients for light passing through a layered material.  Additionally, it calculates the angle of maximal transmission of the light.  The calculation is based on a set of lecture notes by Dr. Peter Beyersdorf for his PHYS 208 class; these notes are saved in the directory labeled "reference".

Input
-----

As per the lecture notes we assume that the light waves are described by periodic Bloch waves.  All of the simulation parameters are listed in "lib/declare\_parameters.m".  In this simulation, the indices of refraction should be real, positive numbers because complex indices of refraction may result in erroneous outputs.

Output
------

Running "lib/simulation.m" will output a series of graphs and an optimal angle.  The graphs describe the real and imaginary parts of the transmission and reflection coefficients (t and r respectively) as well as the total transmission and reflection of the light through the system (T and R respectively).  The optimal angle is printed in the Matlab output window.
