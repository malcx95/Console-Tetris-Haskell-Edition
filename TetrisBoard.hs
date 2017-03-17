module TetrisBoard where

import Tetromino
import Data.List
import Control.Monad

generateEmptyBoard :: Int
                   -> Int
                   -> [[SquareType]]
generateEmptyBoard rows cols = 
    let
        centerRow = [SquareEmpty] ++ centerRow
        row = [SquareOut] ++ (take (cols - 2) centerRow) ++ [SquareOut]
        col = [row] ++ col
        bottom = [SquareOut] ++ bottom
    in
        (take (rows - 1) col) ++ [(take cols bottom)]


addTetrominoToBoardRowHelp :: Int -> Int -> [SquareType] -> Tetromino -> [SquareType]
addTetrominoToBoardRowHelp _ _ [] _ = []
addTetrominoToBoardRowHelp row col (x:xs) (Tetromino {tetrominoType = t, squares = sqs, x = tX, y = tY}) =
    let
        rest = addTetrominoToBoardRowHelp row (col + 1) xs tetromino
    in
        if row >= tY 
           && row < tY + tetrominoSize
           && col >= tX
           && col < tX + tetrominoSize
           && ((sqs !! row) !! col) then [((sqs !! row) !! col)] ++ rest 
        else [x] ++ rest

addTetrominoToBoardRow :: Int -> [SquareType] -> Tetromino -> [SquareType]
addTetrominoToBoardRow row board tetromino = 
    addTetrominoToBoardRowHelp row 0 board tetromino

-- -- adds a given tetromino on top of the squares of the given board
-- addTetrominoToBoard :: [[SquareType]] -> Tetromino -> [[SquareType]]
-- addTetrominoToBoard board tetromino = addTetrominoToBoardHelp 0 board tetromino

