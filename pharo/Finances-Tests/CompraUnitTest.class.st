Class {
	#name : #CompraUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #'as yet unclassified' }
CompraUnitTest >> test_seCompra [

	self assert: (Compra new seCompra: [ true ]).
]

{ #category : #'as yet unclassified' }
CompraUnitTest >> test_seVenda [

	self assert: (Compra new seVenda: [ true ])
		  equals: nil.
]
