# Chapter 07 Reshape2 cast()

install.packages("reshape2")
library(reshape2)

names(airquality) <- tolower(names(airquality)) # 소문자로 변환한 변수명으로 기존 변수명 대체 
head(airquality) # airquality 데이터 세트 확인

# airquality 데이터를 변형한 후 aq_melt 변수에 할당
aq_melt <- melt(airquality, id = c("month", "day"), na.rm = TRUE) 

head(aq_melt) # aq_melt 데이터 세트 확인

# aq_melt 데이터를 변형한 후 aq_dcast 변수에 할당
aq_dcast <- dcast(aq_melt, month + day ~ variable) 

head(aq_dcast) # aq_dcast 데이터 세트 확인

View(airquality) # airquality 데이터 세트 확인
View(aq_melt) # aq_melt 데이터 세트 확인
View(aq_dcast) # aq_dcast 데이터 세트 확인

acast(aq_melt, day ~ month ~ variable)
acast(aq_melt, month ~ variable, mean)
dcast(aq_melt, month ~ variable, mean)


