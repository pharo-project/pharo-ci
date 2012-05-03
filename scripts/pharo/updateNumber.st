"output Version Number of stdout"
FileStream stdout nextPutAll: SystemVersion current highestUpdate asString.
SmalltalkImage current snapshot: false andQuit: true.