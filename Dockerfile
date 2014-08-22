#
# Dockerfile for a jmeter client.
# A container from this image will be ready to run a jmeter client.
# 
# Usage:
#  docker run -it \
#             -v <absolute path on host>:/test-scripts \
#             <docker image tag>
# E.g. 
#   docker run -it -v /user/sri/scripts:/test-scripts sri/jmeter
#

# Use jmeter-base as the foundation
FROM ssankara/jmeter-base

MAINTAINER Sri Sankaran sri@redhat.com

# Create mount point for script & data files
VOLUME ["/scripts"]
VOLUME ["/input_data"]
VOLUME ["/logs"]

# Use a predefined configuration.  This sets the contract for connecting to jmeter servers.
ADD jmeter.properties /var/lib/apache-jmeter-$JMETER_VERSION/bin/

ENTRYPOINT [ "/var/lib/apache-jmeter-2.11/bin/jmeter" ]
