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
		scenarioOutline: 'Ao investir um montante em uma ação, estou comprando uma certa quantidade de ações'
			   		  def:  'Quando compro "{lote}" ações de IBOV3 no total de R$ "{montante}" em 12/01/2019
						      Então nesta operação o valor da ação de "IBOV3" foi de "{valorAcaoOperacao}"
							   E o valor médio dessas ações passa a ser de "{valorMedio}"'
							
				examples: 	#(  lote    montante  valorAcaoOperacao    valorMedio) asHeaderFor
							 - #(  1000      10000          10                10)
							
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
