Class {
	#name : #OperacaoVenda,
	#superclass : #Operacao,
	#category : #Finances
}

{ #category : #'instance initialization' }
OperacaoVenda >> lote: loteOPeracao acao: umaAcao data: aDate total: montanteInteger [

	super lote: loteOPeracao acao: umaAcao data: aDate total: montanteInteger.
	acao seComprada: [ resultado := montanteInteger - (umaAcao custoMeuLoteDe: loteOPeracao) ].

]

{ #category : #calculations }
OperacaoVenda >> seVenda: aBlockClosure [ 

	^ aBlockClosure value.
]
