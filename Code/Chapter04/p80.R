# 데이터 1, 2, 3, 4, 5를 변수 ID에 할당
ID <- c(1, 2, 3, 4, 5) 
# ID 변수 조회
ID

# 데이터 F, M, F, M, F를 변수 SEX에 할당
SEX <- c("F", "M", "F", "M", "F") 

# SEX 변수 조회
SEX

# ID와 SEX로 데이터 프레임 생성
DATA <- data.frame(ID = ID, SEX = SEX) 

# DATA 조회
View(DATA)

 
