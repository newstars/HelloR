library(readxl) # readxl 패키지 로드
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장
exdata1 # exdata1 데이터 세트 내용 확인
hist(exdata1$AGE) # exdata1의 AGE 변수에 대한 히스토그램

hist(exdata1$AGE, xlim = c(0, 60), ylim = c(0, 5), main = "AGE분포")