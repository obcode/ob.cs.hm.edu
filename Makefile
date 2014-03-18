# (c) 2012 Oliver Braun

# push to ob.cs.hm.edu

UPLOAD_HOST=	ob.cs.hm.edu
UPLOAD_DIR=	www

push:
	git pull
	git push
	ssh -t ob.cs.hm.edu "cd www && git pull && sudo /home/obraun/bin/restartWWW.sh"

# needs https://github.com/alandipert/fswatch
watch:
	cabal run &
	sleep 10
	fswatch snaplets 'curl http://0.0.0.0:8000/admin/reload'
