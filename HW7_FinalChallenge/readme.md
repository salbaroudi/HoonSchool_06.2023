## Hoon School Live: Final Challenge:

For HSL 23' Final Challenge, I attempt to implement a specialized O(n) algorithm called Counting Sort. Given an array of numbers from 1...n, with a range of elements from 0...k (k <= n), we can sort our array in **O(n) time**. Duplicates are permitted, and some numbers within the range may be omitted.

The Pseudocode for Counting Sort [1] is Below:
```
//Let A be our input array with slots 1...n
//Let B be our output array (empty/zeroed) with slots 1...n
//Let C be an auxilliary support array indexed as 0...k
CountingSort(A,B,k):
    // 1 - Initialize Auxiliary Array
    for i=0...k
        C[i] = 0

    // 2 - Tally the number of times an element appears, 
    // and store in a slot of C.
    for i=1...n:
        C[A[i]]] = C[A[i]] + 1

    // 3 - Perform a Summation, which tells us how many 
    // elements are <= to the element in slot 1...j...k of C
    for i=1...k
    C[i]= C[i] + C[i-1]

    // 4 - Build our sorted array B, using some clever manipulations.
    for i = len(A) ... 1
    B[C[A[i]]] = A[i]
    C[A[i]] = C[A[i]] - 1
```

Counting Sort is interesting, in that it uses **no comparisons**, and derives order information from the tallying of elements that appear in our Array C. 

Unfortunately, Hoon does not have random-access read/writes of arrays. As of writing, Hoon only has experimental arrays (not yet merged into standard libraries), and lists are not random access. Thus, the time complexity of this implementation is likely O($n^2$) or higher. Hoon will need a jet for random-access of arrays to get to O(n).

### Conclusions:

This code was done to to try writing an imperative algorithm in functional Hoon code.  I learned a basic programming pattern for writing small programs in hoon, which is structured as the following [2]:

```

|=  [numlist=(list @ud)] 
=<
=\ var a
=\ var b
=\ ...<legs that store data and calculated values...>

[(chain of nested calls for computing a value)]


|%
++ arm1 
++ arm2 ...
++ <...core with many arms, 
which does most of our computations>
--

```


The algorithm does work and can be improved in-terms of space/time efficiency. However, until arrays become a thing in Hoon...it might best to leave this curious example for now.

### Using Counting Sort:

Simply load countingsort.hoon as a generator on your Desk.  Run:

```
+countingsort  ~[1 2 2 1 3 1 4 5 1 1 2 6 3]
> ~[1 1 1 1 1 2 2 2 3 3 4 5 6]

```

### References:

[1] CLRS Introduction to Algorithms, 3rd Edition, Section 8.2 - Counting Sort, pgs 194-196. 
[2] Programming Pattern comes from ~talmut-modnys' caesar.hoon example. 