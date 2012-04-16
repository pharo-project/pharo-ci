Gofer new
    squeaksource3: 'Handles';
    package: 'Handles';
    load.
	
Smalltalk recreateSpecialObjectsArrayForHandle.
SCHandle useSC.


"Hard code rule !!!!"
"ImageMorph allInstances first image: ((Form fromFileNamed:'./Doc/Handle.png') scaledIntoFormOfSize:(ImageMorph allInstances first image extent))."

(Smalltalk saveAs: 'HandlesImage.image') 
	ifFalse: [ Smalltalk snapshot: false andQuit: true ].