I'm an abstraction which provide default way to fork the current image and run a block.

Example: 
"CIImageForkerBlock is a subclass wich implement needed stuff"
CIImageForkerBlock forkDo: [ 1+2 ]

Should result 3 :)

Extension for block provide : [ 1+2 ] valueInForkedImage 