Extension { #name : #Collection }

{ #category : #'*Finances-Adapter-CSV-Tests' }
Collection >> asLancamento [

	^ Lancamento newFor: self.
]
