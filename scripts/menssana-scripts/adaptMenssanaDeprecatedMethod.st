
Author fullName: 'hudson'.
"This is a bit tricky. My problem is that when we will open the menssana image, a deprecated method will be called. This does not seem to be a problem on mac os, but it ends the job on the linux server (I don't know why). So here I manually replace the guilty code to no longer send a deprecated message"
FSPlatformResolver theMetaClass compile: 'forCurrentPlatform	| platformName |	platformName :=  Smalltalk os platformName.	^ (self allSubclasses detect: [:ea | ea platformName = platformName]) new'
