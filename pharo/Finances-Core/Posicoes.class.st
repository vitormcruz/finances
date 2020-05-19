Class {
	#name : #Posicoes,
	#superclass : #Object,
	#category : #'Finances-Core'
}

{ #category : #adding }
Posicoes >> get: aString ifAbsentAdd: umaAcao [ 

	self subclassResponsibility.
]

{ #category : #testing }
Posicoes >> isEmpty [

	self subclassResponsibility.
]

{ #category : #accessors }
Posicoes >> posicao: tipo doTicker: ticker [ 

	^ self get: ticker 
		    ifAbsentAdd: (tipo asPosicaoClass newParaTicker: ticker) 
]

{ #category : #operacao }
Posicoes >> registra: lancamento [ 

	| posicao |

	posicao := self posicao: lancamento tipo 
						 doTicker: lancamento ticker.
						
	
	
]

{ #category : #accessing }
Posicoes >> size [ 

	self subclassResponsibility.
]
