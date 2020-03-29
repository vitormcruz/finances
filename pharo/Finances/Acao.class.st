Class {
	#name : #Acao,
	#superclass : #Object,
	#instVars : [
		'ticker',
		'operacoes',
		'totalAcoes',
		'montanteTotal'
	],
	#category : #Finances
}

{ #category : #testing }
Acao class >> isAbstract [
	
	^ self = AcaoAbstractUnitTest. 
]

{ #category : #'instance creation' }
Acao class >> newParaTicker: ticker [

	^ super new ticker: ticker.
]

{ #category : #'as yet unclassified' }
Acao >> adaptTo: acaoClass [

	self class = Acao ifFalse: [ ^ self ].
	^ self becomeForward: (acaoClass newParaTicker: ticker).
]

{ #category : #'as yet unclassified' }
Acao >> calculaNovoMontanteOperacaoNaoGeradora: umaOperacao [

		self subclassResponsibility.
]

{ #category : #operacao }
Acao >> calculaNovoMontanteParaOperacao: umaOperacao [

	(self isTipoOperacaoGeradora: umaOperacao) ifTrue: [ ^ umaOperacao total + montanteTotal  ].

	^ self calculaNovoMontanteOperacaoNaoGeradora: umaOperacao.
	
]

{ #category : #operacao }
Acao >> comprar: loteAcoes em: aDate totalizando: montante [
	
	self adaptTo: AcaoComprada.
	^ self nova: OperacaoCompra comLote: loteAcoes em: aDate totalizando: montante.
]

{ #category : #calculations }
Acao >> custoMeuLoteDe: anInteger [ 

	^ self valorMedio * anInteger.
]

{ #category : #initialization }
Acao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotal := 0.
	totalAcoes := 0.
]

{ #category : #tests }
Acao >> isComprada [

	self subclassResponsibility.
]

{ #category : #testing }
Acao >> isTipoOperacaoGeradora: umaOperacao [

	self subclassResponsibility.
]

{ #category : #tests }
Acao >> isVendida [

	self subclassResponsibility.
]

{ #category : #operacao }
Acao >> nova: classeOperacao comLote: loteAcoes em: aDate totalizando: montante [

	| novaOperacao |
	
	novaOperacao := classeOperacao comLoteDe: loteAcoes
											paraAcao: self
											em: aDate
											totalizando: montante.
											
	operacoes add: novaOperacao.
	montanteTotal := self calculaNovoMontanteParaOperacao: novaOperacao.
	totalAcoes := totalAcoes + loteAcoes.
	
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
	^ montanteTotal / totalAcoes.
]

{ #category : #operacao }
Acao >> vender: loteAcoes em: aDate totalizando: montante [

	self adaptTo: AcaoVendida.
	^ self nova: OperacaoVenda comLote: loteAcoes em: aDate totalizando: montante.
]
