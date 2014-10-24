# (c) 2012 Oliver Braun

# push to ob.cs.hm.edu

UPLOAD_HOST=	ob.cs.hm.edu
UPLOAD_DIR=	www

all::
	ghc --make -threaded site.hs
	./site rebuild

watch: all
	./site watch

push: all
	rsync -avz _site/ $(UPLOAD_HOST):$(UPLOAD_DIR)

clean:
	rm -rf _cache _site site site.hi site.o
