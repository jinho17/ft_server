# ft_server  
(2020.07.12) 100% SUCCESS

과제 체크 리스트  
=====================  
ssl protocol
---------------------


autoindex
----------------------

redirection
----------------------

wordpress mysql 테스트
----------------------


> docker 명령어
----------------------
**docker 이미지 빌드 명령어**

    docker build -t ft_server .  

**docker 실행**  

    docker run -it -p 80:80 -p 443:443 --name server ft_server  
    
**docker 이미지 확인**  

    docker images  
    
**컨테이너 확인**  

    docker ps : 현재 실행중인 컨테이너 확인  
    docker ps -a : 모든 컨테이너 확인  
    
**삭제**  

    docker rm server : 컨테이너 삭제  
    docker rmi ft_server : 이미지 삭제  
    
**컨테이너 시작 및 실행**  

    docker start server  
    docker exec-it server /bin/bash  


> 서버 명령어
--------------------
**nginx / php7.3-fpm / mysql 시작**  

    service nginx start  
    service php7.3-fpm start  
    service mysql start  
    
**재시작**  

    service nginx restart  


> srcs 코드 설명
---------------------
default.conf  

     etc/nginx/site-available/default로 복사.  
     autoindex, redirection 설정  
     
init.sh  

     도커 컨테이너 실행시 shell 사용 가능하도록 bash 사용  

phpmyadmin.inc.php  

     var/www/html/phpMyAdmin/config.inc.php에 복사  
     phpmyadmin 설정 코드  
     phpMyAdmin은 웹페이지에서 곧바로 자신의 리눅스 서버에있는 DB(데이터베이스) 내용을 보고, 편집, DB생성등 DB에 관한 모든걸 할 수 있는 웹애플리케이션입니다.  
 
wordpress_set.sql  

     컨테이너에 복사 후, mysql -u root mysql < /var/wordpress_set.sql 로 실행  
     mysql 데이터베이스 생성 코드. 아이디 : wpuser / 비밀번호 : jinkim  
 
 wp-config.php  
     
     var/www/html/WordPress/wp-config.php에 복사
     wordpress와 데이터 베이스 연동 코드  

