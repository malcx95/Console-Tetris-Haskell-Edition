
module Tetromino
    (
        SquareType(..)
        , TetrominoType(..)
        , tetrominoSize
        , squareToChar
    ) where
        
import Data.List
import Control.Monad

tetrominoSize :: Int
tetrominoSize = 8

iBody :: [[Char]]
iBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['I', 'I', 'I', 'I', 'I', 'I', 'I', 'I']
          , ['I', 'I', 'I', 'I', 'I', 'I', 'I', 'I']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

lBody :: [[Char]]
lBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['L', 'L', 'L', 'L', 'L', 'L', 'e', 'e']
          , ['L', 'L', 'L', 'L', 'L', 'L', 'e', 'e']
          , ['L', 'L', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['L', 'L', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

jBody :: [[Char]]
jBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'J', 'J', 'J', 'J', 'J', 'J']
          , ['e', 'e', 'J', 'J', 'J', 'J', 'J', 'J']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'J', 'J']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'J', 'J']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

oBody :: [[Char]]
oBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'O', 'O', 'O', 'O', 'e', 'e']
          , ['e', 'e', 'O', 'O', 'O', 'O', 'e', 'e']
          , ['e', 'e', 'O', 'O', 'O', 'O', 'e', 'e']
          , ['e', 'e', 'O', 'O', 'O', 'O', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

sBody :: [[Char]]
sBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'S', 'S', 'S', 'S']
          , ['e', 'e', 'e', 'e', 'S', 'S', 'S', 'S']
          , ['e', 'e', 'S', 'S', 'S', 'S', 'e', 'e']
          , ['e', 'e', 'S', 'S', 'S', 'S', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

tBody :: [[Char]]
tBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'T', 'T', 'T', 'T', 'T', 'T']
          , ['e', 'e', 'T', 'T', 'T', 'T', 'T', 'T']
          , ['e', 'e', 'e', 'e', 'T', 'T', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'T', 'T', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

zBody :: [[Char]]
zBody =
        [
            ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['Z', 'Z', 'Z', 'Z', 'e', 'e', 'e', 'e']
          , ['Z', 'Z', 'Z', 'Z', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'Z', 'Z', 'Z', 'Z', 'e', 'e']
          , ['e', 'e', 'Z', 'Z', 'Z', 'Z', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
          , ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
        ]

data SquareType 
    = SquareEmpty
    | SquareOut
    | SquareI
    | SquareL
    | SquareJ
    | SquareO
    | SquareS
    | SquareT
    | SquareZ
    deriving (Show, Eq)

data TetrominoType 
    = TetrominoI
    | TetrominoL
    | TetrominoJ
    | TetrominoO
    | TetrominoS
    | TetrominoT
    | TetrominoZ
    | TetrominoNone
    deriving (Show, Eq)

data Tetromino =
    Tetromino { tetrominoType ::    TetrominoType
              , squares ::          [[SquareType]]
              , x ::                Int
              , y ::                Int
              }
    deriving Show

charToSquare :: Char -> SquareType
charToSquare c =
    case c of
        'e' -> SquareEmpty  
        'X' -> SquareOut    
        'I' -> SquareI      
        'L' -> SquareL      
        'J' -> SquareJ      
        'O' -> SquareO      
        'S' -> SquareS      
        'T' -> SquareT      
        'Z' -> SquareZ      

bodyToSquares :: [[Char]] -> [[SquareType]]
bodyToSquares =
    map $ map charToSquare 

squareToChar :: SquareType -> Char
squareToChar x = case x of
                   SquareEmpty  -> ' '
                   SquareOut    -> 'X'
                   SquareI      -> 'I'
                   SquareL      -> 'L'
                   SquareJ      -> 'J'
                   SquareO      -> 'O'
                   SquareS      -> 'S'
                   SquareT      -> 'T'
                   SquareZ      -> 'Z'

createTetromino :: Int -- random number (0-6)
                -> Tetromino
createTetromino 0 = Tetromino {tetrominoType=TetrominoI, squares=bodyToSquares iBody, x=0, y=0}
createTetromino 1 = Tetromino {tetrominoType=TetrominoL, squares=bodyToSquares lBody, x=0, y=0}
createTetromino 2 = Tetromino {tetrominoType=TetrominoJ, squares=bodyToSquares jBody, x=0, y=0}
createTetromino 3 = Tetromino {tetrominoType=TetrominoO, squares=bodyToSquares oBody, x=0, y=0}
createTetromino 4 = Tetromino {tetrominoType=TetrominoS, squares=bodyToSquares sBody, x=0, y=0}
createTetromino 5 = Tetromino {tetrominoType=TetrominoT, squares=bodyToSquares tBody, x=0, y=0}
createTetromino 6 = Tetromino {tetrominoType=TetrominoZ, squares=bodyToSquares zBody, x=0, y=0}

