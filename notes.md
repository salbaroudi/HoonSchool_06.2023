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
    - **Our indexing starts at 1, not 0 (!!!)**
    - We never display a slot for the root node, only the two sub-trees.
    - Any non-atomic node is represented by [] - only leaves are represented as data in our cell notation.
    - **A Visual Checksum:** Count the number of closing brackets "]]]]]...." to check that you got the tree depth correct.

#### Tuples:

- Binary trees, when given a specific structure, are interpreted as tuples by Dojo. This is done by having a long branched tree, where one cell has an atom, and the other a nested cell.

```
[1 [2 [3 4]]]

/ \ 
1   /\
    2 \
      /  \
      3   4
```


#### Lark Notation:

- Urbit uses a relative notation to "traverse" a tree from root, to a specified node further down the tree.
- **Rules:**
    - Characters used: {-, +, <, >, .}
    - Format:
        - Begin with -,+ to indicate L/R, respectively.
        - Then switch to < > to indicate L/R, respectively.
        - Continue to alternate as you go down the levels...
        - Dot "." means Root.
            - we access the root of the tree with ".tree"

- Example 1: -.tree: the left subtree of "tree", from the root.
- Example 2: ->+.tree: left subtree, right sub-sub-tree, and right leaf of "tree".

- Note that our directions are read L -> R, and the structure's root node (.tree) is on the right.


#### Faces:

- Faces: We can name specific nodes, to avoid long strings of Lark notation.
- what happens if we use the same face variable multiple times in the same tree? Urbit will DFS to find the first one. We need to keep track of which one we want. Use the caret "^" character to specify which one you want.
- Urbits DFS: Keep going down the Left Branch until you find the "First" match.
- Example of Usage:
```
> =a [b=1 [b=2 [b=3 b=4]]]

//Go left, first result
> b.a
1

//Go left, then go right and left again (...repeat) until a third match found
> ^^b.a
3

```


#### Numeric Addressing of Trees:

- Use the plus operator and the index, follow by the tree reference. For example `+5.tree`, `+14.tree`...etc


### Nock:

The Nock system underlies how urbit mutates the state of its binary trees using clearly specified rules.

- For now, lets give a quasi-(more specific)-definition  of a function using our Binary Tree Structures: A binary tree with "variables", that is waiting to be computed **is a function**. When we fill in the values, we can reduce the tree down to an atomic output, or another binary tree.

- Instead of data-function, lets use subject-formula.
    - subject: the tree we wish to operate on.
    - formula: Our series of Nock codes (with parameter inputs). 
- All Nock code is a cell (our 2ple structure from above), in which a subject is placed in the first slot, and formula placed in the second slot.
- Nock has 12 rules for reducing and manipulating binary trees - these are given enumerations (0-11) instead of names. One says "apply Nock 11", not "rebalance sub-tree" when referencing the operations.
- CS Fact: Nock 0-5 rules are all that is needed for Turing Completeness. All other rules can be derived from these first five rules.

#### Nock Operators:

- ?[x]: reduce to 0 if x is a cell, 1 if an atom
- +[x]: reduce to the atom x plus 1
- =[x y]: Reduce to 0 if x and y are the same noun, 1 otherwise. 

#### Nock Formulas (Or Instructions) [NockRules]: 
Subject (Input) ===> Nock Formula.
Example: [[5 6] [7 8]]  [0 2]

1) [0 b]: Reduce to noun at address b
2) [1 b]: Reduce to a constant noun b
3) [2 b c]: Treat b and c as formulas, resolve each against the subject, then compute nock again with the product of b as subject,
and c as a formula (?)
4) [3 b]: Compute formula b on a subject. Return 0 if its a cell, and 1 if an atom.
5) [4 b]: Compute the formula b on the subject, and increment the result by 1 (if an atom)


### Runes:

- A rune is essentially a funciton call, that is referenced by a two symbol name.
    - This allows for very dense code.
    - Each rune consists of a prefix and suffix (such as col-hep, or tis-lis).
- Runes evaluate from the most nested, and then outwards (order of operations). 
- So For example:
    1) `:- :- 1 2 3`: we do (:- 1 2) first, and then (:- [1 2] 3) next.
    2) :- 1 :- 2 3: we do (:- 2 3) first, and then :- 1 [2 3]
- A table of all possible rune symbols is below. 

### Nocking with Hoon:

- Tislet Rune (=+): Takes two inputs. Sets the first as the "head" of the subject, while the second is a hoon expression


## Week 2:

- Running Nock Code: Use .* Rune. Format: `.* [subject] [formula]`
- True and false types:
    - %.n = False = 1 (@ud)
    - %.y = True = 0 (@ud)

- Hoon is technically built on top of Nock. 
    - C Programming Analogy: Hoon is C, Nock is Assembly code.

- Limbs: Are parts of the Binary Tree.
- Wings: Are combinations of limbs of the Binary Tree.

- Hoon Code Formatting:

1) Tall Code: This is the underlying (basic) form of code. It can be written two ways. With double+ spaces, or line breaks. For example:

```
:-  1  :-  2  3

OR

:-  
1
:- 
2
3
```

2) Wide Code: Similarly, this is written with Parens, and uses single spaces:

```
:-(p q)
```

3) Sugar Code:

```
[p q]
```
- Note that Wide and Sugar code can be substituted into Tall code, but Tall code cannot be substituted into the other two.
    - guess: this is because tall code is not delimited, but Wide and Sugar are (parsing errors).




### References:

[NockRules] https://developers.urbit.org/reference/nock/definition