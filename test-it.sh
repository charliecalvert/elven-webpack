#! /bin/bash

TEST03="test03"

if [ -d "$TEST03" ]; then
    echo "Testing: Directory $TEST03 exists." 
    rm -r test03
else
    echo "Testing: Directory $TEST03 does not exist."
fi

./start.sh $TEST03
cd $TEST03/
npm run build
npm start
code .