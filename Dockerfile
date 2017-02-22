FROM heroku/python

WORKDIR /app
ENV WORKSPACE_DIR=/app/builds
ENV BUILD_DIR=$WORKSPACE_DIR
ENV CACHE_DIR=/app/cache
ENV ENV_DIR=/app/env

RUN mkdir -p $BUILD_DIR
RUN mkdir -p $CACHE_DIR
RUN mkdir -p $ENV_DIR
RUN mkdir -p /app/builds/

# RUN apt-get update && apt-get install -y python-pip

# Install bob-builder application
# RUN pip install bob-builder==0.0.5

COPY . /app

COPY requirements.txt /app/builds/requirements.txt

RUN /app/bin/detect $BUILD_DIR $CACHE_DIR

RUN /app/bin/compile $BUILD_DIR $CACHE_DIR $ENV_DIR

CMD /bin/bash
