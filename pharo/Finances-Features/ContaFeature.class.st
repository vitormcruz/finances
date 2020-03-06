Class {
	#name : #ContaFeature,
	#superclass : #SbddFeature,
	#category : #'Finances-Features'
}

{ #category : #'as yet unclassified' }
ContaFeature >> Criar_uma_nova_conta_feature [

	<scenariooutline>
	
	self scenarioOutline: ''
						 def:  ''
						 examples:   #(         'nome'                  'resultado'              ) asHeaderFor 
									  - #(  'Conta Exemplo'         'Ok'                            )	 
									  - #(  'Conta Exemplo 2'       'Ok'                            )	 
									  - #(         nil              'Não pode criar conta sem nome' )	 
						 run: [ :nome :resultado |
							(Conta newNomeado: nome) ifErrObject: [ self assert: 'Ok' equals: 'Não pode criar conta sem nome'] .
						 ]
]
