#서대문구에 치킨집이 많은 동은?
install.packages("readxl")
library(readxl)

ck <- read_xlsx("HelloCodingR/치킨집_가공.xlsx")
head(ck)

#substr() 함수를 이용하여 소재지전체주소에 있는 11~15번째 문자 가져오기
addr <- substr(ck$소재지전체주소, 12, 16)

head(addr)

addr_num <- gsub("[0-9]", "", addr) #숫자제거
addr_trim <- gsub(" ", "", addr_num) #공백제거

head(addr_trim)

install.packages("dplyr")
library(dplyr)

#table() 함수를 이용해서 숫자 세기, 변수가 한개일때 도수분표표를 만들어줌
addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

install.packages("treemap")
library(treemap)

#treemap(데이터, index=인덱스 표시 열 제목, vSize=크기를 이용할 열 제목, vColor=컬러, title=제목)
treemap(addr_count, index=".", vSize="Freq", title="서대문구 동별 치킨집 분표")

arrange(addr_count,desc(Freq)) %>% head()
