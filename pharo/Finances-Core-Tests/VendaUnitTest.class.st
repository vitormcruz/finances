Class {
	#name : #VendaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #tests }
VendaUnitTest >> test_seCompra [

	self assert: (Venda new seCompra: [ true ])
		  equals: nil.
]

{ #category : #tests }
VendaUnitTest >> test_seVenda [

	self assert: (Venda new seVenda: [ true ]).
]
