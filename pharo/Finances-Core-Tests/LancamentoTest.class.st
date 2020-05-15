"
A LancamentoTest is a test class for testing the behavior of Lancamento
"
Class {
	#name : #LancamentoTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #tests }
LancamentoTest >> testa_criar_com_array_vazio [

	self should: [ Lancamento newFor: #() ]
		  raise: ValidationError 
		  withExceptionDo: [ :ex | 
		  		self assert: ex messageText 
					  equals: 'Validation failed with errors: Um lançamento deve ter ao menos quatro campos, mas este foi criado com 0'
		  ].
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_campos_adequados [

	| lancamento |
	
	lancamento := Lancamento newFor: #('BOVA11' '01/04/1984' '100' '1000').
	self assert: lancamento ticker equals: 'BOVA11'.
	self assert: lancamento data equals: (Date newDay: 1 month: 4 year: 1984).
	self assert: lancamento quantidade equals: 100.
	self assert: lancamento valor equals: 1000.
	
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_campos_adequados_e_quantidade_negativa [

	| lancamento |
	
	lancamento := Lancamento newFor: #('BOVA11' '01/04/1984' '-100' '1000').
	self assert: lancamento ticker equals: 'BOVA11'.
	self assert: lancamento data equals: (Date newDay: 1 month: 4 year: 1984).
	self assert: lancamento quantidade equals: -100.
	self assert: lancamento valor equals: 1000.
	
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_campos_de_dados_invalidos [

	self should: [ Lancamento newFor: #('BOVA11' 'data errada' 'qtd errada' 'valor errado') ]
		  raise: ValidationError 
		  withExceptionDo: [ :ex | 
		  		self assert: ex messageText
					  equals: 'Validation failed with errors: A data está no formato inválido: "data errada", ',
								 'A quantidade está no formato inválido: "qtd errada", ', 
								 'O valor está no formato inválido: "valor errado"'	
		  ]
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_menos_campos_do_que_esperado [

	self should: [ Lancamento newFor: #('BOVA11') ]
		  raise: ValidationError 
		  withExceptionDo: [ :ex | 
		  		self assert: ex messageText
					  equals: 'Validation failed with errors: Um lançamento deve ter ao menos quatro campos, mas este foi criado com 1'	
		  ]
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_qtd_numerico_nulo [

	self should: [ Lancamento newFor: #('BOVA11' '01/04/1984' '0' '1000') ]
		  raise: ValidationError 
		  withExceptionDo: [ :ex | 
		  		self assert: ex messageText
					  equals: 'Validation failed with errors: A quantidade do lote não pode ser igual a 0.'	
		  ]
]

{ #category : #tests }
LancamentoTest >> testa_criar_com_valor_numerico_negativo [

	self should: [ Lancamento newFor: #('BOVA11' '01/04/1984' '100' '-1000') ]
		  raise: ValidationError 
		  withExceptionDo: [ :ex | 
		  		self assert: ex messageText
					  equals: 'Validation failed with errors: O valor do lote não podeser igual negativo.'	
		  ]
]
