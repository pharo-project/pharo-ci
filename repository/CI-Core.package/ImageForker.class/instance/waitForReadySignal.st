image forking
waitForReadySignal
	"wait for the parent image's signal that it is ready to receive the validation result"
	[ FileStream stdin binary next = 1 ] whileFalse