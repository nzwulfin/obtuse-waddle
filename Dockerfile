## BUILDING
##   (from project root directory)
##   $ docker build -t nzwulfin-obtuse-waddle .
##
## RUNNING
##   $ docker run nzwulfin-obtuse-waddle

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="ekjszh1" \
    STACKSMITH_STACK_NAME="nzwulfin/obtuse-waddle" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-3.5.2-0 --checksum f7ee6044bc9ebdfefa9c9eb181deb01b065157fc645bfc9c7880274d1cc69237

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Python base template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python"]
