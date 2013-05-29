An ImageWorker is the new image forker stuff. It will use Seamless stuff to communicate with the forked image.

Example : 

ImageWorker evaluate: [ 1+2 ].

/_\ WARNING /_\

You have to use asLocalObject !
Exemple:

ImageWorker evaluate: [ ConfigurationOfCI asLocalObject load ].

ImageWorker evaluate: [ ConfigurationOfCI load ]. Will not work and crash you current image