# 10장 ggmap
# Google Map Platform 출시로 인해 ggmap 패키지 변경됨

install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap")
library(ggmap)

# http://developers.google.com/maps/terms
# 1. 상기 주소에서 구글 계정 인증 필요
# 2. 프로젝트 신규로 생성하기
# 3. Google Maps Platform API Key 활용하기

# 프로젝트 설정 이후 API Key 확인하기
# https://console.cloud.google.com/

googleAPIkey = "API 키 입력하기"

# seoul의 위치 정보를 가져온 후 gg_seoul 변수에 할당
register_google(googleAPIkey)
gg_seoul <- get_googlemap("seoul", maptype = "roadmap")
ggmap(gg_seoul)                           # gg_seoul의 위치 값에 따른 구글 지도 호출

#구글 지도 위에 산점도 그리기
library(dplyr)
library(ggplot2)

# 한글 검색을 위해 utf8로 변환한 후 위도와 경도 데이터를 geo_code 변수에 할당
geo_code <- enc2utf8("대전역") %>% geocode()
geo_data <- as.numeric(geo_code)              # 리스트를 숫자로 변환하여 geo_data 변수에 할당

# 대전역의 위치정보를 가져온 후 구글 지도 호출
get_googlemap(center=geo_data, maptype="roadmap", zoom=13) %>% ggmap()+
  # geo_code에 있는 경도(lon)와 위도(lat) 값으로 산점도 그리기
  geom_point(data=geo_code, aes(x=geo_code$lon, y=geo_code$lat))    
