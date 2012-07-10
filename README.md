shootout
========

Shootout test between lua/luajit/java/php/nodejs

## results

[ngx_lua 内幕](http://adc.taobao.com/ppts/up-1341918158-0.pdf)

``` 
               |   lua   |  luajit  |  nodejs  |   java   |   php
fasta          |   6.84  |   1.15   |   4.79   |   1.90   |   21.29 
nbody          |  61.68  |   2.27   |   3.69   |   1.86   |  108.29
spectral-norm  |  91.87  |   3.15   |   3.50   |   4.01   |  237.42
binary-trees   |  30.10  |   7.05   |   1.46   |   1.12   |   --
mandelbrot     |  75.16  |   3.24   | *50.99   |   1.14   |   --
fannkuchredux  | 187.46  |   7.57   |   6.21   |   3.31   |   --
```

2.4 GHz Intel Core 2 Duo, 8 GB 1067 MHz DDR3

* Lua 5.1.4
* luajit 2.0.0-beta9
* node v0.8.1
* java version "1.6.0_33"
* PHP 5.3.10 with Suhosin-Patch (cli)

`mandelbrot for v8` result is [UNEXPECTED OUTPUT](http://shootout.alioth.debian.org/u32/benchmark.php?test=mandelbrot&lang=v8).