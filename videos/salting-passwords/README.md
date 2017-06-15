---
title: "Salting Passwords"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/zzRxaj1fO0g?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we look at the remaining vulnerability in our approach to password storage: *rainbow tables*. Our solution is to use a *salt*. We'll need to refactor our `hashutils.py` code to this end:

```python
import hashlib
import random
import string


def make_salt():
    return ''.join([random.choice(string.ascii_letters) for x in range(5)])


def make_pw_hash(password, salt=None):
    if not salt:
        salt = make_salt()
    hash = hashlib.sha256(str.encode(password + salt)).hexdigest()
    return '{0},{1}'.format(hash, salt)


def check_pw_hash(password, hash):
    salt = hash.split(',')[1]
    if make_pw_hash(password, salt) == hash:
        return True

    return False
```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/997bcbfa4e8d95f06840988ca1497d02e337ce9d) from this lesson.

## References

- [Rainbow Table (Wikipedia)](https://en.wikipedia.org/wiki/Rainbow_table)
- [Downloadable Rainbow Tables](http://rainbowtables.shmoo.com/)
- [Salt (Wikipedia)](https://en.wikipedia.org/wiki/Salt_(cryptography))
- [bcrypt (Wikipedia)](https://en.wikipedia.org/wiki/Bcrypt)
- [scrypt (Wikipedia)](https://en.wikipedia.org/wiki/Scrypt)
