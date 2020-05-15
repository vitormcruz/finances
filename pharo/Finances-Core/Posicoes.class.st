Class {
	#name : #Posicoes,
	#superclass : #Object,
	#category : #'Finances-Core'
}

{ #category : #accessors }
Posicoes >> ativaDoTicker: ticker eDoTipo: tipo [ 

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
