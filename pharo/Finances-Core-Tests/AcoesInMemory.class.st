Class {
	#name : #AcoesInMemory,
	#superclass : #Acoes,
	#instVars : [
		'acoes'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #armazenamento }
AcoesInMemory >> get: ticker ifAbsentAdd: umaAcao [ 

	^ acoes at: ticker 
			  ifAbsentPut: [ Acao newParaTicker: ticker ].
]

{ #category : #initialization }
AcoesInMemory >> initialize [ 

	acoes := Dictionary new.
]
