#Project 02 지역별 미세먼지 농도 비교하기

install.packages("readxl") # readxl 패키지 설치 
install.packages("dplyr") # dplyr 패키지 설치

library(readxl) # readxl 패키지 로드

# dustdata.xlsx 파일을 불러온 후 dustdata_anal에 할당
dustdata <- read_excel("C:/Rstudy/dustdata.xlsx")

View(dustdata) # 데이터 확인
str(dustdata) # 데이터 속성 확인

library(dplyr) # dplyr 패키지 로드

# 성북구와 중구 데이터만 추출 및 확인
dustdata_anal <- dustdata %>% filter(area %in% c("성북구", "중구")) 

View(dustdata_anal)

# dustdata_anal 데이터 세트에 yyyymmdd에 따른 데이터 수 파악
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))

# dustdata_anal 데이터 세트에 area에 따른 데이터 수 파악
count(dustdata_anal, area) %>% arrange(desc(n))

# area 값이 성북구인 데이터를 dust_anal_area_sb에 할당
dust_anal_area_sb <- subset(dustdata_anal, area == "성북구") 

# area 값이 중구인 데이터를 dust_anal_area_jg에 할당
dust_anal_area_jg <- subset(dustdata_anal, area == "중구")

# 데이터 확인
dust_anal_area_sb 
dust_anal_area_jg

# psych 패키지 설치 및 로드
install.packages("psych")
library(psych)

# 성북구의 미세먼지량에 대한 기초 통계량 도출
describe(dust_anal_area_sb$finedust)

# 중구의 미세먼지량에 대한 기초 통계량 도출
describe(dust_anal_area_jg$finedust)

# 성북구와 중구의 미세먼지 농도에 대해 boxplot을 통한 분포 차이 확인
boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main = "finedust_compare", xlab = "AREA", names = c("성북구", "중구"), 
        ylab = "FINEDUST_PM", col = c("blue", "green"))

# dustdata_anal 데이터 세트에서 측정소명(area)에 따라 미세먼지 농도 평균에 대한 차이를 검증
t.test(data = dustdata_anal, finedust ~ area, var.equal = T)

