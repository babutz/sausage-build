FROM alpine:3.15 as builder
LABEL name="sausage-front" \
      version="last"
WORKDIR /usr/src/app
COPY *.json ./
RUN apk add --no-cache npm==8.1.3-r0 \
        && npm install
COPY ./src ./src
RUN npm run build

FROM alpine:3.15 as dependencies
COPY *.json ./
RUN apk add --no-cache npm==8.1.3-r0 \
        && npm install --only=production

FROM nginx
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./static
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY app.conf /etc/nginx/conf.d/app.conf
EXPOSE 80
