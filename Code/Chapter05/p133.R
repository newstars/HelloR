library(readxl) # readxl 패키지 로드
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장
exdata1 # exdata1 데이터 세트 내용 확인

install.packages("descr") # descr 패키지 설치 
library(descr) # descr 패키지 로드

# exdata1의 AREA 변수의 빈도분석(그래프 제외) 결과를 freq_test에 할당
freq_test <- freq(exdata1$AREA, plot = F)
freq_test # freq_test 조회
