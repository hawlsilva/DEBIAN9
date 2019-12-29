
# Instalando e configurando mysql no Debian

apt-get install mysql-server mysql-client

# Verificar o status do servidor

service mysql status

# Parando o serviço

service mysql stop

# Reiniciando o serviço

service mysql restart

# Acessando o mysql

mysql -u root -p

# Digite a senha e confirme
# Verificando os bancos de ddados 

show databases;

# Criando banco de dados 

create database DBraul;

# Saindo do mysql

# CTRL + D

# Configurando o acesso remoto ao MYSQL

vim /etc/mysql/my.cnf <enter>

bind-address 		= 127.0.0.1

# bind-address		= IP DA SUA MAQUINA.

# Reiniciando o serviço

service mysql restart

# Habilitar root para acesso remoto

mysql -u root -p 

# Digite e confirme a senha

grant all privileges on *.* to root@'%' identified by 'root';

flush privileges;

# Ajustes de segurança no mysql

mysql_secure_installation 

# Opções a serem confirmadas preste atenção e responda de acordo 

no
yes
yes
yes
yes

# Criando usuários como permissão de root

mysql -u root -p 

# Cria um novo usuário e senha com todos os privilegios de administrador.
 
grant all privileges on *.* to admin@'%' identified by 'sua_senha';

# Aplica as alterações sem para o serviço.

flush privileges;

# Criando para acessar um determinado banco de dados.

grant all privileges on DBraul.* to raul@'%' identified by 'sua_senha';

# Aplicar as modificações

flush privileges;

# Verificando usuários do mysql
select user, host from mysql.user;

# Trocando a senha do usuário.

update mysql.user set password=password('senha) where user= 'raul';

flush privileges;

# Excluir usuário

delete from mysql.user where user='raul';

flush privileges;

# Restaurando backup no shell linux

mysql -u root -p DBraul --default-character-set=utf8 < Dump2015129.sql


# DBraul - Banco a ser recuperado / Dump arquivo de backup.








