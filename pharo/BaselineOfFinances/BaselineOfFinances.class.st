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
		
	   baseline: 'Mocketry'
      with: [ spec repository: 'github://dionisiydk/Mocketry:v6.0.2' ];

	   baseline: 'Roassal2'
    	with: [spec repository: 'github://ObjectProfile/Roassal2/src'];
		
 	   baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sbdd:develop'; 
											  loads: #(core) ];
														
		package: 'Finances-Core';   
		package: 'Finances-Tests' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Features' with: [ spec requires: 'Finances-Core' ];   
		
		group: 'default' with: #('core' 'tests' 'features' 'Roassal2');
		group: 'core' with: #('Finances-Core');
		group: 'tests' with: #(core 'Mocketry' 'Finances-Tests');			
		group: 'features' with: #(core 'SBDD' 'Finances-Features')		
	].
]
