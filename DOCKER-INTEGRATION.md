# Docker Integration Guide

## Create Network

```bash
docker network create \
    --driver bridge \
    --subnet 172.28.0.0/16 \
    brainsait-hubspot
```

## Update docker-compose.yml

```yaml
version: '3.8'

services:
  app:
    image: brainsait/app:latest
    networks:
      - brainsait-hubspot
    environment:
      - HUBSPOT_ENABLED=true

networks:
  brainsait-hubspot:
    external: true
```

## Test Connectivity

```bash
# From container
docker exec -it app bash
curl https://bf.hubspot-inbox.com
```
