::We can illustrate the difference by trying to make a quadratic function.

:: Consider doing this with a gate:
=poly-gate |=  [x=@ud a=@ud b=@ud c=@ud]
(add (add (mul a (mul x x)) (mul b x)) c)

=wrapped-gate |=  [x=@ud]  ::our input value x
=/  a  5 ::three legs that store our constants.
=/  b  4
=/  c  3
(poly-gate x a b c) ::our gate call...we have to provide 4 inputs everytime!


::Versus a Door:
::To run, we call quad poly and populate the sample with a b c vals. This gives us a gate, which we call with value 10
=poly |_  [a=@ud b=@ud c=@ud]
++  quad
  |=  x=@ud
  (add (add (mul a (mul x x)) (mul b x)) c)
--
%~  $  %~  quad  poly  [5 4 3]  10
