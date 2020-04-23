Class {
	#name : #AcoesFake,
	#superclass : #Acoes,
	#category : #'Finances-Core-Tests'
}

{ #category : #armazenamento }
AcoesFake >> get: aString ifAbsentAdd: umaAcao [ 

	^ innerDictionary at: aString 
			  			   ifAbsentPut: umaAcao.
]

{ #category : #initialization }
AcoesFake >> initialize [ 
	
	innerDictionary := Dictionary new.
]
