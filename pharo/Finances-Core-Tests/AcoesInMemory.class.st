Class {
	#name : #AcoesInMemory,
	#superclass : #Acoes,
	#instVars : [
		'acoes'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #accessing }
AcoesInMemory >> acaoDoTicker: ticker [

	^ acoes at: ticker ifAbsentPut: [ Acao newParaTicker: ticker ].

]

{ #category : #initialization }
AcoesInMemory >> initialize [ 

	acoes := Dictionary new.
]
