# Verified commits

[Go back](../index.md#advanced-concepts)

You can sign a commit using GPG keys. If you do, you will see this label on each  signed commit

![gpg](../images/gpg.png)

The [official tutorial about GPG keys](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key) should be enough. Note that you will need to **write a passphrase each time you are committing** (at least each **10 minutes**), but you can increase the time your passphrase is cached

* [help on Stack Overflow](https://stackoverflow.com/questions/38384957/prevent-git-from-asking-for-the-gnupg-password-during-signing-a-commit)
* [gpg-agent.conf](https://gist.github.com/tknv/43604e851a371949343b78261c48f190)

My steps

* see config `gpg-agent --gpgconf-list | head -n1`
* edit the file shown / create it if needed (`~/.gnupg/gpg-agent.conf`)
	* `max-cache-ttl 28800` (=8 hours)
	* `default-cache-ttl 28800` (=8 hours)
* save, and exit
* reload: `gpg-connect-agent reloadagent /bye`