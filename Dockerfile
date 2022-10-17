FROM eclipse-mosquitto:2.0.15

COPY mosquitto.conf /mosquitto/config/mosquitto.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
