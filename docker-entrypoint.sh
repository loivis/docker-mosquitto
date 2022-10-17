#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
    [ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

echo "# HEAD: set mosquitto config from environment"
for line in $(env | grep 'MSQT_' | sed 's/MSQT_//'); do

    key=$(echo $line | cut -d'=' -f1 | tr '[A-Z]' '[a-z]')
    value=$(echo $line | cut -d'=' -f2)
    echo $key $value
    if [[ "$key" != "" && "$value" != "" ]]; then
        if [ "$(grep $key /mosquitto/config/mosquitto.conf)" == "" ]; then
            echo $key $value >>/mosquitto/config/mosquitto.conf
        else
            sed -i "s/^$key .*/$key $value/" /mosquitto/config/mosquitto.conf
        fi
    fi
done
echo "# TAIL: set mosquitto config from environment"

exec "$@"
