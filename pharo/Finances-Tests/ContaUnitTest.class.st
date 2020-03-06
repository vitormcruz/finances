Class {
	#name : #ContaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #'as yet unclassified' }
ContaUnitTest >> testa_criacao_conta_sem_nome [

	self assert: (Conta newNomeada: nil) creationFailed.


]
