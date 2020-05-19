Class {
	#name : #Posicao,
	#superclass : #Object,
	#instVars : [
		'ativoFinanceiro',
		'operacoes',
		'totalAcoes',
		'montanteTotal'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Posicao class >> newParaTicker: aString [ 

	^ super new ticker: aString.
]

{ #category : #'operacao - calcular' }
Posicao >> << umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #accessors }
Posicao >> ativoFinanceiro [

	^ ativoFinanceiro
]

{ #category : #'operacao - criar' }
Posicao >> comprar: loteAcoes em: aDate totalizando: montante [
	
	^ self novaOperacao: Compra comLote: loteAcoes em: aDate totalizando: montante.
]

{ #category : #'operacao - calcular' }
Posicao >> incrementaPosicao: umaOperacao [ 

	self subclassResponsibility.
]

{ #category : #initialization }
Posicao >> initialize [ 

	operacoes := OrderedCollection new.
	montanteTotal := 0.
	totalAcoes := 0.
]

{ #category : #accessors }
Posicao >> montanteTotal [
	^ montanteTotal
]

{ #category : #'operacao - criar' }
Posicao >> novaOperacao: classeOperacao comLote: loteAcoes em: aDate totalizando: montante [
	| novaOperacao |
	
	novaOperacao := classeOperacao comLoteDe: loteAcoes em: aDate totalizando: montante.
	operacoes add: novaOperacao.
	self << novaOperacao.
	^ novaOperacao
]

{ #category : #accessors }
Posicao >> operacoes [

	^ operacoes clone.
]

{ #category : #'operacao - calcular' }
Posicao >> realizaPosicao: umaOperacao [ 

	| valorMedioAntesAtualizar valorRealizado |
	
	valorMedioAntesAtualizar := self valorMedio.
	valorRealizado := umaOperacao lote * valorMedioAntesAtualizar.
	umaOperacao realizouResultadoComSeguinteValor: valorRealizado.
	totalAcoes := totalAcoes - umaOperacao lote.
	self realizaValor: valorRealizado.

]

{ #category : #'operacao - calcular' }
Posicao >> realizaValor: valorRealizado [

	self subclassResponsibility.

	
]

{ #category : #accessors }
Posicao >> ticker: aString [ 

	ativoFinanceiro := aString asAtivoFinanceiro.
]

{ #category : #accessors }
Posicao >> tipoAtivo [

	^ ativoFinanceiro tipo.
]

{ #category : #accessors }
Posicao >> tipoPosicao [
	self subclassResponsibility.
]

{ #category : #accessors }
Posicao >> totalAcoes [
	^ totalAcoes
]

{ #category : #'resultado financeiro' }
Posicao >> totalInvestido [

	self subclassResponsibility.
]

{ #category : #accessors }
Posicao >> valorMedio [

	totalAcoes = 0 ifTrue: [ ^ 0 ].  
	^ (montanteTotal / totalAcoes) abs.
]

{ #category : #'operacao - criar' }
Posicao >> vender: loteAcoes em: aDate totalizando: montante [

	^ self novaOperacao: Venda comLote: loteAcoes em: aDate totalizando: montante.
]
