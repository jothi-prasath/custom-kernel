#!/bin/bash

LOG_FILE="../kernel_build.log"
#export CC=clang LLVM=1

start_time=$(date +"%T")
kernel_version=$(make kernelversion)
make -j$(nproc) 

if [ $? -eq 0 ]; then
    exit_status=0
else
    exit_status=1
fi

end_time=$(date +"%T")

start_seconds=$(date -d "$start_time" +"%s")
end_seconds=$(date -d "$end_time" +"%s")
duration=$((end_seconds - start_seconds))


echo "$(date +"%m/%d/%Y") [$kernel_version] kernel build $start_time - $end_time {${duration}}s [$exit_status]" >> "$LOG_FILE"

