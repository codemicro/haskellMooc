-- Wk03x07 - Write a Spelling Book Generator 

padText = " is for "
separator = ", "

-- speller takes a list of strings and returns an "a is for apple, b is for banana, etc" style string with the inputted words.
speller :: [[Char]] -> [Char] 
speller = foldl (\acc nv -> 
    let text = [head nv] ++ padText ++ nv 
    in if null acc then text else acc ++ separator ++ text) ""

main = do 
    print (speller ["apple", "banana", "coconut"])