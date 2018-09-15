#8장 애국가 분석하여 워드클라우드 만들기

#wordcloud2 패키지 버그가 있는 경우는 이걸 쓰세요.
#install.packages("devtools")
#library(devtools)
#devtools::install_github("lchiffon/wordcloud2")

#KoNLP 패키지 설치
install.packages("KoNLP")

#wordcloud2 패키지 설치
install.packages("wordcloud2")

library(KoNLP)
library(wordcloud2)

#useSystemDic()
#세종사전
useSejongDic()
#useNIADic()

# 텍스트파일 데이터를 word_data에 할당
word_data <- readLines("애국가(가사).txt")

# word_data 변수의 각 행에서 명사를 추출하여 word_data2 변수에 할당
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)

# 추가할 단어를 add_words 변수에 할당
add_words <-c("백두산", "남산", "철갑", "가을", "하늘", "달")

# add_words 변수의 데이터를 사용자 정의 단어(user_dic)로 추가
buildDictionary(user_dic = data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic = T)

# word_data 변수의 각 행에서 명사를 word_data2 변수에 할당
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)

# word_data2를 벡터로 변환한 후 undata 변수에 할당
undata <- unlist(word_data2)

# undata의 빈도 수 확인 후 word_table에 할당
word_table <- table(undata)

# undata에서 두 글자 이상인 단어만 선별한 후 undata2 변수에 할당
undata2 <- Filter(function(x){nchar(x)>=2}, undata)

# undata2의 빈도 확인 후 word_table2 변수에 할당
word_table2 <- table(undata2)

# word_tabel2를 내림차순 정렬
sort(word_table2, decreasing = T)

# word_table2의 워드클라우드 생성
wordcloud2(word_table2)

# color(색상), backgroundColor(배경색) 옵션 사용
wordcloud2(word_table2, color = "random-light", backgroundColor = "black")

# fontFamily(글꼴), size(크기), shape(모양) 옵션 사용
wordcloud2(word_table2, fontFamily = "맑은 고딕", size = 1.2, color = "random-light", backgroundColor = "black", shape="star")