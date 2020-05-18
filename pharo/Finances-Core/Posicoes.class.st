Class {
	#name : #Posicoes,
	#superclass : #Object,
	#category : #'Finances-Core'
}

{ #category : #accessors }
Posicoes >> ativaDoTicker: ticker doTipo: tipo [ 

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

{ #category : #operacao }
Posicoes >> registra: lancamento [ 

	| posicao |

	posicao := self ativaDoTicker: lancamento ticker 
						 doTipo: lancamento tipo.
						
	
	
]

{ #category : #accessing }
Posicoes >> size [ 

	self subclassResponsibility.
]
