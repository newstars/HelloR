install.packages("dplyr") # dplyr 패키지 설치
library(dplyr) # dplyr 패키지 로드

# Sample1 엑셀 파일을 불러와서 exdata1 데이터 세트로 저장
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")

# exdata1 데이터 세트에서 AMT17 변수명을 Y17_AMT, AMT16 변수명을 Y16_AMT로 변경 
exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT = AMT16) 
View(exdata1) # exdata1 데이터 세트 확인

# exdata1 데이터 세트에서 Y17_AMT와 Y16_AMT를 더해서 exdata1 데이터 세트의 AMT 변수로 추가
exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT

# exdata1 데이터 세트에서 Y17_CNT와 Y16_CNT를 더해서 exdata1 데이터 세트의 CNT 변수로 추가
exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT 

View(exdata1) # exdata1 데이터 세트를 View 창으로 확인

# exdata1 데이터 세트의 AMT를 CNT로 나눈 값을 exdata1 데이터 세트의 AVG_AMT로 생성
exdata1$AVG_AMT <- exdata1$AMT / exdata1$CNT 

View(exdata1) # exdata1 데이터 세트를 View 창으로 확인

# exdata1 데이터 세트에서 AGE 변수 값이 50 이상이면 “Y”
# 50 미만이면 “N” 값으로 exdata1 데이터 세트에 AGE50_YN 변수 생성 
exdata1$AGE50_YN <- ifelse(exdata1$AGE >= 50, "Y", "N") 

View(exdata1) # exdata1 데이터 세트를 View 창에서 확인

# exdata1 데이터 세트의 AGE 값이 50 이상이면 “A1.50++”, 40 이상이면 “A2.4049”
# 30 이상이면 “A3.3039”, 20 이상이면 A4.2029”, 나머지는 “A5.0019”를 값으로 하는 AGE_GR10 변수 생성 
exdata1$AGE_GR10 <- ifelse(exdata1$AGE >= 50, "A1.50++",
                           ifelse(exdata1$AGE >= 40, "A2.4049", 
                                  ifelse(exdata1$AGE >= 30, "A3.3039",
                                         ifelse(exdata1$AGE >= 20, "A4.2029", "A5.0019"))))

View(exdata1) # exdata1 데이터 세트를 View 창에서 확인



