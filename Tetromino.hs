
module Tetromino
    (
        SquareType
        , TetrominoType
        , squareToChar
    ) where
        
import UI.NCurses
import Data.List
import Control.Monad

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
    deriving (Show, Eq)

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

