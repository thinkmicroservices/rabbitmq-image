#!/bin/sh

# initialize rabbitmq
( echo "Starting..."; \
sleep 30 ; \

rabbitmqctl add_user $RABBITMQ_ADMIN_USER $RABBITMQ_ADMIN_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_ADMIN_USER administrator ; \
rabbitmqctl set_permissions -p / $RABBITMQ_ADMIN_USER  ".*" ".*" ".*" ; \
rabbitmqctl add_user $RABBITMQ_API_USER $RABBITMQ_API_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_API_USER management ; \
rabbitmqctl set_permissions -p / $RABBITMQ_API_USER  ".*" ".*" ".*" ; \
rabbitmqctl delete_user guest ; \
echo "Admin User: '$RABBITMQ_ADMIN_USER'" ; \
echo "API User:  '$RABBITMQ_API_USER'" ; \
echo "ManagementUI port 15672") &

rabbitmq-server $@
