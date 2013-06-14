image-creation
terminateActiveProcess
	"Terminate the current UI process in the freshly spawned image.
	This way we can be sure to not have any nast side-effects from the pending stack.
	The forked  image will contain the full stack of the original image, thus it is not guaranteed that the exuction in the new image is properly stopped."
	 
	| currentProcess semaphore |

	semaphore := Semaphore new.
	currentProcess := Processor activeProcess.

	[
		[currentProcess terminate] on: Error do: [ :error | "ignore" ].
		UIManager default spawnNewProcessIfThisIsUI: currentProcess.
		semaphore signal.
	] fork.

	semaphore wait.
	Error signal: 'Should not get here'