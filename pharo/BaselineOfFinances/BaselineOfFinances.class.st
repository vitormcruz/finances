Class {
	#name : #BaselineOfFinances,
	#superclass : #BaselineOf,
	#category : #BaselineOfFinances
}

{ #category : #baselines }
BaselineOfFinances >> baseline: spec [ 
    
	<baseline>
        
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
		package: 'Finances-Tests' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Features' with: [ spec requires: 'Finances-Core' ];   
		package: 'Finances-CSV-Adapter' with: [ spec requires: #('Finances-Core' 'NeoCSV') ];   
		package: 'Finances-Memory-Adapter' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-CSV-Adapter-Tests' with: [ spec requires: #('Finances-CSV-Adapter' 'Finances-Memory-Adapter') ];   
		
		group: 'default' with: #('core' 'tests' 'features' 'Roassal2' 'Finances-Memory-Adapter' 'Finances-CSV-Adapter');
		group: 'core' with: #('Finances-Core');
		group: 'tests' with: #(core 'Mocketry' 'Finances-Tests' 'Finances-CSV-Adapter-Tests');			
		group: 'features' with: #(core 'SBDD' 'Finances-Features');		
		group: 'external' with: #('Mocketry' 'Roassal2' 'NeoCSV' 'SBDD' 'LangExtensions' 'ValidationNotification')
	].
]
