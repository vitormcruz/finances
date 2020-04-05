Class {
	#name : #Acao,
	#superclass : #Object,
	#instVars : [
		'ticker',
		'operacoes',
		'totalAcoes',
		'montanteTotal'
	],
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #testing }
Acao class >> isAbstract [
	
	^ self = Acao. 
]

{ #category : #'instance creation' }
Acao class >> newParaTicker: ticker [

	^ super new ticker: ticker.
]

{ #category : #calculating }
Acao >> << umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #adapting }
Acao >> adaptTo: acaoClass [

	self class = Acao ifFalse: [ ^ self ].
	^ self becomeForward: (acaoClass newParaTicker: ticker).
]

{ #category : #operacao }
Acao >> comprar: loteAcoes em: aDate totalizando: montante [
	
	self adaptTo: AcaoComprada.
	^ self novaOperacao: Compra comLote: loteAcoes em: aDate totalizando: montante.
]

{ #category : #calculation }
Acao >> incrementaPosicao: umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #initialization }
Acao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotal := 0.
	totalAcoes := 0.
]

{ #category : #accessor }
Acao >> montanteTotal [
	^ montanteTotal
]

{ #category : #operacao }
Acao >> novaOperacao: classeOperacao comLote: loteAcoes em: aDate totalizando: montante [
	| novaOperacao |
	
	novaOperacao := classeOperacao comLoteDe: loteAcoes em: aDate totalizando: montante.
	operacoes add: novaOperacao.
	self << novaOperacao.
	^ novaOperacao
]

{ #category : #accessors }
Acao >> operacoes [

	^ operacoes clone.
]

{ #category : #calculation }
Acao >> realizaPosicao: umaOperacao [ 

	| valorMedioAntesAtualizar valorRealizado |
	
	valorMedioAntesAtualizar := self valorMedio.
	valorRealizado := umaOperacao lote * valorMedioAntesAtualizar.
	umaOperacao realizouResultadoComSeguinteValor: valorRealizado.
	totalAcoes := totalAcoes - umaOperacao lote.
	self realizaValor: valorRealizado.

]

{ #category : #calculations }
Acao >> realizaValor: valorRealizado [

	self subclassResponsibility.

	
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
	^ (montanteTotal / totalAcoes) abs.
]

{ #category : #operacao }
Acao >> vender: loteAcoes em: aDate totalizando: montante [

	self adaptTo: AcaoVendida.
	^ self novaOperacao: Venda comLote: loteAcoes em: aDate totalizando: montante.
]
