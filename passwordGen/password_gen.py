## This is a built in function in python that will generate random
import random

##This will print text into the console to intoduce the user to the program
print("Welcome To Andrew's Password Creator")

##This variable will hold all avalible characters to be used in the generated password
chars = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890!£$%^&*_+@:?>"

##This sets the variable that controls the number of requested passwords inputted by user
number = input("Password Amount: ")
number = int(number)

##This sets the variable that controls the length of the password inpuitted by user
length = input("Password length: ")
length = int(length)

##This prints to the console the begining of the password output
print("\nHere are your passwords! ")


## pwd is a shorthand for password
for pwd in range(number): 
    passwords = ""
    for c in range(length):
##this will add both random and choice together to build password string
        passwords += random.choice(chars)
##This will print desired amount of password at the length inputted by user
    print(passwords)
