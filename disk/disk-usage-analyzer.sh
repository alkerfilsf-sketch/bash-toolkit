i=0
while true
do
     read -p "Silahkan Masukkan Nama File: " File[$i]

     read -p "Mau lanjut? (ya/tidak): " lanjut

     if [ "$lanjut" = "tidak" ]; then
     break
     fi

   ((i++))
done
echo " "
echo "File sedang dicari, Harap tunggu...."
echo " "
for ((i=0; i<${#File[@]}; i++))
do
    found[$i]=$(find ~ -name "${File[$i]}" -type d -print -quit)

    if [ -n "${found[$i]}" ]; then
        hasil[$i]=$(du -sh "${found[$i]}")
    else
        echo "File ${File[$i]} tidak ditemukan"
    fi
done
    echo "------------------------------- Hasil Disk Usage Analyzer ----------------------------------"
for ((i=0; i<${#File[@]}; i++))
do
    echo " "
    echo "File : (${found[$i]})"
    echo "Folder ${File[$i]} : (${hasil[$i]})"
    echo " "
    echo "---------------------------------------------------------------------------------------------"
done
