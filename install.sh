#!/bin/bash
#0. Instalar ISSABEL
yum -y install wget git;
wget -O - http://repo.issabel.org/issabel4-netinstall.sh | bash;
#10. Situarse en /var/www/html/
cd /var/www/html/;
#20. clonar xone-connect en xone/
git clone https://jacr70@bitbucket.org/tradesystem/xone-connect.git;
#21 renombrar a xone
mv xone-connect xone;
#30. clonar yii v1 yii
git clone https://github.com/yiisoft/yii.git;
#40. crear en /var/www/html/xone assets chmod 777
mkdir  -p /var/www/html/xone/assets&& chmod -R 777  /var/www/html/xone/assets;
#50. crear en /var/www/html/xone/protected runtime 777
 chmod -R 777  /var/www/html/xone/protected;
#60. ejecutar script sql /var/www/html/xone/protected/data/xone_dump_prueba.sql
mysql -p < /var/www/html/xone/protected/data/sprint\ 1/estructura/xone_20160926.sql ;
mysql -p <  /var/www/html/xone/protected/data/sprint\ 1/data/xone_20160926.sql ; 

#Implementacion 
#70 descargar tpl
git clone https://jacr70@bitbucket.org/tradesystem/tpl.git;

#80 Crear usuario MySQL
mysql -p < tpl/user.sql
#90- copiar imagenes de xone en themes/tenant/images/xone
cp -r tpl/xone themes/tenant/images/;
chown -R asterisk. themes/tenant/images/xone;
#95- remplazar remplazar themes/tenant/_common login.tpl 
cp tpl/login.tpl themes/tenant/_common/;
#100- remplazar themes/tenant/css/custom.css 
cp tpl/custom.css  themes/tenant/css/custom.css;
#110- remplazar remplazar themes/tenant/_common  index.tpl 
cp tpl/index.tpl themes/tenant/_common/;
#120- remplazar remplazar themes/tenant/_common  _menu.tpl 
cp tpl/_menu.tpl themes/tenant/_common/;
#130- remplazar themes/tenant/css/neon-core.css
cp tpl/neon-core.css themes/tenant/css/;
#140- remplazar favicon
cp tpl/favicon.ico . ;
#150- modificar index.php de isabel
cp tpl/index.php . ;
#160- modificar archivo en /var/www/html/modules/control_panel/libs/paloServerSentEvents.class.php
cp tpl/paloServerSentEvents.class.php /var/www/html/modules/control_panel/libs/paloServerSentEvents.class.php;
#170- modificar archivo en /var/www/html/modules/pbxadmin/libs/contentFreePBX.php
cp tpl/contentFreePBX.php /var/www/html/modules/pbxadmin/libs/contentFreePBX.php;
#175- rectificar permisos
amportal chown;
#180 - borrar tpl
rm -rf tpl ;
#190 - Echo LISTO
echo "XONE CONNECT INSTALADO";
