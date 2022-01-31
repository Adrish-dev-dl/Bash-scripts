To schedule the bash script tp run at specific interval, we will use crontab.

1. Open linux terminal and enter crontab -e.
2. Press insert button and move you cursor to the last row.
3. Create an entry :- 
   */10 * * * * /bin/sh /<path>/Memory_cpu_usage.sh -- This will schedule the job to run after every 10 minutes
4. Save the file by pressing escape key and then :wq
5. Enter crontab -l to list out all the cron jobs and check if the newly scheduled one eixts.
