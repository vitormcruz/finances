"
A LancamentosCSVLoaderTest is a test class for testing the behavior of LancamentosCSVLoader
"
Class {
	#name : #LancamentosCSVLoaderTest,
	#superclass : #TestCase,
	#instVars : [
		'posicoes',
		'lancamentosCSVLoader'
	],
	#classVars : [
		'testDir'
	],
	#category : #'Finances-CSV-Adapter-Tests'
}

{ #category : #'private-initialization' }
LancamentosCSVLoaderTest class >> initialize [

	testDir := (IceRepository registry detect: [ :repo | repo name = 'finances' ]) location 
				  		pathString , '/testDir'.
]

{ #category : #running }
LancamentosCSVLoaderTest >> setUp [

	posicoes := PosicoesInMemory new.
	lancamentosCSVLoader := LancamentosCSVLoader newFor: posicoes.
]

{ #category : #'as yet unclassified' }
LancamentosCSVLoaderTest >> testa_carrega_de_arquivo_com_um_lancamento_compra_acao [

	self skip: 'Implementando testes no Lancamento para atender a este teste que é mais genérico'.

	lancamentosCSVLoader loadFromCsvFile: (testDir, '/UmLancamentoCompraAcao.csv') asFileReference.
	
	self assert: posicoes size equals: 1.
	self assertCollection: (posicoes ativaDoTicker: 'ALUP11' eDoTipo: #Comprada) ativoFinanceiro operacoes asOperacaoStrings 
		  equals: #('ALUP11_20/03/2015_213_3703.09') asOrderedCollection.
	

	
]

{ #category : #'as yet unclassified' }
LancamentosCSVLoaderTest >> testa_carrega_de_arquivo_vazio [

	lancamentosCSVLoader loadFromCsvFile: (testDir, '/ArquivoVazio.csv') asFileReference.
	
	self assert: posicoes isEmpty.

	
]
