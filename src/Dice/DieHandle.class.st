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
