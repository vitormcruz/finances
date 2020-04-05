Class {
	#name : #Venda,
	#superclass : #Operacao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #test }
Venda class >> seCompra: aBlockClosure [ 
	^ nil
]

{ #category : #calculations }
Venda >> seVenda: aBlockClosure [ 

	^ aBlockClosure value.
]
