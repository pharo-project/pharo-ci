private
coreTests
	^ TestCase allSubclasses select: [ :class|
		class isAbstract not
			and: [
				#('KernelTests-Objects' 'KernelTests-Exception') anySatisfy: [ :package|
					class category beginsWith: package ]]].