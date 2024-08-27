set ant 999
set iterate 0
battery set 100
atget id id
getpos2 lonSen latSen
loop
wait 10
read message
rdata message type value

if((type=="healthcheck") && (ant == 999))
   set ant value
   data message type id
   send message * value
end

if(type=="alert")
   send message ant
end
delay 1000

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data message "alert" lonSen latSen
   send message ant
end

inc iterate
print iterate

if (type=="stop")
   data message "stop"
   send message * value
   cprint "Para sensor: " id
   wait 1000
   stop
end

battery bat
if(bat<5)
   data message "critic" lonSen latSen
   send message ant
end

if( temp<15)
   print "Low temperature"
   battery set bat - 0.5
end