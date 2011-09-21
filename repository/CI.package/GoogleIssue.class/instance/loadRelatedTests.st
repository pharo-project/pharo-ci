loading
loadRelatedTests
	^ TestCase allSubclasses select: [ :class|
			class isAbstract not
				and: [
					self relatedPackages anySatisfy: [ :package|
						class category beginsWith: package ]]].