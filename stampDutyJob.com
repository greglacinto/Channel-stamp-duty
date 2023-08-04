COMMONENVFILE="/etc/b2k/OPTPROD/FINCORE/01/com/commonenv.com"
. $COMMONENVFILE
create_finacle_session()
{
       # Create a Finacle session
       FILE_PREFIX=""
       exebatch babx4044 $FILE_PREFIX "" ""
       if [ ! -f ${FILE_PREFIX}tty.mn3 -o ! -f ${FILE_PREFIX}anskey.mn1 ]
       then
               exit 1
       else
               B2K_SESSION_ID=`cat ${FILE_PREFIX}tty.mn3`
               NOETOS=`cat ${FILE_PREFIX}anskey.mn1`
               export B2K_SESSION_ID NOETOS
               rm -f ${FILE_PREFIX}tty.mn3 ${FILE_PREFIX}anskey.mn1
       fi

 

       # Store finacle session id, etos in cron session file
       echo $B2K_SESSION_ID > cron.session
       echo $NOETOS >> cron.session
}
call_cron_coms()
{
       SCRIPT_NAME="CDStampDuty.scr"
       exebatch babx4061 $B2K_SESSION_ID $SCRIPT_NAME $1 2>babx4061.log 1>/dev/null&
}
if [ -s "cron.session" ]
then
       rm -f cron.session
       create_finacle_session;
       call_cron_coms;
else
       create_finacle_session;
       call_cron_coms;
fi
