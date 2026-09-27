from week01_python.cleaning import clean_city, find_customer, total_amount, filter_evens, averages


def main() -> None:
    print(clean_city("   new york "))
    print(total_amount([19.99, 5.01, 75.0]))
    customers = {1: "Asha", 2: "Ravi"}
    print(find_customer(customers, 2))
    print(find_customer(customers, 99))
    print(filter_evens([20,30,25,35,67]))
    print(averages([10.5,32.5,23.0,78.90]))