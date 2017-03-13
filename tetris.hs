import System.IO
import Control.Monad.IO.Class
import Control.Concurrent
import Tetromino
import TetrisBoard
import UI.NCurses
import Data.List
import Control.Monad

data Action 
    = NoAction
    | RotateRight
    | RotateLeft
    | MoveLeft
    | MoveRight
    | RushDown
    | Quit
    deriving (Eq)

main :: IO ()
main = runCurses $ do
    setEcho False
    w <- defaultWindow
    colors <- initColors
    (rows, cols) <- screenSize
    let board = generateEmptyBoard (fromIntegral $ rows) (fromIntegral $ cols - 1)
    mainLoop w board colors 0
    -- drawBoard board colors 0 w
    -- render
    -- waitFor w (\ev -> ev == EventCharacter 'q' || ev == EventCharacter 'Q')

mainLoop    :: Window           -- the window
            -> [[SquareType]]   -- the board
            -> [ColorID]        -- the colors
            -> Integer          -- counter
            -> Curses ()
mainLoop w board colors counter = do
        liftIO $ threadDelay 100000
        ev <- getEvent w (Just 0)
        let action = getAction ev
        drawBoard board colors 0 w
        render
        if action == Quit then
            return ()
        else
            mainLoop w board colors (counter + 1)

getAction :: Maybe Event -> Action
getAction ev = 
    case ev of
        Nothing -> NoAction
        Just ev' -> if ev' == EventCharacter 'q' || ev' == EventCharacter 'Q' then
                        Quit
                    else if ev' == EventSpecialKey KeyUpArrow then
                        RotateLeft
                    else if ev' == EventSpecialKey KeyDownArrow then
                        RotateRight
                    else if ev' == EventSpecialKey KeyLeftArrow then
                        MoveLeft
                    else if ev' == EventSpecialKey KeyRightArrow then
                        MoveRight
                    else if ev' == EventCharacter ' ' then
                        RushDown
                    else
                        NoAction

initColors :: Curses ([ColorID])
initColors = do
    cyan <- newColorID ColorCyan ColorDefault 1
    blue <- newColorID ColorBlue ColorDefault 2
    white <- newColorID ColorWhite ColorDefault 3
    yellow <- newColorID ColorYellow ColorDefault 4
    green <- newColorID ColorGreen ColorDefault 5
    magenta <- newColorID ColorMagenta ColorDefault 6
    red <- newColorID ColorRed ColorDefault 7
    gray <- newColorID ColorDefault ColorDefault 8
    nothing <- newColorID ColorBlack ColorDefault 9
    return ([cyan, blue, white, yellow, green, magenta, red, gray, nothing])

getColor :: SquareType -> [ColorID] -> ColorID
getColor square colors = case square of
                   SquareEmpty  -> colors !! 8
                   SquareOut    -> colors !! 7
                   SquareI      -> colors !! 0
                   SquareJ      -> colors !! 1
                   SquareL      -> colors !! 2
                   SquareO      -> colors !! 3
                   SquareS      -> colors !! 4
                   SquareT      -> colors !! 5
                   SquareZ      -> colors !! 6

drawBoard :: [[SquareType]] -> [ColorID] -> Integer -> Window -> Curses ()
drawBoard [] _ _ _ = return ()
drawBoard (x:xs) colors rowNum w = do
    updateWindow w $ do
        moveCursor rowNum 0
        drawRow x colors
    drawBoard xs colors (rowNum + 1) w

drawRow :: [SquareType] -> [ColorID] -> Update ()
drawRow [] _ = return ()
drawRow (x:xs) colors = do
        let col = getColor x colors
        setColor col
        drawString [(squareToChar x)]
        drawRow xs colors

