#!/bin/bash

rsync -aH --delete --itemize-changes $HOME/backup/zettelkasten_backup_250815_0020/ $HOME/zettelkasten/
