helper
publishChangeNotFound: changeNotFound
	self publishResultGroupWithTitle: 'Could not Find Change' with: [ 
		self stream nextPutAll: changeNotFound change name asString.
		changeNotFound locations ifNotEmpty: [ :locations |
			self stream << '<ul>'; lf.
			locations do: [ :location |
				self stream << '<li>'; << location asString; << '</li>'; lf ].
			self stream << '</ul>' ]]