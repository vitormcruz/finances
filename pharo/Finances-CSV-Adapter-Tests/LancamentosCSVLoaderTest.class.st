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
	lancamentosCSVLoader := LancamentosCSVLoader new.
]

{ #category : #'as yet unclassified' }
LancamentosCSVLoaderTest >> testa_carrega_de_arquivo_vazio [

	lancamentosCSVLoader loadFromCsvFile: (testDir, '/ArquivoVazio.csv') asFileReference.
	
	self assert: posicoes isEmpty.

	
]
