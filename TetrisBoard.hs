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


-- addTetrominoToBoardRowHelp :: Int -> Int -> [SquareType] -> Tetromino -> [SquareType]
-- addTetrominoToBoardRowHelp _ _ [] _ = []
-- addTetrominoToBoardRowHelp row col (x:xs) (Tetromino {tetrominoType = t, squares = sqs, x = tX, y = tY}) =
--     let
--         rest = addTetrominoToBoardRowHelp row (col + 1) xs tetromino
--     in
--         if row >= tY 
--            && row < tY + tetrominoSize
--            && col >= tX
--            && col < tX + tetrominoSize
--            && ((sqs !! row) !! col) then [((sqs !! row) !! col)] ++ rest 
--         else [x] ++ rest

maybeReplaceSquare :: (SquareType, Int) -> Int -> Int -> TetrominoType -> SquareType
maybeReplaceSquare _ _ _ _ = SquareEmpty

addTetrominoToBoardRow :: [(SquareType, Int)] -> Tetromino -> [SquareType]
addTetrominoToBoardRow row (Tetromino {tetrominoType = t, squares = sqs, x = tX, y = tY}) =
    map (\x -> maybeReplaceSquare x tX tY t) row
--     addTetrominoToBoardRowHelp row 0 board tetromino



-- -- adds a given tetromino on top of the squares of the given board
addTetrominoToBoard :: [[SquareType]] -> Tetromino -> [[SquareType]]
addTetrominoToBoard board tetromino = 
    let
        indices = [0..]
        boardWithIndices = zip board indices
    in
        map (\(row, y) -> addTetrominoToBoardRow (zip row indices) tetromino) boardWithIndices

