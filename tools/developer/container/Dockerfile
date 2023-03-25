FROM docker.io/python:3.11

COPY dependencies /tmp/dependencies

RUN mkdir /workspace \
    && pip install --user --requirement /tmp/dependencies/requirements.txt \
    && /bin/bash -c "$(curl -fsSL https://exaloop.io/install.sh)"

ENV PATH "~/.codon/bin:~/.local/bin:/workspace/tools/developer/bin:$PATH"
