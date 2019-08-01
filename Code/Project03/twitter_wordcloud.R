#Project03 트위터 키워드 크롤링으로 워드클라우드 그리기
#https://apps.twitter.com/ 트위터 앱키 생성


#트위터 API 키 (사용불가)
#API Key		0iApiCFYRk2VLXPvquUTvRj67
#API Secret	UCxXRCpPUBzcLEGqK0R1XhHo9aS2cC6goKm52sRy5p316EBMg4
#Access Token	74414052-7DLWvzEEVHhGqnfUhr6U4ioEc74oA0pQCpLFsPvhj
#Access Token Secret	31FhCeVp7selgZxTdSJ6O6GpXSv5c6G7WypjjYDBwjxpD=

install.packages("twitteR") #트위터 패키지

library(twitteR)

consumerKey = "0iApiCFYRk2VLXPvquUTvRj67"  
consumerSecret = "UCxXRCpPUBzcLEGqK0R1XhHo9aS2cC6goKm52sRy5p316EBMg4"
accessToken = "74414052-7DLWvzEEVHhGqnfUhr6U4ioEc74oA0pQCpLFsPvhj"
accessTokenSecret = "31FhCeVp7selgZxTdSJ6O6GpXSv5c6G7WypjjYDBwjxpD"

#키 값으로 OAuth 인증
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

keyword <-enc2utf8("월드컵") #한글 데이터 형 변환후 keyword 변수에 할당

# keyword 변수에 있는 키워드로 결과 값을 100개 검색
bigdata <- searchTwitter(keyword, n=100, lang="ko") 

#크롤링 데이터를 데이터 프레임으로 변환하고 bigdata_df에 할당
bigdata_df <- twListToDF(bigdata)
str(bigdata_df) # bigdata_df 데이터 세트 구조 확인

bigdata_text <- bigdata_df$text #text 열 추출 후 bigdata_text에 할당
head(bigdata_text) #bigdata_text 데이터 확인

library(KoNLP) # KoNLP 패키지 로드
useSejongDic() # 세종 사전 설정

#명사 추출
bigdata_noun <- sapply(bigdata_text, extractNoun, USE.NAMES = F)

#필터링을 위한 벡터 변환
bigdata_noun <- unlist(bigdata_noun)

# 2글자 이상인 단어만 추출하여 저장
bigdata_noun <- Filter(function(x) { nchar(x) >= 2 }, bigdata_noun) 
bigdata_noun <- gsub("[A-Za-z0-9]", "", bigdata_noun) # 영어, 숫자 제거

#불필요 텍스트 클랜징
bigdata_noun <- gsub("\n", "", bigdata_noun) #뉴라인 제거
bigdata_noun <- gsub("\r", "", bigdata_noun) #줄바꿈 제거
bigdata_noun <- gsub("RT", "", bigdata_noun) #RT 제거
bigdata_noun <- gsub("http", "", bigdata_noun) #http 제거

bigdata_noun <- gsub("[~!@#$%^&*()-_|+=?:]", "", bigdata_noun)  #특수문자 제거
bigdata_noun <- gsub("[ㄱ-ㅎ]", "", bigdata_noun) #ㄱ부터ㅎ까지 자음 제거
bigdata_noun <- gsub("(ㅜ|ㅠ)+", "", bigdata_noun) # 한개이상의 ㅜㅠ 제거
bigdata_noun <- gsub("또라이", "", bigdata_noun) # 공백 제거

word_table <- table(bigdata_noun) # 데이터 세트 형태로 저장

library(wordcloud2) # 패키지 로드

# 워드클라우드 표현, random-light 글자 색, 검은 배경색 적용
wordcloud2(word_table, fontFamily = "맑은 고딕", size = 5, color = "random-light", backgroundColor = "black")

