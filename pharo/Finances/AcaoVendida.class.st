Class {
	#name : #AcaoVendida,
	#superclass : #Acao,
	#category : #Finances
}

{ #category : #'as yet unclassified' }
AcaoVendida >> calculaNovoMontanteOperacaoNaoGeradora: umaOperacao [

		^ montanteTotal - (self custoMeuLoteDe: umaOperacao lote).
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
