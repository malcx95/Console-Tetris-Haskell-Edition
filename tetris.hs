import System.IO
import Tetromino
import TetrisBoard
import UI.NCurses
import Data.List
import Control.Monad

-- data Yolo = Yolo {swag :: Int, hype :: String} deriving (Show)
-- 
-- test :: Yolo
-- test = Yolo {swag = 5, hype = "hej"}

main :: IO ()
main = runCurses $ do
    setEcho False
    w <- defaultWindow
    col <- newColorID ColorRed ColorBlack 1
    (rows, cols) <- screenSize
    let board = generateEmptyBoard (fromIntegral $ rows) (fromIntegral $ cols - 1)
    drawBoard board 0 w
    render
    waitFor w (\ev -> ev == EventCharacter 'q' || ev == EventCharacter 'Q')

drawBoard :: [[SquareType]] -> Integer -> Window -> Curses ()
drawBoard [] _ _ = return ()
drawBoard (x:xs) rowNum w = do
    updateWindow w $ do
        drawRow x rowNum 0
    drawBoard xs (rowNum + 1) w

drawRow :: [SquareType] -> Integer -> Integer -> Update ()
drawRow [] _ _ = return ()
drawRow (x:xs) rowNum colNum = do
        moveCursor rowNum colNum
        drawString [(squareToChar x)]
        drawRow xs rowNum (colNum + 1)

waitFor :: Window -> (Event -> Bool) -> Curses ()
waitFor w p = loop where
    loop = do
        ev <- getEvent w Nothing
        case ev of
            Nothing -> loop
            Just ev' -> if p ev' then return () else loop

