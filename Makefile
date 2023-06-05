CC ?= cc
CFLAGS = `pkg-config --cflags glib-2.0`
all: src/xdg-user-dir-lookup.o