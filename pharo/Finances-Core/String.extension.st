Extension { #name : #String }

{ #category : #'*Finances-Core' }
String >> asAtivoFinanceiroComprado [

	^ AcaoComprada newParaTicker: self.
]

{ #category : #'*Finances-Core' }
String >> asAtivoFinanceiroVendido [

	^ AcaoVendida newParaTicker: self.
]
