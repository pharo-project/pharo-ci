publishing
publishList: collection title: titleString color: color
	
	VTermOutputDriver stderr 
		color256: color;
		<< titleString;
		flush; clear.
	
	"Shortcut form if there is only one message"
	collection size = 1
		ifTrue: [ ^ VTermOutputDriver stderr space; << collection first asString ].
	
	VTermOutputDriver stderr lf.
	collection do: [ :aMessage |
		VTermOutputDriver stderr 
			<< '    - '; << aMessage asString; lf ]