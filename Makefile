# (c) 2012 Oliver Braun

# push to ob.cs.hm.edu

UPLOAD_HOST=	ob.cs.hm.edu
UPLOAD_DIR=	www

push:
	rsync -avz --exclude '.git' --exclude '*.swp' \
	   --exclude Makefile --exclude README.md --exclude tmp \
	   . ${UPLOAD_HOST}:${UPLOAD_DIR}

