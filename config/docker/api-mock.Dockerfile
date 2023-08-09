FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1014

# shadow-utils contains adduser and groupadd binaries
RUN microdnf install shadow-utils \
	&& groupadd --gid 1000 noroot \
	&& adduser \
	--no-create-home \
	--no-user-group \
	--uid 1000 \
	--gid 1000 \
	noroot

WORKDIR /

COPY api-mock /usr/local/bin/

USER 1001

ENTRYPOINT ["/usr/local/bin/api-mock"]
