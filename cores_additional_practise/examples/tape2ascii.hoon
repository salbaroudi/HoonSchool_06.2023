:: This example has been modified to add additional computations and legs. Really, we can add as many as we want,
:: using this pattern. 

|=  [input=tape]  ::Tape input for our gate
=/  counter  0  ::set a counter leg
=/  results  *(list @ud)  ::(!) Note the star notation. Unfamiliar to me!
=/  results2  *(list @ud)
|- ::Kicked Trap time
?:  =(counter (lent input))  ::is our counter = length?
  :-  results  results2 ::if so, return results.
=/  ascii  `@ud`(snag counter input)  :: Another: We use snag to pull a character, and convert to an unsigned int.
=/  warped  (mul 2 `@ud`(snag counter input))
%=  $ ::retrun our trap with modified values
  counter  (add counter 1)
  results  (snoc results ascii)  ::in particular, build our results!
  results2  (snoc results2 warped)
==
