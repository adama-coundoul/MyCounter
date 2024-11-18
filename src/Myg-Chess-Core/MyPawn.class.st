Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [ 

	^ 'P'
]

{ #category : 'as yet unclassified' }
MyPawn >> isOnLastRank: aSquare [ 

^ ((aSquare file = $1 ) or: (aSquare file = $8))
]

{ #category : 'testing' }
MyPawn >> isPawn [ 
^ true 
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	
    "Déplace le pion vers une nouvelle case et vérifie s'il doit être promu."
    (self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
    square emptyContents.
    square := aSquare.
    (self isOnLastRank: square )
                ifTrue: [ aSquare contents: self promoteToQueen ]
					 ifFalse: [aSquare contents: self]
 
    
   
    
            
]

{ #category : 'path commands' }
MyPawn >> moveToAutomaticVersion: aSquare [
    "Déplace le pion vers une nouvelle case et vérifie s'il doit être promu."
    (self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
    
    "Vider le contenu de la case actuelle"
    square emptyContents.
    square := aSquare.

    "Vérifier si le pion est sur la dernière rangée"
    (self isOnLastRank: square)
        ifTrue: [
            | newQueen |
            newQueen := self promoteToQueen.
            aSquare contents: newQueen.
            newQueen square: aSquare. "Met à jour la case de la nouvelle reine"
        ]
        ifFalse: [
            aSquare contents: self
        ].

]

{ #category : 'path commands' }
MyPawn >> moveToInteractiveVersion: aSquare [ 
| choice promotedPiece |

"Déplace le pion vers une nouvelle case et vérifie s'il doit être promu."
(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
square emptyContents.
square := aSquare.

((aSquare file = $1) or: (aSquare file = $8)) ifTrue: [
    "Demander à l'utilisateur quelle pièce il souhaite pour la promotion"
    choice := UIManager default chooseFrom: #('Queen' 'Rook' 'Bishop' 'Knight')
                    title: 'Choose a piece for promotion'.

    "Créer la nouvelle pièce selon le choix de l'utilisateur et assigner le board"
    choice = 1 ifTrue: [promotedPiece := (MyQueen new color: self color)].
    choice = 2 ifTrue: [promotedPiece := (MyRook new color: self color)].
    choice = 3 ifTrue: [promotedPiece := (MyBishop new color: self color)].
    choice = 4 ifTrue: [promotedPiece := (MyKnight new color: self color)].
    choice > 4 ifTrue: [self error: 'Invalid choice'].
    
    square contents: promotedPiece.
    promotedPiece square: aSquare.

] ifFalse: [
    aSquare contents: self
].


]

{ #category : 'as yet unclassified' }
MyPawn >> promoteToQueen [
    "Transforme le pion en une reine de la même couleur."
    ^ MyQueen new color: self color.
]

{ #category : 'accessing' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'accessing' }
MyPawn >> targetSquaresLegal: aBoolean [
    ^ (self isWhite
        ifTrue: [
            "Déplacement des pions blancs"
            ((self square file = $2)
                ifTrue: [ { (self square up). (self square up up) } ]  "Mouvement de 1 ou 2 cases"
                ifFalse: [ { self square up } ])  "Mouvement de 1 case"
        ]
        ifFalse: [
            "Déplacement des pions noirs"
            ((self square file = $7)
                ifTrue: [ { (self square down). (self square down down) } ]  "Mouvement de 1 ou 2 cases"
                ifFalse: [ { self square down } ])  "Mouvement de 1 case"
        ])
    select: [ :s | 
        s notNil and: [ 
            s hasPiece not or: [ s contents color ~= color ] 
        ] ].

]
