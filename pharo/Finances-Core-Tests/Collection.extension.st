Extension { #name : #Collection }

{ #category : #'*Finances-Core-Tests' }
Collection >> asOperacaoStrings [ 

	" Converte uma lista de operacoes em uma lista de string represetativas com o objetivo de facilitar a criação de 
	testes que necessitem realizar comparações de várias operações "

	^ self collect: [ :operation | 
		(String streamContents: [ :s |
			(NeoCSVWriter on: s) 
				addRawFields: #(data lote total resultado valorUnitarioAcao); 
				nextPutAll: {operation}
		]) trim
	]
]
