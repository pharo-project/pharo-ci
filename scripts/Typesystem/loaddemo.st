"load Demo directory"
((FileDirectory on: ((FileDirectory default fullName),'/../scripts/Typesystem/Source-Demo')) matchingEntries: '*.st') do: [:each | each  readStream fileIn].

