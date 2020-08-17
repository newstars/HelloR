# 데이터 1, 2, 3, 4, 5를 변수 lD에 할당
ID <- c(1, 2, 3, 4, 5)

# 데이터 F, M, F, M, F를 변수 SEX에 할당
SEX <- c("F", "M", "F", "M", "F")

# ID 변수와 SEX 변수로 데이터 프레임 생성
data_ex <- data.frame(ID = ID, SEX = SEX)

# data_ex 데이터세트를 data_ex.txt파일로저장
write.table(data_ex, file = "C:/Rstudy/data_ex.txt") 
