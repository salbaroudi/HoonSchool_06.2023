|=  n=@ud  ::Define a gate.
:: A bunch of legs  for storing data.
=/  index  0
=/  p  0
=/  q  1
=/  r  *(list @ud)
:: We set a trap.
|-  ^-  (list @ud)  ::trap must return a list of @uds (typecheck)
?:  =(index n)  r  :: is index = n? If so return r (our list of results)
~&  >  [index p q r] ::Print to console: a cell of index, p q r for each call.
%=  $ :: For the last child of ?:, we throw in our centis call. Call the $ arm of the trap with modified values to traverse...
  index  +(index)
  p      q
  q      (add p q)
  r      (snoc r q) ::"Magic" of making the list is here, in the r modification.
==

::As a general programming paradigm for gates. Put a trap at the end with a %= as the last child (for arm calls and manipualtions).
::