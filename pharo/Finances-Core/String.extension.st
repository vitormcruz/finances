Extension { #name : #String }

{ #category : #'*Finances-Core' }
String >> asAtivoFinanceiroComprado [

	^ AcaoComprada newParaTicker: self.
]
