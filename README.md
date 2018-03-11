# DD-WRT + Namecheap DDNS

Included script allows a router running the [DD-WRT](https://www.dd-wrt.com) firmware
to use Namecheap's Dynamic DNS Services __with multiple domains__.

If you only need to configure DDNS for a single domain, this can be done
[via the DD-WRT web interface](https://www.namecheap.com/support/knowledgebase/article.aspx/9356/11/how-to-configure-a-ddwrt-router).

## Instructions

1. Follow the [official instructions](https://www.namecheap.com/support/knowledgebase/article.aspx/595/11/how-to-enable-dynamic-dns-option-for-a-domain)
   to enable Dynamic DNS for your domains on Namecheap.
   
   Save _Dynamic DNS Password_ for your domains. You will need them for the next step.
   
1. Create a file called `domains`.

   Add your domains and their corresponding passwords (from the above step) into the `domains`
   file. For example:
   
   ```properties
   example.com=acbd18db4cc2f85cedef654fccc4a4d8
   example.net=37b51d194a7513e45b56f6524f2d51f2
   ``` 
   
1. Place `ddns_update.sh`, `ddns_update.wanup`, and `domains` into `/jffs/etc/config` to be
   automatically executed by the router firmware. (More information on
   [script execution](https://www.dd-wrt.com/wiki/index.php/Script_Execution)) 