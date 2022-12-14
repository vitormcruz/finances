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

{ #category : #'tests - pos ativa' }
PosicoesUnitTest >> testa_obter_posicao_comprada_nunca_obtida [

	self assert: (posicoes posicao: #Comprada doTicker: 'BOVA11') operacoes isEmpty.
]

{ #category : #'tests - pos ativa' }
PosicoesUnitTest >> testa_registra_lancamento_compra_ativo_nunca_usado [

	| lancamentoTickerNuncaUsado | 

	lancamentoTickerNuncaUsado := Lancamento ticker: 'ALUP11' lote: 100 data: (Date readFrom: '10/20/2019' readStream) valor: 1000.

	lancamentoTickerNuncaUsado processaOperacoesPara: posicoes.
	
	self assertCollection: (posicoes posicao: #Comprada doTicker: 'ALUP11') operacoes asOperacaoStrings 
		  equals: #('20 October 2019,100,1000,,10') asOrderedCollection.
]
