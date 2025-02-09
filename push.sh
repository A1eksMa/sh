#!/bin/bash
{ echo $GIT_USER; echo $GIT_TOKEN; } | git push origin main
