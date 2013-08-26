I output validation result as fuel-serialized files.

Try : 


result := CIValidationResult failure: 'Testing !'.
CIFilePublisher publish: result.