# LIST
values = [1, 2, "Shrek", 4, 5]
# list is a data type that allows multiple values and can consist of the different data types

print(values[0])  # 1

print(values[2]) # 3

print(values[-1]) # 5

print(values[1:3])  # 2, Shrek

values.insert(3, "Jabba") # adding a new element IN the list
print(values)

values.append("Ending") # adding a new element AT THE END of the list
print(values)

values[2] = "GONK" # UPDATE the value within the list
print(values)

del values[0]   # DELETE value from the list
print(values)




# TUPLE - same data type as LIST, but cannot be changed (immutable)
tup = (1, 2, "Bob", 4.5)
print(tup[1])

# tup[2] = "Hulk" -- this command will not work, since TUPLE is immutable (cannot be changed)




# DICTIONARY
dic = {"a": 2, 4: "back", "c": "Hello There!"}
print(dic["c"])

dict = {}
dict["FirstName"] = "G"
dict["LastName"] = "Kap"
dict["Gender"] = "male"
print(dict)
print(dict["LastName"])

