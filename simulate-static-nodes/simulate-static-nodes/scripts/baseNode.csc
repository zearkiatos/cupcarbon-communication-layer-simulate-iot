atget id id

data p "healthcheck" id id
send p

loop
read message
rdata message type value1 value2
if( type == "alert")
   cprint "Alerta en: longitud" value1 ", latitud: " value2
end

if(type == "critic")
   cprint "Nodo descargado en: longitud" value1 ", latitud: " value2
   data p "stop"	
   send p
   wait 1000
   stop
end
wait 100