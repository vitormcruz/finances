Class {
	#name : #Venda,
	#superclass : #Operacao,
	#category : #'Finances-Core'
}

{ #category : #test }
Venda class >> seCompra: aBlockClosure [ 
	^ nil
]

{ #category : #acessing }
Venda >> realizouResultadoComSeguinteValor: anInteger [ 

	resultado := total - anInteger.
]

{ #category : #testing }
Venda >> seCompra: aBlockClosure [ 
	^ nil.
]

{ #category : #testing }
Venda >> seVenda: aBlockClosure [ 

	^ aBlockClosure value.
]
