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