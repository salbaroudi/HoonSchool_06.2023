::Paste into Console
=/  adder
|%
++  add-one
  |=  a=@ud
  ^-  @ud
  (add a 1)
++  sub-one
  |=  a=@ud
  ^-  @ud
  (sub a 1)
++  mul-two
  |=  a=@ud
  ^-  @ud
  (mul a 2)
++  div-two
  |=  a=@ud
  ^-  @ud
  (div a 2)
--
:: Notice: We call an arm, and the inner gate is compiled, which accepts one input.
:: We then use the sugar synxat to call this gate on input 5
(add-one.adder 5)