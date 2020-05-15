Class {
	#name : #Lancamento,
	#superclass : #Object,
	#instVars : [
		'ticker',
		'data',
		'quantidade',
		'valor'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Lancamento class >> newFor: aCollection [ 

	^ (self newValidating: [ 
		super new newFor: aCollection.
   ]) failOnCreationFailed.
]

{ #category : #accessing }
Lancamento >> data [
	^ data
]

{ #category : #'instance creation' }
Lancamento >> newFor: aCollection [ 

	| validationObserver |
	
	validationObserver := SimpleValidationObserver new.
	
	aCollection size = 4 ifFalse: [ 
		^ self issueError: 'Um lançamento deve ter ao menos quatro campos, mas este foi criado com ', aCollection size asString
	].

	ticker := aCollection first.
	data := [ Date readFrom: aCollection second readStream pattern: 'dd/m/yyyy' ] 
				on: Exception 
				do: [ self issueError: 'A data está no formato inválido: "', aCollection second, '"' ].
				
	quantidade := [ aCollection third asNumber ] 
						on: Exception 
						do: [ self issueError: 'A quantidade está no formato inválido: "', aCollection third, '"' ].
						
	valor := [ aCollection fourth asNumber ] 
					on: Exception 
					do: [ self issueError: 'O valor está no formato inválido: "', aCollection fourth, '"' ].
					
	validationObserver onValidationError: [ ^ self ].
	
	quantidade = 0 ifTrue: [ self issueError: 'A quantidade do lote não pode ser igual a 0.'  ].
	
   valor < 0 ifTrue: [ self issueError: 'O valor do lote não podeser igual negativo.' ].
]

{ #category : #accessing }
Lancamento >> quantidade [
	^ quantidade
]

{ #category : #accessing }
Lancamento >> ticker [
	^ ticker
]

{ #category : #accessing }
Lancamento >> valor [
	^ valor
]
