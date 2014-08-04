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
FROM srisankaran/jmeter-base

MAINTAINER Sri Sankaran sri@redhat.com

# Create a mount point
VOLUME ["/test-scripts"]

# Use a predefined configuration.  This sets the contract for connecting to jmeter servers.
ADD jmeter.properties /var/lib/apache-jmeter-$JMETER_VERSION/bin/


