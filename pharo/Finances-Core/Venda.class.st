Class {
	#name : #Venda,
	#superclass : #Operacao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #test }
Venda class >> seCompra: aBlockClosure [ 
	^ nil
]

{ #category : #testing }
Venda >> seCompra: aBlockClosure [ 
	^ nil.
]

{ #category : #testing }
Venda >> seVenda: aBlockClosure [ 

	^ aBlockClosure value.
]
