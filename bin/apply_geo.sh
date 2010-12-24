#!/bin/bash

## my very little productivity script with postgis setup

# useful first time stuff -
#   psql -d postgres -f /usr/local/Cellar/postgresql/9.0.1/share/contrib/adminpack.sql 
#

psql -d $1 -f /usr/local/Cellar/postgis/1.5.2/share/postgis/postgis.sql
psql -d $1 -f /usr/local/Cellar/postgis/1.5.2/share/postgis/spatial_ref_sys.sql 
