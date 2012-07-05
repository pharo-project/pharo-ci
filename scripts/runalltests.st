'From Pharo2.0a of ''18 April 2012'' [Latest update: #20179] on 5 July 2012 at 9:32:43 pm'!

!ReleaseTest methodsFor: 'testing' stamp: 'PavelKrivanek 7/5/2012 21:32'!
testMethodsWithUnboundGlobals

  Smalltalk cleanOutUndeclared. 

  FileStream stdout nextPutAll: 'testMethodsWithUnboundGlobals: ', SystemNavigation default methodsWithUnboundGlobals asString; lf.

  self assert: SystemNavigation default methodsWithUnboundGlobals isEmpty
  ! !


"Run all tests in the image"
Deprecation raiseWarning: false.
HDTestReport runCategories: Smalltalk organization categories
