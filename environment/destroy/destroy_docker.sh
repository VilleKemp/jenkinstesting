#!/bin/bash
#destroy docker containers
docker kill petstore
docker kill owasp17
docker rm petstore
docker rm owasp17
