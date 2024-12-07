#!/bin/bash

cut -d "," -f2 compras.txt|grep -E '[0-9]+'|paste -sd+|bc 
