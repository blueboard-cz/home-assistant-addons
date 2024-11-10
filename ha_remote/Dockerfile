ARG BUILD_FROM
FROM $BUILD_FROM

# Install necessary packages
RUN apk add --no-cache bash jq curl

# Copy local files
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Run the script
CMD [ "/run.sh" ]