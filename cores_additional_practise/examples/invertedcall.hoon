::Notice:  Our arm call is on top. 
:: Also: To feed an input n, we need to run this as a generator.
|=  n=@ud
=<
(add-one n)
|%
++  add-one
  |=  a=@ud
  ^-  @ud
  (add a 1)
--
