I run a block in a separate image and communicate the value back using OSProcess.
Exceptions are properly serialized in the remote image and locally resignalled, as if the block were evaluated locally.

Example:
	CIImageWorkder do: [ 1 + 2 ].
	CIImageWorker do: [ 1 / 0 ].