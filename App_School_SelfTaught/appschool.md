## App School  (Self-Taught) Notes:

At the time of writing, The 23' Zorp Hackathon will begin 1 week after HSL ends. I don't feel this is sufficent time to learn apps and produce an application that is complex enough to present at Assembly Lisbon 23'. 

To better prepare for the hackathon, I am teaching myself App School. These notes are pulled from the urbit.org Developer's portal, Neal Davis's Hoon School Notes and Blog, as well as other sources. Lets begin.

## Glossary:

- Arvo: Urbits 
- Noun: A noun is an atom (a single value +ve integer), or a cell of two nouns.
- Core: A special cell that pares operations to data.
- Arms: The comptation portion of a core.
- Legs: THe data portion of a core.


##  Lesson 1: Arvo and Creating Simple Agents:

- Def: App: the entire desk you are distributing.
- Def: Agent: A single process running on a particular Desk.
- Analogy of an Agent: It is a state-machine. It must respond to all possible outputs, and act accordingly to transition to another state.
    - It is a piece of software that maintains and distributes a stateful structure.
    - It has an interface that lets other entities interact with it.
    - It transitions based on a predefined function and input, and must guarentee that the next state is valid.

- use faslus (/+) to import libraries from /lib on Mars.

## Lesson 2: The Agent Core:

