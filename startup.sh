 #!/bin/sh

echo "Starting java project"

mvn spring-boot:run & export APP_COMPILE_PID=$!


#sleep 10000

inotifywait -r -m -e modify ./ | 
   while read path _ file; do 
        if [[  $(expr match "$file" '.*\.java$') != 0 ]]; then 
            echo "File modified: $path$file " 
            
            APP_RUNNING_PID=$(netstat -nlp | grep 8080  | grep  -io '[0-9]*/.*$' | grep -io '^[0-9]*')

            if [  "$APP_COMPILE_PID" -gt 0 ]; then 
                kill -9 $APP_COMPILE_PID
            fi

            if [  "$APP_RUNNING_PID" -gt 0 ]; then 
                kill -9 $APP_RUNNING_PID
            fi
            
            mvn spring-boot:run & export APP_COMPILE_PID=$!
        fi
   done