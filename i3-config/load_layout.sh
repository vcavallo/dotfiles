#!/bin/bash
WKSP_N=$1
i3-msg "workspace $WKSP_N; append_layout ~/.i3/workspace_$WKSP_N.json"
