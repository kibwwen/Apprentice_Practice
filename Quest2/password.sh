echo "パスワードマネージャーへようこそ！"
while :
do 
  read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" select
  if [ "$select" = "A" ]; then
    read -p "サービス名を入力してください：" service
    echo "サービス名:$service" >> password.txt
    read -p "ユーザー名を入力してください：" user
    echo "ユーザー名:$user" >> password.txt
    read -p "パスワードを入力してください：" pass
    echo "パスワード:$pass" >> password.txt
    echo "Thank you!"

  elif [ "$select" = "G" ]; then
    file=./password.txt
    read -p "サービス名を入力してください：" service
    test=$(grep -A 2 "$service" "$file")
    if [ "$test" != "" ];
    then
      echo "$test"
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
