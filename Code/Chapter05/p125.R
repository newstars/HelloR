library(readxl) # readxl 패키지 로드

# Sample4_y17_history 파일을 jeju_y17_history(제주 지역 17년 카드 이용 금액) 데이터 세트로 저장 
jeju_y17_history <- read_excel("C:/Rstudy/Sample4_y17_history.xlsx")
# Sample5_y16_history 파일을 jeju_y16_history(제주 지역 16년 카드 이용 금액) 데이터 세트로 저장 
jeju_y16_history <- read_excel("C:/Rstudy/Sample5_y16_history.xlsx")

View(jeju_y17_history) # jeju_y17_history 데이터 세트 확인 
View(jeju_y16_history) # jeju_y16_history 데이터 세트 확인

# 제주 지역 17년 카드 이용 금액(jeju_y17_history)과 제주 지역 16년 카드 이용 금액(jeju_y16_ history) 데이터 세트에서 ID 변수와 jeju_y17_history 데이터 세트를 기준으로 가로 결합 
bind_col <- left_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(bind_col) 

# 제주 지역 17년 카드 이용 금액(jeju_y17_history)과 제주 지역 16년 카드 이용 금액(jeju_y16_ history) 데이터 세트에서 ID 값이 동일한 데이터만 가로 결합
bind_col_inner <- inner_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(bind_col_inner)

# 제주 지역 17년 카드 이용 금액(jeju_y17_history)과 제주 지역 16년 카드 이용 금액(jeju_y16_ history) 데이터 세트에서 ID 변수를 기준으로 모든 데이터를 가로 결합
bind_col_full <- full_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(bind_col_full)
