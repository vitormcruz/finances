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
		'acao'
	],
	#category : #Finances
}

{ #category : #'instance creation' }
Operacao class >> comLoteDe: lote paraAcaor: aString em: aDate totalizando: anInteger [ 

	^ super new lote: lote
					acao: aString
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

	initializeOneTimeOnly := [ :initializationBlok |
		initializationBlok value.
		initializeOneTimeOnly := [ :initializationBloc | 
				Error signal: 'Este objeto só pode ser inicializado uma vez, depois disso torna-se imutável' 
			]
	].

	id := UUID new.
]

{ #category : #accessing }
Operacao >> lote [
	^ lote
]

{ #category : #'instance initialization' }
Operacao >> lote: loteInteger acao: aString data: aDate total: montanteInteger [

	initializeOneTimeOnly value: [ 
		acao := aString.
		data  := aDate.
		total := montanteInteger.
		lote := loteInteger.
		valorUnitarioAcao := total / lote.
	]
]

{ #category : #accessing }
Operacao >> total [
	^ total
]

{ #category : #accessors }
Operacao >> valorUnitarioAcao [
	^ valorUnitarioAcao.
]
