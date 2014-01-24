db_code='25'
ftp_host='ftp.volfarm.ru'
ftp_port='21'
ftp_user='mgs'
ftp_pass='604020'

# Запуск 1С для автообмена
db_user='Склад'
db_password='123'
db_autofile='auto\autoobmen.prm'	# Считая от местоположения папки (auto - по умолчанию) со скриптами

# Запуск 1С для работы
db_user_run="Аптека_${db_code}"
db_password_run=''

#Директория со скриптом (Unix)
CUR_DIR=`dirname $0`/..
WIN_DIR='h:\mgs\'

get_local_path=$CUR_DIR'/'$db_folder'/CP/'
get_remote_path='out/'${file_prefix}${db_code}'*'

get_execute=${file_prefix}${db_code}'upd'

put_remote_path='/in/'
put_local_path='../'${db_folder}'/PC/*'

