#!/bin/bash

#
#
#

#path_1c='c:\\Program files\\1Cv77\\BIN\\1cv7.exe'
path_1c="~/.wine/dosdevices/c\:/Program\ Files/1Cv77/BIN/1cv7.exe"

if [ $# -lt 2 ]; then
	echo "Usage: $0 config_file name_db"
	exit 0
else
	DB=$2

	if ! [ -s $1 ]; then
		echo 'Файла настроек не существует, или его размер равен 0.'
		exit 0
	fi

	if [ $DB == 'regional' ]; then
		db_folder='REGIONAL'
		file_prefix='R'
	else if [ $DB == 'federal' ]; then
		db_folder='federal'
		file_prefix='F'
	else
		echo 'Некорректно настроен запуск автообмена.'
		exit 0
	fi
	fi

	source `dirname $0`/$1
	source `dirname $0`/scripts/func.sh
fi



# получаем файл
rm -rf ${get_local_path}${file_prefix}${db_code}*
ftpGetFile $get_remote_path $get_local_path

# Запус автообмена для 1С
wine start "c:\Program files\1Cv77\BIN\1cv7.exe config /d ${WIN_DIR}${DB} /n ${db_user} /p ${db_password} /@ ${WIN_DIR}${db_autofile}"

ftpPutFile ${put_local_path} ${put_remote_path}


exit 0

# Запус 1С
wine start "c:\Program files\1Cv77\BIN\1cv7.exe enterprise /m /d ${DB} /n ${db_user_run} /p ${db_password_run}"
exit 0



