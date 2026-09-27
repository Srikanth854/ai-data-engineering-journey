def clean_city(city: str) -> str:
    """Trim spaces and fix capitalization of a city name."""
    return city.strip().title()


def total_amount(amounts: list[float]) -> float:
    """Add up transaction amounts."""
    return sum(amounts)


def find_customer(customers: dict[int, str], customer_id: int) -> str | None:
    """Return the customer's name, or None if the id doesn't exist."""
    return customers.get(customer_id)


def filter_evens(numbers: list[int]) -> list[int]:
    """Return the even integers from the list"""
    return ([i for i in numbers if i % 2 == 0])


def averages(items: list[float]) -> float | None:
    if not items:         
        return None
    return ((sum(items))/(len(items)))