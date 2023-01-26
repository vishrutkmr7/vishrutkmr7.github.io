# Get Leetcode rank of the given profile
# profile: https://leetcode.com/vishrutkmr7/

import requests
from bs4 import BeautifulSoup


def get_rank(profile):
    response = requests.get(profile, timeout=5)
    soup = BeautifulSoup(response.content, "html.parser")

    rank = soup.find(
        "span", {"class": "ttext-label-1 dark:text-dark-label-1 font-medium"}
    ).text
    easy = soup.find_all(
        "span",
        {
            "class": "mr-[5px] text-base font-medium leading-[20px] text-label-1 dark:text-dark-label-1"
        },
    )[0].text
    medium = soup.find_all(
        "span",
        {
            "class": "mr-[5px] text-base font-medium leading-[20px] text-label-1 dark:text-dark-label-1"
        },
    )[1].text
    hard = soup.find_all(
        "span",
        {
            "class": "mr-[5px] text-base font-medium leading-[20px] text-label-1 dark:text-dark-label-1"
        },
    )[2].text

    solved = int(easy) + int(medium) + int(hard)

    return rank, solved


if __name__ == "__main__":
    rnk, slvd = get_rank("https://leetcode.com/vishrutkmr7/")
    print(rnk, slvd)
