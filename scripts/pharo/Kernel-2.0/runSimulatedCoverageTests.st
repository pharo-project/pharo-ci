TestValueWithinFix removeSelector: #testValueWithinNonLocalReturnFixReal.
TestValueWithinFix removeSelector: #testValueWithinNonLocalReturnFixSimply.

!

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20416] on 24 November 2012 at 8:01:03 pm'!

!HDTestReport methodsFor: 'running' stamp: 'JohanBrichau 10/25/2010 23:05'!
runAll
  suite tests do: [ :each | 
    FileStream stdout nextPutAll: each asString; lf.
    [ 
      thisContext runSimulated: [each run: self]  contextAtEachStep: [ :current |
        | cls sel methods bytecodes |
        cls := current method methodClass.
        sel := current method selector.
        methods := (Smalltalk globals at: #Trace) at: cls ifAbsentPut: Dictionary new.
        bytecodes := methods at: sel ifAbsentPut: Set new.
        bytecodes add: current pc.].
    ] ifError: [:e | FileStream stdout nextPutAll: 'ERROR: ', e asString; lf; lf.]].
 ! !

| classTrace result  |

Smalltalk globals at: #Trace put: Dictionary new.

HDTestReport runCategories: Smalltalk organization categories.

"HDTestReport runCategories: {'Announcements-Tests-Core' }."

((Smalltalk allClasses inject: OrderedCollection new into: [:col :c | col add: c; add: c class. col]), Smalltalk allTraits) do: [:class | 

result := String streamContents: [:s |

classTrace := (Smalltalk globals at: #Trace) at: class ifAbsent: nil.
classTrace
        ifNil: [
                s nextPutAll: 'Class ', class name, ' not called'; lf. ]
        ifNotNil: [
                s nextPutAll: class name; lf.
                class selectors do: [:sel |
                        | m usedBytecodes allBytecodes |
                        [m := class >> sel.
                        usedBytecodes := (classTrace at: sel ifAbsent: Set new) size.
                        allBytecodes := 0.
                        m symbolicLinesDo: [:pc :lineForPC | allBytecodes := allBytecodes + 1 ]..
                        s tab; nextPutAll: sel; nextPutAll: ' - '; nextPutAll:
(usedBytecodes  /  allBytecodes * 100) asFloat asString; nextPutAll:
'%'; lf.
] ifError: [:e | FileStream stdout nextPutAll: 'ERROR: ', e asString ]]]].
FileStream stdout nextPutAll: result asString.

].

"FLSerializer serialize: (Smalltalk globals at: #Trace) toFileNamed: 'trace.fuel'."


FileStream stdout nextPutAll: 'done'; cr.

Smalltalk snapshot: false andQuit: true.