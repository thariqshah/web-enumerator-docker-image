# 1. Use the Kali Linux rolling base image
FROM kalilinux/kali-rolling

WORKDIR /app

# 3. Update package list and install Golang
RUN apt-get update && apt-get install -y golang ca-certificates

# # 4. Install assetfinder
# RUN go get -u github.com/tomnomnom/assetfinder

# 5. Install httprobe (latest version)
RUN go install github.com/tomnomnom/httprobe@latest

# # 6. Install subjack
# RUN go get github.com/haccer/subjack

# 7. Install waybackurls (latest version)
RUN go install github.com/tomnomnom/waybackurls@latest

# 8. Install OWASP Amass (master version)
RUN go install -v github.com/owasp-amass/amass/v4/...@master

# 9. Copy recon.sh to /app directory
COPY recon.sh /

# 10. Make recon.sh executable
RUN chmod +x /recon.sh

ENTRYPOINT ["bash","/recon.sh"]
CMD [ "blog.aristocat.in" ]
