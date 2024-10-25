class Alphabet:
    def init(self, lang, letters):
        self.lang = lang
        self.letters = letters

    def print_letters(self):
        print("Letters of the alphabet:", ' '.join(self.letters))

    def letters_num(self):
        return len(self.letters)


class EngAlphabet(Alphabet):
    _letters_num = 26  # Number of letters in the English alphabet

    def init(self):
        super().init("En", list("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

    def is_en_letter(self, letter):
        return letter in self.letters

    def letters_num(self):
        return self._letters_num

    @staticmethod
    def example():
        return "This is an example text in English."


# Main test block
if name == "main":
    eng_alphabet = EngAlphabet()

    # Print the alphabet letters
    eng_alphabet.print_letters()

    # Output the number of letters in the alphabet
    print("Number of letters:", eng_alphabet.letters_num())

    # Check if the letter 'F' belongs to the English alphabet
    print("Is 'F' an English letter?", eng_alphabet.is_en_letter('F'))

    # Check if the letter 'Щ' belongs to the English alphabet
    print("Is 'Щ' an English letter?", eng_alphabet.is_en_letter('Щ'))

    # Output an example text in English
    print("Example text:", EngAlphabet.example())