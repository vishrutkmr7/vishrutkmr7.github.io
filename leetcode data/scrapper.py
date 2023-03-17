import requests
from flask import Flask, jsonify
from bs4 import BeautifulSoup

app = Flask(__name__)


@app.route("/my-leetcode-rank")
def get_rank(profile):
    response = requests.get(profile, timeout=5)
    soup = BeautifulSoup(response.content, "html.parser")
    rank_class = "ttext-label-1 dark:text-dark-label-1 font-medium"
    counts_css = "mr-[5px] text-base font-medium leading-[20px] text-label-1 dark:text-dark-label-1"

    rank = soup.find("span", {"class": rank_class}).text
    easy = soup.find_all(
        "span",
        {"class": counts_css},
    )[0].text
    medium = soup.find_all(
        "span",
        {"class": counts_css},
    )[1].text
    hard = soup.find_all(
        "span",
        {"class": counts_css},
    )[2].text

    solved = int(easy) + int(medium) + int(hard)

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
    # res = get_rank("https://leetcode.com/vishrutkmr7/")
    # json_result = json.dumps(res)
    # print(json_result)
    app.run()
