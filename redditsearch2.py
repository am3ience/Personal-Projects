import praw
import pprint

user_agent = "testing API /u/am3ience"
r = praw.Reddit(user_agent=user_agent)
submissions = r.get_subreddit('news').get_hot(limit=10)
submission_form= "{}) {} : {} <{}>"
count = 1 
print('-' * 25)
for sub in submissions:
	print(submission_form.format(count, sub.ups, sub.title, sub.url))
	count += 1
	
input("")