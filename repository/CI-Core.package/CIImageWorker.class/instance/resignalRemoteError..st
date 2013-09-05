private
resignalRemoteError: remoteError
	"Resignal the remote error as if it were caused in this method.
	Note that the remote image pruned the stack up to the #evaluateBlock method."
	
	"1. reattach the outermost context of the remote error to the current context"
	remoteError signalerContext bottomContext privSender: thisContext.
	
	"2. Make sure we start the error handler lookup in the current context chain"
	remoteError privHandlerContext: thisContext.
	
	"3. pass/resignal the remote error"
	remoteError pass.