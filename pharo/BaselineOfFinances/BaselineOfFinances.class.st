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
		
 	   baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											  loads: #(core) ];
														
		package: 'Finances-Core';   
		package: 'Finances-Tests' with: [ spec requires: #('Finances-Core') ];   
		package: 'Finances-Features' with: [ spec requires: 'Finances-Core' ];   
		
		group: 'default' with: #('core' 'tests' 'features');
		group: 'core' with: #('Finances-Core');
		group: 'tests' with: #(core 'Finances-Tests');			
		group: 'features' with: #(core 'Finances-Features')		
	].
]
