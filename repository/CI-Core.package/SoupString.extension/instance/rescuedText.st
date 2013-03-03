*CI-Core
rescuedText

	| map result |
	map := OrderedCollection newFrom: {
				 '&amp;quot;' -> '"'.
				 '&amp;apos;' -> ''''.
				 '&amp;lt;' -> '<'.
				 '&amp;gt;' ->'>'.
				 '&amp;' -> '&'}.
				
	result := contents.
	map do: [:pair | result := result copyReplaceAll: pair key with: pair value ].
	^ result