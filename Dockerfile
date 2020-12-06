FROM nginx:alpine

COPY init.sh /init.sh

CMD /init.sh && nginx -g 'daemon off;'
