#!/bin/sh

export IFS=","
export STRING=${1:-""}

IFS="," ARR=(${STRING})
ARRAY_CONTENTS="\"${ARR[0]}\""
for i in "${ARR[@]:1}"; do
    ARRAY_CONTENTS="${ARRAY_CONTENTS},\"$i\"";
done

echo "[$ARRAY_CONTENTS]"

