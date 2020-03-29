Class {
	#name : #AcaoComprada,
	#superclass : #Acao,
	#category : #Finances
}

{ #category : #'as yet unclassified' }
AcaoComprada >> calculaNovoMontanteOperacaoNaoGeradora: umaOperacao [

	^ montanteTotal - (self custoMeuLoteDe: umaOperacao lote).
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
