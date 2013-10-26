setup
setUp
	super setUp.
	stream := WriteStream on: (String new: 10).
	instance stream: stream.