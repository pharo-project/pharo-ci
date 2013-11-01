publishing
publishList: collection title: titleString color: color
	
	VTermOutputDriver stderr 
		color256: color;
		<< titleString; clear.
	
	"Shortcut form if there is only one message"
	collection size = 1
		ifTrue: [ ^ VTermOutputDriver stderr space; << collection first asString; lf; flush ].
	
	VTermOutputDriver stderr lf.
	collection do: [ :aMessage |
		VTermOutputDriver stderr 
			<< '    - '; << aMessage asString; lf; flush ]