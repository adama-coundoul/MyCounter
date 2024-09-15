Extension { #name : 'Integer' }

{ #category : '*Dice' }
Integer >> D20 [
	|aNewDieHandle|
	aNewDieHandle := DieHandle new.
	self timesRepeat: [ aNewDieHandle addDie: (Die withFaces: 20) ].
	^ aNewDieHandle 
]
