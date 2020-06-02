Class {
	#name : #PosicoesInMemory,
	#superclass : #Posicoes,
	#instVars : [
		'innerDictionary'
	],
	#category : #'Finances-Adapter-Memory'
}

{ #category : #adding }
PosicoesInMemory >> get: aString ifAbsentAdd: umAtivoFinanceiro [ 

	^ innerDictionary at: aString 
						   ifAbsentPut: umAtivoFinanceiro.
]

{ #category : #initialization }
PosicoesInMemory >> initialize [ 
	
	innerDictionary := Dictionary new.
]

{ #category : #testing }
PosicoesInMemory >> isEmpty [

	^ innerDictionary isEmpty.
]

{ #category : #accessing }
PosicoesInMemory >> size [

	^ innerDictionary size.
]
