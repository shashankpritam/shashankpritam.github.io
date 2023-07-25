---
title: "Intersecting Genetics and Computation"
---

Welcome to my webpage!



# Spotlight: Past Projects

## PPII Binding Site Predictor: Unveiling the Intricacies of Protein Structures

### Features at a Glance

**PPII Binding Site Prediction:** Feed the application with a 4-letter PDB ID (for instance, 1CKA), and it will return the potential PPII helix binding site within the structure. 

**User-Friendly Outputs:** If the structure you input doesn't house a PPII binding site, you'll be notified. However, when a PPII binding site is discovered, you'll be provided with a detailed model of the PPII bound structure, demonstrating the "best possible orientation" at the predicted binding site. 

### Getting Started

To run our application, you'll need numpy, scipy, modeller, biopython, and Python 3.8.10. We've tested the program on WSL Ubuntu 20.4. Ensure you have an active internet connection if PDB files are not already present in the pp2pred folder (database_folder).

Here are the steps to kickstart your journey with PPII Binding Site Predictor:

1. Install the required modules.
2. Ensure you have Python version >= 3.8.10 installed.
3. Clone or download our repository.
4. Create an input file named `input_database.txt` with a list of 4-letter PDB IDs to analyze (one PDB ID per line).
5. Execute the following command in your terminal: `python3 pp2_pred_for_database.py input_database.txt`.

### Licensing and Access

The PPII Binding Site Predictor project operates under the LGPL-2.1 License. 

You can find the PPII Binding Site Predictor repository [here](https://github.com/shashankpritam/PPII-Interface). For more detailed insights about the project, visit the project site [here](https://shashankpritam.github.io/PPII-Interface/).

For queries and assistance, don't hesitate to reach out via our contact email.