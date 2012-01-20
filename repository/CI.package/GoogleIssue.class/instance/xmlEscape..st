integration-private
xmlEscape: aString
	"a poor man's convert... :/"
	| map |
	map := Dictionary newFromPairs: #(
				$" '&quot;' 
				$' '&apos;' 
				$< '&lt;' 
				$> '&gt;' 
				$& '&amp;').
	
	^ String streamContents: [ :s|
		aString do: [ :c|
			map 
				at: c 
				ifPresent: [ :mapping| s nextPutAll: mapping ] 
				ifAbsent: [ s nextPut: c]]]. 