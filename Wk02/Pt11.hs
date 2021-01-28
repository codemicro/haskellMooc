-- Wk02x11 - The guessing game, Starman

-- function check takes a secret word, the displayed word and a character as inputted by the player and returns
-- a boolean that represents if the guess was correct in finding a letter and the string to display next time round
check :: String -> String -> Char -> (Bool, String)
check secret disp guessedChar
    = (guessedChar `elem` secret, [if x == guessedChar
            then guessedChar
            else y | (x, y) <- zip secret disp])

-- function turn orchestrates a single turn, checking if the player has won or lost and then allowing another
-- guess if that has been deemed suitable
turn :: String -> String -> Int -> IO ()
turn secret disp guesses =
    do 
        if guesses == 0
            then putStrLn "You lose :("
            else if secret == disp
                then putStrLn "You win! :D"
                else takeGuess secret disp guesses

-- function takes a guess, checks the guess and decrements the guess counter as applicable
takeGuess :: String -> String -> Int -> IO ()
takeGuess secret disp guesses = 
    do 
        putStrLn (disp ++ "   " ++ take guesses (repeat '*'))
        putStr  "  Enter your guess: "
        q <- getLine
        let (correct, disp') = check secret disp (q!!0)
        let guesses' = if correct then guesses else guesses - 1
        turn secret disp' guesses'

-- function starman is the entrypoint, I guess?
starman :: String -> Int -> IO ()
starman word guesses = turn word ['-' | x <- word] guesses
