image-creation
terminateActiveProcess
	"Terminate the current UI process in the freshly spawned image.
	This way we can be sure to not have any nast side-effects from the pending stack.
	The forked  image will contain the full stack of the original image, thus it is not guaranteed that the exuction in the new image is properly stopped."
	 
	| currentProcess semaphore |

	semaphore := Semaphore new.
	currentProcess := Processor activeProcess.

	[ | queue nextInQueue|
		"kill the current UI process"
		[currentProcess terminate] on: Error do: [ :error | ].
		"process the pending ui messages to make sure we activate the commandline handler!"
		queue := WorldState deferredUIMessages.
		[(nextInQueue := queue nextOrNil) isNil] whileFalse: [ nextInQueue value]. 
		
		semaphore signal.
	] fork.

	semaphore wait.
	Error signal: 'Should not get here'