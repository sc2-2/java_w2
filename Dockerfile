FROM mysql:5.7
# COPY utf8mb4.cnf /etc/mysql/conf.d/utf8mb4.cnf

# 目录映射
VOLUME ["/data/mysql"]

# VOLUME ["/data/oadb.sql"]
ADD ./oadb.sql /tmp/sql/oadb.sql
RUN mv /tmp/sql/*.sql /docker-entrypoint-initdb.d

# 设置密码为 123456
ENV MYSQL_ROOT_PASSWORD=123456

# # 创建数据库
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# # 启动数据库
# CMD ["mysqld"]

# # 创建数据库oadb
# RUN mysql -uroot -p123456 -e "create database oadb"

# # 将数据库导入到数据库
# RUN mysql -uroot -p123456 oadb < /var/lib/mysql/oadb.sql

# # 端口映射
# EXPOSE 3306
