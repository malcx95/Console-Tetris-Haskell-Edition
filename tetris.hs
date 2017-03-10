import Data.List
import System.IO
import Control.Monad
import UI.NCurses

-- data Yolo = Yolo {swag :: Int, hype :: String} deriving (Show)
-- 
-- test :: Yolo
-- test = Yolo {swag = 5, hype = "hej"}

main :: IO ()
main = runCurses $ do
    setEcho False
    w <- defaultWindow
    col <- newColorID ColorRed ColorBlack 1
    updateWindow w $ do
        moveCursor 1 10
        setColor col
        drawString "Hello world!"
        moveCursor 3 10
        drawString "(press q to quit)"
        moveCursor 0 0
    render
    waitFor w (\ev -> ev == EventCharacter 'q' || ev == EventCharacter 'Q')

waitFor :: Window -> (Event -> Bool) -> Curses ()
waitFor w p = loop where
    loop = do
        ev <- getEvent w Nothing
        case ev of
            Nothing -> loop
            Just ev' -> if p ev' then return () else loop
