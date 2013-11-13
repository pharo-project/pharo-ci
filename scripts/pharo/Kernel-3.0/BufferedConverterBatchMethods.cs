'From Pharo2.0a of ''18 April 2012'' [Latest update: #20266] on 22 August 2012 at 9:49:59 pm'!

!TextConverter methodsFor: 'conversion' stamp: 'HenrikSperreJohansen 8/22/2012 21:31'!
next: anInteger putAll: aString startingAt: startIndex toStream: aStream

        ^aStream isBinary 
		ifTrue: [ aStream basicNext: anInteger putAll: aString startingAt: startIndex ]
		ifFalse: ["self bufferedNext: anInteger putAll: aString startingAt: startIndex toStream: aStream"
			aString class == ByteString 
				ifTrue: [self next: anInteger putByteString: aString startingAt: startIndex toStream: aStream]
				ifFalse: [self bufferedNext: anInteger putAll: aString startingAt: startIndex toStream: aStream]]	      
! !

!TextConverter methodsFor: 'conversion' stamp: 'HenrikSperreJohansen 8/22/2012 20:51'!
nextPutAll: aString toStream: aStream
	"Handle fast conversion if ByteString"
	
	^self next: aString size putAll: aString startingAt: 1 toStream: aStream
! !

!TextConverter methodsFor: 'private' stamp: 'HenrikSperreJohansen 8/22/2012 21:47'!
bufferedNext: anInteger putAll: aString startingAt: startIndex toStream: aStream
        "Many streams pay a hefty overhead for nextPut: 
	Alleviate this by using a buffer we know has fast nextPut, and will be accepted by most stream batch primitives"
        
      | buffer bufferStream currentIndex endIndex | 
	"Assume at most 4 bytes per character, and use a buffer size of 65K"
	buffer := String new: (anInteger * 4 min: 65536).
	bufferStream := buffer writeStream.
	
	currentIndex := startIndex.
	endIndex := startIndex + anInteger.
	[currentIndex < endIndex] whileTrue:
		[currentIndex := currentIndex + (self encodeUpto: endIndex - currentIndex from: aString startingAt: currentIndex inBuffer: bufferStream ofSize: buffer size).
		 aStream basicNext: bufferStream position putAll: buffer startingAt: 1.
		 bufferStream reset].
	^aString copyFrom: startIndex to: currentIndex -1! !

!TextConverter methodsFor: 'private' stamp: 'HenrikSperreJohansen 8/22/2012 21:40'!
encodeUpto: toWrite from: aString startingAt: startIndex inBuffer: aBufferStream ofSize: bufSize
	"I encode toWrite, or as many characters from aCollection as can fit in the buffer, and return the actual amount of characters written"
	^aString class = ByteString 
		ifTrue: [self encodeUpto: toWrite fromByteString: aString startingAt: startIndex inBuffer: aBufferStream ofSize: bufSize]
		ifFalse: [self encodeUpto: toWrite fromCollection: aString startingAt: startIndex inBuffer: aBufferStream ofSize: bufSize]
	! !

!TextConverter methodsFor: 'private' stamp: 'HenrikSperreJohansen 8/22/2012 21:40'!
encodeUpto: anAmount fromByteString: aString startingAt: startIndex inBuffer: aBufferStream ofSize: bufSize
	| lastIndex nextIndex endIndex maxPos |
	self halt: 'This method not yet finished!!'.
	endIndex := startIndex + anAmount.
	"We must not write past end of buffer, or streams internal collection be inconsistent with that parent asssumes it to be; 
	here we make an assumption that all characters can be encoded using 4 bytes"
	maxPos := bufSize - 4.
		
	lastIndex := startIndex.
	[nextIndex := ByteString findFirstInString: aString inSet: latin1Map startingAt: lastIndex.
	(aBufferStream position + (nextIndex - lastIndex) < maxPos) and: [nextIndex ~= 0 and: [nextIndex >= endIndex ]]] whileTrue:
		[aBufferStream next: nextIndex-lastIndex putAll: aString startingAt: lastIndex.
		aBufferStream nextPutAll: (latin1Encodings at: (aString byteAt: nextIndex)+1).
		lastIndex := nextIndex + 1].

	aBufferStream next: endIndex - lastIndex putAll: aString startingAt: lastIndex.
	"Return how many characters from the string were actually written"
	^lastIndex - startIndex. 
		! !

!TextConverter methodsFor: 'private' stamp: 'HenrikSperreJohansen 8/22/2012 21:43'!
encodeUpto: toWrite fromCollection: aCollection startingAt: startIndex inBuffer: aBufferStream ofSize: bufSize
	"A general version which works with any collection of characters"
	| currentIndex endIndex maxPos |

	currentIndex := startIndex.
	endIndex := startIndex + toWrite.
	"We must not write past end of buffer, or streams internal collection be inconsistent with that parent asssumes it to be; 
	here we make an assumption that all characters can be encoded using 4 bytes"
	maxPos := bufSize - 4.
	[(aBufferStream position < maxPos)and: [currentIndex < endIndex]] whileTrue: [
		self nextPut: (aCollection at: currentIndex) toStream: aBufferStream.
		currentIndex := currentIndex +1].
	"Return how many characters from the collection were actually written"
	^currentIndex - startIndex! !


!UTF8TextConverterTest methodsFor: 'testing' stamp: 'HenrikSperreJohansen 8/22/2012 21:48'!
testNextPutAllStartingAtWideString
	"Test that WideString non-ascii characters are converted correctly when using next:putAll:startingAt:"
	|converter stream source converted |
	converter := UTF8TextConverter new.
	stream := (String new: 10) writeStream.
	source := 'abcdefågh' asWideString. "Notice å at 7, which is a non-ascii character in latin1-range, hence ByteString encoded"
converted := converter next: 5 putAll: source startingAt: 5 toStream: stream.
"C3A5 is twobyte utf8-encoding of å"
self assert: stream contents asByteArray = #[16r65 16r66 16rC3 16rA5 16r67 16r68] .
self assert: converted = 'efågh'! !

TextConverter removeSelector: #nextPutByteString:toStream:!

!TextConverter reorganize!
('conversion' convertFromSystemString: convertToSystemString: next:putAll:startingAt:toStream: nextFromStream: nextPut:toStream: nextPutAll:toStream:)
('friend' emitSequenceToResetStateIfNeededOn: restoreStateOf:with: saveStateOf:)
('initialize-release' initialize installLineEndConvention:)
('private' bufferedNext:putAll:startingAt:toStream: encodeUpto:from:startingAt:inBuffer:ofSize: encodeUpto:fromByteString:startingAt:inBuffer:ofSize: encodeUpto:fromCollection:startingAt:inBuffer:ofSize: next:putByteString:startingAt:toStream:)
!

