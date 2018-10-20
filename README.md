# ping-machine


Bursche1 

zur einmaligen Überprüfung mehrerer Hosts. 

-> Ausgabe in shell und 2 Logfiles 
  (/home/Logfiles/bursche1_online.txt und /home/Logfiles/bursche1_offline.txt)
  
  
  
Bursche2 

zur kontinuierlichen Überwachung eines Hosts. 

-> Ausgabe in /home/Logfiles/bursche2.log 
  (Log beginnt nach erstem Ausfall und wird dann "nur" bei Änderung des Erreichbarkeitsstatus ausgeführt)



Bursche3 

zur kontinuierlichen direkten Überwachung eines Hosts.

-> Ausgabe in /home/Logfiles/bursche3.log 
  (Logzeiten über Parameterübergabe durch Startbefehl: ./Bursche3.sh -ip=xxx.xxx.xxx.xxx -w=10 >/home Logfiles/bursche3.log)
