:: Define a gate, with an input type of @ud
|=  n=@ud
|-  :: Our trap, that gets kicked.
~&  n  ::Display our n value fpr each iteration (apart of the $ arm)
?:  =(n 1)  ::is n = 1?
  1 :: If yes, return 1
%+  mul :: If no, call mul gate
n ::with first child n
%=  $ ::second chlid is a call expression on buc arm, with
  n  (dec n) ::...n-1
==



:: Alternative (Sugar Syntax Expression), with no trap.
|=  n=@ud
?:  =(n 1)
  1
(mul n $(n (dec n)))