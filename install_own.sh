#!/bin/bash
rsync -avxHAXP --exclude-from=- own/. ~/ << "EXCLUDE"
own
EXCLUDE
