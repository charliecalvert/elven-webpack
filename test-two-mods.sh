#! /bin/bash

COLORS=~/Git/JsObjects/Utilities/Templates/Scripts/Colors.sh
LOCAL_COLORS=./Colors.sh

if [ -f "$LOCAL_COLORS" ]; then
    echo "Testing: File $COLORS exists." 
else
    echo "Testing: File $COLORS does not exist."
    cp "$COLORS" .
fi

source ./Colors.sh

TEST03="test03"

if [ -d "$TEST03" ]; then
    echo -e ${Green}"Testing${Color_Off}: Directory $TEST03 exists." 
    rm -r test03
else
    echo "Testing: Directory $TEST03 does not exist."
fi

./start-with-two-modules.sh $TEST03
cd $TEST03/
npm run build
npm start
code .