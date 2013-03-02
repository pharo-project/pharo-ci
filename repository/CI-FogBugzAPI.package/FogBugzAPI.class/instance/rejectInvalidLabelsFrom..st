private
rejectInvalidLabelsFrom: aCollection

	^ aCollection reject:[ :e | self knownLabels anySatisfy:[ :label | e beginsWith: label ]]