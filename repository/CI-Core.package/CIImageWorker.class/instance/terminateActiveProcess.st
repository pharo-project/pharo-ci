private - forked image
terminateActiveProcess
	"Terminate the current UI process in the freshly spawned image.
	This way we can be sure to not have any nast side-effects from the pending stack.
	The forked  image will contain the full stack of the original image, thus it is not guaranteed that the exuction in the new image is properly stopped."
	 
	| currentProcess semaphore |

	semaphore := Semaphore new.
	currentProcess := Processor activeProcess.

	[ 
		"suspend the current UI process, terminating it would cause all pending #ensure: blocks to be evaluated which can cause unwanted side-effects"
		self inform: 'terminateActiveProcess'.
		[ currentProcess suspend ] on: Error do: [ :error | ].
		semaphore signal.
	] fork.

	semaphore wait.
	Error signal: 'Should not get here'