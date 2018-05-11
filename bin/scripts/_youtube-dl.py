# Here's a more complete example of a program that outputs only errors
# (and a short message after the download is finished), and
# downloads/converts the video to an mp3 file:

from __future__ import unicode_literals
import youtube_dl


class MyLogger(object):
	def debug(self, msg):
		pass

	def warning(self, msg):
		pass

	def error(self, msg):
		print(msg)


def my_hook(d):
	if d['status'] == 'finished':
		print('Done downloading, now converting ...')


ydl_opts = {
	'format': 'bestaudio/best',
	'postprocessors': [{
		'key': 'FFmpegExtractAudio',
		'preferredcodec': 'mp3',
		'preferredquality': '192',
	}],
	'logger': MyLogger(),
	'progress_hooks': [my_hook],
}

with youtube_dl.YoutubeDL(ydl_opts) as ydl:
	ydl.download(['https://www.youtube.com/watch?v=BaW_jenozKc'])
