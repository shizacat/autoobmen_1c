#!/bin/bash

function ftpGetFile {
	# $1 - What to get
	# $2 - Where are put (folder)
	
	(
		cd $2
		echo "
			verbose
			prompt
			open $ftp_host
			user $ftp_user $ftp_pass
			cd `dirname $1`
			mget `basename $1`
			bye
		" | ftp -n > /dev/null
	)

}

function ftpPutFile {
	# $1 - What to put
	# $2 - Where are put (folder)
	
	(
		cd `dirname $1`
		echo "
			verbose
			prompt
			open $ftp_host
			user $ftp_user $ftp_pass
			cd $2
			put `basename $1`
			bye
		" | ftp -n > /dev/null	#> ftp_$$.log
	)

}

