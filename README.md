## Docker build 

docker build  -t web-enumerator . 

docker run --rm -v {VOLUME_PATH_IN_LOCAL}:/app --name web-enumerator web-enumerator {url}

docker logs web-enumerator


sed -i 's/\r$//' recon.sh
