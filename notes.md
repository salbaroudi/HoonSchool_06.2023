## Week 0: Intro to Computing and Functional Programming:

#### Formal System:
- Axioms: starting points - facts that we assume to be true.
- Inference Rules: Operations that can be repeatedly applied to axioms to derive new truths.
- Anything that can be reached or derived from IRs...(Axioms).

- Why bother with formal systems? If we make a formal system for our computers...
    - This formal system has a theorem with property X <=> This computer can reach a state with X property.
    - All theorems of this system has Z property <=> All states of this computer have Z property.
    - You can make corresponsences between your formal system and the world it is modelling.
        - If the formal system has a property / theorem that is true <=> It is true in the world.

- Example: Simple System:
    Axiom: MI.
    IRs: 
        - xI -> xIU: add a U if string ends in I
        - Mx -> Mxx : double a string
        - xIIIy -> xUy:replace substring III with U

    A Theorem: 
        - MIU is a theorem, because we take the axiom and apply the first IR.
        - MIIII is a theorem, use axiom and apply rule 3 and then rule 1.
        - etc..

- Example: Addition:
    Axioms: nwhere n is a number, or:
        - add(a,b), sub(a,b), mul, div...
        - note that operations between two numbers are axioms here, and the definition recurses to basic number.
    IRs:
        - If a,b are numbers:
            - add(a,b) tree => a+b
            - ...div(a,b) tree => a/b
            - etc...
    - We can also use variables, and substitute other trees into variables....

The system above shows us the mechanics of functional programming. In imperative programming, we tell the computer how to do things (recipes and routines). In functional programming, all operations are functions that take inputs to outputs, and they are piped / composed together. Ideally, there is no state and it is carried though the input/outputs of each function.

In addition to composure and piping, we can also do 


## Week 1: 

**Urbit ID Basic Stats:**
- Planets: 2^32
- Stars: 2^16
- Galaxies: 2^8

- For the tutorials this week, we will be using Fakeships to practise using Urbit's underlying datastructures.

- The urbit binary, when run, has its own mini file system much like Linux. This system is collectively known as "Mars", and the Linux file system it is contained in is called "Earth".
- Urbit File System Root Folders:
    - /app:
    - desk/bill:
    - gen/: 
    - lib/:
    - mar/:
    - sur/:
    - sys/:
    - ted/:

- Analogy: We develop our scripts and code on Earth, and send them to run on Mars (in Urbit).
- Urbit organizes collections of code as "desks". 
- To see a desk from "Earth" It must be mounted in the dojo: `|mount %base`
- To update a desk (when we alter code on Earth), run `|commit %<deskname>`

#### Running Code in Dojo:
- we can write code inline.
- Note: Only syntactically correct code can be entered. The console cursor will freeze if you make a mistake.
- all nouns/entities for a line of code must be separated by **double-spaces**.
- Numbers > 999 must be separated by a dot, to delimit thousand units. So 1000 = "1.000".

#### Binary Trees:

- At the intermediate level of interpretation, your ship is a binary tree of integers...this is where your ships memory (state) resides.
- Urbit stores all ship information in a massive binary tree, and has predefined rules to transform/update the tree.


- Formal (Recursive Def) of Noun: A noun is an atom (a single value +ve integer), or a cell of two nouns.
- Nouns: Are atoms (basic pieces of data), or cells that can be nested arbitrarily. Examples:
    - Atoms (1,2,3...)
    - Cell: [_,_]
    - Cells of Cells.

- Binary Tree and Cells+atoms are isomorphic, you can build the former with the latter.
    - Our cells form the nodes and leaves, and our atoms fill the nodes+leaves with data.
- Binary Tree numbering is just Binary Heap Numbering from CS. So urbit numbers our binary trees as:

```
            1
        2       3
    4   5       6   7
8   9 ...

```
- If we have incomplete binary trees, missing nodes still retain their heap ordering (we don't skip counts).
- Visual Isomorphism for going between binary trees, and cell lists:
```
    (Root)           
   /     \        ===         [ <>  <> ]
  <>     <>
```
- Note:
    - We never display a slot for the root node, only the two sub-trees.
    - Any non-atomic node is represented by [] - only leaves are represented as data in our cell notation.


#### Lark Notation:

- Urbit uses a relative notation to "traverse" a tree from root, to a specified node further down the tree.



