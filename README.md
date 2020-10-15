# Improved Load Balancing in Large Scale Systems using Attained Service Time Reporting

This repository contains all functions required to reproduce the figures found in our publication "Improved Load Balancing in Large Scale Systems using Attained Service Time Reporting".

The repository is build up as follows :

 - *general_functions* : This contains the implementation of various algorithms presented in the paper.
 - *Simulation_code* : This contains the implementation of the finite dimensional simulation code. There is also an associated mex file, which is the file that is used to generate the simulation data.
generate_data_for_plots : Here we put the the functions which use the "general_functions" and "simulations_code" to generate the data required to make the plots/tables of the paper.
 - *data* : This is where the generated data is saved.
 - *generate_plots* : Here the data is used to create and save the figures used in our paper.
 - *figures* : Here the PDF files generated in create_figures are saved.
