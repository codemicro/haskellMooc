-- Wk03x04 - Lists and recursion

length' lst =
    if lst == []
        then 0
        else  let x:xs = lst in 1 + length' xs

filter' pred lst = 
    if lst == []
        then []
        else let x:xs = lst in if pred x
            then x : filter pred xs
            else filter pred xs
        
main = do
    print (length' [1..10])
    print (filter' (<5) [3,9,2,12,6,4])
