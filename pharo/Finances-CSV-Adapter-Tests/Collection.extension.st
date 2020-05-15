Extension { #name : #Collection }

{ #category : #'*Finances-CSV-Adapter-Tests' }
Collection >> asLancamento [

	^ Lancamento newFor: self.
]
