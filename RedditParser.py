#   Reddit Parser
#
#   Gets user to input a subreddit they want to parse, script displays top 10 links
#
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
sub = raw_input("Type in the subreddit you want to search: ")

def run_bot(sub):
    global i
    count = 1
    while i < 10:
        for submission in reddit.subreddit(sub).hot(limit=10):
            link = submission.shortlink
            print(count, submission.title.encode("utf-8"), link)
            i += 1
            count += 1


run_bot(sub)
