import random

x = [ i for i in range(10, 110, 10) ]
a = []

while x:
    a.append(random.choice(x))
    x.pop(x.index(a[len(a) - 1]))

print(a)

for i in range(len(a)):
    for j in range(len(a)):
        if a[i] < a[j]:
            a[i], a[j] = a[j], a[i]

print(a)
