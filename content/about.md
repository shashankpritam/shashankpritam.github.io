# Hi there!

Welcome to my little corner of the web. I'm currently working on my PhD in Computational Biology, with a focus on Population Genetics. It's fascinating stuff - all about understanding the genetic makeup of populations and how it changes over time. But enough about me, let's talk about something cool I've been working on!

## PPII Binding Site Predictor

This is a tool I've developed that has some interesting applications in biological research. 

### Quick Overview

- **Predicting PPII Binding Sites:** You just need to supply a 4-letter PDB ID (like 1CKA for instance), and the tool will highlight potential PPII helix binding sites within the protein's structure. 
- **Easy to Understand Outputs:** If there's no PPII binding site in your protein, the tool will clearly state that. But when it does find a site, it provides a detailed model showcasing the best possible orientation of the PPII bound structure. 

### Getting Started

You need Python 3.8.10 along with a few Python libraries (numpy, scipy, modeller, biopython) to run this tool. Just follow these steps:

1. Make sure you have the required Python version and libraries.
2. Download the tool from our repository.
3. Create a text file named `input_database.txt` listing the PDB IDs you want to analyze (one PDB ID per line).
4. Run this command in your terminal: `python3 pp2_pred_for_database.py input_database.txt`.

## Wrapping Up

You can find all the details about this project on its [GitHub page](https://github.com/shashankpritam/PPII-Interface). If you have any questions or need help, feel free to shoot me an email.

Thanks for visiting and happy exploring!
