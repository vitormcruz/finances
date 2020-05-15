Class {
	#name : #Posicoes,
	#superclass : #Object,
	#category : #'Finances-Core'
}

{ #category : #accessing }
Posicoes >> ativaCompradaDoTicker: ticker [

	^ self get: ticker 
		    ifAbsentAdd: (Posicao newCompradaTicker: ticker) 
]

{ #category : #adding }
Posicoes >> get: aString ifAbsentAdd: umaAcao [ 

	self subclassResponsibility.
]

{ #category : #testing }
Posicoes >> isEmpty [

	self subclassResponsibility.
]

{ #category : #accessing }
Posicoes >> size [ 

	self subclassResponsibility.
]
