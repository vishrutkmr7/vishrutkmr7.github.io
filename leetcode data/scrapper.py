import requests
from flask import Flask, jsonify
from bs4 import BeautifulSoup

app = Flask(__name__)


@app.route("/my-leetcode-rank/<username>", methods=["GET"])
def get_rank(username):
    profile = f"https://leetcode.com/{username}/"
    response = requests.get(profile, timeout=5)
    soup = BeautifulSoup(response.content, "html.parser")
    rank_class = "ttext-label-1 dark:text-dark-label-1 font-medium"
    counts_css = "mr-[5px] text-base font-medium leading-[20px] text-label-1 dark:text-dark-label-1"

    rank = soup.find("span", {"class": rank_class}).text
    easy = int(
        soup.find_all(
            "span",
            {"class": counts_css},
        )[0].text
    )
    medium = int(
        soup.find_all(
            "span",
            {"class": counts_css},
        )[1].text
    )
    hard = int(
        soup.find_all(
            "span",
            {"class": counts_css},
        )[2].text
    )

    solved = easy + medium + hard

    return jsonify(
        {
            "rank": rank,
            "solved": solved,
            "easy": easy,
            "medium": medium,
            "hard": hard,
        }
    )


if __name__ == "__main__":
    app.run()
