FROM ubuntu:latest
LABEL authors="jun"

ENTRYPOINT ["top", "-b"]


# docker run
#1. -d
#2. --name jenkins --hostname jenkins \
#2.1. --restart=on-failture \
#3. -p 8080:8080 \
#4. -e TZ=Asiz/Seoul \
#5. -v ${HOME}/.jenkins:/var/jenkins_home \
#6. --network practice \
#7. 94f7668717b8 \

#1. 데몬 백그라운드 실행
#2. 컨테이너 이름 설정 외부에서 접근 가능하게 호스트 네임 설정
#2.1 잰킨스 재시작시 서버가 죽으면 자동으로 재시작 설정
#3. 포트번호 8080 으로 접속
#4. 기본 시간 세팅 한국 서울
#5. 컨테이너 에 있는 젠킨스 파일 로컬 패스로 옮김
#6. 실행될 네트워크 (네트워크에 조인된 모든 컨테이너 끼리 서로 소통 가능함
#7. 실행되는 젠킨스 컨테이너 아이디

# 젠킨스 파일 설정
# Build periodically - 주기적 1분마다 파일 자동 빌드
# Poll SCM 리파지토리 변경이 있을때만 자동으로 파일 빌드됨.


#젠킨스에서 webhook 설정은 localhost:8080 으로 젠킨스 주소 입력하면 정상동작하지않는다.
#Payload URL - 젠킨스 서버 주소에 /github-webhook/ 경로를 추가하여 입력한다.
#http://locahost:8080를 입력하시면 정상적으로 동작하지 않는다.
#http://public-ip:8080 같이 공개 IP를 사용하는 경우에도 정상동작안함
#ngrok 어플리케이션을 통해 외부에서 접근할 수 있는 도메인을 사용해야한다.
# ngrok 은 내부 로컬 서버를 안전하게 공개 서버로 바꿔주는 역할을한다.

#github 이벤트 발생  -> 터널링 서비스 제공자 -> 터널에이전트는 키값을 통해서 jekins url 로 전달한다.

#webhook test