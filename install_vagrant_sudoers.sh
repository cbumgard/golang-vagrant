#!/bin/bash
# Script for placing sudoers.d files with syntax-checking

# Making a temporary file to contain the sudoers-changes to be pre-checked
TMP=$(mktemp -t vagrant_sudoers)
cat /etc/sudoers > $TMP
cat >> $TMP <<EOF

# Allow passwordless startup of Vagrant when using NFS.
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/su root -c echo '*' >> /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -e /*/ d -ibak /etc/exports
%staff ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
EOF

# Check if the changes we want are OK
visudo -c -f $TMP
if [ $? -eq 0 ]; then
  echo "Adding vagrant commands to sudoers"
  cat $TMP > /etc/sudoers
else
  echo "sudoers syntax wasn't valid. Aborting!"
fi

rm -f $TMP
