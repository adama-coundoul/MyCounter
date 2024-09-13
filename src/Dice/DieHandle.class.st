Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'adding' }
DieHandle >> addDie: aDie [ 
	dice add: aDie 
]

{ #category : 'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size 
]

{ #category : 'initialization' }
DieHandle >> initialize [ 
	dice := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
DieHandle >> roll [ 
   |n|
	n := 0.
	dice do: [:each | n := n + each roll ].
	^ n 
	
]

{ #category : 'as yet unclassified' }
DieHandle >> sumFaces [ 
	|n|
	n := 0.
	dice do: [:each | n := n + each faces ].
	^ n 
]
