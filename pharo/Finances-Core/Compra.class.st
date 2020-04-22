Class {
	#name : #Compra,
	#superclass : #Operacao,
	#category : #'Finances-Core'
}

{ #category : #testing }
Compra >> seCompra: aBlockClosure [ 
	^ aBlockClosure value.
]

{ #category : #testing }
Compra >> seVenda: aBlockClosure [ 

	^ nil.
]
