Class {
	#name : #AcaoVendida,
	#superclass : #Acao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #calculation }
AcaoVendida >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self realizaPosicao: umaOperacao ].
	self incrementaPosicao: umaOperacao.
	

]

{ #category : #calculation }
AcaoVendida >> incrementaPosicao: umaOperacao [ 

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal - umaOperacao total.
]

{ #category : #calculation }
AcaoVendida >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal + valorRealizado.

	
]
