
#!/bin/bash

# Function to generate IPs in a range
generate_ips() {
    local base=$1
    local start=$2
    local end=$3

    for octet in $(seq $start $end); do
        echo "${base}${octet}"
    done
}

# Function to generate IPs with a variable third octet
generate_ips_variable_third() {
    local base=$1
    local start_third=$2
    local end_fourth=$3

    for third in $(seq $start_third 255); do
        for fourth in $(seq 0 $end_fourth); do
            echo "${base}${third}.${fourth}"
        done
        # Handle the case where the fourth octet is greater than end_fourth
        if [ $third -eq $start_third ]; then
            for fourth in $(seq $((end_fourth + 1)) 255); do
                echo "${base}${third}.${fourth}"
            done
        fi
    done
}

# Generate IPs for 10.0-10.5
for second in $(seq 0 5); do
    generate_ips "10.${second}." 1 254
done

# Generate IPs for 10.6.192-255
generate_ips_variable_third "10.6." 192 255

# Generate IPs for 10.7-10.17
for second in $(seq 7 17); do
    generate_ips "10.${second}." 1 254
done