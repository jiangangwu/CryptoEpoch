case "$1" in
  start)  
    nohup gunicorn -c gun.conf manage:app --keyfile cryptoepoch.com/Apache/2_cryptoepoch.com.key --certfile cryptoepoch.com/Apache/1_cryptoepoch.com_bundle.crt > server.log 2>&1 &  
    echo $! > server.pid  
    ;;
 
  stop)  
    kill `cat server.pid`  
    rm -rf server.pid  
    ;;  
  
  restart)  
    $0 stop  
    sleep 1  
    $0 start  
    ;;  
    
  *)  
    echo "Usage: server.sh {start|stop|restart}"  
    ;;  
  
esac  
  
exit 0  
