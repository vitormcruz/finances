Class {
	#name : #BaselineOfFinances,
	#superclass : #BaselineOf,
	#category : #BaselineOfFinances
}

{ #category : #baselines }
BaselineOfFinances >> baseline: spec [ 
    
	<baseline>
	<todo: 'tentar usar os grupos como dependências dos pacotes'>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'gitlab://vitormcruz/finances';   
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
													 		loads: #(core) ];
														
 	   baseline: 'ValidationNotification' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
													 		        loads: #(core) ];
		
	   baseline: 'Mocketry'
      with: [ spec repository: 'github://dionisiydk/Mocketry:v6.0.2' ];

	   baseline: 'Roassal2'
    	with: [spec repository: 'github://ObjectProfile/Roassal2/src'];
	
		baseline: 'NeoCSV'
		with: [ spec repository: 'github://svenvc/NeoCSV:v15' ];
		
 	   baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sbdd:develop'; 
											  loads: #(core) ];
										
		package: 'Finances-Core' with: [spec requires: #('LangExtensions' 'ValidationNotification')];   
		package: 'Finances-Core-Tests' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Features' with: [ spec requires: #('Finances-Core' 'Finances-Adapter-Memory' 'SBDD') ];   
		package: 'Finances-Adapter-CSV' with: [ spec requires: #('Finances-Core' 'NeoCSV') ];   
		package: 'Finances-Adapter-Memory' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Adapter-Spec2' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Adapter-CSV-Tests' with: [ spec requires: #('Finances-Adapter-CSV' 'Finances-Adapter-Memory') ];   
		package: 'Finances-App' with: [spec requires: #('Finances-Core')]; 
		
		group: 'default' with: #('core' 'tests' 'features' 'Roassal2' 'Finances-Adapter-Memory' 'Finances-Adapter-CSV' 'Finances-Adapter-Spec2');
		group: 'core' with: #('Finances-Core' 'Finances-Adapter-CSV' );
		group: 'tests' with: #(core 'Mocketry' 'Finances-Core-Tests' 'Finances-Adapter-CSV-Tests');			
		group: 'features' with: #(core 'Finances-Features');		
		group: 'external' with: #('Mocketry' 'Roassal2' 'NeoCSV' 'SBDD' 'LangExtensions' 'ValidationNotification')
	].
]
