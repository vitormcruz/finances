Class {
	#name : #Operacao,
	#superclass : #Object,
	#instVars : [
		'data',
		'total',
		'id',
		'valorUnitarioAcao',
		'initializeOneTimeOnly',
		'lote',
		'acao',
		'resultado'
	],
	#category : #Finances
}

{ #category : #'instance creation' }
Operacao class >> comLoteDe: lote em: aDate totalizando: anInteger [
	^ super new lote: lote data: aDate total: anInteger
]

{ #category : #'instance creation' }
Operacao class >> comLoteDe: lote paraAcao: umaAcao em: aDate totalizando: anInteger [ 

	^ super new lote: lote
					acao: umaAcao
			  	   data: aDate
				   total: anInteger.
]

{ #category : #'ston-core' }
Operacao class >> stonAllInstVarNames [

	^ super stonAllInstVarNames asOrderedCollection remove: #initializeOneTimeOnly; yourself.
]

{ #category : #accessors }
Operacao >> acao [
	^ acao
]

{ #category : #accessing }
Operacao >> data [
	^ data
]

{ #category : #accessors }
Operacao >> id [
	^ id.
]

{ #category : #initialization }
Operacao >> initialize [

	initializeOneTimeOnly := [ 
		initializeOneTimeOnly := [ 
			Error signal: 'Este objeto só pode ser inicializado uma vez, depois disso torna-se imutável' 		]
	].

	id := UUID new.
]

{ #category : #'as yet unclassified' }
Operacao >> isCompra [
	self shouldBeImplemented.
]

{ #category : #accessing }
Operacao >> lote [
	^ lote
]

{ #category : #'instance initialization' }
Operacao >> lote: loteOperacao acao: umaAcao data: aDate total: montanteInteger [

	initializeOneTimeOnly value.
	acao := umaAcao.
	data  := aDate.
	total := montanteInteger.
	lote := loteOperacao.
	valorUnitarioAcao := total / lote.
]

{ #category : #'instance initialization' }
Operacao >> lote: loteOperacao data: aDate total: montanteInteger [

	initializeOneTimeOnly value.
	data  := aDate.
	total := montanteInteger.
	lote := loteOperacao.
	valorUnitarioAcao := (total ~= 0) & (lote ~= 0) ifTrue: [ total / lote ]
																  ifFalse: [ 0 ].
]

{ #category : #accessors }
Operacao >> resultado [
	^ resultado.
]

{ #category : #calculations }
Operacao >> seCompra: aBlockClosure [ 
	^ nil.
]

{ #category : #calculations }
Operacao >> seVenda: aBlockClosure [ 

	^ nil.
]

{ #category : #accessing }
Operacao >> total [
	^ total
]

{ #category : #accessors }
Operacao >> valorUnitarioAcao [
	^ valorUnitarioAcao.
]
