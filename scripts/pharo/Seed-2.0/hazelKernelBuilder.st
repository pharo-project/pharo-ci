b := HazelKernelBuilder new.
b buildKernel.

writer := HzImageWriter new.
writer format: HzCogImageFormat new.
writer imageFileName: 'hazzelled.image'.
VmLimitationsHandler exceptionClasses do: [ :cls |
    writer substitute: cls by: (b hazelSmalltalk globals at: cls name).
    ].
writer writeImage: b hazelSmalltalk.