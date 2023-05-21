FROM mysql:8.0-debian
RUN apt-get update && \
    apt-get install -y locales
RUN local-gen ja_jp.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR /Internet_TV
