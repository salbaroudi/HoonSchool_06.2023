::Counting Sort Algorithm
:: Sean al-Baroudi (~nodsup-halnux)


:: Steps of the Program.
:: Input of Matrix: Via Generator Call on Dojo.
    :: Check input:  not sig, and of type @ud for all elements.
    :: Get the maximum element in range, check it is less than length of A Array.
:: If all these tests pass, proceed. Else throw tapes at console and terminate program.

:: Build our C matrix => An array of size 0...k with zeros in each slot.

:: Algorithm:
    ::Just put everything into one big core to start.
    :: ++getmaxelem (return @ud)
    :: ++k<N arm to check (return loobean)

:: Build new Array B and C. 

:: Lets just write a simple outline for our code, for now. Using ~talmut-modnys's caesar.hoon code as a basic structure.
:: Effectively, we use a gate to accept inputs, and use our =< rune to structure our output cell and mega-core with all 
:: support code. I'll just write dummy code for arms I don't know how to code yet.

|=  [numlist=(list @ud)] 
=<  :: Better to have top-level code at top, and support cores at the bottom.

    =/  k  (add (getmaxelement numlist) 1)
    =/  sortlist  (genlist (lent numlist))
    =/  auxlist  (genlist k)
    [(sumtrap (tallytrap numlist auxlist) (sub k 1))]

    :: (2) Our core below contains a number of different arms, some with gates inside. All the arms below will assist
    :: in our top level computation (above).
    |%
    ++  testarm  "This is just a test arm."
    ++  fetch  |=  [i=@ud ll=(list)]  (snag i ll) ::Fetch an element at position i
    ++  place  |=  [ll=(list @ud) i=@ elem=@ud]  (snap ll i elem) ::overwrite an element at position i
    ++  genlist  |=  [n=@ud]  (reap n 0)
    ++  recursiontest  |=  [n=@ud]
            =/  index  0
            |-
            ~&  index
            ?:  =(index n)
            index
            %=($ index +(index))
    ++  getmaxelement  |=  [li=(list @ud)] 
        =/  k  0
        |-
          ?~  li  k
          ?:  (gte i.li k)  %=  $  k  i.li  li  t.li  ==
          $(li t.li)
    ++  tallytrap  |=  [nlist=(list @ud) alist=(list @ud)]
            =/  retlist  alist
            |-
                ~&  nlist
                ~&  retlist
                ?~  nlist  retlist
                %=  $  retlist  (snap retlist i.nlist (add 1 (snag i.nlist retlist)))  nlist  t.nlist  ==
    ++  sumtrap  |=  [alist=(list @ud) k=@ud]
            =/  retlist  alist
            =/  range  (gulf 1 k)
            |-
                ~&  range
                ~&  retlist
                ?~  range  retlist
                %=  $  retlist  (snap retlist i.range (add (snag (sub i.range 1) retlist) (snag i.range retlist)))  range  t.range  ==
    --

