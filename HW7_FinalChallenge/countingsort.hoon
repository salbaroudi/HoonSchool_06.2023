::Counting Sort Algorithm
:: Sean al-Baroudi (~nodsup-halnux)

:: Counting Sort Gate. Input: List of whole numbers, including zero.
|=  [numlist=(list @ud)] 
=<  :: Better to have top-level code here, and support cores at the bottom.

    =/  k  (getmaxelement numlist) ::K counts the number of unique elements.
    =/  itest  (inputtest numlist k) ::Just to run an arm that checks for a valid input.
    =/  auxlist  (genlist (add k 1))  ::Note:  This is our "Array C ".  From 0...k, so add one.

    :: (1) Our computation (4 loops in an imperiative algorithm) has been rendered as a bunch of chained arms.
    (sorttrap numlist (sumtrap (tallytrap numlist auxlist) k))

    :: (2) Our core below contains a number of different arms.All the arms below will assist in our top level computation.
    |%
    ++  infoarm  "CountingSort Version %9999K."
    ++  genlist  |=  [n=@ud]
        ^-  (list @ud)
        (reap n 0)
    ++  inputtest  |=  [nlist=(list @ud) k=@ud]
            ?:  |(=(k 0) =((lent nlist) 1))  ~&  "Error: Max element is zero, or length of list < 2. Check Input."  !!  "OK"
    ++  getmaxelement  |=  [li=(list @ud)] 
        ^-  @ud
        =/  k  0
        |-
          ?~  li  k
          ?:  (gte i.li k)  %=  $  k  i.li  li  t.li  ==
          $(li t.li)
    ++  tallytrap  |=  [nlist=(list @ud) alist=(list @ud)]
        ^-  (list @ud)
            |-
                ?~  nlist  alist
                %=  $  alist  (snap alist i.nlist (add 1 (snag i.nlist alist)))  nlist  t.nlist  ==
    ++  sumtrap  |=  [alist=(list @ud) k=@ud]
        ^-  (list @ud)
            =/  range  (gulf 1 k)
            |-
                ?~  range   ~&  alist  alist
                %=  $  alist  (snap alist i.range (add (snag (sub i.range 1) alist) (snag i.range alist)))  range  t.range  ==
    ++  sorttrap  |=  [nlist=(list @ud) alist=(list @ud)]
        ^-  (list @ud)
            =/  revrange  (flop (gulf 0 (sub (lent nlist) 1)))
            =/  sortlist  (genlist (lent numlist))
            |-
                ?~  revrange  (slag 1 sortlist)  :: List from n...1 (reversed)
                =/  nelem  (snag i.revrange nlist) ::A[i]
                =/  auxelem  (snag nelem alist) ::C[A[i]]
                ::~&  "RR:"  ~&  revrange  ~&  "SL:"  ~&  sortlist  ~&  ~&  "nelem:"  nelem  ~&  "aelem:"  ~&  auxelem
                %=  $  sortlist  (snap sortlist auxelem nelem)  alist  (snap alist nelem (sub auxelem 1))  revrange  t.revrange  ==
    --
