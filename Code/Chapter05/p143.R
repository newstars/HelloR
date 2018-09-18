library(readxl) # readxl 패키지 로드

exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장 
exdata1 # exdata1 데이터 세트 내용 확인

# exdata1의 Y17_CNT, Y16_CNT 변수의 상자 그림 그리기
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)

# y축을 0~60, 그래프 명칭을 ‘boxplot’, 항목 값을 ‘17년건수’, ‘16년건수’로 변경
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0, 60), main = "boxplot", names = c("17년건수", "16년건수"))

# 위 옵션에 더해 그래프 색 변경
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0, 60), main = "boxplot", names = c("17년건수", "16년건수"), col = c("green", "yellow"))

# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 25로 구성된 데이터를 y1 변수에 할당
y1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 25) 
boxplot(y1) # y1 변수의 상자 그림 그리기