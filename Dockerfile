# sd-swoole
FROM swoole-centos:1.0.1
MAINTAINER Han Zhang 1047249570@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer,redis
RUN mkdir -p /data/sd
COPY composer.json /data/sd/composer.json
COPY sd.ini /etc/supervisord.d/sd.ini
COPY profile /tmp/profile
# 安装SD框架

RUN cd /data/sd && /usr/sbin/composer install \ 
	&& php vendor/tmtbe/swooledistributed/src/Install.php -y \
	&& cp -rf /tmp/profile /etc/profile \
	&& rm -rf /tmp/profile

CMD ["php","/data/sd/bin/start_swoole_server.php","start"]
CMD ["/usr/sbin/init"] 
