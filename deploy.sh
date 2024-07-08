#!/bin/bash

# remove existing deployment
ssh -p 2222 s367224@se.ifmo.ru "rm -rf wildfly/wildfly-21.0.0.Final/standalone/deployments/weblab2.war"
# add new deployment
scp -P 2222 ./target/weblab2.war s367224@se.ifmo.ru:wildfly/wildfly-21.0.0.Final/standalone/deployments