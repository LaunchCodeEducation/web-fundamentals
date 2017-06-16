---
title: 'Studio: FlickList 9'
currentMenu: studios
---

Like Flicklist 8, this studio has a different structure than most Flicklist studios. Once again, we will omit the walkthrough and let you get to work immediately on the Studio. 

## Studio

We've added all of the main user-facing features to the Flicklist application. One aspect of the application that users typically don't think about is security. But we as developers should prioritize it. We must treat our users' data carefully, and do everything we can to prevent sensitive data from being exposed. We'll make our passwords secure in this studio using hashing.

### Checking Out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio9`. As usual, remember to start up your MAMP servers and activate `flask-env`.

### Your tasks

Passwords should be hashed when creating a new user account so that in the event of a security breach - for example, a database break-in - it will be extremely difficult for anybody to unmask the passwords.

Recall that hashing uses one of many available algorithms to turn a string into a hexadecimal number. For example, with the sha256 algorithm, "LaunchCode" becomes:

```nohighlight
fd433b1435c24ea70f918e6236d4185c18fa708754cec1dab86d931eb1273c71
```

The key concept that makes a given hashing algorithm useful for security purposes is that it is structured such that it is extremely difficult, and would take an incredibly large amount of time, to reverse the process and retrieve the original string.

Generating a hash for a string is easy. Turning a hash back into the string that it came from should be very, very, very hard. The harder this reverse process is, the better the hash algorithm. Algorithms with this property are known as *one-way hash functions*.

Review the code added in the [video lessons for Class 13](../../../class-prep/13/) if you forget how to implement any of the steps below:

1. Create a new file in the top directory of the `flicklist-flask` project named `hashutils.py`. Include the necessary imports and define the three functions you'll need: `make_salt`, `make_pw_hash`, and `check_pw_hash`.

<aside class="aside-pro-tip" markdown="1">
Look at the `hashutils.py` file you created in the Class 13 video lessons. Was there any application-specific code in that file? Can you reuse it as is, instead of creating these three functions again? Or do you need to make any modifications to it in order to reuse it in your `flicklist-flask` project?     
</aside>

2. Make sure you import these functions from `hashutils.py` into the necessary files, now that you have refactored your code following the *MVC* pattern. Which function(s) do you need to import to `main.py`? Which to `models.py`?

3. Change your code in the `User` class so that you are storing in the database a password hash rather than the password the user entered. Since you changed a property in one of your model classes, you will need to drop and recreate your tables in the Python shell and create a new user (register one) and new movie data for you to test your application's functionality.

4. Modify your `login` function so that it compares two hashes rather than two password strings.


[get-the-code]: ../getting-the-code/
