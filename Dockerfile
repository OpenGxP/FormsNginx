FROM nginx:1.20

# copy into nginx directory 
COPY nginx/ /etc/nginx/

# create dir for app data
RUN mkdir -p /data/app

# copy index into app folder
COPY nginx/html/index.html /data/app/index.html
