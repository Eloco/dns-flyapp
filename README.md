# dns-flyapp

using https://github.com/compassd/dcompass for DNS-server

- [Config](https://github.com/Eloco/dns-flyapp/blob/main/app/dcompass.yaml)
- [Diy-block-url](https://github.com/Eloco/dns-flyapp/blob/main/app/blocklist.url)

```
❯ dig +short  github.com @`dig +short eloco-dns.fly.dev A`
13.114.40.48
```

## Deploy

1. local config
```
fly launch --copy-config --name eloco-dns  --no-deploy
fly secrets set -a eloco-dns PROXY='socks5://[user:[passwd]]@[ip:[port]]' # recommand (if not set, then wont use proxy)
```

2. remote edploy 
```
flyctl deploy --remote-only --detach  # or use Github action deploy
```
