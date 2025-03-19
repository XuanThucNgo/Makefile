static:
	ar rcs lib/static/libhello.a obj/helloThuc.o obj/helloWorld.o

link:
	gcc obj/main.o -Llib/static -lhello -o bin/app

all:
	gcc -c main.c -o obj/main.o -I./inc
	gcc -c src/helloThuc.c -o obj/helloThuc.o -I./inc
	gcc -c src/helloWorld.c -o obj/helloWorld.o -I./inc

clean:
	rm -rf obj/* bin/*