---
title: Simplicity
date: 2023-07-26
draft: false
---

# Simplicity, Efficiency, and the Art of Learning

## Introduction

#### Why am I writing this blog post?

My work involves modeling *complex biological systems* and *networks* using mathematics. Mathematical models are valuable tools for understanding biological systems and processes. 

However, biological systems are incredibly complex, so models must balance realism with simplicity. Simpler models are more robust and generalizable despite not capturing every detail.

For example, the SIR model is one of the simplest models of infectious disease spread. It divides the population into three compartments - Susceptible, Infected, and Recovered (hence the name SIR model). Despite its simplicity, the SIR model provides key insights into herd immunity, the impact of vaccination, and epidemic dynamics. 


Let's have a look at the SIR model diagram below to understand the power of simplicity:

![Susceptible, Infected & Recovered Model](sir.svg)



1. This SIR model diagram is helpful for people to understand infectious disease spread, regardless of their academic background. This is because it involves a simple diagram that can be easily visualized and followed, rather than jargon-filled equations.
2. Despite its simplicity, a mathematician can still write down equations describing the SIR model. The three-compartment structure lends itself well to mathematical analysis.

### SIR Model Math Equations

![SIR Model Math Equations](equation.svg)

3. A computer programmer can then take those equations and plot simulations of disease spread under different conditions. The programmer also has the flexibility to add complexity to the model since the framework is robust.


### SIR Model Coding

![Simulating the model in python](py.svg)



4. We can then design effective policies to control disease outbreaks based on the model predictions.

![Prediction Based on SIR](sir_plot.png)

## Simplicity is the Backbone of Robustness

The above modeling made possible because the SIR model focuses on abstracting the complex real world into a simple model. Rather than trying to incorporate every detail initially, it starts simple, and complexity can be added later. This demonstrates why beginning with simplicity is so valuable in biological modeling. It enables clear understanding, mathematical tractability, computational simulation, and practical applications. Starting simple and flexible provides a strong foundation before adding complexity where needed.

Similarly, we can look at a simple biological model of HIV infection progression shown below.

This diagram summarizes the key stages of HIV infection in a person through a simple sequence. Despite being a simplification, it captures the essence of HIV pathogenesis - initial exposure, viral replication, immunosuppression leading to AIDS, and eventual death. 

![HIV Infection](hiv.svg)

These examples of simple sequence models demonstrate the power of abstraction and simplicity when modeling complex biological phenomena. Identifying the key agents and transitions enables mathematical analysis, computational implementation, and communication with diverse audiences. Beginning simple lays a robust and flexible foundation to build upon. 

## Information and Complexity Can Be Distracting and Inefficient

Here, we will discuss the downsides of overloading with information and complexity. We will talk about cognitive load, decision fatigue, analysis paralysis, etc. and how they affect creativity and efficiency.

## Learning New Things Requires Starting from an Empty Slate

We will further dive into the concept of "beginner's mind" or "Shoshin". We will go through the discussion of how preconceived notions or biases can hinder learning. I might share my personal experiences of learning new programming languages like Go or complex concepts in population genetics.

## Human Mind Thinks in Logarithmic Fashion, It's Important to Make It Efficient

In this section, I will explain how the human mind perceives information in logarithmic terms. I will explain how this affects our learning, decision-making, and perception of the world. I will also provide some tips on how to leverage this for efficient learning.

## Conclusion: Simplicity in Complexity

The power of simplicity shines through in the Stable Marriage Problem. 
Here's how the algorithm starts:
![The Problem of Stable Marriage](stable_marriage.svg)
The algorithm proposes, rejects, and makes new proposals. It's all done in an orderly and systematic manner: 
![The Solution for Stable Marriage](stable_marriage_sol.svg)

By applying a straightforward matching algorithm, we find optimal pairings without conflict. This seemingly trivial example reveals a profound truth: reducing complexity often reveals elegant solutions. Whether unraveling biological mysteries, economic challenges, or even the game of love, seeking simplicity in the complex allows us to see otherwise hidden patterns. Simplicity enables understanding. Algorithmic thinking is a tool to cut through entanglement and find clarity. Like mathematicians, we can leverage the strength of simplicity in our lives to discover more robust and beautiful solutions. The Stable Marriage Problem has had far-reaching impacts, with critical applications in markets and medicine. Its creators were even awarded the Nobel Prize in Economics[^1^] for the robust framework it provides. This playful puzzle illustrates how simplicity can elucidate solutions to complex societal challenges. By cutting through complexity, we can uncover more profound truths.



[^1^]: “The Sveriges Riksbank Prize in Economic Sciences in Memory of Alfred Nobel 2012.” NobelPrize.Org, https://www.nobelprize.org/prizes/economic-sciences/2012/summary/. Accessed 8 Aug. 2023.

