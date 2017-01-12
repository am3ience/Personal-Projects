#   Reddit Parser
#
#   Gets user to input a subreddit they want to parse, script displays top 10 links
#   crude UI
#   Author: Paul
#
#
#

import praw
from Tkinter import *

reddit = praw.Reddit(client_id='',
                     client_secret='',
                     user_agent='practise parse bot'
                     )

i = 0


def run_bot():
    sub = entry_1.get()
    global i
    count = 1
    while i < 10:
        for submission in reddit.subreddit(sub).hot(limit=10):
            link = submission.shortlink
            text_1.insert(INSERT, (count, submission.title.encode("utf-8"), link, "\n"))
            i += 1
            count += 1



root = Tk()
root.title("Reddit Parser")


label_1 = Label(root, text="subreddit:")

entry_1 = Entry(root)


button_1 = Button(root, text="Enter", command=lambda: run_bot())

text_1 = Text(root)

label_1.grid(row=0)
entry_1.grid(row=0, column=1)
button_1.grid(row=0, column=2)
text_1.grid(row=1, columnspan=3)

root.mainloop()
