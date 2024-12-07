#!/bin/bash

cut -f2,3 -d "," compras.txt|sort -n |sed -n '$p'|grep -Eo '([a-z]|[A-Z])+'
