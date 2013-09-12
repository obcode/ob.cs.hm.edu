# (c) 2012 Oliver Braun

# push to ob.cs.hm.edu

UPLOAD_HOST=	ob.cs.hm.edu
UPLOAD_DIR=	www

push:
	git pull
	git push
	ssh ob.cs.hm.edu "cd www && git pull"
	curl http://ob.cs.hm.edu/admin/reload

# needs https://github.com/alandipert/fswatch
watch:
	./dist/build/obcshmedu/obcshmedu &
	fswatch snaplets 'curl http://0.0.0.0:8000/admin/reload'
