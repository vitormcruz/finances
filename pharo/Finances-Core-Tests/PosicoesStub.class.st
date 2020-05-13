Class {
	#name : #PosicoesStub,
	#superclass : #Posicoes,
	#instVars : [
		'dictionary'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #adding }
PosicoesStub >> get: aString ifAbsentAdd: umaAcao [ 

	^ dictionary at: aString ifAbsentPut: umaAcao.
]

{ #category : #initialization }
PosicoesStub >> initialize [ 
	
	dictionary := Dictionary new.
]

{ #category : #testing }
PosicoesStub >> isEmpty [

	dictionary isEmpty.
]
