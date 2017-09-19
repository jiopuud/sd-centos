# sd-swoole
FROM swoole-centos
MAINTAINER Han Zhang 1047249570@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer,redis
RUN mkdir /data/sd
COPY composer.json /data/sd/composer.json
# 安装SD框架
RUN cd /data/sd && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y

CMD ["php","/apps/bin/start_swoole_server.php","start"]
