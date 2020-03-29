Class {
	#name : #OperacaoCompra,
	#superclass : #Operacao,
	#category : #Finances
}

{ #category : #'instance initialization' }
OperacaoCompra >> lote: loteOperacao acao: umaAcao data: aDate total: montanteInteger [

	super lote: loteOperacao 
			acao: umaAcao 
			data: aDate 
			total: montanteInteger.
			
	acao seVendida: [ resultado := (umaAcao custoMeuLoteDe: loteOperacao) - montanteInteger ].
]

{ #category : #calculations }
OperacaoCompra >> seCompra: aBlockClosure [ 
	^ aBlockClosure value.
]
