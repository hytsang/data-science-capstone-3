wd = file.path('..', '..')

en_US_data_path = file.path(wd, "data", "final", "en_US")
files = list.files(en_US_data_path)

q1_ans = file.size(file.path(en_US_data_path, files[1]))/1024^2

blogs_file = file.path(en_US_data_path, files[1])
news_file = file.path(en_US_data_path, files[2])
twitter_file = file.path(en_US_data_path, files[3])

twitter = readLines(twitter_file)
news = readLines(news_file)
blogs = readLines(news_file)

q2_ans = length(twitter)

q3_ans = max(c(max(nchar(twitter)), max(nchar(news)), max(nchar(blogs))))

q4_ans = sum(grepl("love", twitter))/sum(grepl("hate", twitter))

q5_ans = sum(grepl("A computer once beat me at chess, but it was no match for me at kickboxing", twitter))
