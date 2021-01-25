# maps

def f(x): 
    return x*(x+1)

lst = list(range(1, 11))
li = list(map(f, lst))

# folds

g = lambda acc, elem: acc / elem
accl = 1
for val in lst: 
    accl = g(accl, val)

g_ = lambda acc, elem: elem / acc
accr = 1 
for val in lst[::-1]:
    accr = g_(accr, val)

# printing

print(li)
print(accl)
print(accr)