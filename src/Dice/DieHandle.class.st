Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'arithmetic' }
DieHandle >> + aDieHandle [ 
	|aNewHandle|
	aNewHandle := self class new.
	dice do: [:each | aNewHandle addDie:each ].
	(aDieHandle dice) do: [ :each | aNewHandle addDie:each ].
	^ aNewHandle 
	
	
]

{ #category : 'adding' }
DieHandle >> addDie: aDie [ 
	dice add: aDie 
]

{ #category : 'accessing' }
DieHandle >> dice [ 
	^ dice 
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
