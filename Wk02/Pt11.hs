-- starman

-- function check takes a secret word, the displayed word and a character as inputted by the player and returns
-- a boolean that represents if the guess was correct in finding a letter and the string to display next time round
check :: String -> String -> Char -> (Bool, String)
check secret disp guessedChar = (
    guessedChar `elem` secret, 
    [(if x == guessedChar then guessedChar else y) | (x, y) <- zip secret disp]
    )

turn :: String -> String -> Int -> IO ()
turn secret disp guesses =
    do 
        if guesses == 0
            then putStrLn "You lose :("
            else if secret == disp
                then putStrLn "You win! :D"
                else takeGuess secret disp guesses

takeGuess :: String -> String -> Int -> IO ()
takeGuess secret disp guesses = 
    do  putStrLn (disp ++ "  " ++ take guesses (repeat '*'))
        putStr "  Enter a guess: "
        userIn <- getLine
        let (correct, disp') = check secret disp (userIn!!0)
        print correct
        print disp
        print guesses
        let guesses' = if correct then guesses else guesses - 1
        print guesses
        turn secret disp guesses

starman :: String -> Int -> IO ()
starman word guesses = turn word ['-' | x <- word] guesses
