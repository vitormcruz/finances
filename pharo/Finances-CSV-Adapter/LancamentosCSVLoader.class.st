Class {
	#name : #LancamentosCSVLoader,
	#superclass : #LancamentosLoader,
	#instVars : [
		'neoCSVReader',
		'posicoes'
	],
	#category : #'Finances-CSV-Adapter'
}

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
						
		posicao := posicoes ativaDoTicker: lancamento ticker eDoTipo: lancamento tipo.
		posicao aplica: lancamento.					
	]
					
		

]
