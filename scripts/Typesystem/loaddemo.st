TypeConfiguration uniqueInstance disable: true.

"load Demo directory"
((FileDirectory on: ((FileDirectory default fullName),'/../scripts/Typesystem/Source-Demo')) matchingEntries: '*.st') do: [:each | each  readStream fileIn].

TypeConfiguration uniqueInstance disable: false.

"load Demo directory"
((FileDirectory on: ((FileDirectory default fullName),'/../scripts/Typesystem/Source-Demo')) matchingEntries: '*.st') do: [:each | each  readStream fileIn].

