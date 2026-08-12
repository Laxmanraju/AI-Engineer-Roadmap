import random

for i in range(3):
    print(random.randint(1,100) )

members = ["lax", "Sra", "Arj"]
leader = random.choice(members)
print(leader)


#  Excercise to roll dice and get randonm values each time
class Dice:

    def roll(self):
        x = random.randint(1,6)
        y = random.randint(1,6)
        return (x,y)


dice = Dice()
tuple  = dice.roll()
print(tuple)


# Absolute path understanding
from pathlib import Path

path = Path("ecommerce")
print(path.exists())

path = Path()
for file in path.glob('*.py'):
    print(file)