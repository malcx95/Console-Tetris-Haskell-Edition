
module Tetromino
    (
        SquareType(..)
        , TetrominoType(..)
        , squareToChar
    ) where
        
import Data.List
import Control.Monad

iBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["IIIIIIII"]
          , ["IIIIIIII"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

lBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["LLLLLLee"]
          , ["LLLLLLee"]
          , ["LLeeeeee"]
          , ["LLeeeeee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

jBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeJJJJJJ"]
          , ["eeJJJJJJ"]
          , ["eeeeeeJJ"]
          , ["eeeeeeJJ"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

oBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeOOOOee"]
          , ["eeOOOOee"]
          , ["eeOOOOee"]
          , ["eeOOOOee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

sBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeeeSSSS"]
          , ["eeeeSSSS"]
          , ["eeSSSSee"]
          , ["eeSSSSee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

tBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["eeTTTTTT"]
          , ["eeTTTTTT"]
          , ["eeeeTTee"]
          , ["eeeeTTee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
        ]

zBody =
        [
            ["eeeeeeee"]
          , ["eeeeeeee"]
          , ["ZZZZeeee"]
          , ["ZZZZeeee"]
          , ["eeZZZZee"]
          , ["eeZZZZee"]
          , ["eeeeeeee"]
          , ["eeeeeeee"]
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
bodyToSquares (x:xs) =
    let
        row = map charToSquare (x !! 0)
    in
        row ++ bodyToSquares xs


-- createTetromino :: Int -- random number between 0-6
--                 -> Tetromino
                

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

