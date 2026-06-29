FROM traffmonetizer/cli_v2:latest
# این دستور باعث میشه کانتینر با توکنی که توی رندر ست کردی بالا بیاد
ENTRYPOINT ["/usr/bin/trafficmonetizer", "start", "accept", "--token", "GmhmuiWJq6DazKvf2CKsaKvB16z887uHKl9XVstCnbw="] 
