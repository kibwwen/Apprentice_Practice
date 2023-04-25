echo "パスワードマネージャーへようこそ！"
while :
do 
  read -p "次の選択肢から入力してください([A]Add Password/[G]Get Password/[E]Exit):" select
  if [ "$select" = "A" ]; then
    read -p "サービス名を入力してください：" service
    read -p "ユーザー名を入力してください：" user
    read -p "パスワードを入力してください：" pass
    gpg password.txt.gpg 2> /dev/null
    rm ./password.txt.gpg
    echo "サービス名:$service" >> password.txt
    echo "ユーザー名:$user" >> password.txt
    echo "パスワード:$pass" >> password.txt
    gpg -e -r kibwwen@gmail.com password.txt
    rm ./password.txt
    echo "Thank you!"

  elif [ "$select" = "G" ]; then
    file=./password.txt
    read -p "サービス名を入力してください：" service
    gpg password.txt.gpg 2> /dev/null
    rm ./password.txt.gpg
    value=$(grep -A 2 "$service" "$file")
    gpg -e -r kibwwen@gmail.com password.txt
    rm ./password.txt
    if [ "$value" != "" ];
    then
      echo "$value"
    else
      echo "そのサービスは登録されていません"
    fi

  elif [ "$select" = "E" ]; then
    echo "Good Bye"
    break

  else
    echo "入力間違えています。【A】/ 【G】/ 【E】から入力してください"
  
  fi

done
