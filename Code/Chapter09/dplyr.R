# 9장 실습

#dplyr 패키지 설치
install.packages("dplyr")
library(dplyr, warn.conflicts = FALSE)  #warn.conflicts 옵션을 사용하면 경고 알림을 제어할 수 있습니다.

nrow(mtcars)
str(mtcars)

# mtcars에서 cyl 값이 4인 행만 추출
filter(mtcars, cyl==4)
# mtcars에서 cyl 값이 6보다 크거나 같고(이상), mpg 값이 20보다 큰(초과) 행만 추출
filter(mtcars, cyl>=6 & mpg>20)

# mtcars에서 wt를 기준으로 오름차순 정렬한 후 head() 함수로 상위 데이터만 출력
head(arrange(mtcars, wt, desc(hp)))

# mtcars에서 mpg로 오름차순 정렬 후 wt로 내림차순 정렬
head(arrange(mtcars, mpg, desc(wt)))


# mtcars에서 am, gear 열 추출
head(select(mtcars, am, gear))
select(mtcars, mpg, cyl, carb)

# mtcars에 years 열을 추가하고 데이터 값에 1974를 입력
head(mutate(mtcars, years="1974"))

# mtcars에 mpg_rank 열을 추가하고, rank() 함수로 mpg 열의 순위를 구한 후 할당
mutate(mtcars, mpg_rank=rank(mpg))

# cyl 열에서 중복 값 제거
distinct(mtcars, cyl)

# gear   열에서 중복 값 제거
distinct(mtcars, gear)

# cyl과 gear 열에서 중복 값 제거하기
distinct(mtcars, cyl, gear)

# mtcars에서 반환할 열을 지정한 후 cyl 열의 평균, 최솟값, 최댓값 반환
summarise(mtcars, cyl_mean=mean(cyl), cyl_min=min(cyl), cyl_max=max(cyl))

# mtcars에서 cyl 열의 평균, 최솟값, 최댓값 반환
summarise(mtcars, mean(cyl), min(cyl), max(cyl))


# mtcars에서 cyl별로 묶은 후 gr_cyl에 반환
gr_cyl <- group_by(mtcars, cyl)

# gr_cyl에서 cyl별 개수 요약
summarise(gr_cyl, n())
# gear 중복 값을 제외하고 cyl별 개수 요약
summarise(gr_cyl, n_distinct(gear))

# mtcars에서 10개의 샘플 데이터 추출
sample_n(mtcars, 10)

# mtcars에서 20%를 샘플 데이터로 추출
sample_frac(mtcars, 0.2)

# mtcars에서 cyl별 그룹으로 묶고 개수(n())로 요약
group_by(mtcars,cyl) %>% summarise(n())

# mtcars에서 mpg로 순위를 구하여 mpg_rank 열에 추가하고 mp_rank에 반환
mp_rank<-mutate(mtcars, mpg_rank=rank(mpg))

# mp_rank에서 mpg_rank를 기준으로 정렬
arrange(mp_rank, mpg_rank)

# mtcars에서 mpg로 순위를 구하고 mpg_rank 열에 추가한 후 mpg_rank 열로 정렬
mutate(mtcars, mpg_rank=rank(mpg)) %>% arrange(mpg_rank)
