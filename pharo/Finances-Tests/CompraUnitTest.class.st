Class {
	#name : #CompraUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #tests }
CompraUnitTest >> test_seCompra [

	self assert: (Compra new seCompra: [ true ]).
]

{ #category : #tests }
CompraUnitTest >> test_seVenda [

	self assert: (Compra new seVenda: [ true ])
		  equals: nil.
]
