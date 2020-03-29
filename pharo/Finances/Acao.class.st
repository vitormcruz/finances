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

{ #category : #operacao }
Acao >> comprar: loteAcoes em: aDate totalizando: montante [

	^ self nova: OperacaoCompra 
	       comLote: loteAcoes
			 em: aDate 
			 totalizando: montante.
]

{ #category : #calculations }
Acao >> custoMeuLoteDe: anInteger [ 

	^ self valorMedio * anInteger.
]

{ #category : #initialization }
Acao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotalGasto := 0.
	totalAcoes := 0.
]

{ #category : #operacao }
Acao >> nova: classeOperacao comLote: loteAcoes em: aDate totalizando: montante [
	| novaOperacao |
	
	novaOperacao := classeOperacao comLoteDe: loteAcoes
									   paraAcao: self
								      em: aDate
								      totalizando: montante.

	operacoes add: novaOperacao.
	totalAcoes := totalAcoes + loteAcoes.
	montanteTotalGasto := montanteTotalGasto + montante.
		
	^ novaOperacao
]

{ #category : #accessors }
Acao >> operacoes [

	^ operacoes clone.
]

{ #category : #calculations }
Acao >> seComprada: aBlockClosure [ 
	
	operacoes ifEmpty:[ ^ nil ] .
	^ operacoes first seCompra: aBlockClosure 
]

{ #category : #calculations }
Acao >> seVendida: aBlockClosure [ 

	operacoes ifEmpty:[ ^ nil ] .
	^ operacoes first seVenda: aBlockClosure 
	
	
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

{ #category : #operacao }
Acao >> vender: loteAcoes em: aDate totalizando: montante [

	^ self nova: OperacaoVenda
			 comLote: loteAcoes
			 em: aDate
			 totalizando: montante
]
