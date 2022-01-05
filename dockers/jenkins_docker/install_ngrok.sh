echo "begin - install ngrok"

# ngrok install install (debian)
# https://ngrok.com/download
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
| tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
| tee /etc/apt/sources.list.d/ngrok.list \
&& apt update && apt install ngrok

echo "end - install ngrok"