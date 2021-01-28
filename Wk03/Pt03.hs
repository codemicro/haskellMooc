-- Wk03x03a - Functional maps and folds versus imperative loops

-- maps
f x = x * (x+1)

lst = [1..10]
li = map f lst

-- folds

accl = foldl (/) 1 lst
accr = foldr (/) 1 lst

-- main

main = do
    print li
    print accl
    print accr