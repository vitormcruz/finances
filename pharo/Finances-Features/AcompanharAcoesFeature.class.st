"
Eu como Investidor
Desejo Investir numa Ação
E acompanhar a minha rentabilidade com ela
"
Class {
	#name : #AcompanharAcoesFeature,
	#superclass : #SbddFeature,
	#instVars : [
		'acoes'
	],
	#category : #'Finances-Features'
}

{ #category : #scenarios }
AcompanharAcoesFeature >> Investir_numa_nova_acao [
	<scenarioOutline>
	^ self
		scenarioOutline: 'O total investido em novas ações dividido pela quantidade comprada é igual ao valor médio de cada ação.'
			   		  def:  'Quando compro "{lote}" ações de IBOV3 no total de R$ "{montante}" em 12/01/2019
						      Então nesta operação o valor da ação de "IBOV3" foi de "{valorAcaoOperacao}"
							   E o valor médio dessas ações passa a ser de "{valorMedio}"'
							
				examples: 	#(  lote    montante  valorAcaoOperacao    valorMedio) asHeaderFor
							 - #(  1000      10000          10                10    )
							 - #(  2000      500            0.25              0.25  )
							 - #(  10       10000           1000              1000  )
							
					  run: [ :lote :montante :ticker :valorAcaoOperacao :valorMedio | 
						| operacao acao |
			
						acao := acoes acaoDoTicker: ticker.
						operacao := acao comprar: lote em: (Date readFrom: '12/01/2019' pattern: 'dd/mm/yyyy') totalizando: montante.
						self assert: operacao valorUnitarioAcao equals: valorAcaoOperacao.
						self assert: acao valorMedio equals: valorMedio 
					]
]

{ #category : #running }
AcompanharAcoesFeature >> setUp [

	acoes := AcoesInMemory new.
	super setUp.

]
