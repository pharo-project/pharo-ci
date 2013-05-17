result handling main image
openCommunicationSocket

	readSocket := Socket newTCP.
	"chose a random port"
	readSocket listenOn: 0.
	communicationPort := readSocket port.