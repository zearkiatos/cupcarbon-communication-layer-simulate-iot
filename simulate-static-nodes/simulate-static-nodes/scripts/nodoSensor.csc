set ant 999
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
   print "Alert!!!"
   send message ant
end
delay 1000

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data message "alert" lonSen latSen
   send message ant
end