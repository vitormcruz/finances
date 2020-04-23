Class {
	#name : #Compra,
	#superclass : #Operacao,
	#category : #'Finances-Core'
}

{ #category : #acessing }
Compra >> realizouResultadoComSeguinteValor: anInteger [ 

	resultado := anInteger - total.
]

{ #category : #testing }
Compra >> seCompra: aBlockClosure [ 
	^ aBlockClosure value.
]

{ #category : #testing }
Compra >> seVenda: aBlockClosure [ 

	^ nil.
]
