Extension { #name : #String }

{ #category : #'*Finances-Core' }
String >> asAtivoFinanceiro [

	^ Acao newParaTicker: self.
]
