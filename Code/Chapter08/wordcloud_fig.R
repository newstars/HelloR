install.packages("wordcloud2")

#정상 동작 안될시 아래의 코드에서 주석("#")을 지우고 wordcloud2를 다시 설치하세요.
# require(devtools)
# install_github("lchiffon/wordcloud2")

library(wordcloud2)

wordcloud2(demoFreq, figPath = "peace.png", size=2.7)
  
