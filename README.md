# vk-attachments-pics
This is a small script which allows you to download photos from VK dialogs.

## How to use?
### 1. get access token
by opening in browser

https://oauth.vk.com/authorize?client_id=5376127&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=messages&response_type=token&v=5.50

After authentificating you'll get this url:
```url
https://oauth.vk.com/blank.html#access_token=abcde12345&expires_in=86400&user_id=143937778
```
> TOKEN = abcde12345

### 2. Run script
```sh
$ ./vk-parser 'TOKEN' 'ID'
```

### Some words about uncomfortable authentication method
https://habrahabr.ru/post/179953/
