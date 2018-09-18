library(readxl) # readxl 패키지 로드

# Sample2_m_history 파일(남성 카드 이용 금액)을 m_history 데이터 세트로 저장
m_history <- read_excel("C:/Rstudy/Sample2_m_history.xlsx")
View(m_history) # m_history 데이터 세트 확인

# Sample3_f_history 파일(여성 카드 이용 금액)을 f_history 데이터 세트로 저장 
f_history <- read_excel("C:/Rstudy/Sample3_f_history.xlsx")
View(f_history) # f_history 데이터 세트 확인

# m_history 데이터 세트와 f_history 데이터 세트를 세로 결합하여 exdata_bindjoin 데이터 세트 생성
exdata_bindjoin <- bind_rows(m_history, f_history)
View(exdata_bindjoin) # exdata_bindjoin 데이터 세트를 View 창에서 확인