Class {
	#name : #Acao,
	#superclass : #Object,
	#instVars : [
		'ticker',
		'operacoes',
		'totalAcoes',
		'montanteTotalGasto'
	],
	#category : #Finances
}

{ #category : #'instance creation' }
Acao class >> newParaTicker: ticker [

	^ super new ticker: ticker.
]

{ #category : #'adiciona operacao' }
Acao >> comprar: loteAcoes em: aDate totalizando: montante [

	| operacao |
	
	operacao := Operacao comLoteDe: loteAcoes
								paraAcaor: self
								em: aDate
								totalizando: montante.
								
	operacoes add: operacao.
	
	totalAcoes := totalAcoes + loteAcoes.
	montanteTotalGasto := montanteTotalGasto + montante.
		
	^ operacao
]

{ #category : #initialization }
Acao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotalGasto := 0.
	totalAcoes := 0.
]

{ #category : #accessors }
Acao >> operacoes [

	^ operacoes clone.
]

{ #category : #accessors }
Acao >> ticker [
	^ ticker
]

{ #category : #accessing }
Acao >> ticker: tickerName [

	ticker := tickerName.
]

{ #category : #accessing }
Acao >> totalAcoes [
	^ totalAcoes
]

{ #category : #calculations }
Acao >> valorMedio [

	totalAcoes = 0 ifTrue: [ ^ 0 ].  
	^ montanteTotalGasto / totalAcoes.
]
