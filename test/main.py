n = int(input("size: "))
array = []
for i in range(n):
    array.append(int(input("v: ")))

s = 0
for i in range(n):
    s += array[i]
