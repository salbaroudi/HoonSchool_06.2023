## Hoon School Live: Final Challenge:


Now that HSL is finished, it is time to put all of the pieces that were presented, into a basic program.

For my Final Challenge, I choose to implement a specialized O(n) algorithm called Counting Sort. Given an array of numbers from 1...n, with a range of elements from 0...k (k <= n)>, we can sort our array in **O(n) time**. Duplicates are permitted, and some numbers within the range may be omitted.

The Pseudocode for Counting Sort[] is Below:
```
//Let A be our input array with slots 1...n
//Let B be our output array (empty/zeroed) with slots 1...n

CountingSort(A,B,k):
    // 1 - Initialize Auxiliary Array
    for i=0...k
        C[i] = 0

    // 2 - Tally the number of times an element appears, 
    // and store in a slot of C.
    for i=1...n:
        C[A[i]]] = C[n] + 1

    // 3 - Perform a Summation, which tells us how many 
    // elements are <= to the element 
    // in slot 1...j...k of C
    for i=1...k
    C[i]= C[i] + C[i-1]

    // 4 - Build our sorted array B, using 
    // some clever manipulations.
    for i = len(A) ... 1
    B[C[A[i]]] = A[i]
    C[A[i]] = C[A[i]] - 1
```

Counting Sort is interesting, in that it uses **no comparisons whatsover**, and derives order information from the tallying of elements that appear in our Array A, to derive order information for the elements. 


Some features that are shown in this program:

* Comments
* Custom Testing:
    * I can't actually run a -test thread with my current urbit...so I'll make a crude test script instead.
* Importing from the /lib folder.
* Using data structures (specifically, lists in place of arrays)
* Usage of functional programming gates (such as turn)
* Usage of regular-recursion / tail-recursion in place of for-loops.


### References:

[1] CLRS Introduction to Algorithms, 3rd Edition, Section 8.2 - Counting Sort, pgs 194-196. 
