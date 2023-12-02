

def main():
    print("Welcome to my referral email generator.")
    loop() 
    
def loop():
    print("\n") 
    name = input("Enter name: ")
    email = input("Enter email: ")
    phone_number = input("Enter phone number: ")
    option = input("Tech (1), QT (2), QR (3), Other (4): ")

    if option == '1':
        print_message(name, email, phone_number, "tech")
    elif option == '2':
        print_message(name, email, phone_number, "quantitative trading")
    elif option == '3':
        print_message(name, email, phone_number, "quantitative research")
    elif option == '4':
        str = input("What is the position called?: ")
        print_message(name, email, phone_number, str)
    
    again = input("Would you like to refer another person? (y/n): ") 
    if again == 'y':
        loop()
    

def print_message(name, email, phone_number, str):
    print("\nHello,\n")    
    print(f'I am referring {name} for a {str} position. I met them online in a computer science forum.')
    print("Here is their contact information and their resume is attached:\n") 
    print(f'Name: {name}')
    print(f'Email: {email}')
    print(f'Phone Number: {phone_number}\n')
    
    print("Thank you and have a great day!\n")
    print("Best,\nJames Pope")

if __name__ == "__main__":
    main()
