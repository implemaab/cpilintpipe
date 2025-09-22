# Run CPILint as part of pipeline
FROM azul/zulu-openjdk:22

WORKDIR /

# Install dependencies
RUN apt-get update \
 && apt-get install -y unzip=6.0-26ubuntu3.2 wget=1.21.2-2ubuntu1 zip=3.0-12build2 --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY cpilint-1.1.0.zip .

# Prepare installation
RUN mkdir -p tmp
RUN unzip cpilint-*.zip -d tmp

RUN mv tmp/cpilint* cpilint

RUN chmod +x cpilint/bin/cpilint

COPY pipe /
COPY LICENSE pipe.yml README.md /
RUN wget --progress=dot:giga -P / https://bitbucket.org/bitbucketpipelines/bitbucket-pipes-toolkit-bash/raw/0.6.0/common.sh

RUN chmod a+x /*.sh

ENTRYPOINT ["/pipe.sh"]
