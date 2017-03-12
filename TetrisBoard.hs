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
    in
        take rows col

