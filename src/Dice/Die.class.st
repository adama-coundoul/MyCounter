Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'as yet unclassified' }
Die class >> withFaces: anInteger [ 
	| instance |
	instance := self new.
	instance faces: anInteger. 
	^ instance 
]

{ #category : 'accessing' }
Die >> faces [
	^ faces
]

{ #category : 'accessing' }
Die >> faces: anInteger [
 	 faces := anInteger 
]

{ #category : 'initialization' }
Die >> initialize [ 

   faces := 6
]

{ #category : 'as yet unclassified' }
Die >> roll [ 
  ^ 6 atRandom
]
