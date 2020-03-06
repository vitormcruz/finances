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
		package: 'Finances-Tests' with: [ spec requires: 'Finances' ];   
		package: 'Finances-Features' with: [ spec requires: 'Finances' ];   
		
		group: 'default' with: #('core' 'tests' 'features');
		group: 'core' with: #('Finances');
		group: 'tests' with: #(core 'Finances-Tests');			
		group: 'features' with: #(core 'Finances-Features')		
	].
]
