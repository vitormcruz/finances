Class {
	#name : #LancamentosCSVLoader,
	#superclass : #LancamentosLoader,
	#instVars : [
		'neoCSVReader'
	],
	#category : #'Finances-CSV-Adapter'
}

{ #category : #initialization }
LancamentosCSVLoader >> initialize [ 

	neoCSVReader := NeoCSVReader new.
]

{ #category : #loading }
LancamentosCSVLoader >> loadFromCsvFile: aCSVFileReference [ 

	| lancamentos  |

	lancamentos := (neoCSVReader clone on: aCSVFileReference readStream) upToEnd 
		

]
