"remove time dependent tests"
TestValueWithinFix removeSelector: #testValueWithinNonLocalReturnFixReal.
TestValueWithinFix removeSelector: #testValueWithinNonLocalReturnFixSimply.

!

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20416] on 24 November 2012 at 8:01:03 pm'!

!HDTestReport methodsFor: 'running' stamp: 'JohanBrichau 10/25/2010 23:05'!
runAll
  suite tests do: [ :each | 
    FileStream stdout nextPutAll: '<p>', each asString asHTMLString, '</p>'.
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

| classTrace result printMethod log printSource |

log := FileStream stdout.


log nextPutAll: '<html><head>
<style TYPE="text/css">
<!!--
body { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 9pt; }

p { color: black; margin: 1px; padding: 3px; margin-left: 20px; }
pre { margin-left: 40px; }

.covered { background-color: #4AA02C; color: white }
.uncovered { background-color: #C35617; color: white }
.partlyCovered { background-color: gold; color: black }

.uncoveredSource { color: red; background-color: #FFF8C6 }


-->
</style>
</head><body>'.


getSource := [:class :selector |
  | m usedBytecodes allBytecodes unusedBytecodes dm source colors isRed |
  m := class >> selector.
  usedBytecodes := (((Smalltalk globals at: #Trace) at: class) at: selector ifAbsent: Set new).
  allBytecodes := Set new.
  m symbolicLinesDo: [:pc :lineForPC | allBytecodes add: pc ].
  unusedBytecodes := allBytecodes copyWithoutAll: usedBytecodes.

  dm := m debuggerMap.
  source := (class sourceCodeAt: selector) asString.
  colors := (1 to: source size) collect: [:c | false].
  
 unusedBytecodes do: [:pc |
        range := dm rangeForPC: pc contextIsActiveContext: false.
        (range first to: range last) do: [:i | colors at: i put: true].
        "source makeBoldFrom: range first to: range last."].
  isRed := false.
  String streamContents: [:s | 
    source withIndexDo: [:char :index | 
      | current |
      current := colors at: index.
      current 
        ifTrue: [
          isRed 
            ifTrue: [ s nextPutAll: char asHTMLString ]
            ifFalse: [ s nextPutAll: '<span class="uncoveredSource">', char asHTMLString. isRed:=true ]]
        ifFalse: [
          isRed 
            ifTrue: [ s nextPutAll: '</span>', char asHTMLString. isRed:=false  ]
            ifFalse: [ s nextPutAll: char asHTMLString ]]
  ]] 
].

printMethod := [:class :selector :coverage |
  | cls |
  cls := 'uncovered'.
  coverage=100 ifTrue: [cls := 'covered'].
  (coverage>0 and: [coverage<100]) ifTrue: [cls := 'partlyCovered'].   
 
  log nextPutAll: ('<p class="', cls, '">', selector asHTMLString, ' - ', coverage asFloat asString asHTMLString
  , '%</p>').
  (coverage>0 and: [coverage<100]) ifTrue: [
    log nextPutAll: '<pre>', (getSource value: class value: selector) ,'</pre>'.
  ].
].

Smalltalk globals at: #Trace put: Dictionary new.

log nextPutAll: '<h2>Tests</h2>'.

HDTestReport runCategories: Smalltalk organization categories.

"HDTestReport runCategories: {'Announcements-Tests-Core' }."

log nextPutAll: '<h2>Coverage report</h2>'.


((Smalltalk allClasses inject: OrderedCollection new into: [:col :c | col add: c; add: c class. col]), Smalltalk allTraits) do: [:class | 
"
{ AnnouncementSubscription } do: [:class | 
"

classTrace := (Smalltalk globals at: #Trace) at: class ifAbsent: nil.
 log nextPutAll: '<h3>', class name asHTMLString, '</h3>'.
 
  classTrace
        ifNil: [
                [class selectors do: [:sel |
                     printMethod value: class value: sel value: 0.]
        ] ifError: [:e | FileStream stdout nextPutAll: '<p>ERROR: ', e asString asHTMLString, '</p>']]
        ifNotNil: [
                
                class selectors do: [:sel |
                        | m usedBytecodes allBytecodes |
                        [m := class >> sel.
                        usedBytecodes := (classTrace at: sel ifAbsent: Set new) size.
                        allBytecodes := 0.
                        m symbolicLinesDo: [:pc :lineForPC | allBytecodes := allBytecodes + 1 ]..
                        printMethod value: class value: sel value: (usedBytecodes  /  allBytecodes * 100).

] ifError: [:e | FileStream stdout nextPutAll: '<p>ERROR: ', e asString asHTMLString, '</p>']]].

].

"FLSerializer serialize: (Smalltalk globals at: #Trace) toFileNamed: 'trace.fuel'."

log nextPutAll: '<p>done...</p></body>'.


Smalltalk snapshot: false andQuit: true.