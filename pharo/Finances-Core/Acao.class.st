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

{ #category : #'operacao - calcular' }
Acao >> << umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #adapting }
Acao >> adaptTo: acaoClass [

	self class = Acao ifFalse: [ ^ self ].
	^ self becomeForward: (acaoClass newParaTicker: ticker).
]

{ #category : #'operacao - criar' }
Acao >> comprar: loteAcoes em: aDate totalizando: montante [
	
	self adaptTo: AcaoComprada.
	^ self novaOperacao: Compra comLote: loteAcoes em: aDate totalizando: montante.
]

{ #category : #'operacao - calcular' }
Acao >> incrementaPosicao: umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #initialization }
Acao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotal := 0.
	totalAcoes := 0.
]

{ #category : #accessors }
Acao >> montanteTotal [
	^ montanteTotal
]

{ #category : #'operacao - criar' }
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

{ #category : #'operacao - calcular' }
Acao >> realizaPosicao: umaOperacao [ 

	| valorMedioAntesAtualizar valorRealizado |
	
	valorMedioAntesAtualizar := self valorMedio.
	valorRealizado := umaOperacao lote * valorMedioAntesAtualizar.
	umaOperacao realizouResultadoComSeguinteValor: valorRealizado.
	totalAcoes := totalAcoes - umaOperacao lote.
	self realizaValor: valorRealizado.

]

{ #category : #'operacao - calcular' }
Acao >> realizaValor: valorRealizado [

	self subclassResponsibility.

	
]

{ #category : #testing }
Acao >> seComprada: aBlockClosure [ 
	
	operacoes ifEmpty:[ ^ nil ] .
	^ operacoes first seCompra: aBlockClosure 
]

{ #category : #testing }
Acao >> seVendida: aBlockClosure [ 

	operacoes ifEmpty:[ ^ nil ] .
	^ operacoes first seVenda: aBlockClosure 
	
	
]

{ #category : #accessors }
Acao >> ticker [
	^ ticker
]

{ #category : #accessors }
Acao >> ticker: tickerName [

	ticker := tickerName.
]

{ #category : #accessors }
Acao >> totalAcoes [
	^ totalAcoes
]

{ #category : #accessors }
Acao >> valorMedio [

	totalAcoes = 0 ifTrue: [ ^ 0 ].  
	^ (montanteTotal / totalAcoes) abs.
]

{ #category : #'operacao - criar' }
Acao >> vender: loteAcoes em: aDate totalizando: montante [

	self adaptTo: AcaoVendida.
	^ self novaOperacao: Venda comLote: loteAcoes em: aDate totalizando: montante.
]
