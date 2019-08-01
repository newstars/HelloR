install.packages("psych") #psych 패키지 설치
library(psych)            #psych 패키지 로드

# 데이터 값 1, 2, 3, 4, 5, 6, 100을 x1에 할당 
x1 <- c(1, 2, 3, 4, 5, 6, 100) 

# x1 변수 조회
x1

# x1 변수 평균
mean(x1)

# x1 변수 중앙값
median(x1)

# 데이터 값 1, 2, 3, 4, 5, 100을 x2에 할당
x2 <- c(1, 2, 3, 4, 5, 100) 

#x2변수조회
x2

#x2변수중앙값
median(x2)

#x2변수최댓값
max(x2)

#x2변수최솟값 
min(x2)

#x2변수범위
range(x2)

#x2변수사분위수
quantile(x2) 

# x2 변수 1사분위수
quantile(x2,probs = 0.25)

# x2 변수 2사분위수(=중앙값) 
quantile(x2,probs = 0.5)

# x2 변수 3사분위수
quantile(x2,probs = 0.75)

# x2 변수 하위 80% 지점의 값
quantile(x2,probs = 0.8)

# x2 변수 분산
var(x2) 

# x2 변수 표준편차
sd(x2) 

# x2 변수 첨도
kurtosi(x2)

# x2 변수 왜도
skew(x2)
