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
	
	posicao := posicoes ativaDoTicker: 'BOVA11' eDoTipo: #Comprada.
	
	self assert: (posicoes ativaDoTicker: 'BOVA11' eDoTipo: #Comprada) 
		  identicalTo: posicao .
]

{ #category : #'tests - pos ativa' }
PosicoesUnitTest >> testa_obter_posicao_inexistente_ativa_comprada [

	self assert: (posicoes ativaDoTicker: 'BOVA11' eDoTipo: #Comprada) operacoes isEmpty.
]
