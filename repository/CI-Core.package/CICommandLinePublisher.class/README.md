A CICommandLinePublisher is a publisher which publish on the shell directlty.

Try : 

result := CIValidationResult failure: 'Testing !'.
CICommandLinePublisher publish: result.