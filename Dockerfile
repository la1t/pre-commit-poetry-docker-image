ARG BASE_IMAGE_TAG=3.6.2-python3.12

FROM anatolygusev/pre-commit:${BASE_IMAGE_TAG}

ARG POETRY_VERSION=1.8.1

# https://python-poetry.org/docs/configuration/#using-environment-variables
ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VERSION=${POETRY_VERSION} \
    POETRY_HOME="/opt/poetry"

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl && \
    apt-get purge -y --auto-remove -o APT:AutoRemove:RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python - && \
    poetry --version
