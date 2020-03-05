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
		
 	   baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											  loads: #(core) ];
														
		package: 'Finances';   
		package: 'Finances-Tests' with: [ spec requires: 'SBDD' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('Finances');
		group: 'tests' with: #(core 'Finances-Tests')			
	].
]
