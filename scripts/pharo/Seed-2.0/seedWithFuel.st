| seed |

HzFuelExporter exportAll.

'crash.dmp' asFileReference ensureDeleted.
'fileok.txt' asFileReference ensureDeleted.
'bootstrapped.image' asFileReference ensureDeleted.
'bootstrapped.changes' asFileReference ensureDeleted.

seed := PharoSeed new
            withBasicKernel;
            withFileSupport;
            withGene: PharoTranscriptGene new;
            withNonInteractiveTranscript;
            withFuel;
            processInitializer: [ :image | (image at: #HazelZygote) saveAndQuit ].

HazelBuilderExample new
    buildImageWithSeed: seed.