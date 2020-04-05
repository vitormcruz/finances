Class {
	#name : #AcaoComprada,
	#superclass : #Acao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #calculation }
AcaoComprada >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self incrementaPosicao: umaOperacao ].
	self realizaPosicao: umaOperacao.


]

{ #category : #calculation }
AcaoComprada >> incrementaPosicao: umaOperacao [  

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal + umaOperacao total.
]

{ #category : #calculation }
AcaoComprada >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal - valorRealizado.

	
]
