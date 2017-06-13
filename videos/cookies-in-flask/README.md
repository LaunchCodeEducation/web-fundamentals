---
title: "Cookies in Flask"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/Tn5Nb8d48z8?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video lesson we learn how to manipulate cookies in a Flask app. Below is the code from this lesson:

```python
from flask, import Flask, request, make_response

app = Flask(__name__)
app.config['DEBUG'] = True

@app.route('/')
def index():
    count = int(request.cookies.get('visit-count', 0))
    count += 1
    message = 'You have visited this page ' + str(count) + ' times'

    # make a response, set cookie, return
    resp = make_response(message)
    resp.set_cookie('visit-count', str(count))
    return resp

app.run()
```

## References

- [make_response Reference](http://flask.pocoo.org/docs/0.12/api/#flask.make_response)
- [Using Response Objects to Set Cookies](http://flask.pocoo.org/docs/0.12/api/#response-objects)
- [document.cookie](https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie)
