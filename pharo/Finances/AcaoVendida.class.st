Class {
	#name : #AcaoVendida,
	#superclass : #Acao,
	#category : #Finances
}

{ #category : #calculation }
AcaoVendida >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self realizaPosicao: umaOperacao ].
	self incrementaPosicao: umaOperacao.
	

]

{ #category : #'as yet unclassified' }
AcaoVendida >> calculaNovoMontanteOperacaoNaoGeradora: umaOperacao [

		^ montanteTotal - (self custoMeuLoteDe: umaOperacao lote).
]

{ #category : #calculation }
AcaoVendida >> incrementaPosicao: umaOperacao [ 

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal - umaOperacao total.
]

{ #category : #tests }
AcaoVendida >> isComprada [

	^ false.
]

{ #category : #testing }
AcaoVendida >> isTipoOperacaoGeradora: umaOPeracao [ 

	umaOPeracao seVenda: [ ^ true ].
	^ false.
]

{ #category : #tests }
AcaoVendida >> isVendida [

	^ true.
]

{ #category : #calculation }
AcaoVendida >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal + valorRealizado.

	
]
