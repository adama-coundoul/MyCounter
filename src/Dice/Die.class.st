Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'accessing' }
Die >> faces [
	^ faces
]

{ #category : 'initialization' }
Die >> initialize [ 

   faces := 6
]

{ #category : 'as yet unclassified' }
Die >> roll [ 
  ^ 6 atRandom
]
