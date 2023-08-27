::Below, we have a simple counter recursion function. 

::As a trap: this will run without us explicitly calling the buc arm.
=/  index  1
|-
?:  (gth index 10)  "done! Made it to 10"
$(index +(index))


::As a gate: This does **NOT** run automatically. We get a core meta-data summary in dojo with this.
|=  n=@ud  
?:  (lth n 10)  n  $(n (add n 1))

:: To run it (without using the /gen folder on mars), we can do a few things.
:: Give it a name, and use censig to call an arm in a gate, with an input value.
=/  mygate
|=  n=@ud  
?:  (gth n 10)  n  $(n (add n 1))
%~  $  mygate  2

:: Or just call the arm, with the bunt value.
=>
|=  n=@ud  
?:  (gth n 10)  n  $(n (add n 1))
$