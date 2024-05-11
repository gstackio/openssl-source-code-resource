ARG alpine

FROM ${alpine} AS resource

RUN apk add --no-cache curl bash jq coreutils

COPY in check /opt/resource/
RUN chmod +x /opt/resource/*
