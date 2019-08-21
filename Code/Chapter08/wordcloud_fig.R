install.packages("wordcloud2")

#정상 동작 안될시 아래의 방법으로 wordcloud2를 다시 설치하세요.
require(devtools)
install_github("lchiffon/wordcloud2")

library(wordcloud2)
library(htmltools) #R Studio Viewer Pane 에서 안보일 경우

wordcloud2(demoFreq, figPath = "peace.png", size=2.7)
  