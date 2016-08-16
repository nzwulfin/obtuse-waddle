## BUILDING
##   (from project root directory)
##   $ docker build -t nzwulfin-obtuse-waddle .
##
## RUNNING
##   $ docker run nzwulfin-obtuse-waddle

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="zraaqka" \
    STACKSMITH_STACK_NAME="nzwulfin/obtuse-waddle" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-3.5.0-5 --checksum 94f4d26598f8774f58e96a631930f2a73518901f385661c19303783667d0066b

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Django template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
