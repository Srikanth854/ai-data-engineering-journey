from week01_python.cleaning import averages, clean_city, find_customer, total_amount


def test_clean_city_trims_and_capitalizes() -> None:
    assert clean_city("   new york ") == "New York"


def test_total_amount_adds_values() -> None:
    assert total_amount([10.0, 20.0, 30.0]) == 60.0


def test_find_customer_returns_name_when_id_exists() -> None:
    customers = {1: "Asha", 2: "Ravi"}
    assert find_customer(customers, 2) == "Ravi"


def test_find_customer_returns_none_when_id_missing() -> None:
    customers = {1: "Asha", 2: "Ravi"}
    assert find_customer(customers, 99) is None


def test_averages_of_normal_list() -> None:
    assert averages([10.0, 20.0, 30.0]) == 20.0


def test_averages_of_empty_list_is_none() -> None:
    assert averages([]) is None