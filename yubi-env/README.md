# Securely storing environment variables in gopass

I've been making use of [gopass](https://www.gopass.pw/) for a couple years now, which
combined with my [GPG and YubiKey Setup](https://kula.tproa.net/lnt/computers/gpg/gpg-and-yubikey.html)
makes securely storing credentials on remote machines a breeze.

Sometimes the secrets I want to protect are things which need to be
environment variables. My canonical example of this are the various
`AWS_` environment variables which things like the `aws` client
and `terraform` commands use to authenticate to AWS. I can store those
in gopass, but I also want to 1) keep setting those variables out 
of my shell history, without having to think about it; and 2)
keep them out of my `screen` scrollback buffer.

`yubi-env.sh` defines a shell function, `yubi-env`. Assuming that
you add environment variables to a `gopass` entry like

```
_export AWS_ACCESS_KEY_ID=....
_export AWS_SECRET_ACCESS_KEY=...
```

it will set those environment variables in your current shell. It,
of course, works with any shell environment variable.

`yubi-env.completion` extends the `gopass` bash shell completion
to also work with `yubi-env`.
