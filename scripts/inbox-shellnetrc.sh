 
#!/bin/sh


inbox=$(curl -sf "imaps://USERNAME:PASSWORD@imap.gmail.com/" -X "STATUS INBOX (UNSEEN)" | tr -d -c "[:digit:]" ) 

if [ "$inbox" ] && [ "$inbox" -gt 0 ]; then
    echo "$inbox"
else
    echo "0"
fi


