Class {
	#name : #LancamentosCSVLoader,
	#superclass : #LancamentosLoader,
	#instVars : [
		'neoCSVReader',
		'posicoes'
	],
	#category : #'Finances-Adapter-CSV'
}

{ #category : #'instance creation' }
LancamentosCSVLoader class >> newFor: posicaoRepo [

	^ super new posicoes: posicaoRepo.
]

{ #category : #initialization }
LancamentosCSVLoader >> initialize [ 

	neoCSVReader := NeoCSVReader new separator: $;.
]

{ #category : #loading }
LancamentosCSVLoader >> loadFromCsvFile: aCSVFileReference [ 

	<todo: 'adicionar validação linha por linha'>
	<todo: 'adicionar validação do lançamento'>

	| posicao |
	(((neoCSVReader clone on: aCSVFileReference readStream) 
		skipHeader;
		upToEnd)  collect: #asLancamento) do: [ :lancamento |
			
			lancamento processaOperacoesPara: posicoes
	]
					
		

]

{ #category : #'as yet unclassified' }
LancamentosCSVLoader >> posicoes: posicaoRepo [

	posicoes := posicaoRepo.
]
