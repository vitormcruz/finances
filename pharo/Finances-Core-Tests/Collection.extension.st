Extension { #name : #Collection }

{ #category : #'*Finances-Core-Tests' }
Collection >> asOperacaoStrings [ 

	^ self collect: [ :operation | 
		(String streamContents: [ :s |
			(NeoCSVWriter on: s) 
				addRawFields: #(data lote total resultado valorUnitarioAcao); 
				nextPutAll: {operation}
		]) trim
	]
]
