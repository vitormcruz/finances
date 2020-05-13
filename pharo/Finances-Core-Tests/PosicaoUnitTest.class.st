Class {
	#name : #PosicaoUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'as yet unclassified' }
PosicaoUnitTest >> testa_cria_posicao_comprada_de_acao [
	| posicao |
	
	posicao := Posicao newCompradaTicker: 'BOVA11'.
	self assert: posicao tipoAtivo equals: #Acao.
	self assert: posicao tipoPosicao equals: #Comprada.
]
