# descr 패키지 설치 및 로드
install.packages("descr") 
library(descr)

library(readxl) # readxl 패키지 로드
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장
exdata1 # exdata1 데이터 세트 내용 확인

# exdata1의 SEX 변수 분포 막대그래프 그리기, 그래프 명칭은 ‘성별(barplot)’로 함
freq(exdata1$SEX, plot = T, main = '성별(barplot)')

# exdata1의 SEX 변수에 대한 빈도 분포를 dist_sex에 할당 
dist_sex <- table(exdata1$SEX) 
dist_sex # dist_sex 조회

# dist_sex에 대한 막대그래프 그리기
barplot(dist_sex)

# y축을 0~8로 변경
barplot(dist_sex, ylim = c(0, 8))

# y축을 0~8로 변경 및 그래프 명칭을 ‘BARPLOT’, X축 제목을 ‘SEX’
# Y축 제목을 ‘FREQUENCY’, 항목 값을 ‘Female’, ‘Male’로 변경
barplot(dist_sex, ylim = c(0, 8), main = "BARPLOT", xlab = "SEX", ylab = "FREQUENCY", names = c("Female", "Male"))

# y축을 0~8, 그래프 명칭을 ‘BARPLOT’, X축 제목을 ‘SEX’
# Y축 제목을 ‘FREQUENCY’, 항목 값을 ‘Female’, ‘Male’로 변경 및 그래프 색 변경 
barplot(dist_sex, ylim = c(0, 8), main = "BARPLOT", xlab = "SEX", ylab = "FREQUENCY", names = c("Female", "Male"), col = c("pink", "navy"))

