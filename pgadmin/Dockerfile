FROM dpage/pgadmin4:9.18
USER root
RUN apk upgrade --no-cache && apk add --no-cache ca-certificates && update-ca-certificates
ENV PIP_CERT=/etc/ssl/certs/ca-certificates.crt
RUN python3 -m pip install --no-cache-dir --upgrade 'pip>=26.2.2' 'setuptools>=78.1.1'
RUN /venv/bin/python -m pip install --no-cache-dir --upgrade 'certifi>=2026.10.19' 'pillow>=13.0.0' 'urllib3>=2.8.0'
RUN python3 -m pip uninstall -y pip && rm -rf /usr/local/lib/python*/ensurepip/_bundled/*
USER 5050
