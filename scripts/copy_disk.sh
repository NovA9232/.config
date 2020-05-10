#!/bin/bash
rsync -axHAWXS --numeric-ids --info=progress2 $1 $2
