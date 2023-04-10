import random

values = [ random.choice([0, 1]) for i in range(11) ]
print(values)
s = 0

for i in range(len(values)):
    s += ((2 ** (len(values) - i - 1)) * values[i])

print(s)
