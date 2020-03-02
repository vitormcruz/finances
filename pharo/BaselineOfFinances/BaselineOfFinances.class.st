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
											  loads: #(tests) ];
														
		package: 'Finances';   
		package: 'Finances-Tests' with: [ spec requires: 'Finances' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('SBDD-Core');
		group: 'tests' with: #(core 'SBDD-Tests')			
	].
]
