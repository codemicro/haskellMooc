x = map ((+6).(*3)) [1..20]
y = foldl (\a c -> c:a) "" "hello world"
z = sum' [1..20]
a = product' [1..20]

sum' = foldl (+) 0
product' = foldl (*) 1

main = do 
    print x
    print y
    print z
    print a
