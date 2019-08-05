install.packages("dplyr") # dplyr 패키지 설치
library(dplyr) # dplyr 패키지 로드

install.packages("readxl") # dplyr 패키지 설치
library(readxl) # readxl 패키지 로드

# Sample1 엑셀 파일을 불러와서 exdata1 데이터 세트로 저장
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")

exdata1 %>% select(ID) # exdata1 데이터 세트에서 ID 변수만 추출
exdata1 %>% select(ID, AREA, Y17_CNT) # exdata1 데이터 세트에서 ID, AREA, Y17_CNT 변수 추출

exdata1 %>% select(-AREA) # exdata1 데이터 세트에서 AREA 변수만 제외하고 추출
exdata1 %>% select(-AREA, - Y17_CNT) # exdata1 데이터 세트에서 AREA, Y17_CNT 변수를 제외하고 추출

exdata1 %>% filter(AREA == '서울') # exdata1 데이터 세트에 AREA(지역)가 서울인 경우만 추출
# exdata1 데이터 세트에서 AREA(지역)가 서울이면서 Y17_CNT(17년 이용 건수)가 10건 이상인 경우만 추출 
exdata1 %>% filter(AREA == '서울' & Y17_CNT >= 10)

exdata1 %>% arrange(AGE) # exdata1 데이터 세트의 AGE 변수를 오름차순 정렬

exdata1 %>% arrange(desc(Y17_AMT)) # exdata1 데이터 세트의 Y17_AMT 변수를 내림차순 정렬

# exdata1 데이터 세트의 AGE 변수는 오름차순, Y17_AMT 변수는 내림차순 정렬
exdata1 %>% arrange(AGE, desc(Y17_AMT))

# exdata1 데이터 세트의 Y17_AMT(17년 이용 금액) 변수 값 합계를 TOT_Y17_AMT 변수로 도출
exdata1 %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))

# exdata1 데이터 세트의 AREA(지역) 변수 값별로 Y17_AMT(17년 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))
