printing
name

	^ String streamContents: [:s | s << self id asString << ': ' << self title ]