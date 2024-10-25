import random


def guess_the_number():
    # Generate a random number between 1 and 100
    random_number = random.randint(1, 100)

    attempts = 0
    max_attempts = 5

    print("Guess the number (between 1 and 100):")

    while attempts < max_attempts:
        # Increment attempts
        attempts += 1

        # Read user's guess
        guess = int(input(f"Attempt {attempts}: "))

        # Check if the guess is correct
        if guess == random_number:
            print(f"Congratulations! You guessed the right number {random_number}.")
            break
        elif guess < random_number:
            print("Too low.")
        else:
            print("Too high.")
    else:
        print(f"Sorry, you've run out of attempts. The correct number was {random_number}.")

# Call the function to start the game
guess_the_number()