helper
publishList: list kind: kind do: block
	| selectBlock |
	selectBlock := [ :each | each isKindOf: kind ] .
	list
		select: selectBlock
		thenDo: [ :each | 
			itemId := itemId + 1.
			self stream << '<li class="list-group-item">'.
			block value: each.
			self stream << '</li>'. ].
	^ list reject: selectBlock