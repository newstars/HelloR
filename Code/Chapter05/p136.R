library(readxl) # readxl 패키지 로드
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장 
exdata1 # exdata1 데이터 세트 확인
stem(exdata1$AGE) # exdata1의 AGE 변수에 대한 줄기 잎 그림