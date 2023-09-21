class Test:
    def __init__(self):
        self.x = 0

    def main(self):
        for x in range(100):
            print(x)

        if x == 99:
            print("x is 99")

        return 0


def main4():
    for x in range(100):
        print(x)

    if x == 99:
        print("x is 99")

    return 0


def main3():
    for x in range(100):
        print(x)

    if x == 99:
        print("x is 99")

    return 0


def main():

    for x in range(100):
        print(x)

    if x == 99:
        print("x is 99")

    return 0


if __name__ == "__main__":
    main()

    Test.main.__dict__
