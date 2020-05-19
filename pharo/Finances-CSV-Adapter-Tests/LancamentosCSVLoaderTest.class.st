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
	| posicaoALUP11 |
	
	lancamentosCSVLoader loadFromCsvFile: (testDir , '/UmLancamentoCompraAcao.csv') asFileReference.

	posicaoALUP11 := posicoes posicao: #Comprada doTicker: 'ALUP11'.
	
	self assert: posicoes size equals: 1.	
	self assert: posicaoALUP11 montanteTotal equals: 3000.10.
	self assert: posicaoALUP11 totalAcoes  equals: 200.
]

{ #category : #'as yet unclassified' }
LancamentosCSVLoaderTest >> testa_carrega_de_arquivo_com_varios_lancamento_compra_de_uma_acao [
	| posicaoALUP11 |
	
	lancamentosCSVLoader loadFromCsvFile: (testDir , '/VariosLancamentosCompraDeUmaAcao.csv') asFileReference.

	posicaoALUP11 := posicoes posicao: #Comprada doTicker: 'ALUP11'.
	
	self assert: posicoes size equals: 1.
	self assert: posicaoALUP11 montanteTotal equals: 4900.45.
	self assert: posicaoALUP11 totalAcoes  equals: 500.
]

{ #category : #'as yet unclassified' }
LancamentosCSVLoaderTest >> testa_carrega_de_arquivo_vazio [

	lancamentosCSVLoader loadFromCsvFile: (testDir, '/ArquivoVazio.csv') asFileReference.
	
	self assert: posicoes isEmpty.

	
]
