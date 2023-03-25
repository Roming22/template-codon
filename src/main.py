#!/usr/bin/env python3
"""Oneliner description of the application

A more thorough description of the application, which could include:
    - Various examples of how to run the command.
    - Warning about undesirable side effects.
"""

from utils.prime import is_prime


def main() -> None:
    print(f"Hello World!")
    primes = []
    n = 1
    while len(primes) < 6000:
        n += 1
        if is_prime(n):
            primes.append(n)
    print(f"Done")


if __name__ == "__main__":
    main()
