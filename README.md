# FUN-O
*fun-o* is a collection of modules for phonologists using SWI-Prolog. The main goal with these modules is to make the process of phonological analysis easier ,faster and a bit more understandable.

# !Important!
For now the only language supported is French. More language will likely be supported in the future.

### Linux
```{bash}
mkdir fun-o
cd fun-o
git clone https://github.com/MateoLevesque/fun-o.git
```

Then you need to also paste this line near the top of your `.pl` files :
```{prolog}
:- ['fun-o/fun-o']
```

Now you have a working installation of the module you can start using it. You can see in the next section most of the functionalities and how they work.

# Current functionalities
Here you can find a list of functionality and terms that are used in the module.

## Phoneme dictionary
The term `phon/2` is a term that hold the value of each French phonemes. The arguments of this term are the phoneme itself and 

## Functionalities to implement in the future
Just to clarify, functionalities that are described below may or may not be added depending on whether I find them worthy/fun enough to mess around with. But there are some of my ideas:

- Automated phonological transcription.
- Mora counter
- Stress classification
- Metrical feet analysis.
- Phono-morphology change prediction.
- Calculate the odds that a certain phoneme is presided or followed by another. ("Latent Phonological analysis")
- OT implementation possibilities.
- SPE rules creator. (takes an underlying form and a context and automatically figures out the surface form)
- And others...

## Why ?
Mostly for fun and to learn Prolog since it seems to be an extremely powerful language, but also because I'm genuinely interested about finding the applications of a tool like Prolog in phonology.
