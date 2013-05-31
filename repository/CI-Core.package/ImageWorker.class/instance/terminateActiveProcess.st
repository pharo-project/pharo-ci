image-creation
terminateActiveProcess
	| currentProcess semaphore |

	semaphore := Semaphore new.
	currentProcess := Processor activeProcess.

	[ 
		[currentProcess terminate] on: Error do: [ :error | "nothing because we don't care"].
		UIManager default spawnNewProcessIfThisIsUI: currentProcess.
		semaphore signal.
	] fork.

	semaphore wait.
	Error signal: 'Should not get here'