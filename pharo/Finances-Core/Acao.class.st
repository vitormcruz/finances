Class {
	#name : #Acao,
	#superclass : #Object,
	#instVars : [
		'ticker'
	],
	#category : #'Finances-Core'
}

{ #category : #testing }
Acao class >> isAbstract [
	
	^ self = Acao. 
]

{ #category : #'instance creation' }
Acao class >> newParaTicker: ticker [

	^ super new ticker: ticker.
]

{ #category : #accessors }
Acao >> ticker [
	^ ticker
]

{ #category : #accessors }
Acao >> ticker: tickerName [

	ticker := tickerName.
]

{ #category : #accessor }
Acao >> tipo [

	^ #Acao.
]
