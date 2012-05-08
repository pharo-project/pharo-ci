
 Gofer new
        squeaksource3: 'Fuel';
        package: 'Fuel';
        package: 'FuelMetalevel';
        package: 'FuelPackageLoader';
        load.

!

| packageNames |

FLSerializer serialize: (TextStyle named: 'Bitmap DejaVu Sans') toFileNamed: 'dejavu.fuel'.
FLSerializer serialize: (Unicode classPool at: #DecimalProperty) toFileNamed: 'decimalProperty.fuel'.
FLSerializer serialize: (Unicode classPool at: #GeneralCategory) toFileNamed: 'generalCategory.fuel'.
FLSerializer serialize: (UCSTable classPool at: #GB2312Table) toFileNamed: 'gb2312Table.fuel'.
FLSerializer serialize: (UCSTable classPool at: #JISX0208Table) toFileNamed: '#jisX0208Table.fuel'.
FLSerializer serialize: (UCSTable classPool at: #KSX1001Table) toFileNamed: '#ksx1001Table.fuel'.


packageNames := ((MCWorkingCopy allManagers  collect: [:p | p package name] ) 
  copyWithoutAll: SmalltalkImage current kernelPackageNames) asSortedCollection.

FileStream forceNewFileNamed: 'pharo-core.fuel' do: [:aStream |
       aStream binary.
       FLPackageStore new storeOn: aStream packages: packageNames.].

Smalltalk snapshot: false andQuit: true.
