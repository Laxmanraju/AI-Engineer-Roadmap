# // car takes start, stop and end commands
# When type help , it provides options to play the game
# any other command-- It should say not understood
from ast import While

exit = False
start = True

while not exit:
    while start:
        command = input(">")
        command = command.lower()
        if command == "exit":
            print("Goodbye!")
            exit = True
            start = False
        elif command == "stop":
            print("Car Stopped!")
        elif command == "start":
            print("Car Started!")
        elif command == "help":
            print('''You can enter following commands:
                    start: Car starts
                    stop: Car stops
                    exit: Game exists''')
        else:
            print("Invalid command")


