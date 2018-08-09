# kDNS

This is a DNS GUI for PowerDNS.

It offers following functions:

- User and Permission Management
- Authorative DNS Management with Ownership Control
  - Support of new gTLDs
  - Support of new DNS Records
  - PTR / Reverse DNS support
- Recursive DNS Management (API for PowerDNS recursive server)
  - Control Root Nameserver (support for AdGuard, OpenNIC, NewNations, FurNic, etc)
  - Export for your private TLDs (so that you can access your private authorative Domains with your private powerDNS Recursor)
  - Export for your TLDs (so that you can access your public TLDs faster over your PowerDNS Recursor)
- Whois Management (API for whoisd)
  - Whois export for whoisd (export in JSON, bash script included for converting to raw text files)
  - The given Data is the Owner-Username, Owner-E-Mail Address and free text from the DNS Management, this can be used for abuse management
  - It is a bit geeky but if you run your own whois server, then this is very useful

The complete tool with PowerDNS authorative, PowerDNS recursor and this GUI is my personal DNS management tool and used in my internal network. It completes everything what I need and reduces the DNS Network Load from my Network. Through caching the DNS is ultra fast.
