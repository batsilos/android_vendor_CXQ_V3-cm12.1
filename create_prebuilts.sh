ls -R $PWD/$1 |
    while read line
    do
            line=$(echo $line | tr -d '\r')

            if [[ "$line" =~ ^/.*:$ ]]
            then
                    dir=${line%:}

            elif [[ "$line" = "opendir failed, Permission denied" ]]
            then
                    echo "find: $dir: Permission denied"

            else
                if [[ "$dir" = "/" ]]; then dir=""; fi

                echo "$dir/$line" >> prebuilts_test.txt
            fi
    done
