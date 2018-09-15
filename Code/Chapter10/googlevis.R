#10장 googleVis
install.packages("googleVis")
library(googleVis)
library(ggplot2)

str(economics)

# 날짜별(date) 개인 저축률의 변화(pasvert) 값을 구한 후 motion 변수에 할당
motion <- gvisMotionChart(economics, idvar="psavert", timevar = "date")
plot(motion)                         # motion 변수의 값으로 그래프 그리기

str(CityPopularity)
head(CityPopularity)

# 게이지의 측정 데이터(labelvar)는 도시명, 값(numvar)은 인구수, 눈금은 0~1000으로 옵션 지정
gauge <- gvisGauge(CityPopularity, labelvar="City", numvar="Popularity", options=list(min=0, max=1000))
plot(gauge)                          # gauge 변수 값으로 그래프 그리기

# 게이지 색상 영역 설정
Gauge <- gvisGauge(CityPopularity, options=list(min=0, max=1000, greenFrom=800, greenTo=1000, yellowFrom=500, yellowTo=800, redFrom=0, redTo=500, width=400, height=300)) 
plot(Gauge)
