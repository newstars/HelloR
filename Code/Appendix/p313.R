#부록 통계 분석 기법 맛보기

install.packages("readxl")
library(readxl) # readxl 패키지 로드

exdata1 <- read_excel("C:\Rstudy\Sample1.xlsx") # Sample1 엑셀 파일을 exdata1 데이터 세트로 저장 
exdata1 # exdata1 데이터 세트 확인

# 성별, 지역별 분할표를 작성하여 SEX_AREA_CROSS 변수에 할당
sex_area_cross <- xtabs(~SEX + AREA, data = exdata1)
sex_area_cross # SEX_AREA_CROSS 확인 
chisq.test(sex_area_cross) # SEX_AREA_CROSS에 대한 카이제곱 검정

# AMT17(17년 이용 금액)과 Y17_CNT(17년 이용 건수)의 상관관계 검증
cor.test(exdata1$AMT17, exdata1$Y17_CNT)

# 성별에 따른 AMT16(16년 이용 금액)의 평균 차이를 t-test() 함수로 검증
t.test(data=exdata1, AMT16 ~ SEX, var.equal = T)