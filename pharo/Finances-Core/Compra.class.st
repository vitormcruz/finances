Class {
	#name : #Compra,
	#superclass : #Operacao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #calculation }
Compra >> aplicaOperadorA: aPositiveInteger [ 

	^ aPositiveInteger.
]

{ #category : #calculations }
Compra >> seCompra: aBlockClosure [ 
	^ aBlockClosure value.
]
