Class {
	#name : #PosicoesUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'posicoes'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #running }
PosicoesUnitTest >> setUp [

	posicoes := PosicoesStub new.
	

]

{ #category : #'as yet unclassified' }
PosicoesUnitTest >> testa_obter_posicao_existente_ativa_comprada [
	
	| posicao |
	
	posicao := posicoes ativaCompradaDoTicker: 'BOVA11'.
	
	self assert: (posicoes ativaCompradaDoTicker: 'BOVA11') identicalTo: posicao .
]

{ #category : #'tests - pos ativa' }
PosicoesUnitTest >> testa_obter_posicao_inexistente_ativa_comprada [

	self assert: (posicoes ativaCompradaDoTicker: 'BOVA11') operacoes isEmpty.
]
