# 10장 ggplot2

# ggplot2 패키지 설치 및 로드
install.packages("ggplot2")
library(ggplot2)


#airquality 속성 확인
str(airquality)


# x축은 Day 열, y축은 Temp 열로 맵핑
ggplot(airquality, aes(x=Day, y=Temp))

#산점도 그리기
ggplot(airquality, aes(x=Day, y=Temp)) + 
  geom_point()

# 크기를 3, 색상을 빨강으로 적용하여 산점도 그리기
ggplot(airquality, aes(x=Day, y=Temp)) + 
  geom_point(size = 3, color = "red")

# x축을 Day, y축을 Temp로 맵핑한 후 꺾은선그래프 그리기
ggplot(airquality, aes(x=Day, y=Temp)) + 
  geom_line()

# x축을 Day, y축을 Temp로 맵핑한 후 꺾은선그래프와 산점도 그리기
ggplot(airquality, aes(x=Day, y=Temp))+
  geom_line()+
  geom_point()

# 꺾은선그래프 색상을 빨간색과 산점도 크기를 3으로 변경하고 겹쳐 그리기
ggplot(airquality, aes(x=Day, y=Temp)) +
  geom_line(color="red", size=1) +
  geom_point(size=3)

# mtcars에서 cyl 종류별 빈도수 확인
ggplot(mtcars, aes(x = cyl)) + 
  geom_bar(width = 0.5)

# 빈 범주를 제외하고 cyl 종류별 빈도수 확인
ggplot(mtcars, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5)

# cyl 종류별 gear 빈도 누적 막대그래프
ggplot(mtcars, aes(x = factor(cyl))) + 
  geom_bar(aes(fill = factor(gear)))

#선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) + # cyl열을 x축으로 지정
  geom_bar(aes(fill = factor(gear))) + # cyl종류별 gear 빈도 파악
  coord_polar()                        # 선버스트 차트로 변환

#원그래프 그리기
ggplot(mtcars, aes(x = factor(cyl))) + # cyl열을 x축으로 지정
  geom_bar(aes(fill = factor(gear))) + # cyl 종류별 gear 빈도 파악
  coord_polar(theta = "y")             # 원그래프로 변환

# 상자그림 그리기
# airquality에서 Day 열을 그룹 지어, 날짜별 온도 상자 그림을 그림
ggplot(airquality, aes(x = Day, y = Temp, group = Day)) +
  geom_boxplot()

# airquality에서 Temp의 히스토그램
ggplot(airquality, aes(x=Temp))+
  geom_histogram(binwidth=1)


# economics 데이터 세트 확인
str(economics)

#회귀분석으로 절편 값과 기울기 구하기
lm(psavert ~ date, data=economics)

#꺾은선그래프에 사선 그리기
ggplot(economics, aes(x=date, y=psavert))+          # x축을 date, y축울 psavert로 맵핑
  geom_line()+                                      # 꺾은선그래프 그리기
  geom_abline(intercept=12.18671, slope=-0.0005444) # 절편 12.18671, 기울기 -0.000544로 사선 그리기

# 꺾은선그래프에 평행선 그리기
ggplot(economics, aes(x=date, y=psavert))+          # x축을 date, y축울 psavert로 맵핑
  geom_line()+                                      # 꺾은선그래프 그리기
  geom_hline(yintercept = mean(economics$psavert))  # psavert 평균 값으로 평행선 그리기

#꺾은선 그래프에 수직선 그리기
library(dplyr)                                      # filter() 함수 사용을 위한 패키지 로드

# 개인 저축률(psavert)이 최솟값일 때의 날짜(date)를 구해 x_inter 변수에 할당
x_inter <- filter(economics, psavert == min(economics$psavert))$date

ggplot(economics, aes(x=date, y=psavert))+          # x축을 date, y축을 psarvert로 맵핑
  geom_line()+                                      # 꺾은선그래프 그리기
  geom_vline(xintercept = x_inter)                  # x_inter 변수 값으로 수직선 그리기

#날짜 직접 입력
ggplot(economics, aes(x=date, y=psavert))+
  geom_line()+
  geom_vline(xintercept = as.Date("2005-07-01"))    # "2005-07-01"을 날짜로 변환

# 산점도를 그리고 데이터 레이블 입력하기
ggplot(airquality, aes(x = Day, y = Temp)) +         # x축을 Day, y축을 Temp로 맵핑 
  geom_point() +                                     # 산점도 그리기 
  geom_text(aes(label = Temp, vjust = 0, hjust = 0)) # 각 점에 Temp 값 입력하기

#산점도에 사각형 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +               # x축을 wt, y축울 mpg로 맵핑
  geom_point() +                                     # 산점도 그리기  
  # x축 3 ~ 4, y축 12 ~ 21 위치에 하늘색(skyblue) 투명한(alpha=0.5) 사각형(rect) 그리기
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha=1, fill="skyblue")

#산점도에 사각형 및 화살표 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +               # x축을 wt, y축울 mpg로 맵핑
  geom_point() +                                     # 산점도 그리기  
  # x축 3 ~ 4, y축 12 ~ 21 위치에 하늘색(skyblue) 투명한(alpha=0.5) 사각형(rect) 그리기
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha=1, fill="skyblue") +
  # x축 2.5~3.7, y축 10~17 위치에 빨간색(red) 화살표 그리기
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow=arrow())

#산점도에 사각형, 화살표, 레이블 추가하기
ggplot(mtcars, aes(x = wt, y = mpg)) +               # x축을 wt, y축울 mpg로 맵핑
  geom_point() +                                     # 산점도 그리기  
  # x축 3 ~ 4, y축 12 ~ 21 위치에 하늘색(skyblue) 투명한(alpha=0.5) 사각형(rect) 그리기
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha=1, fill="skyblue") +
  # x축 2.5~3.7, y축 10~17 위치에 빨간색(red) 화살표 그리기
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow=arrow())+
  annotate("text", x=2.5, y=10, label="point")       # "point" 레이블 추가

#막대그래프에 제목 추가하기
ggplot(mtcars, aes(x=gear))+
  geom_bar()+
  labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
