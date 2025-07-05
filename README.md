# Demographic-analysis-of-movie-preferences-by-age-and-gender
## 1. 주제 선정 및 문제 정의
관심분야: 영화
핵심문제: 성별, 연령대별 영화 장르 선호도 분석
주제배경: 영화 관람을 즐기는 사람들의 성별, 연령대는 모두 다르고, 이들은 서로 다른 취향을 가진다. 이는 영화 장르 선호도에 영향을 미친다. 
목적: 성별, 연령대별로 영화장르 선호도를 분석하고, 이에 대한 인사이트를 도출한다.
기대효과: 성별, 연령대별 영화 장르 선호도를 분석함으로써, 여러 플랫폼에서 사용자화된 영화 추천 또는 마케팅 전략으로 활용될 수 있다. 

## 2. 데이터베이스 설계
1. 사용자 테이블(User)
user_id(PK), gender(VARCHAR, choice = {Male, Female}, NOT NULL), age_id(FK), birth_of_year(INTEGER), name(VARCHAR)의 속성으로 구성되며, CHECK(birth_of_year BETWEEN 1900 AND 2020) 제약을 걸어준다. 한 명의 사용자는 하나의 연령대에 속하고, 하나의 연령대는 여러 명의 사용자가 속할 수 있다.(사용자, 연령대 N:1)
2. 연령대 테이블(AgeRange)
age_id(PK), age_range(VARCHAR, UNIQUE)의 속성으로 구성되며, CHECK(age_range in (5-11, 11-14, 15-18, 19-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80-89, 90-100, 100-))
제약을 걸어준다. 
연령대 테이블은 사용자와 1:N 관계이다. 
3. 영화 테이블(Movie)
movie_id(PK), title(VARCHAR, UNIQUE, NOT NULL), release_date(VARCHAR), director(VARCHAR, NOT NULL), age_limit(VARCHAR), running_time(VARCHAR), movieInfo(VARCHAR), actor(VARCHAR)의 속성으로 구성되며, CHECK(age_limit in , = (0, 12+, 15+, 19+)) 제약을 걸어준다. age_limit은 영화 나이제한을 의미하며, 0은 나이제한이 없음을 의미한다. 
<테이블 간 관계는 이후 설명>
4. 영화 장르 테이블(Genre)
genre_id(PK), genreName(VARCHAR, UNIQUE, NOT NULL), information(VARCHAR)
의 속성으로 구성된다. 
<테이블 간 관계는 이후 설명>
5. 영화 장르 관계 테이블(MovieGenre)
genre_id(FK), movie_id(FK), (genre_id, movie_id)(PK)의 속성으로 구성되며, 영화 테이블과 장르 테이블 간의 관계를 나타내는 테이블이다.
영화는 여러 개의 장르를 가질 수 있고, 장르는 여러 개의 영화에 속할 수 있다.
즉, 영화 테이블과 장르 테이블은 N:M 관계를 가진다. 
6. 영화 평점 관계 테이블(MovieRating)
user_id(FK), movie_id(FK), {user_id, movie_id}(PK) rating(DECIMAL(2, 1), NOT NULL), watched_date(VARCHAR), until_the_end(Boolean), review(VARCHAR)의 속성으로 구성되며, key 이외의 속성은 관계 테이블이 가지는 속성들이다. (시청 날짜, 끝까지 영화를 시청했는지 여부, 사용자가 남긴 리뷰). 이는 영화와 영화 평점 사이의 관계를 나타내는 테이블이다. 즉, 사용자가 평가한 평점이 기록되는 테이블이다. CHECK(rating ≥ 0.0 AND rating ≤ 5.0)와 같이 평점은 0~5로 제한한다. 한 명의 사용자는 여러 개의 영화에 대한 평가를 남길 수 있고, 하나의 영화는 여러 명의 사용자에게 평가 받을 수 있다. 즉 사용자의 평가와 영화는 N:M 관계이다. 

정규화 선택 이유: 3NF 선택, 테이블 내의 중복성을 최소화 하였고, 테이블 별 각 속성들을 해당 테이블의 primary key에 종속시켜, 종속성 보존을 하였다. 각 테이블의 속성들을 하나의 primary key로 식별되게 만들어 관리 효율을 좋게 설계하였다.

## 3. ERD
<img width="279" alt="image" src="https://github.com/user-attachments/assets/309e6317-198d-4dfd-9f1f-3c69939cd5c4" />

## 4. 데이터 분석 및 인사이트
### 첫 번째 분석: 연령대별 영화 장르 선호도 분석
1. 연령대 19-29의 영화 장르 선호도
<img width="260" alt="image" src="https://github.com/user-attachments/assets/35bc006b-f035-4ddc-9cbe-1405ec672808" />
<img width="253" alt="image" src="https://github.com/user-attachments/assets/bf18786f-d80a-4aed-80e4-c555156c0a84" />

2. 연령대 30-39의 영화 장르 선호도
<img width="256" alt="image" src="https://github.com/user-attachments/assets/d8dac678-bbe7-4809-ae6b-2d19a6124ae5" />
<img width="260" alt="image" src="https://github.com/user-attachments/assets/be353ff9-99bc-4038-bcf1-512f5e69b90b" />

3. 연령대 40-49의 영화 장르 선호도
<img width="266" alt="image" src="https://github.com/user-attachments/assets/26d55ce2-85fb-4039-b6cb-d25d208df19f" />
<img width="277" alt="image" src="https://github.com/user-attachments/assets/46cef18c-08a9-422d-887a-93760ad6b5c1" />

4. 연령대 50-59의 영화 장르 선호도
<img width="277" alt="image" src="https://github.com/user-attachments/assets/e68632f6-dd7b-4c18-8d93-5a3a032c0038" />
<img width="277" alt="image" src="https://github.com/user-attachments/assets/18303690-3c4a-409b-9efe-4bbf34428abc" />

### 두 번째 분석: 성별에 따른 영화 장르 분석
1. 남성의 영화 장르 선호도
<img width="265" alt="image" src="https://github.com/user-attachments/assets/9ddaf64f-612d-4a22-bb97-a0dfa302bfdf" />
<img width="267" alt="image" src="https://github.com/user-attachments/assets/1f0a8567-fd93-4cb4-b78a-95c74d634e75" />

2. 여성의 영화 장르 선호도
<img width="290" alt="image" src="https://github.com/user-attachments/assets/3138b01d-de61-4ea0-8e7a-ce744809ead9" />
<img width="292" alt="image" src="https://github.com/user-attachments/assets/793a4807-36e8-477c-a3fe-24c55e5574c9" />

### 세 번째 분석: 연령대별 영화 리뷰 작성자 수 분석
1. 연령대별 영화 리뷰 작성자 수 분석
<img width="187" alt="image" src="https://github.com/user-attachments/assets/cef9045f-861f-408f-bd7e-6ac5442364e5" />
<img width="261" alt="image" src="https://github.com/user-attachments/assets/e50ada91-ed96-4ef7-8409-42c415911577" />
















