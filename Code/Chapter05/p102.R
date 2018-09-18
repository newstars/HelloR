library(readxl) # readxl 패키지 로드

# Sample1 엑셀 파일을 불러와서 exdata1 데이터 세트로 저장
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") 

exdata1 # exdata1 데이터 세트 내용 확인

View(exdata1) # exdata1 데이터 세트 확인

str(exdata1) # exdata1 데이터 세트의 변수 속성 조회