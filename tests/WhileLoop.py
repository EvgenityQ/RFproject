it = 10

while it > 1:
    if it == 9:
        it = it - 1
        continue    # skip iteration if condiiton is TRUE
    if it == 3:
        break   # stop the program if condition is TRUE
    print(it)
    it = it -1

print("While loop is done")
