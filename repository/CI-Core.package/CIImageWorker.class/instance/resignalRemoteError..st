private
resignalRemoteError: remoteError
	"Resignal the remote error as if it were caused in the #value method of the CIImageWorker.
	Note that the remote image pruned the stack up to the #evaluateBlock method."
	| signalerContext |
	
	signalerContext := self remoteErrorRootContext.
	"1. reattach the outermost context of the remote error to the current context"
	remoteError signalerContext bottomContext privSender: signalerContext.
	
	"2. Make sure we start the error handler lookup in the current context chain"
	remoteError privHandlerContext: signalerContext.
	
	"3. pass/resignal the remote error"
	self cleanUp.
	remoteError pass.