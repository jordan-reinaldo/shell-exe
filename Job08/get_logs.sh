cd /home/shell-exe/Job08
nbreco=$(grep "jordan" /var/log/auth.log | wc -l)

date=$(date +%F-%T)

echo "$nbreco" "$date" > "number_connection_$date.txt"

mv "number_connection_$date.txt" "Backup"

tar -cvf "Backup/number_connection_$date.tar" "Backup/number_connection_$date.txt"
