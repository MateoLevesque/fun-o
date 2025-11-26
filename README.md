# FUN-O
*fun-o* is a collection of modules for phonologists using SWI-Prolog. The main goal with these modules is to make the process of phonological analysis easier ,faster and a bit more understandable.

# Supported languages
For now the only supported language is French. There will be more implemented in the futur like German, Norwegian or Spanish.

# Before you start
This is still in early development so the precision or the completeness of the different files might not be optimal. All implemented functionalities work but no precision testing has been done yet. 

# Installation
First of all, you must have a working [SWI-Prolog](https://www.swi-prolog.org/) installation.

## Linux
Run the following commands at the root of your project.
```{bash}
mkdir fun-o
cd fun-o
git clone https://github.com/MateoLevesque/fun-o.git
```

# Usage
Once you have the files in your project, then you will need to paste this line near the top of the `.pl` files where the module is needed:
```{prolog}
:- ['fun-o/fun-o']
```

You can see in the next section most of the functionalities and how they work.

# Current functionalities
To have a more complete understanding of the different terms and rules see the comments in the according files.

Here you can find a list of functionality and terms that are used in the module:

## Phoneme Dictionary
For now there is only one dictionary. The one implemented right now is quite simple and only has 2 arguments. The term is `phoneme/2`. For example: `phoneme(i, vowel).` this is quite simple but useful in some cases. Now I'm working on a second one that aims to replace the actual one. This new dictionary will work with Definite Clause Grammars (DCG) and will be even more useful. 

## Sonority analysis
You can work with the sonority principle with the module `sonority.pl`.

## Syllable parsing
The actual model we have for syllable parsing is quite simple. It seems to work fine but I didn't do proper testing nor precision calculation. You can use the syllable parsing terms in the `syllable.pl` file.

# Functionalities to implement in the future
Just to clarify, functionalities that are listed below might not be added in the future. There implementation will depend on whether I find them useful enough.

## Grapheme to Phoneme conversion (In progress)

## Mora analysis

## Stress classification

## Metrical feet analysis.

## Phono-morphology change prediction.

## Calculate the odds that a certain phoneme is presided or followed by another. ("Latent Phonological analysis")

## OT implementation possibilities.

## SPE rules creator. (takes an underlying form and a context and automatically figures out the surface form)

## And others...

# Information on the project
Below, you will find some useful information about the project.

## Why?
This project was intended to fulfil a university project for my bachelors degree. Since the project changed subject, I still wanted to work with Prolog so I started experimenting with it. I like phonology and merging phonology and computing so this project is also a way to fulfil these likings.

