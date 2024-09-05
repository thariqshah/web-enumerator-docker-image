# 1. Use the Kali Linux rolling base image
FROM kalilinux/kali-rolling

WORKDIR /app


# Add Go binaries to the PATH
ENV PATH="/root/go/bin:${PATH}"


# 3. Update package list and install Golang
RUN apt-get update && apt-get install -y golang ca-certificates nmap

RUN go install github.com/tomnomnom/assetfinder@latest \
    && go install github.com/tomnomnom/httprobe@latest \
    && go install github.com/haccer/subjack@latest \
    && go install github.com/tomnomnom/waybackurls@latest \
    && go install -v github.com/owasp-amass/amass/v4/...@master

# # 9. Copy recon.sh to /app directory
# COPY recon.sh /app

# # 10. Make recon.sh executable
# RUN chmod +x /app/recon.sh

ENTRYPOINT ["bash","/app/recon.sh"]
