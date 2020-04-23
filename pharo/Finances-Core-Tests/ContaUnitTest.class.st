Class {
	#name : #ContaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #tests }
ContaUnitTest >> testa_criacao_conta_com_nome_vazio [

	#('' ' ' '    ') do: [ :nome |
		self assert: (Conta newNomeada: nome) creationFailed.
	].

]

{ #category : #tests }
ContaUnitTest >> testa_criacao_conta_sem_nome [

	self assert: (Conta newNomeada: nil) creationFailed.


]
