#!/bin/bash
mpd 
mpc ls | mpc add
mpc random on &

