Class {
	#name : #Lancamento,
	#superclass : #Object,
	#instVars : [
		'ticker',
		'data',
		'valor',
		'lote'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Lancamento class >> extractFieldsFrom: aCollection into: aBlockClosure [

	<todo: 'Revisar e tentar melhorar isso usando linguagem funcional....'>

	| ticker data quantidade valor |
	
	aCollection size = 4 ifFalse: [ 
		self issueError: 'Um lançamento deve ter ao menos quatro campos, mas este foi criado com ', aCollection size asString.
		^ aBlockClosure valueWithArguments: { nil. nil. nil. nil. }.
	].

	ticker := aCollection first.
	
	[ data := Date readFrom: aCollection second readStream pattern: 'dd/m/yyyy' ] 
		on: Exception 
		do: [ self issueError: 'A data está no formato inválido: "', aCollection second, '"' ].
				
	[ quantidade := aCollection third 
										asNumber
										validate: [ :it | it = 0 ifTrue: [ self issueError: 'A quantidade do lote não pode ser igual a 0.' ] ]
   ] on: Exception 
	  do: [ self issueError: 'A quantidade está no formato inválido: "', aCollection third, '"' ].
						
	[ valor := aCollection fourth 
								  asNumber 
								  validate: [ :it | it < 0 ifTrue: [ self issueError: 'O valor do lote não pode ser negativo.' ] ]
	] on: Exception 
	  do: [ self issueError: 'O valor está no formato inválido: "', aCollection fourth, '"' ].
					

	^ aBlockClosure valueWithArguments: { ticker. data. quantidade. valor. }
	

]

{ #category : #'instance creation' }
Lancamento class >> newFor: aCollection [ 

	"Cria um novo lançamento a partir um array desestruturado"

	^ (self newValidating: [
		self extractFieldsFrom: aCollection into: [ :ticker :data :quantidade :valor |
			self ticker: ticker lote: quantidade data: data valor: valor.
		].
   ]) failOnCreationFailed.
]

{ #category : #'instance creation' }
Lancamento class >> ticker: ticker lote: lote data: data valor: valor [

	| lancamentoClass |
	
	lancamentoClass := LancamentoCompra.
	lote ifNil: [ lancamentoClass = Lancamento ].
	[ lote isNotNil ], [lote negative] ifAllTrue: [ lancamentoClass := LancamentoVenda ].
	
	^ lancamentoClass new ticker: ticker lote: lote data: data valor: valor.
]

{ #category : #processamento }
Lancamento >> aplicarEm: posicao [

	^ posicao comprar: lote em: data totalizando: valor.
]

{ #category : #accessing }
Lancamento >> data [
	^ data
]

{ #category : #accessing }
Lancamento >> lote [
	^ lote
]

{ #category : #processamento }
Lancamento >> processaOperacoesPara: posicoes [

	| posicao |

	posicao := posicoes ativaDoTicker: self ticker doTipo: self tipo.
	^ self aplicarEm: posicao.
	
	

]

{ #category : #accessing }
Lancamento >> ticker [
	^ ticker
]

{ #category : #'instance creation' }
Lancamento >> ticker: umTicker lote: umLote data: umaData valor: umValor [

	ticker := umTicker.
	lote := umLote.
	data := umaData.
	valor := umValor.


]

{ #category : #accessors }
Lancamento >> tipo [
	
	^ #Comprada.
]

{ #category : #accessing }
Lancamento >> valor [
	^ valor
]
