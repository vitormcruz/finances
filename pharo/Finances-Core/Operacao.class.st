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
		'resultado'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Operacao class >> comLoteDe: lote em: aDate totalizando: anInteger [
	^ super new lote: lote data: aDate total: anInteger
]

{ #category : #accessors }
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

{ #category : #testing }
Operacao >> isCompra [
	self shouldBeImplemented.
]

{ #category : #accessors }
Operacao >> lote [
	^ lote
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

{ #category : #accessors }
Operacao >> total [
	^ total
]

{ #category : #accessors }
Operacao >> valorUnitarioAcao [
	^ valorUnitarioAcao.
]
