"
Eu sou um repositório de ações.
"
Class {
	#name : #Acoes,
	#superclass : #Object,
	#instVars : [
		'innerDictionary'
	],
	#category : #'Finances-Core'
}

{ #category : #accessors }
Acoes >> acaoDoTicker: ticker [

	^ self get: ticker 
		    ifAbsentAdd: (Acao newParaTicker: ticker) 


]

{ #category : #armazenamento }
Acoes >> get: aString ifAbsentAdd: umaAcao [ 

	self subclassResponsibility.
]
