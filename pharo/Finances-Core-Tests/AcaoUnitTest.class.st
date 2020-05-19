Class {
	#name : #AcaoUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #test }
AcaoUnitTest >> testa_tipo_acao [

	self assert: Acao new tipo equals: #Acao.
]
