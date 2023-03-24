# DNS analysis

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

#### DNS records lookup

You can use the commands [nslookup](/operating-systems/networking/protocols/dns.md#nslookup-ipdomain-lookup)/[dig](/operating-systems/networking/protocols/dns.md#dig-ipdomain-lookup) to query DNS servers. You can also use the website [DNS dumpster](/operating-systems/networking/protocols/dns.md#dnsdumpster-domains-lookup), to find both domains and subdomains.

➡️ Find attack vectors: domains, subdomains, mail servers...

<br>

#### WHOIS

You can use [whois](/operating-systems/networking/protocols/dns.md#whois--domain-registrar-data) to dig for registrar information.

➡️ Find a (human) target to attack.
</div><div>

#### Certificates

Another popular way to find subdomains is to study the generated certificate. A SSL certificate is generate for usually multiple domains, so we may find subdomains or other domains like this.

See [SSL Tools](/operating-systems/networking/protocols/ssl-tls.md#find-certificates-given-a-domain) such as `crt.sh`.

➡️ Find attack vectors: subdomains or other domains. 
</div></div>