# PREL=taskset -c 1
# PREJ=taskset -c 1
# PREP=taskset -c 1
# PREN=taskset -c 1

# LUA=${PREL} /usr/local/Cellar/luajit/2.0.0-beta9/bin/luajit
LUA=${PREL} lua
JAVAC=javac
JAVA=${PREJ} java -server -XX:+TieredCompilation -XX:+AggressiveOpts
PHP=${PREP} php
NODE=${PREN} node

lua: fasta nbody spectralnorm binarytrees mandelbrot fannkuchredux

node: fasta-node nbody-node spectralnorm-node binarytrees-node mandelbrot-node fannkuchredux-node

java: fasta-java nbody-java spectralnorm-java binarytrees-java mandelbrot-java fannkuchredux-java

php: fasta-php nbody-php spectralnorm-php binarytrees-php mandelbrot-php fannkuchredux-php

fasta:
	@echo ==== $@ ====
	@time -p ${LUA} fasta.lua 2500000 > /dev/null

nbody:
	@echo ==== $@ ====
	@time -p ${LUA} nbody.lua 5000000 > /dev/null

spectralnorm:
	@echo ==== $@ ====
	@time -p ${LUA} spectralnorm.lua 3000 > /dev/null

binarytrees:
	@echo ==== $@ ====
	@time -p ${LUA} binarytrees.lua 16 > /dev/null

mandelbrot:
	@echo ==== $@ ====
	@time -p ${LUA} mandelbrot.lua 4000 > /dev/null

fannkuchredux:
	@echo ==== $@ ====
	@time -p ${LUA} fannkuchredux.lua 11 > /dev/null

fasta-java: fasta.class
	@echo ==== $@ ====
	@time -p ${JAVA} fasta 2500000 > /dev/null

nbody-java: nbody.class
	@echo ==== $@ ====
	@time -p ${JAVA} nbody 5000000 > /dev/null

spectralnorm-java: spectralnorm.class
	@echo ==== $@ ====
	@time -p ${JAVA} spectralnorm 3000 > /dev/null

binarytrees-java: binarytrees.class
	@echo ==== $@ ====
	@time -p ${JAVA} binarytrees 16 > /dev/null

mandelbrot-java: mandelbrot.class
	@echo ==== $@ ====
	@time -p ${JAVA} mandelbrot 4000 > /dev/null

fannkuchredux-java: fannkuchredux.class
	@echo ==== $@ ====
	@time -p ${JAVA} fannkuchredux 11 > /dev/null

%.class: %.java
	@${JAVAC} $^

fasta-php:
	@echo ==== $@ ====
	@time -p ${PHP} fasta.php 2500000 > /dev/null

nbody-php:
	@echo ==== $@ ====
	@time -p ${PHP} nbody.php 5000000 > /dev/null

spectralnorm-php:
	@echo ==== $@ ====
	@time -p ${PHP} spectralnorm.php 3000 > /dev/null

binarytrees-php:
	@echo ==== $@ ====
	@time -p ${PHP} binarytrees.php 16 > /dev/null

mandelbrot-php:
	@echo ==== $@ ====
	@time -p ${PHP} mandelbrot.php 4000 > /dev/null

fannkuchredux-php:
	@echo ==== $@ ====
	@time -p ${PHP} fannkuchredux.php 11 > /dev/null

fasta-node:
	@echo ==== $@ ====
	@time -p ${NODE} fasta.js 2500000 > /dev/null

nbody-node:
	@echo ==== $@ ====
	@time -p ${NODE} nbody.js 5000000 > /dev/null

spectralnorm-node:
	@echo ==== $@ ====
	@time -p ${NODE} spectralnorm.js 3000 > /dev/null

binarytrees-node:
	@echo ==== $@ ====
	@time -p ${NODE} binarytrees.js 16 > /dev/null

mandelbrot-node:
	@echo ==== $@ ====
	@time -p ${NODE} mandelbrot.js 4000 > /dev/null

fannkuchredux-node:
	@echo ==== $@ ====
	@time -p ${NODE} fannkuchredux.js 11 > /dev/null

clean:
	-@rm -f *.class

