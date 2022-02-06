FROM node:16-alpine3.15 as build-stage

ENV FRONTEND_VERSION nightly

RUN apk add --no-cache git \
    && git clone -b ${FRONTEND_VERSION} https://github.com/OpenGxP/FormsFrontend.git \
    && cd FormsFrontend \
    && npm install \
    && npm run build


FROM nginx:1.20

COPY nginx/ /etc/nginx

COPY 40-write-runtime-endpoint-file.sh /docker-entrypoint.d

RUN mkdir /data \
    && chmod +x /docker-entrypoint.d/40-write-runtime-endpoint-file.sh

COPY runtimeEndpoint.json /data

COPY --from=build-stage /FormsFrontend/dist /data
