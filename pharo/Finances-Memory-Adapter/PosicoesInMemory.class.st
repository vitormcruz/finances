Class {
	#name : #PosicoesInMemory,
	#superclass : #Posicoes,
	#instVars : [
		'innerDictionary'
	],
	#category : #'Finances-Memory-Adapter'
}

{ #category : #initialization }
PosicoesInMemory >> initialize [ 
	
	innerDictionary := Dictionary new.
]

{ #category : #testing }
PosicoesInMemory >> isEmpty [

	^ innerDictionary isEmpty.
]
