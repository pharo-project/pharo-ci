An ImageWorker is the new image forker stuff. It will use Seamless stuff to communicate with the forked image.

Example : 

a := ImageWorker new.
b:= a evaluate: [ 1+2 ].
b inspect.