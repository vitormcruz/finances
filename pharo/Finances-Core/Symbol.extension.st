Extension { #name : #Symbol }

{ #category : #'*Finances-Core' }
Symbol >> asPosicaoClass [

	self = #Comprada ifTrue: [ ^ PosicaoComprada ].
	self = #Vendida ifTrue: [ ^ PosicaoVendida ].
	Error signal: 'Uma posição só pode ser #Comprada ou #Vendida, mas tentouse fazer a conversão de ', self.
]
