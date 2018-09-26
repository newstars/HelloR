# Chapter 07 Reshape2 melt()

install.packages("reshape2")
library(reshape2)

head(airquality) #airquality 데이터 세트 확인
names(airquality) <- tolower(names(airquality)) # 소문자로 변환한 변수명으로 기존 변수명 대체

melt_test <- melt(airquality) # melt( ) 함수를 적용하여 데이터를 melt_test 변수에 할당 
head(melt_test) # melt_test 확인

tail(melt_test) # 뒤에서 1행부터 6행까지 출력하기

# 변형한 데이터를 melt_test2 변수에 할당
melt_test2 <- melt(airquality, id.vars = c("month", "wind"), measure.vars = "ozone")

head(melt_test2) # 데이터 확인