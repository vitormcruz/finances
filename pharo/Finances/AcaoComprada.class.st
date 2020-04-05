Class {
	#name : #AcaoComprada,
	#superclass : #Acao,
	#category : #Finances
}

{ #category : #calculation }
AcaoComprada >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self incrementaPosicao: umaOperacao ].
	self realizaPosicao: umaOperacao.


]

{ #category : #'as yet unclassified' }
AcaoComprada >> calculaNovoMontanteOperacaoNaoGeradora: umaOperacao [

	^ montanteTotal - (self custoMeuLoteDe: umaOperacao lote).
]

{ #category : #calculation }
AcaoComprada >> incrementaPosicao: umaOperacao [  

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal + umaOperacao total.
]

{ #category : #tests }
AcaoComprada >> isComprada [

	^ true.
]

{ #category : #testing }
AcaoComprada >> isTipoOperacaoGeradora: umaOPeracao [ 

	umaOPeracao seCompra: [ ^ true ].
	^ false.

]

{ #category : #tests }
AcaoComprada >> isVendida [

	^ false.
]

{ #category : #calculation }
AcaoComprada >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal - valorRealizado.

	
]
