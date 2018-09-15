# data.frame을 구성하기 위한 ID, SEX, AGE, AREA 변수 생성
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울", "인천", "경기")

# ID, SEX, AGE, AREA 변수를 포함한 데이터 프레임 구조로 dataframe_ex 데이터 세트에 저장
dataframe_ex <- data.frame(ID, SEX, AGE, AREA)
dataframe_ex # dataframe_ex 조회

str(dataframe_ex)
