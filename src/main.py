#!/usr/bin/env python3
"""Oneliner description of the application

A more thorough description of the application, which could include:
    - Various examples of how to run the command.
    - Warning about undesirable side effects.
"""
import click

from utils.prime import is_prime


@click.command(
    help=__doc__,
)
@click.option(
    "-c",
    "--count",
    help="How many prime must be found before stopping",
    default=5000,
    type=int,
)
def main(count: int) -> None:
    print(f"Hello World!")
    primes = []
    n = 1
    while len(primes) < count:
        n += 1
        if is_prime(n):
            primes.append(n)
    print(f"Done")


if __name__ == "__main__":
    main()
