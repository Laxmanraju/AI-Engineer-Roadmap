from operator import truediv
# https://www.youtube.com/watch?v=_uQrJ0TkZlc
print('Hello World')
print("o----")
print(" ||||")
print("*" * 10)

price = 10
print(price)
full_name = "John Smith"
age = 20
is_new = True
print(full_name)
# name = input('what is you name?')
# print("Hi " + name)
# birthyear = input(" birthyear: ")
# age = 2026-int(birthyear)
# print(age)

first = "John"
last = "Smith"
message = first + " [" + last + "] " + "is a coder"
msg = f'{first} [{last}] is a coder'
print(msg)
course = "Python for beginners"
print(len(course))

print(course.upper())
print(course.find('on'))
print(course.replace('Python', 'Java'))
print('Python' in course)


print(10/3)
print(10//3)
print(10%3)
print(10**3)

x = 10
# x = x + 3
x += 3
print(x)

import math

print(math.ceil(5.14))
print(math.floor(5.14))

is_hot = False

if is_hot:
    print("Its a hot day")
else:
    print("Its a cold day")
print("enjoy your day")

hasGoodCredit = True
hasCriminalRecord = True

if hasGoodCredit and not hasCriminalRecord:
    print("Eligible for loan")
else:
    print("Not eligible for loan")

temperature = 30
if temperature > 30:
    print("Temperature is greater than 30")
else:
    print("Temperature is less or equal to 30")

name = "Jayy"
if len(name) < 3:
    print("Name is too short")
elif len(name) > 50:
    print("Name is too long")
else:
    print("Name is ok")

